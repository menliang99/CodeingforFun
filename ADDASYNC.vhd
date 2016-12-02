
--Releaized multiple trigging for clock generation!!


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADDASYNC is 

	port ( 
		reset : in std_logic;
		clkin : in std_logic;  --50MHz for 140kHz PWM
		ADC_const : out std_logic;
		DAC_const : out std_logic
	);
end entity;


architecture arch of ADDASYNC is 
	
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
			
		count2 <= count2 + 1;
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
			
		count1 <= count1 + 1;
	 end if;
  end process;
  	
end arch;