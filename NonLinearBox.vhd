

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity NonLinearBox is 

   	port (
			clkin : in std_logic;
			reset :  in std_logic;
			din : in std_logic_vector(11 downto 0);
			dout: out std_logic_vector(11 downto 0)
	  );

end entity;


architecture behavior of NonLinearBox is 

  --signal dout12bit : std_logic_vector(11 downto 0);

  begin 

  Trans:	 process(clkin, reset) 
	 begin 
	 
	  if reset = '1' then 
  
          dout <= (others => '0');
	  
	  elsif (clkin'event and clkin = '1') then
	  
			dout <= din;
--	  
--		case din(11 downto 4) is
--		
--		 when x"00" => dout12bit <= x"3E7";
--		 when x"01" => dout12bit <= x"3E1";
--		 when x"02" => dout12bit <= x"3DB";
--		 when x"03" => dout12bit <= x"3D6";
--		 when x"04" => dout12bit <= x"3D0";
--		 when x"05" => dout12bit <= x"3CA";
--		 when x"06" => dout12bit <= x"3C5";
--		 when x"07" => dout12bit <= x"3BF";
--		 when x"08" => dout12bit <= x"3BA";
--		 when x"09" => dout12bit <= x"3B5";
--		 when x"0A" => dout12bit <= x"3AF";
--		 when x"0B" => dout12bit <= x"3AA";
--		 when x"0C" => dout12bit <= x"3A5";
--		 when x"0D" => dout12bit <= x"3A0";
--		 when x"0E" => dout12bit <= x"39B";
--		 when x"0F" => dout12bit <= x"396";
--		 when x"10" => dout12bit <= x"391";
--		 when x"11" => dout12bit <= x"38C";
--		 when x"12" => dout12bit <= x"387";
--		 when x"13" => dout12bit <= x"382";
--		 when x"14" => dout12bit <= x"37E";
--		 when x"15" => dout12bit <= x"379";
--		 when x"16" => dout12bit <= x"374";
--		 when x"17" => dout12bit <= x"370";
--		 when x"18" => dout12bit <= x"36B";
--		 when x"19" => dout12bit <= x"367";
--		 when x"1A" => dout12bit <= x"362";
--		 when x"1B" => dout12bit <= x"35E";
--		 when x"1C" => dout12bit <= x"35A";
--		 when x"1D" => dout12bit <= x"355";
--		 when x"1E" => dout12bit <= x"351";
--		 when x"1F" => dout12bit <= x"34D";
--		 when x"20" => dout12bit <= x"349";
--		 when x"21" => dout12bit <= x"344";
--		 when x"22" => dout12bit <= x"340";
--		 when x"23" => dout12bit <= x"33C";
--		 when x"24" => dout12bit <= x"338";
--		 when x"25" => dout12bit <= x"334";
--		 when x"26" => dout12bit <= x"330";
--		 when x"27" => dout12bit <= x"32C";
--		 when x"28" => dout12bit <= x"329";
--		 when x"29" => dout12bit <= x"325";
--		 when x"2A" => dout12bit <= x"321";
--		 when x"2B" => dout12bit <= x"31D";
--		 when x"2C" => dout12bit <= x"319";
--		 when x"2D" => dout12bit <= x"316";
--		 when x"2E" => dout12bit <= x"312";
--		 when x"2F" => dout12bit <= x"30E";
--		 when x"30" => dout12bit <= x"30B";
--		 when x"31" => dout12bit <= x"307";
--		 when x"32" => dout12bit <= x"304";
--		 when x"33" => dout12bit <= x"300";
--		 when x"34" => dout12bit <= x"2FD";
--		 when x"35" => dout12bit <= x"2F9";
--		 when x"36" => dout12bit <= x"2F6";
--		 when x"37" => dout12bit <= x"2F3";
--		 when x"38" => dout12bit <= x"2EF";
--		 when x"39" => dout12bit <= x"2EC";
--		 when x"3A" => dout12bit <= x"2E9";
--		 when x"3B" => dout12bit <= x"2E5";
--		 when x"3C" => dout12bit <= x"2E2";
--		 when x"3D" => dout12bit <= x"2DF";
--		 when x"3E" => dout12bit <= x"2DC";
--		 when x"3F" => dout12bit <= x"2D9";
--		 when x"40" => dout12bit <= x"2D5";
--		 when x"41" => dout12bit <= x"2D2";
--		 when x"42" => dout12bit <= x"2CF";
--		 when x"43" => dout12bit <= x"2CC";
--		 when x"44" => dout12bit <= x"2C9";
--		 when x"45" => dout12bit <= x"2C6";
--		 when x"46" => dout12bit <= x"2C3";
--		 when x"47" => dout12bit <= x"2C0";
--		 when x"48" => dout12bit <= x"2BD";
--		 when x"49" => dout12bit <= x"2BB";
--		 when x"4A" => dout12bit <= x"2B8";
--		 when x"4B" => dout12bit <= x"2B5";
--		 when x"4C" => dout12bit <= x"2B2";
--		 when x"4D" => dout12bit <= x"2AF";
--		 when x"4E" => dout12bit <= x"2AC";
--		 when x"4F" => dout12bit <= x"2AA";
--		 when x"50" => dout12bit <= x"2A7";
--		 when x"51" => dout12bit <= x"2A4";
--		 when x"52" => dout12bit <= x"2A2";
--		 when x"53" => dout12bit <= x"29F";
--		 when x"54" => dout12bit <= x"29C";
--		 when x"55" => dout12bit <= x"29A";
--		 when x"56" => dout12bit <= x"297";
--		 when x"57" => dout12bit <= x"294";
--		 when x"58" => dout12bit <= x"292";
--		 when x"59" => dout12bit <= x"28F";
--		 when x"5A" => dout12bit <= x"28D";
--		 when x"5B" => dout12bit <= x"28A";
--		 when x"5C" => dout12bit <= x"288";
--		 when x"5D" => dout12bit <= x"285";
--		 when x"5E" => dout12bit <= x"283";
--		 when x"5F" => dout12bit <= x"281";
--		 when x"60" => dout12bit <= x"27E";
--		 when x"61" => dout12bit <= x"27C";
--		 when x"62" => dout12bit <= x"279";
--		 when x"63" => dout12bit <= x"277";
--		 when x"64" => dout12bit <= x"275";
--		 when x"65" => dout12bit <= x"272";
--		 when x"66" => dout12bit <= x"270";
--		 when x"67" => dout12bit <= x"26E";
--		 when x"68" => dout12bit <= x"26B";
--		 when x"69" => dout12bit <= x"269";
--		 when x"6A" => dout12bit <= x"267";
--		 when x"6B" => dout12bit <= x"265";
--		 when x"6C" => dout12bit <= x"263";
--		 when x"6D" => dout12bit <= x"260";
--		 when x"6E" => dout12bit <= x"25E";
--		 when x"6F" => dout12bit <= x"25C";
--		 when x"70" => dout12bit <= x"25A";
--		 when x"71" => dout12bit <= x"258";
--		 when x"72" => dout12bit <= x"256";
--		 when x"73" => dout12bit <= x"253";
--		 when x"74" => dout12bit <= x"251";
--		 when x"75" => dout12bit <= x"24F";
--		 when x"76" => dout12bit <= x"24D";
--		 when x"77" => dout12bit <= x"24B";
--		 when x"78" => dout12bit <= x"249";
--		 when x"79" => dout12bit <= x"247";
--		 when x"7A" => dout12bit <= x"245";
--		 when x"7B" => dout12bit <= x"243";
--		 when x"7C" => dout12bit <= x"241";
--		 when x"7D" => dout12bit <= x"23F";
--		 when x"7E" => dout12bit <= x"23D";
--		 when x"7F" => dout12bit <= x"23B";
--		 when x"80" => dout12bit <= x"239";
--		 when x"81" => dout12bit <= x"238";
--		 when x"82" => dout12bit <= x"236";
--		 when x"83" => dout12bit <= x"234";
--		 when x"84" => dout12bit <= x"232";
--		 when x"85" => dout12bit <= x"230";
--		 when x"86" => dout12bit <= x"22E";
--		 when x"87" => dout12bit <= x"22C";
--		 when x"88" => dout12bit <= x"22B";
--		 when x"89" => dout12bit <= x"229";
--		 when x"8A" => dout12bit <= x"227";
--		 when x"8B" => dout12bit <= x"225";
--		 when x"8C" => dout12bit <= x"223";
--		 when x"8D" => dout12bit <= x"222";
--		 when x"8E" => dout12bit <= x"220";
--		 when x"8F" => dout12bit <= x"21E";
--		 when x"90" => dout12bit <= x"21C";
--		 when x"91" => dout12bit <= x"21B";
--		 when x"92" => dout12bit <= x"219";
--		 when x"93" => dout12bit <= x"217";
--		 when x"94" => dout12bit <= x"216";
--		 when x"95" => dout12bit <= x"214";
--		 when x"96" => dout12bit <= x"212";
--		 when x"97" => dout12bit <= x"211";
--		 when x"98" => dout12bit <= x"20F";
--		 when x"99" => dout12bit <= x"20D";
--		 when x"9A" => dout12bit <= x"20C";
--		 when x"9B" => dout12bit <= x"20A";
--		 when x"9C" => dout12bit <= x"208";
--		 when x"9D" => dout12bit <= x"207";
--		 when x"9E" => dout12bit <= x"205";
--		 when x"9F" => dout12bit <= x"204";
--		 when x"A0" => dout12bit <= x"202";
--		 when x"A1" => dout12bit <= x"201";
--		 when x"A2" => dout12bit <= x"1FF";
--		 when x"A3" => dout12bit <= x"1FE";
--		 when x"A4" => dout12bit <= x"1FC";
--		 when x"A5" => dout12bit <= x"1FA";
--		 when x"A6" => dout12bit <= x"1F9";
--		 when x"A7" => dout12bit <= x"1F7";
--		 when x"A8" => dout12bit <= x"1F6";
--		 when x"A9" => dout12bit <= x"1F4";
--		 when x"AA" => dout12bit <= x"1F3";
--		 when x"AB" => dout12bit <= x"1F2";
--		 when x"AC" => dout12bit <= x"1F0";
--		 when x"AD" => dout12bit <= x"1EF";
--		 when x"AE" => dout12bit <= x"1ED";
--		 when x"AF" => dout12bit <= x"1EC";
--		 when x"B0" => dout12bit <= x"1EA";
--		 when x"B1" => dout12bit <= x"1E9";
--		 when x"B2" => dout12bit <= x"1E7";
--		 when x"B3" => dout12bit <= x"1E6";
--		 when x"B4" => dout12bit <= x"1E5";
--		 when x"B5" => dout12bit <= x"1E3";
--		 when x"B6" => dout12bit <= x"1E2";
--		 when x"B7" => dout12bit <= x"1E1";
--		 when x"B8" => dout12bit <= x"1DF";
--		 when x"B9" => dout12bit <= x"1DE";
--		 when x"BA" => dout12bit <= x"1DD";
--		 when x"BB" => dout12bit <= x"1DB";
--		 when x"BC" => dout12bit <= x"1DA";
--		 when x"BD" => dout12bit <= x"1D9";
--		 when x"BE" => dout12bit <= x"1D7";
--		 when x"BF" => dout12bit <= x"1D6";
--		 when x"C0" => dout12bit <= x"1D5";
--		 when x"C1" => dout12bit <= x"1D3";
--		 when x"C2" => dout12bit <= x"1D2";
--		 when x"C3" => dout12bit <= x"1D1";
--		 when x"C4" => dout12bit <= x"1CF";
--		 when x"C5" => dout12bit <= x"1CE";
--		 when x"C6" => dout12bit <= x"1CD";
--		 when x"C7" => dout12bit <= x"1CC";
--		 when x"C8" => dout12bit <= x"1CA";
--		 when x"C9" => dout12bit <= x"1C9";
--		 when x"CA" => dout12bit <= x"1C8";
--		 when x"CB" => dout12bit <= x"1C7";
--		 when x"CC" => dout12bit <= x"1C6";
--		 when x"CD" => dout12bit <= x"1C4";
--		 when x"CE" => dout12bit <= x"1C3";
--		 when x"CF" => dout12bit <= x"1C2";
--		 when x"D0" => dout12bit <= x"1C1";
--		 when x"D1" => dout12bit <= x"1C0";
--		 when x"D2" => dout12bit <= x"1BE";
--		 when x"D3" => dout12bit <= x"1BD";
--		 when x"D4" => dout12bit <= x"1BC";
--		 when x"D5" => dout12bit <= x"1BB";
--		 when x"D6" => dout12bit <= x"1BA";
--		 when x"D7" => dout12bit <= x"1B9";
--		 when x"D8" => dout12bit <= x"1B7";
--		 when x"D9" => dout12bit <= x"1B6";
--		 when x"DA" => dout12bit <= x"1B5";
--		 when x"DB" => dout12bit <= x"1B4";
--		 when x"DC" => dout12bit <= x"1B3";
--		 when x"DD" => dout12bit <= x"1B2";
--		 when x"DE" => dout12bit <= x"1B1";
--		 when x"DF" => dout12bit <= x"1B0";
--		 when x"E0" => dout12bit <= x"1AE";
--		 when x"E1" => dout12bit <= x"1AD";
--		 when x"E2" => dout12bit <= x"1AC";
--		 when x"E3" => dout12bit <= x"1AB";
--		 when x"E4" => dout12bit <= x"1AA";
--		 when x"E5" => dout12bit <= x"1A9";
--		 when x"E6" => dout12bit <= x"1A8";
--		 when x"E7" => dout12bit <= x"1A7";
--		 when x"E8" => dout12bit <= x"1A6";
--		 when x"E9" => dout12bit <= x"1A5";
--		 when x"EA" => dout12bit <= x"1A4";
--		 when x"EB" => dout12bit <= x"1A3";
--		 when x"EC" => dout12bit <= x"1A2";
--		 when x"ED" => dout12bit <= x"1A1";
--		 when x"EE" => dout12bit <= x"1A0";
--		 when x"EF" => dout12bit <= x"19F";
--		 when x"F0" => dout12bit <= x"19E";
--		 when x"F1" => dout12bit <= x"19D";
--		 when x"F2" => dout12bit <= x"19C";
--		 when x"F3" => dout12bit <= x"19B";
--		 when x"F4" => dout12bit <= x"19A";
--		 when x"F5" => dout12bit <= x"199";
--		 when x"F6" => dout12bit <= x"198";
--		 when x"F7" => dout12bit <= x"197";
--		 when x"F8" => dout12bit <= x"196";
--		 when x"F9" => dout12bit <= x"195";
--		 when x"FA" => dout12bit <= x"194";
--		 when x"FB" => dout12bit <= x"193";
--		 when x"FC" => dout12bit <= x"192";
--		 when x"FD" => dout12bit <= x"191";
--		 when x"FE" => dout12bit <= x"190";
--		 when x"FF" => dout12bit <= x"18F";
--		 when others => dout12bit <= x"3E7";
--				
--	 end case;
--	 
	end if;
	  
  end process;
  
  
end behavior;


















		
	
