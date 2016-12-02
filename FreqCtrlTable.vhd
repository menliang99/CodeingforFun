

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity TableFreqCtrl is 

   	port (
			reset :  in std_logic;
			clkin : in std_logic;
			din : in std_logic_vector(11 downto 0);
			dout: out std_logic_vector(11 downto 0)
	  );

end entity;


architecture behavior of TableFreqCtrl is 

  signal dout12bit : std_logic_vector(11 downto 0);

  begin 

  Trans:	 process(clkin, reset) 
	 begin 
	 
	  if reset = '1' then 
  
          dout12bit <= (others => '0');
	  
	  elsif (clkin'event and clkin = '1') then
	  
		case din(7 downto 0) is
		
		when x"00" => dout12bit <= x"237";
		when x"01" => dout12bit <= x"237";
		when x"02" => dout12bit <= x"237";
		when x"03" => dout12bit <= x"237";
		when x"04" => dout12bit <= x"237";
		when x"05" => dout12bit <= x"237";
		when x"06" => dout12bit <= x"237";
		when x"07" => dout12bit <= x"237";
		when x"08" => dout12bit <= x"237";
		when x"09" => dout12bit <= x"237";
		when x"0a" => dout12bit <= x"237";
		when x"0b" => dout12bit <= x"237";
		when x"0c" => dout12bit <= x"237";
		when x"0d" => dout12bit <= x"237";
		when x"0e" => dout12bit <= x"237";
		when x"0f" => dout12bit <= x"237";
		when x"10" => dout12bit <= x"237";
		when x"11" => dout12bit <= x"237";
		when x"12" => dout12bit <= x"237";
		when x"13" => dout12bit <= x"237";
		when x"14" => dout12bit <= x"237";
		when x"15" => dout12bit <= x"237";
		when x"16" => dout12bit <= x"237";
		when x"17" => dout12bit <= x"237";
		when x"18" => dout12bit <= x"237";
		when x"19" => dout12bit <= x"237";
		when x"1a" => dout12bit <= x"237";
		when x"1b" => dout12bit <= x"237";
		when x"1c" => dout12bit <= x"237";
		when x"1d" => dout12bit <= x"237";
		when x"1e" => dout12bit <= x"237";
		when x"1f" => dout12bit <= x"237";
		when x"20" => dout12bit <= x"237";
		when x"21" => dout12bit <= x"237";
		when x"22" => dout12bit <= x"237";
		when x"23" => dout12bit <= x"237";
		when x"24" => dout12bit <= x"237";
		when x"25" => dout12bit <= x"237";
		when x"26" => dout12bit <= x"237";
		when x"27" => dout12bit <= x"237";
		when x"28" => dout12bit <= x"237";
		when x"29" => dout12bit <= x"237";
		when x"2a" => dout12bit <= x"237";
		when x"2b" => dout12bit <= x"237";
		when x"2c" => dout12bit <= x"237";
		when x"2d" => dout12bit <= x"237";
		when x"2e" => dout12bit <= x"237";
		when x"2f" => dout12bit <= x"237";
		when x"30" => dout12bit <= x"237";
		when x"31" => dout12bit <= x"237";
		when x"32" => dout12bit <= x"237";
		when x"33" => dout12bit <= x"237";
		when x"34" => dout12bit <= x"237";
		when x"35" => dout12bit <= x"237";
		when x"36" => dout12bit <= x"237";
		when x"37" => dout12bit <= x"237";
		when x"38" => dout12bit <= x"237";
		when x"39" => dout12bit <= x"237";
		when x"3a" => dout12bit <= x"237";
		when x"3b" => dout12bit <= x"237";
		when x"3c" => dout12bit <= x"237";
		when x"3d" => dout12bit <= x"237";
		when x"3e" => dout12bit <= x"237";
		when x"3f" => dout12bit <= x"237";
		when x"40" => dout12bit <= x"237";
		when x"41" => dout12bit <= x"237";
		when x"42" => dout12bit <= x"237";
		when x"43" => dout12bit <= x"237";
		when x"44" => dout12bit <= x"237";
		when x"45" => dout12bit <= x"237";
		when x"46" => dout12bit <= x"23c";
		when x"47" => dout12bit <= x"23c";
		when x"48" => dout12bit <= x"23c";
		when x"49" => dout12bit <= x"240";
		when x"4a" => dout12bit <= x"240";
		when x"4b" => dout12bit <= x"240";
		when x"4c" => dout12bit <= x"244";
		when x"4d" => dout12bit <= x"244";
		when x"4e" => dout12bit <= x"244";
		when x"4f" => dout12bit <= x"249";
		when x"50" => dout12bit <= x"249";
		when x"51" => dout12bit <= x"249";
		when x"52" => dout12bit <= x"24d";
		when x"53" => dout12bit <= x"24d";
		when x"54" => dout12bit <= x"24d";
		when x"55" => dout12bit <= x"252";
		when x"56" => dout12bit <= x"252";
		when x"57" => dout12bit <= x"252";
		when x"58" => dout12bit <= x"256";
		when x"59" => dout12bit <= x"258";
		when x"5a" => dout12bit <= x"258";
		when x"5b" => dout12bit <= x"25d";
		when x"5c" => dout12bit <= x"25d";
		when x"5d" => dout12bit <= x"25d";
		when x"5e" => dout12bit <= x"262";
		when x"5f" => dout12bit <= x"262";
		when x"60" => dout12bit <= x"267";
		when x"61" => dout12bit <= x"267";
		when x"62" => dout12bit <= x"26c";
		when x"63" => dout12bit <= x"26c";
		when x"64" => dout12bit <= x"271";
		when x"65" => dout12bit <= x"271";
		when x"66" => dout12bit <= x"276";
		when x"67" => dout12bit <= x"276";
		when x"68" => dout12bit <= x"27b";
		when x"69" => dout12bit <= x"27b";
		when x"6a" => dout12bit <= x"27b";
		when x"6b" => dout12bit <= x"281";
		when x"6c" => dout12bit <= x"281";
		when x"6d" => dout12bit <= x"286";
		when x"6e" => dout12bit <= x"286";
		when x"6f" => dout12bit <= x"28b";
		when x"70" => dout12bit <= x"28b";
		when x"71" => dout12bit <= x"291";
		when x"72" => dout12bit <= x"291";
		when x"73" => dout12bit <= x"293";
		when x"74" => dout12bit <= x"293";
		when x"75" => dout12bit <= x"298";
		when x"76" => dout12bit <= x"298";
		when x"77" => dout12bit <= x"298";
		when x"78" => dout12bit <= x"29e";
		when x"79" => dout12bit <= x"29e";
		when x"7a" => dout12bit <= x"29e";
		when x"7b" => dout12bit <= x"2a4";
		when x"7c" => dout12bit <= x"2a4";
		when x"7d" => dout12bit <= x"2a4";
		when x"7e" => dout12bit <= x"2aa";
		when x"7f" => dout12bit <= x"2aa";
		when x"80" => dout12bit <= x"2aa";
		when x"81" => dout12bit <= x"2b0";
		when x"82" => dout12bit <= x"2b0";
		when x"83" => dout12bit <= x"2b0";
		when x"84" => dout12bit <= x"2b7";
		when x"85" => dout12bit <= x"2b7";
		when x"86" => dout12bit <= x"2b7";
		when x"87" => dout12bit <= x"2b7";
		when x"88" => dout12bit <= x"2bd";
		when x"89" => dout12bit <= x"2bf";
		when x"8a" => dout12bit <= x"2bf";
		when x"8b" => dout12bit <= x"2bf";
		when x"8c" => dout12bit <= x"2bf";
		when x"8d" => dout12bit <= x"2bf";
		when x"8e" => dout12bit <= x"2bf";
		when x"8f" => dout12bit <= x"2bf";
		when x"90" => dout12bit <= x"2bf";
		when x"91" => dout12bit <= x"2bf";
		when x"92" => dout12bit <= x"2bf";
		when x"93" => dout12bit <= x"2bf";
		when x"94" => dout12bit <= x"2bf";
		when x"95" => dout12bit <= x"2bf";
		when x"96" => dout12bit <= x"2bf";
		when x"97" => dout12bit <= x"2bf";
		when x"98" => dout12bit <= x"2bf";
		when x"99" => dout12bit <= x"2bf";
		when x"9a" => dout12bit <= x"2bf";
		when x"9b" => dout12bit <= x"2bf";
		when x"9c" => dout12bit <= x"2bf";
		when x"9d" => dout12bit <= x"2bf";
		when x"9e" => dout12bit <= x"2bf";
		when x"9f" => dout12bit <= x"2bf";
		when x"a0" => dout12bit <= x"2bf";
		when x"a1" => dout12bit <= x"2bf";
		when x"a2" => dout12bit <= x"2bf";
		when x"a3" => dout12bit <= x"2bf";
		when x"a4" => dout12bit <= x"2bf";
		when x"a5" => dout12bit <= x"2bf";
		when x"a6" => dout12bit <= x"2bf";
		when x"a7" => dout12bit <= x"2bf";
		when x"a8" => dout12bit <= x"2bf";
		when x"a9" => dout12bit <= x"2bf";
		when x"aa" => dout12bit <= x"2bf";
		when x"ab" => dout12bit <= x"2bf";
		when x"ac" => dout12bit <= x"2bf";
		when x"ad" => dout12bit <= x"2bf";
		when x"ae" => dout12bit <= x"2bf";
		when x"af" => dout12bit <= x"2bf";
		when x"b0" => dout12bit <= x"2bf";
		when x"b1" => dout12bit <= x"2bf";
		when x"b2" => dout12bit <= x"2bf";
		when x"b3" => dout12bit <= x"2bf";
		when x"b4" => dout12bit <= x"2bf";
		when x"b5" => dout12bit <= x"2bf";
		when x"b6" => dout12bit <= x"2bf";
		when x"b7" => dout12bit <= x"2bf";
		when x"b8" => dout12bit <= x"2bf";
		when x"b9" => dout12bit <= x"2bf";
		when x"ba" => dout12bit <= x"2bf";
		when x"bb" => dout12bit <= x"2bf";
		when x"bc" => dout12bit <= x"2bf";
		when x"bd" => dout12bit <= x"2bf";
		when x"be" => dout12bit <= x"2bf";
		when x"bf" => dout12bit <= x"2bf";
		when x"c0" => dout12bit <= x"2bf";
		when x"c1" => dout12bit <= x"2bf";
		when x"c2" => dout12bit <= x"2bf";
		when x"c3" => dout12bit <= x"2bf";
		when x"c4" => dout12bit <= x"2bf";
		when x"c5" => dout12bit <= x"2bf";
		when x"c6" => dout12bit <= x"2bf";
		when x"c7" => dout12bit <= x"2bf";
		when x"c8" => dout12bit <= x"2bf";
		when x"c9" => dout12bit <= x"2bf";
		when x"ca" => dout12bit <= x"2bf";
		when x"cb" => dout12bit <= x"2bf";
		when x"cc" => dout12bit <= x"2bf";
		when x"cd" => dout12bit <= x"2bf";
		when x"ce" => dout12bit <= x"2bf";
		when x"cf" => dout12bit <= x"2bf";
		when x"d0" => dout12bit <= x"2bf";
		when x"d1" => dout12bit <= x"2bf";
		when x"d2" => dout12bit <= x"2bf";
		when x"d3" => dout12bit <= x"2bf";
		when x"d4" => dout12bit <= x"2bf";
		when x"d5" => dout12bit <= x"2bf";
		when x"d6" => dout12bit <= x"2bf";
		when x"d7" => dout12bit <= x"2bf";
		when x"d8" => dout12bit <= x"2bf";
		when x"d9" => dout12bit <= x"2bf";
		when x"da" => dout12bit <= x"2bf";
		when x"db" => dout12bit <= x"2bf";
		when x"dc" => dout12bit <= x"2bf";
		when x"dd" => dout12bit <= x"2bf";
		when x"de" => dout12bit <= x"2bf";
		when x"df" => dout12bit <= x"2bf";
		when x"e0" => dout12bit <= x"2bf";
		when x"e1" => dout12bit <= x"2bf";
		when x"e2" => dout12bit <= x"2bf";
		when x"e3" => dout12bit <= x"2bf";
		when x"e4" => dout12bit <= x"2bf";
		when x"e5" => dout12bit <= x"2bf";
		when x"e6" => dout12bit <= x"2bf";
		when x"e7" => dout12bit <= x"2bf";
		when x"e8" => dout12bit <= x"2bf";
		when x"e9" => dout12bit <= x"2bf";
		when x"ea" => dout12bit <= x"2bf";
		when x"eb" => dout12bit <= x"2bf";
		when x"ec" => dout12bit <= x"2bf";
		when x"ed" => dout12bit <= x"2bf";
		when x"ee" => dout12bit <= x"2bf";
		when x"ef" => dout12bit <= x"2bf";
		when x"f0" => dout12bit <= x"2bf";
		when x"f1" => dout12bit <= x"2bf";
		when x"f2" => dout12bit <= x"2bf";
		when x"f3" => dout12bit <= x"2bf";
		when x"f4" => dout12bit <= x"2bf";
		when x"f5" => dout12bit <= x"2bf";
		when x"f6" => dout12bit <= x"2bf";
		when x"f7" => dout12bit <= x"2bf";
		when x"f8" => dout12bit <= x"2bf";
		when x"f9" => dout12bit <= x"2bf";
		when x"fa" => dout12bit <= x"2bf";
		when x"fb" => dout12bit <= x"2bf";
		when x"fc" => dout12bit <= x"2bf";
		when x"fd" => dout12bit <= x"2bf";
		when x"fe" => dout12bit <= x"2bf";
		when x"ff" => dout12bit <= x"2bf";

	   when others => dout12bit <= x"2bf";  -- 140kHz
				
	 end case;
	 
	end if;
	  
  end process;
  
   dout <= dout12bit(11 downto 0);
  
end behavior;
