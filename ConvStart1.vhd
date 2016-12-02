-- Asymmetric Half-Bridge Flyback Converter  "ConvStart1.vhd"
-- CR-PWM Controller Block for 140kHz
--   May 09, 2016

--bug iniside, Aug, 10, 2016


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StartDACADC is 

	port ( 
		reset : in std_logic;
		clkin : in std_logic;  --50MHz for 140kHz PWM
		ADC_const : out std_logic;
		DAC_const : out std_logic
	);
end entity;


architecture arch of StartDACADC is 
	
signal count2, count1: integer range 0 to 49;

begin
	
   ADSYNCGen : process (reset, clkin)
	begin
	  if reset = '1' then 
			ADC_const  <= '0';
			count2 <= 0;
	  elsif (clkin'event and clkin = '1') then
	  
			if count2 < 14 then 
					ADC_const  <= '0';
			else
					ADC_const  <= '1';
			end if;
			
			if count2 = 49 then	-- without the if statement, generated clk is offseted! BUG of VHDL!
				count2 <= 0;
			else
				count2 <= count2 + 1;
			end if;

	 end if;
  end process;
  
  
   DASYNCGen : process (reset, clkin)
	begin
	  if reset = '1' then 
			DAC_const  <= '0';
			count1 <= 0;
	  elsif (clkin'event and clkin = '0') then
	  
			if count1 <= 32 then	
					DAC_const <= '1';
			elsif count1 <= 48 then
					DAC_const <= '0';
			else
					DAC_const  <= '1';
			end if;
			
			if count1 = 49 then	-- without the if statement, generated clk is offseted! BUG of VHDL!
				count1 <= 0;
			else
				count1 <= count1 + 1;
			end if;
	 end if;
  end process;
  	
end arch;