
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Comparator is 

	port ( 
		reset : in std_logic;
		clkin : in std_logic;
		DutyCtrl : in std_logic_vector(7 downto 0);
		Cntout: in std_logic_vector(7 downto 0);
		PWMout : out std_logic
	);
end entity;


architecture arch of Comparator is 
	
  signal PWMsig : std_logic;

begin
	
  cntproc : process (reset, clkin)
	begin
	  if reset = '1' then 
		PWMsig <= '0';
	  elsif (clkin'event and clkin = '1') then
		if DutyCtrl < Cntout then   --define the cornner case
		  PWMsig <= '1';
		else
		  PWMsig <= '0';
		end if;
	 end if;
  end process;

PWMout <= PWMsig;

end arch;


--cornner case :
-- Refin			duty
-- x00			99.6% (255/256)
-- xFF			0%
-- x7F			50%




