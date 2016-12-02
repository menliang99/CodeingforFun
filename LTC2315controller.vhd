
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 


entity LTC2315Controller is

	port(
		reset : in std_logic;
		clkin : in std_logic;    -- Define the working speed of LTC2315, not the same as sck . 
		ADC_SCLK  : out std_logic;    -- Connect to the ADC_SCLK pin of LTC2315.
		ADC_const	 : in std_logic;  -- Connect to the CS pin of LTC2315, AD Sampling Speed : ADC_SCLK / 18.
		ADC_SDO : in std_logic;		 -- Connect to the ADC_SDO pin of LTC2315, Serial output from LTC2315. 
		ADC_DBO: out std_logic_vector(11 downto 0)	-- 12bit parallel output of the LTC2315. 
	);

end entity;

  architecture behavior of LTC2315Controller is

	signal rst_sig : std_logic;
	signal ADC_data : std_logic_vector(13 downto 0);
	signal sclk_counter: integer range 0 to 20;
	
  begin

  rst_sig <= reset;
  ADC_SCLK <= clkin;  
  

ADdatavalid: process(rst_sig, clkin)

   variable dpt : integer := 13;
   begin
	if rst_sig = '1' then 
		ADC_data <= "00000000000000";
	elsif falling_edge(clkin) then  --changed to falling edge on Apirl 29, 2016.  
		if ADC_const = '0' then
			ADC_data(dpt) <= ADC_SDO;
			dpt := dpt - 1;
		else 
			dpt := 13;
		end if;
	end if;	
 end process;
 
ADoutputP: process(rst_sig, ADC_const)

begin
	
	if rst_sig = '1' then 
		ADC_DBO <= x"000";
	elsif rising_edge(ADC_const) then
		ADC_DBO <= ADC_data(11 downto 0);  --changed on Apirl 29, 2016.
	end if;
	
end process;

end behavior;


