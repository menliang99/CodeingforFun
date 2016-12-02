-- Asymmetric Half-Bridge Flyback Converter  "TopCRPWM.vhd"
-- CR-PWM Controller Block for 140kHz
--   August 5, 2016
--  Changed the PWM frequency range down to 35kHz to adopt minimum DC 90V input



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TopCRPWM is

	port(
		Reset : in std_logic;   
		Mclk : in std_logic;   --50MHz
		
		KeyBoardin : in std_logic_vector(9 downto 0);  --keyboard input
		LEDHEX0 : out std_logic_vector(6 downto 0); -- HEX0 output
		LEDHEX1 : out std_logic_vector(6 downto 0); -- HEX1 output
		--LEDHEX2 : out std_logic_vector(6 downto 0); -- HEX2 output
		--LEDHEX3 : out std_logic_vector(6 downto 0); -- HEX3 output
		LEDHEX4 : out std_logic_vector(6 downto 0); -- HEX4 output
		LEDHEX5 : out std_logic_vector(6 downto 0); -- HEX5 output
		
		--ADC_DB1 : out std_logic_vector(7 downto 0);  --ADC1 output for duty control with CS feedback
		ADC_SCLK1 : buffer std_logic;     --clock1 for ADC1, ADC2 and ADC3
		ADC_CONST1 : buffer std_logic;       
		ADC_SDO1 : in std_logic; 
	
		ADC_CONST2 : buffer std_logic;       
		ADC_SDO2 : in std_logic; 
		
		--ADC_DB6 : out std_logic_vector(7 downto 0);  --ADC6 output for frequency control, from input DC sampling
		ADC_SCLK2 : buffer std_logic;     --clock2 for ADC4, ADC5, ADC6
		ADC_CONST6 : buffer std_logic;       
		ADC_SDO6 : in std_logic; 
		
		DAC_SCLK1 : out std_logic;
		DAC_CONST1 : buffer std_logic;
		DAC_SDI1  : out std_logic;
		DAC_SDO1  : in std_logic;
		
		COMP7 : in std_logic;       --output of the comparator7 

		Qm_EN : buffer std_logic;     -- Qm Driver output enable signal
		MonSig  : out std_logic;
		MonSig2 : out std_logic;
		PWMHout : out std_logic;    --PWM signal output
		PWMLout : out std_logic    --PWM signal output 
	);

end entity;

