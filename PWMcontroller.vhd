

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity PWMcontroller is 

   	port (
		clkin   : in  std_logic;
		rst      : in  std_logic; 
		Dutyctrl : in std_logic_vector(7 downto 0);
		PWMHout : out std_logic;
		PWMLout : out std_logic
	  );

end entity;


  architecture behavior of PWMcontroller is 
  
	 
	 component SawCounter is 

		port ( 
		reset : in std_logic;
		clkin : in std_logic;
		CntOut : out std_logic_vector(7 downto 0)
		);
   end component;
	
	component Comparator is 

	 port ( 
		reset : in std_logic;
		clkin : in std_logic;
		DutyCtrl : in std_logic_vector(7 downto 0);
		Cntout: in std_logic_vector(7 downto 0);
		PWMout : out std_logic
	   );
	 end component;
	 
	 component NonLinearBox is 

    port (
			clkin : in std_logic;
			reset :  in std_logic;
			din : in std_logic_vector(7 downto 0);
			dout: out std_logic_vector(7 downto 0)
	  );

	 end component;

	 
	 signal rst_sig  : std_logic;
	 signal clkdivout : std_logic;
	 signal Dutyctrl_reg, Dutyctrl_reg2 : std_logic_vector(7 downto 0);
	 signal DutyctrlOut : std_logic_vector(7 downto 0);
	 signal Counterout : std_logic_vector(7 downto 0);
	 
	 signal plllock, PWMsig: std_logic;

 begin 

  rst_sig <= rst;
 
			
  PPLine : process(rst_sig, clkin) 
	begin
	   if rst_sig = '1' then 
			Dutyctrl_reg <= (others => '0');
			Dutyctrl_reg2 <= (others => '0');
		elsif (clkin'event and clkin = '1') then	
			Dutyctrl_reg <= Dutyctrl;
			Dutyctrl_reg2 <= Dutyctrl_reg;
		end if;
	end process;
	
	
  ULT  : NonLinearBox
		port map  (clkin, rst_sig, Dutyctrl_reg2, DutyctrlOut);
		
  UST  : SawCounter
		port map (rst_sig, clkin, Counterout);
		
  UCT  : Comparator
		port map (rst_sig, clkin, Dutyctrlout, Counterout, PWMsig);
		

		
 -- UDTT : DeadTimer
--		generic map (N => 20)
	--	port map (clk_200M, rst_sig, PWMsig, PWMHout, PWMLout);
	
	PWMHout <= PWMsig;
	PWMLout <= not PWMsig;

end;


















		
	
