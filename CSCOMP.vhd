
--Releaized multiple trigging for clock generation!!


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CRPWM is 

	port ( 
		reset : in std_logic;
		PWMclk : in std_logic;  --35.8MHz for 140kHz PWM
		PWM_rst : in std_logic;
		LEB : out std_logic;  -- Leading Edge Blocking signal, 140kHz, blocking time 1us. 
		ADfilter : out std_logic;
		PWMTEST : out std_logic; -- 140kHZ 50% duty. 
		PWMout : out std_logic
	);
end entity;


architecture arch of CRPWM is 
	
  signal CSflag   : std_logic;  --Prevent multiple trigging error when count1 is less than 128
  signal count1, count2, count3, count4: integer range 0 to 255;


begin
	
 PWMGen : process (reset, PWMclk)
	begin
	  if reset = '1' then 
			PWMout <= '0';
			CSflag <= '0';
	  elsif (PWMclk'event and PWMclk = '1') then

			if count1 < 36 then   ---min duty 36 x 28ns = 1[us] 
					PWMout <= '1';
			elsif count1 < 150 then  -- max duty limit  until 150 x 28ns = 4.2[us]
			
					if PWM_rst = '1'  then
						PWMout <= '0';
						CSflag <= '1';
					elsif CSflag = '0' then
						PWMout <= '1';
					else
						PWMout <= '0';
					end if;
					
			else
					PWMout <= '0';
					CSflag <= '0';
			end if;
			
		count1 <= count1 + 1;
	 end if;
  end process;
   
 CLKGen : process (reset, PWMclk)
	begin
	  if reset = '1' then 
			PWMTEST <= '0';
	  elsif (PWMclk'event and PWMclk = '1') then
	  
			if count2 < 128 then 
					PWMTEST <= '1';
			else
					PWMTEST <= '0';
			end if;
			
		count2 <= count2 + 1;
	 end if;
  end process;
  
  LEBGen : process (reset, PWMclk)
	begin
	  if reset = '1' then 
			LEB <= '1';
	  elsif (PWMclk'event and PWMclk = '1') then
	  
			if count3 < 28 then  ---- minimum duty during nomral operation.  2500 ns / 35.8 
					LEB <= '0';
			else
					LEB <= '1';
			end if;
		count3 <= count3 + 1;
	 end if;
  end process;
  

  FLTGen : process (reset, PWMclk)
	begin
	  if reset = '1' then 
			ADfilter <= '1';
	  elsif (PWMclk'event and PWMclk = '1') then
	  
			if count4 < 38 then  ---- ADinput blocking signal.  2500 ns / 35.8 
					ADfilter <= '0';
			else
					ADfilter <= '1';
			end if;
		count4 <= count4 + 1;
	 end if;
  end process;
  
end arch;