architecture behavior of TopCRPWM is

	signal rst_sig : std_logic;
	signal PWMsig : std_logic;
	signal PWMsig_FreqCtrl : std_logic;
	signal PWMTEST_FreqCtrl : std_logic;
	
	signal FastADclk, clk76P7M : std_logic;
	
	signal ADC_CONST : std_logic;
	
	signal ADC_SCLKDUMP : std_logic;
	
	signal clk1M, clk20K : std_logic;

	signal ADC1dataout, ADC2dataout, ADC6dataout : std_logic_vector(11 downto 0);
	
	signal ADfiltD1, ADfiltD2, DTContrl : std_logic_vector(7 downto 0);
	signal ADfiltclk1, FreqUpdateClk: std_logic;
	
	signal DAC1datain : std_logic_vector(11 downto 0);  -- output of the ADC2DAC table
	signal FQctrlcode, PWMCountMax : std_logic_vector(11 downto 0);  -- output of the linear Freqcontrol table, range 24kHz to 178kHz
	
	signal DTctrl : std_logic_vector(9 downto 0);
	signal FBsamp : std_logic_vector(7 downto 0);
	
	
	signal PWMtest, ADC_Sampclk, PWMHsig, PWMLsig: std_logic;
	
	component PLLfile is
	  port (
		refclk   : in  std_logic := '0'; -- ==> Mclk
		rst      : in  std_logic := '0'; -- ==> rst_sig
	 	outclk_0 : out std_logic;        -- ==> FastADclk
		outclk_1 : out std_logic			-- ==> clk76P7M for frequency varied PWM clock 

 		);
	 end component;

	
	component DutyMinMax_FreqCtrl is 
	port ( 
		reset : in std_logic;
		Qm_EN : in std_logic;
		PWMclk : in std_logic;  -- 50MHz for PWM frequency variation from 50kHz to 170kHz
		PWM_rst : in std_logic; -- COMP7 come from comparator#7 output
		PWMCountMax : in std_logic_vector(10 downto 0);
		PWMTEST : out std_logic; -- Frequency variation with 50% duty for testing purpose
		PWMout : buffer std_logic
	);
	end component;
	
	component ADC_control is
	port(
		reset : in std_logic;
		clkin : in std_logic;    
		ADC_SCLK  : out std_logic;    
		ADC_const	 : in std_logic; 
		ADC_SDO : in std_logic;		 
		ADC_DBO: out std_logic_vector(11 downto 0)  --ADCdataout
	);

	end component;
	
	component DAC_control is
	port(
		reset : in std_logic;   
		clkin : in std_logic;   -- Define the working speed of AD5592, same as DAC_sclk.
		DAC_sclk  : out std_logic;  -- Connect to the SCLK pin of AD5592.
		DAC_const	 : in std_logic; -- Connect to the SYNC pin of AD5592, DAC Output Speed : DAC_sclk / 21.
		DAC_SDI: out std_logic;   -- Connect to the SDI pin of AD5592, serial data input for AD5592.
		DAC_SDO: in std_logic;  -- Connect to the SDO pin of AD5592, serial data output for AD5592.
		DAC_input: in std_logic_vector(11 downto 0)
	);
   end component;
	
	component StartDACADC is 

	port ( 
		reset : in std_logic;
		clkin : in std_logic;  
		ADC_const : out std_logic;
		DAC_const: out std_logic
	);
	end component;
	
	component TableADC2DAC is 

   	port (
			reset :  in std_logic;
			clkin : in std_logic;
			din : in std_logic_vector(11 downto 0);
			dout: out std_logic_vector(11 downto 0)
	  );

   end component;
	
	component TableFreqCtrl is 

   	port (
			reset :  in std_logic;
			clkin : in std_logic;
			din : in std_logic_vector(11 downto 0);
			dout: out std_logic_vector(11 downto 0)
	  );

	end component;
	
	component DeadTimer is

	port(
		reset : in std_logic;
		clkin  : in std_logic;
		DTA	: in std_logic_vector(4 downto 0);
		DTB	: in std_logic_vector(4 downto 0);
		PWMsig : in std_logic;
		PWMTEST : in std_logic;
		PWMTest_Delay : out std_logic;
		QmDrv	: out std_logic;
		QaDrv	: out std_logic
		);

	end component;
	
	component LEDctrl is
	port (
			reset : in std_logic;
			clk : in std_logic;
			bcd : in std_logic_vector(3 downto 0);  --BCD input
			segment7 : out std_logic_vector(6 downto 0)  -- 7 bit decoded output.
    );
	end component;
	
	component CLKDIV is
   port (
	 reset	  : in  std_logic;
    clk50M : in  std_logic;
    clk1M   : buffer std_logic;
	 clk20K	: out std_logic);
	 
   end component;
	
	component ADFilter is

	port(
		reset : in std_logic;
		csin : in std_logic;
		datain : in std_logic_vector(7 downto 0);
		clkout	 : out std_logic;
		dataout: out std_logic_vector(7 downto 0)	
	);

	end component;
	
	component DCsampTable is 

   	port (
			reset :  in std_logic;
			clkin : in std_logic;
			din : in std_logic_vector(11 downto 0);
			dout: out std_logic_vector(11 downto 0)
	  );

	end component;
	
	
	component FBCOMP is 

		port ( 
			reset : in std_logic;
			clk : in std_logic;  
			FBH : in std_logic_vector(7 downto 0);
			FBL : in std_logic_vector(7 downto 0);
			FBSamp : in std_logic_vector(7 downto 0);
			Qm_EN : buffer std_logic
		);
	end component;
	

	begin 
	
	 rst_sig <= not Reset;
	  
	 UPLLT: PLLfile
		  port map(Mclk, rst_sig, FastADclk, clk76P7M);
			
	 USYCT: StartDACADC
		  port map(rst_sig, Mclk, ADC_CONST, DAC_CONST1);
	
	  UCKVT: CLKDIV 
		  port map (rst_sig, Mclk, clk1M, clk20K);
	 
	 ADC_CONST1 <= ADC_CONST;
	 ADC_CONST2 <= ADC_CONST;
	 
	 ADC_CONST6 <= ADC_CONST;  --DC bus sampling rate
	 
	 UAD1T: ADC_control 
	     port map(rst_sig, Mclk, ADC_SCLK1, ADC_CONST1, ADC_SDO1, ADC1dataout);  --ADC1 for open loop testing, connect to opto for close loop control.
	 
	 UAD2T: ADC_control 
	     port map(rst_sig, Mclk, ADC_SCLKDUMP, ADC_CONST2, ADC_SDO2, ADC2dataout); 
		  
	 UAD6T: ADC_control --sampling rate 0.8Ksps, each cycle has 16 points
	     port map(rst_sig, Mclk, ADC_SCLK2, ADC_CONST6, ADC_SDO6, ADC6dataout);  -- ADC6 for load variation.
	 
	 UFLT1: ADFilter
			port map(rst_sig, ADC_CONST, ADC6dataout(11 downto 4), ADfiltclk1, ADfiltD1);
			
	 UFLT2: ADFilter
   		port map(rst_sig, ADfiltclk1, ADfiltD1, FreqUpdateClk, FBsamp);
	 
	 UDA1T: DAC_control
		  port map(rst_sig, Mclk, DAC_SCLK1, DAC_CONST1, DAC_SDI1, DAC_SDO1, DAC1datain);
		  
	 UADAT: TableADC2DAC 
		  port map(rst_sig, Mclk, ADC2dataout, DAC1datain);
		  
	 --ADC1 for DeadTime control
    --ADC2 for Current Control Loop
    --ADC6 for Load Variation Detection	 
	 UDSPT: TableFreqCtrl
			port map(reset => rst_sig, 
					  clkin => Mclk, 
					  din(11 downto 8) => "0000",
					  din(7 downto 0) => FBsamp, 
					  dout => PWMCountMax);	  
		  
	 --ADC_DB1 <= ADC1dataout(11 downto 4);

	 --ADC_DB6 <= PWMCountMax(10 downto 3);
	 DTContrl(7 downto 4) <= ADC1dataout(11 downto 8);
	 DTContrl(3 downto 1) <= "000";
	 DTContrl(0) <= ADC1dataout(7);
	 
	 
	 ULED0: LEDCtrl
			port map(rst_sig, Mclk, ADC1dataout(7 downto 4), LEDHEX0);
	 ULED1: LEDCtrl
			port map(rst_sig, Mclk, ADC1dataout(11 downto 8), LEDHEX1);
			
	 ULED4: LEDCtrl
			port map(rst_sig, Mclk, KeyBoardin(3 downto 0), LEDHEX4);
	 ULED5: LEDCtrl
			port map(rst_sig, Mclk, KeyBoardin(7 downto 4), LEDHEX5);	


	 UCP2T: DutyMinMax_FreqCtrl
			port map(rst_sig, Qm_EN, clk76P7M, COMP7, PWMCountMax(10 downto 0), PWMTEST_FreqCtrl, PWMsig_FreqCtrl);
			
	 --PWMTEST <= FrequpdateClk; --PWMTEST_FreqCtrl;
	 MonSig <= COMP7;
	 MonSig2 <= clk20K;
	 PWMsig <= PWMsig_FreqCtrl;
	 PWMTEST <= PWMTEST_FreqCtrl;
	 
	 DTctrl(9 downto 5) <= "11111";  --dead time 820ns
	 DTctrl(4 downto 0) <= "01000";  -- dead time 200ns
	 
	 UDTT: DeadTimer
			port map(rst_sig, Mclk, DTctrl(9 downto 5), DTctrl(4 downto 0), PWMsig, PWMTEST, ADC_Sampclk, PWMHsig, PWMLsig);

			
	 UCMPT: FBCOMP 
		  port map(rst_sig, ADC_Sampclk, keyBoardin(7 downto 0), ADC1dataout(11 downto 4), ADC2dataout(11 downto 4), Qm_EN);
			
	 PWMHout <= PWMHsig and Qm_EN;
    PWMLout <= PWMLsig or (not Qm_EN);		--make the Qa driver low when Qm is disabled. 

--		PWMHout <= PWMHsig;
--		PWMLout <= PWMLsig;
			
end behavior;