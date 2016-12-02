library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DeadTimer is

	port(
		reset : in std_logic;
		clkin  : in std_logic;
		DTA	: in std_logic_vector(4 downto 0);
		DTB	: in std_logic_vector(4 downto 0);
		PWMsig : in std_logic;
		PWMTest : in std_logic;
		PWMTest_Delay : out std_logic;
		QmDrv	: out std_logic;
		QaDrv	: out std_logic
		);

end entity;

architecture behavior of DeadTimer is

   signal Shift_reg : std_logic_vector(60 downto 0);  --45 * 20ns = the maximum deadtime of 900ns
   signal Shift_Test : std_logic_vector(60 downto 0);
   signal PWM, PWMA, PWMB : std_logic;
	

begin

   process(reset, clkin)
	begin

		if reset = '1' then
			Shift_reg <= (others => '0');
			Shift_Test <= (others => '0');
			
		elsif rising_edge(clkin) then	
			Shift_reg(0) <= PWMsig;
			Shift_Test(0) <= PWMTest;
			
			for i in 1 to 60 loop
					Shift_reg(i) <= Shift_reg(i - 1);
					shift_Test(i) <= Shift_Test(i - 1);
			end loop;
			
			PWMA <= Shift_reg(to_integer(unsigned(DTA)) + 9);
			PWMB <= Shift_reg(to_integer(unsigned(DTB)) + 9);
			
			PWMTest_Delay <= Shift_Test(60);
		end  if;
		
	end process;
	
	
	 Process(reset, clkin) 
	 begin	
		
		 if reset = '1' then
			QaDrv <= '0';
			QmDrv <= '0';
		 elsif rising_edge(clkin) then	
			PWM <= PWMsig;
			--QaDrv <= not(PWM or PWMB);
			QmDrv <= PWM or PWMB; ---for L6491 control, special truth table
			QaDrv <= PWM and PWMA;
		 end if;
	 end process;
	 
end;