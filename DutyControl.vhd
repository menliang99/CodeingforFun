-- Asymmetric Half-Bridge Flyback Converter  "DutyControl.vhd"
-- CR-PWM Controller Block for 140kHz
--   May 09, 2016


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DutyMinMax_FreqCtrl is 

	port ( 
		reset : in std_logic;
		Qm_EN : in std_logic;
		PWMclk : in std_logic;  --50MHz for PWM ranging 50kHz to 178kHz
		PWM_rst : in std_logic;
		PWMCountMax : in std_logic_vector(10 downto 0);
		PWMTEST : out std_logic; -- 50% fixed duty for testing purpose
		PWMout : buffer std_logic
	);
end entity;


architecture arch of DutyMinMax_FreqCtrl is 
	
  signal count: integer range 0 to 2047;  --PWM signal with enable control
  signal countTest : integer range 0 to 2047; -- PWM signal without enable control, for ADC sampling the FB pin, and testing purpose. 
  signal PWMINIT : std_logic;  -- gradually increase the PWM duty, quick stablize and current loop. 
  signal PWMNORMAL : std_logic;
  
  signal dutyoffset : integer range 0 to 255;  -- duty control of the initial pluse 
  signal initplusecount : integer range 0 to 7;  -- number of initial pluse
  
begin
	
	
 CountTESTGen : process (reset, PWMclk)
   begin	
		if reset = '1' then	
			countTest <= 0;
		elsif (PWMclk'event and PWMclk = '1') then
			if countTest < to_integer(unsigned(PWMCountMax)) then
				countTest <= countTest + 1;
			else	
				countTest <= 0;
			end if;
		end if;
	end process;
	
	
	
 CountGen : process (reset, Qm_EN, PWMclk)
   begin	
		if reset = '1' or Qm_EN = '0' then	
			count <= 0;
			dutyoffset <= 64;  
			initplusecount <= 4;
		elsif (PWMclk'event and PWMclk = '1') then
			if count < to_integer(unsigned(PWMCountMax)) then
				count <= count + 1;
			else	
				count <= 0;
				
				if dutyoffset > 0 then	
					dutyoffset <= dutyoffset - 16;  -- 16 * initplusecount = dutyoffset
				else 
					dutyoffset <= 0;
				end if;
				
				if initplusecount > 0 then		
					initplusecount <= initplusecount - 1;
				else	
					initplusecount <= 0;
				end if;
				 
			end if;
		end if;
	end process;
	
	

		
 InitPulseGen : process (reset, PWMclk)
	begin 
	  if reset = '1' then 
			PWMINIT <= '0';

	  elsif (PWMclk'event and PWMclk = '1') then
	  
			if count < (to_integer(unsigned(PWMCountMax) srl 2) - dutyoffset) then 
					PWMINIT <= '1';
			else
					PWMINIT <= '0';
			end if;
			
	 end if;
  end process;
 
	
 PWMGen : process (reset, Qm_EN, PWMclk)
	begin
	  if reset = '1' or Qm_EN = '0' then 
			PWMNORMAL <= '0';
	  elsif (PWMclk'event and PWMclk = '1') then

			if count < to_integer(unsigned(PWMCountMax) srl 3) then   -- divide by 8, min duty is 12.5%
					PWMNORMAL <= '1';
			elsif count < (to_integer(unsigned(PWMCountMax) srl 1) + to_integer(unsigned(PWMCountMax) srl 3)) then  -- max duty limit  50% + 12.5%
					if PWM_rst = '1'  then
						PWMNORMAL <= '0';
					 else 
						PWMNORMAL <= PWMNORMAL;
					end if;
			else
					PWMNORMAL <= '0';
			end if;
			
	 end if;
  end process;
   
 CLKGen : process (reset, PWMclk)  -- 50% duty PWM signal without enable control. 
	begin
	  if reset = '1' then 
			PWMTEST <= '0';

	  elsif (PWMclk'event and PWMclk = '1') then
	  
			if countTest < to_integer(unsigned(PWMCountMax) srl 1) then 
					PWMTEST <= '1';
			else
					PWMTEST <= '0';
			end if;
			
	 end if;
  end process;
  
  
--  PWMoutputSel : process (reset, Qm_EN, PWMclk)
--	begin
--	
--	  if reset = '1' or Qm_EN = '0' then 
--			PWMout <= '0';
--
--	  elsif (PWMclk'event and PWMclk = '1') then
--	  
--			if initplusecount > 0 then 
--					PWMout <= PWMINIT;
--			else
--					PWMout <= PWMNORMAL;
--			end if;
--			
--	 end if;
--  end process;
  
  PWMout <= PWMNORMAL;
 
  
end arch;




