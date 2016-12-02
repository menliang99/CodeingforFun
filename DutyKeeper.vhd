library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Dutykeeper is 
	port (
	   clkin : in std_logic;
		reset : in std_logic;
		MinDutyCtrl : in std_logic_vector(9 downto 0);
		Dutyin : in std_logic_vector(9 downto 0);
		CntTop : in std_logic_vector(9 downto 0);
		Dutyout : out std_logic_vector(9 downto 0)
	);

end entity;

architecture arch of Dutykeeper is 
  signal digoutput : std_logic_vector(19 downto 0);
  signal MinDutyscaled : std_logic_vector(19 downto 0);
  signal DutyBottom : std_logic_vector(9 downto 0);
  signal DutyScaled : std_logic_vector(9 downto 0);
begin 

  multproc : process (reset, clkin)
	begin
	 if reset = '1' then 
		digoutput <= (others => '0');
		Dutyout <= (others => '0');
	 elsif (clkin'event and clkin = '1') then
	 
		digoutput <= Dutyin * (CntTop + 1);
		MinDutyscaled <= MinDutyCtrl * "0101111100";  -- 380
		
		DutyScaled	<= digoutput(19 downto 10);
		DutyBottom	<= MinDutyscaled(19 downto 10) + x"28";    --40
		
		if (DutyScaled > DutyBottom) then		
				Dutyout <= DutyScaled;
		else 
				Dutyout <= DutyBottom;
		end if;
		
	 end if;
	end process;
	


end architecture;

----  				  CntTop 
----   Output = ------------- * input
-----						 1024