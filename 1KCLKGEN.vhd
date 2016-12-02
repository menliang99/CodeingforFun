library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CLKDIV is
  port (
	 reset	  : in  std_logic;
    clk50M : in  std_logic;
    clk1M   : buffer std_logic;
	 clk20K	: out std_logic);
	 
end CLKDIV;

architecture Behavioral of CLKDIV is

signal count1: integer range 0 to 49;
signal count2: integer range 0 to 49;

begin
	
   clk1MGen : process (reset, clk50M)
	begin
	  if reset = '1' then 
			count1 <= 0;
			clk1M <= '0';
	  elsif (clk50M'event and clk50M = '1') then
	  
			if count1 < 25 then 
					clk1M  <= '0';
			else
					clk1M  <= '1';
			end if;

			if count1 = 49 then	-- without the if statement, generated clk is 781.25kHZ! BUG of VHDL!
				count1 <= 0;
			else
				count1 <= count1 + 1;
			end if;
			
	 end if;
  end process;
  

    clk20KGen : process (reset, clk1M)
	begin
	  if reset = '1' then 
			count2 <= 0;
			clk20K <= '0';
	  elsif (clk1M'event and clk1M = '1') then
	  
			if count2 < 14 then 
					clk20K  <= '0';
			else
					clk20K  <= '1';
			end if;
			
			if count2 = 49 then	-- without the if statement, generated clk is 762HZ! BUG of VHDL!
				count2 <= 0;
			else
				count2 <= count2 + 1;
			end if;
	 end if;
  end process;
  
  
  
end Behavioral;