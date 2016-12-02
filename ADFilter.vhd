
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
 


entity ADFilter is

	port(
		reset : in std_logic;
		csin : in std_logic;
		datain : in std_logic_vector(7 downto 0);
		clkout	 : out std_logic;
		dataout: out std_logic_vector(7 downto 0)	
	);

end entity;

  architecture behavior of ADFilter is

	signal accmu : std_logic_vector(9 downto 0);
	type instate_type is (S_reset, S_cycle1, S_cycle2, S_cycle3, S_cycle4);
	signal curin_state: instate_type;
	
  begin

 state_tran : process(reset, csin)  -- state machine for initialization
	 begin
	    if reset = '1' then
			curin_state <= S_reset;
	    elsif csin 'event and csin = '0' then		
	
		case curin_state is
				
			when S_reset =>
				  curin_state <= S_cycle1;
			when S_cycle1=>
				  curin_state <= S_cycle2;
			when S_cycle2 =>   
				  curin_state <= S_cycle3;
			when S_cycle3 =>
				  curin_state <= S_cycle4;
			when S_cycle4 => 
					curin_state <= S_cycle1;
			when others =>
				curin_state <= S_reset;

			end case;
		end if;
    end process;
  
StatinP: process(csin)

  begin
	
	if csin 'event and csin = '1' then		
		case curin_state is
	
			when S_reset =>
				accmu <= "0000000000";
				clkout <= '0';
			when S_cycle1 =>
				dataout <= accmu(9 downto 2);
				accmu(9 downto 8) <= "00";
				accmu(7 downto 0) <= datain;
				clkout <= '1';
			when S_cycle2 =>
				accmu <= accmu + datain;
				clkout <= '1';
			when S_cycle3 =>
				accmu <= accmu + datain;
				clkout <= '0';
			when S_cycle4 =>
				accmu <= accmu + datain;
				clkout <= '0';
		end case;
	 end if;
	 
end process;	


end behavior;











