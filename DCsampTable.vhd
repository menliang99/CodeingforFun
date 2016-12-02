

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity DCsampTable is 

   	port (
			reset :  in std_logic;
			clkin : in std_logic;
			din : in std_logic_vector(11 downto 0);
			dout: out std_logic_vector(11 downto 0)
	  );

end entity;


architecture behavior of DCsampTable is 

  signal dout12bit : std_logic_vector(11 downto 0);

  begin 

  Trans:	 process(clkin, reset) 
	 begin 
	 
	  if reset = '1' then 
  
          dout12bit <= (others => '0');
	  
	  elsif (clkin'event and clkin = '1') then
	  
		case din(7 downto 0) is
		
		when x"00" => dout12bit <= x"2c0";
		when x"01" => dout12bit <= x"2c0";
		when x"02" => dout12bit <= x"2c0";
		when x"03" => dout12bit <= x"2c0";
		when x"04" => dout12bit <= x"2c0";
		when x"05" => dout12bit <= x"2c0";
		when x"06" => dout12bit <= x"2c0";
		when x"07" => dout12bit <= x"2c0";
		when x"08" => dout12bit <= x"2c0";
		when x"09" => dout12bit <= x"2c0";
		when x"0a" => dout12bit <= x"2c0";
		when x"0b" => dout12bit <= x"2c0";
		when x"0c" => dout12bit <= x"2c0";
		when x"0d" => dout12bit <= x"2c0";
		when x"0e" => dout12bit <= x"2c0";
		when x"0f" => dout12bit <= x"2c0";
		when x"10" => dout12bit <= x"2c0";
		when x"11" => dout12bit <= x"2c0";
		when x"12" => dout12bit <= x"2c0";
		when x"13" => dout12bit <= x"2c0";
		when x"14" => dout12bit <= x"2c0";
		when x"15" => dout12bit <= x"2c0";
		when x"16" => dout12bit <= x"2c0";
		when x"17" => dout12bit <= x"2c0";
		when x"18" => dout12bit <= x"2c0";
		when x"19" => dout12bit <= x"2c0";
		when x"1a" => dout12bit <= x"2c0";
		when x"1b" => dout12bit <= x"2c0";
		when x"1c" => dout12bit <= x"2c0";
		when x"1d" => dout12bit <= x"2c0";
		when x"1e" => dout12bit <= x"2c0";
		when x"1f" => dout12bit <= x"2c0";
		when x"20" => dout12bit <= x"2c0";
		when x"21" => dout12bit <= x"2c0";
		when x"22" => dout12bit <= x"2c0";
		when x"23" => dout12bit <= x"2c0";
		when x"24" => dout12bit <= x"269";
		when x"25" => dout12bit <= x"232";
		when x"26" => dout12bit <= x"214";
		when x"27" => dout12bit <= x"1ef";
		when x"28" => dout12bit <= x"1ba";
		when x"29" => dout12bit <= x"178";
		when x"2a" => dout12bit <= x"15b";
		when x"2b" => dout12bit <= x"10d";
		when x"2c" => dout12bit <= x"0e3";
		when x"2d" => dout12bit <= x"0d6";
		when x"2e" => dout12bit <= x"0c4";
		when x"2f" => dout12bit <= x"0b8";  --110kHz
		when x"30" => dout12bit <= x"0af";
		when x"31" => dout12bit <= x"0a6";
		when x"32" => dout12bit <= x"094";
		when x"33" => dout12bit <= x"092";
		when x"34" => dout12bit <= x"090";
		when x"35" => dout12bit <= x"08f";
		when x"36" => dout12bit <= x"08b";
		when x"37" => dout12bit <= x"089";
		when x"38" => dout12bit <= x"086";
		when x"39" => dout12bit <= x"082";
		when x"3a" => dout12bit <= x"07f";
		when x"3b" => dout12bit <= x"079";
		when x"3c" => dout12bit <= x"073";
		when x"3d" => dout12bit <= x"06b";
		when x"3e" => dout12bit <= x"068";
		when x"3f" => dout12bit <= x"064";
		when x"40" => dout12bit <= x"061";
		when x"41" => dout12bit <= x"05c";
		when x"42" => dout12bit <= x"05c";
		when x"43" => dout12bit <= x"05c";
		when x"44" => dout12bit <= x"05c";
		when x"45" => dout12bit <= x"05c";
		when x"46" => dout12bit <= x"05c";
		when x"47" => dout12bit <= x"05c";
		when x"48" => dout12bit <= x"05c";
		when x"49" => dout12bit <= x"05c";
		when x"4a" => dout12bit <= x"05c";
		when x"4b" => dout12bit <= x"05c";
		when x"4c" => dout12bit <= x"05c";
		when x"4d" => dout12bit <= x"05c";
		when x"4e" => dout12bit <= x"05c";
		when x"4f" => dout12bit <= x"05c";
		when x"50" => dout12bit <= x"05c";
		when x"51" => dout12bit <= x"05c";
		when x"52" => dout12bit <= x"05c";
		when x"53" => dout12bit <= x"05c";
		when x"54" => dout12bit <= x"05c";
		when x"55" => dout12bit <= x"05c";
		when x"56" => dout12bit <= x"05c";
		when x"57" => dout12bit <= x"05c";
		when x"58" => dout12bit <= x"05c";
		when x"59" => dout12bit <= x"05c";
		when x"5a" => dout12bit <= x"05c";
		when x"5b" => dout12bit <= x"05c";
		when x"5c" => dout12bit <= x"05c";
		when x"5d" => dout12bit <= x"05c";
		when x"5e" => dout12bit <= x"05c";
		when x"5f" => dout12bit <= x"05c";
		when x"60" => dout12bit <= x"05c";
		when x"61" => dout12bit <= x"05c";
		when x"62" => dout12bit <= x"05c";
		when x"63" => dout12bit <= x"05c";
		when x"64" => dout12bit <= x"05c";
		when x"65" => dout12bit <= x"05c";
		when x"66" => dout12bit <= x"05c";
		when x"67" => dout12bit <= x"05c";
		when x"68" => dout12bit <= x"05c";
		when x"69" => dout12bit <= x"05c";
		when x"6a" => dout12bit <= x"05c";
		when x"6b" => dout12bit <= x"05c";
		when x"6c" => dout12bit <= x"05c";
		when x"6d" => dout12bit <= x"05c";
		when x"6e" => dout12bit <= x"05c";
		when x"6f" => dout12bit <= x"05c";
		when x"70" => dout12bit <= x"05c";
		when x"71" => dout12bit <= x"05c";
		when x"72" => dout12bit <= x"05c";
		when x"73" => dout12bit <= x"05c";
		when x"74" => dout12bit <= x"05c";
		when x"75" => dout12bit <= x"05c";
		when x"76" => dout12bit <= x"05c";
		when x"77" => dout12bit <= x"05c";
		when x"78" => dout12bit <= x"05c";
		when x"79" => dout12bit <= x"05c";
		when x"7a" => dout12bit <= x"05c";
		when x"7b" => dout12bit <= x"05c";
		when x"7c" => dout12bit <= x"05c";
		when x"7d" => dout12bit <= x"05c";
		when x"7e" => dout12bit <= x"05c";
		when x"7f" => dout12bit <= x"05c";
		when x"80" => dout12bit <= x"05c";
		when x"81" => dout12bit <= x"05c";
		when x"82" => dout12bit <= x"05c";
		when x"83" => dout12bit <= x"05c";
		when x"84" => dout12bit <= x"05c";
		when x"85" => dout12bit <= x"05c";
		when x"86" => dout12bit <= x"05c";
		when x"87" => dout12bit <= x"05c";
		when x"88" => dout12bit <= x"05c";
		when x"89" => dout12bit <= x"05c";
		when x"8a" => dout12bit <= x"05c";
		when x"8b" => dout12bit <= x"05c";
		when x"8c" => dout12bit <= x"05c";
		when x"8d" => dout12bit <= x"05c";
		when x"8e" => dout12bit <= x"05c";
		when x"8f" => dout12bit <= x"05c";
		when x"90" => dout12bit <= x"05c";
		when x"91" => dout12bit <= x"05c";
		when x"92" => dout12bit <= x"05c";
		when x"93" => dout12bit <= x"05c";
		when x"94" => dout12bit <= x"05c";
		when x"95" => dout12bit <= x"05c";
		when x"96" => dout12bit <= x"05c";
		when x"97" => dout12bit <= x"05c";
		when x"98" => dout12bit <= x"05c";
		when x"99" => dout12bit <= x"05c";
		when x"9a" => dout12bit <= x"05c";
		when x"9b" => dout12bit <= x"05c";
		when x"9c" => dout12bit <= x"05c";
		when x"9d" => dout12bit <= x"05c";
		when x"9e" => dout12bit <= x"05c";
		when x"9f" => dout12bit <= x"05c";
		when x"a0" => dout12bit <= x"05c";
		when x"a1" => dout12bit <= x"05c";
		when x"a2" => dout12bit <= x"05c";
		when x"a3" => dout12bit <= x"05c";
		when x"a4" => dout12bit <= x"05c";
		when x"a5" => dout12bit <= x"05c";
		when x"a6" => dout12bit <= x"05c";
		when x"a7" => dout12bit <= x"05c";
		when x"a8" => dout12bit <= x"05c";
		when x"a9" => dout12bit <= x"05c";
		when x"aa" => dout12bit <= x"05c";
		when x"ab" => dout12bit <= x"05c";
		when x"ac" => dout12bit <= x"05c";
		when x"ad" => dout12bit <= x"05c";
		when x"ae" => dout12bit <= x"05c";
		when x"af" => dout12bit <= x"05c";
		when x"b0" => dout12bit <= x"05c";
		when x"b1" => dout12bit <= x"05c";
		when x"b2" => dout12bit <= x"05c";
		when x"b3" => dout12bit <= x"05c";
		when x"b4" => dout12bit <= x"05c";
		when x"b5" => dout12bit <= x"05c";
		when x"b6" => dout12bit <= x"05c";
		when x"b7" => dout12bit <= x"05c";
		when x"b8" => dout12bit <= x"05c";
		when x"b9" => dout12bit <= x"05c";
		when x"ba" => dout12bit <= x"05c";
		when x"bb" => dout12bit <= x"05c";
		when x"bc" => dout12bit <= x"05c";
		when x"bd" => dout12bit <= x"05c";
		when x"be" => dout12bit <= x"05c";
		when x"bf" => dout12bit <= x"05c";
		when x"c0" => dout12bit <= x"05c";
		when x"c1" => dout12bit <= x"05c";
		when x"c2" => dout12bit <= x"05c";
		when x"c3" => dout12bit <= x"05c";
		when x"c4" => dout12bit <= x"05c";
		when x"c5" => dout12bit <= x"05c";
		when x"c6" => dout12bit <= x"05c";
		when x"c7" => dout12bit <= x"05c";
		when x"c8" => dout12bit <= x"05c";
		when x"c9" => dout12bit <= x"05c";
		when x"ca" => dout12bit <= x"05c";
		when x"cb" => dout12bit <= x"05c";
		when x"cc" => dout12bit <= x"05c";
		when x"cd" => dout12bit <= x"05c";
		when x"ce" => dout12bit <= x"05c";
		when x"cf" => dout12bit <= x"05c";
		when x"d0" => dout12bit <= x"05c";
		when x"d1" => dout12bit <= x"05c";
		when x"d2" => dout12bit <= x"05c";
		when x"d3" => dout12bit <= x"05c";
		when x"d4" => dout12bit <= x"05c";
		when x"d5" => dout12bit <= x"05c";
		when x"d6" => dout12bit <= x"05c";
		when x"d7" => dout12bit <= x"05c";
		when x"d8" => dout12bit <= x"05c";
		when x"d9" => dout12bit <= x"05c";
		when x"da" => dout12bit <= x"05c";
		when x"db" => dout12bit <= x"05c";
		when x"dc" => dout12bit <= x"05c";
		when x"dd" => dout12bit <= x"05c";
		when x"de" => dout12bit <= x"05c";
		when x"df" => dout12bit <= x"05c";
		when x"e0" => dout12bit <= x"05c";
		when x"e1" => dout12bit <= x"05c";
		when x"e2" => dout12bit <= x"05c";
		when x"e3" => dout12bit <= x"05c";
		when x"e4" => dout12bit <= x"05c";
		when x"e5" => dout12bit <= x"05c";
		when x"e6" => dout12bit <= x"05c";
		when x"e7" => dout12bit <= x"05c";
		when x"e8" => dout12bit <= x"05c";
		when x"e9" => dout12bit <= x"05c";
		when x"ea" => dout12bit <= x"05c";
		when x"eb" => dout12bit <= x"05c";
		when x"ec" => dout12bit <= x"05c";
		when x"ed" => dout12bit <= x"05c";
		when x"ee" => dout12bit <= x"05c";
		when x"ef" => dout12bit <= x"05c";
		when x"f0" => dout12bit <= x"05c";
		when x"f1" => dout12bit <= x"05c";
		when x"f2" => dout12bit <= x"05c";
		when x"f3" => dout12bit <= x"05c";
		when x"f4" => dout12bit <= x"05c";
		when x"f5" => dout12bit <= x"05c";
		when x"f6" => dout12bit <= x"05c";
		when x"f7" => dout12bit <= x"05c";
		when x"f8" => dout12bit <= x"05c";
		when x"f9" => dout12bit <= x"05c";
		when x"fa" => dout12bit <= x"05c";
		when x"fb" => dout12bit <= x"05c";
		when x"fc" => dout12bit <= x"05c";
		when x"fd" => dout12bit <= x"05c";
		when x"fe" => dout12bit <= x"05c";
		when x"ff" => dout12bit <= x"05c";


	   when others => dout12bit <= x"05c";  -- 140kHz
				
	 end case;
	 
	end if;
	  
  end process;
  
   dout <= dout12bit(11 downto 0);
  
end behavior;


















		
	
