library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity SawCounter is 

	port ( 
		reset : in std_logic;
		clkin : in std_logic;
		CntOut : out std_logic_vector(7 downto 0)
	);
end entity;


architecture arch of SawCounter is 
	
  signal Cntsig : std_logic_vector(7 downto 0);

begin
	
  cntproc : process (reset, clkin)
	begin
	  if reset = '1' then 
		Cntsig <= (others => '0');
	  elsif (clkin'event and clkin = '1') then
			 Cntsig <= Cntsig + 1;
	 end if;
  end process;

CntOut <= Cntsig;

end arch;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity TriCounter is 

	port ( 
		reset : in std_logic;
		clkin : in std_logic;
		Cntout : out std_logic_vector(7 downto 0)
	);
end entity;


architecture arch of TriCounter is 
	
  signal cntflag : std_logic;	
  signal Cntsig : std_logic_vector(7 downto 0);

begin
	
  Genflg : process(reset, clkin) 
	begin
	   if reset = '1' then 
		cntflag <= '0';
		elsif (clkin'event and clkin = '0') then
			if Cntsig = x"00" then	
				cntflag <= '0';
			elsif Cntsig = x"FF" then 
				cntflag <= '1';
			end if;
		 end if;
  end process;



  cntproc : process (reset, clkin)
	begin
	  if reset = '1' then 
		Cntsig <= (others => '0');
	  elsif (clkin'event and clkin = '1') then
		if cntflag = '0' then 
			Cntsig <= Cntsig + 1;
		elsif cntflag = '1' then 
			Cntsig <= Cntsig - 1;
		end if;
	 end if;
  end process;

  Cntout <= Cntsig;

end arch;


