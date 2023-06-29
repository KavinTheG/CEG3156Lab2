LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tb_eightBitReg is
end entity;

architecture Testbench of tb_eightBitReg is
	
	signal tb_reset, tb_en, tb_clk : std_logic;
	signal tb_values : std_logic_vector(7 downto 0);
	signal tb_outputs : std_logic_vector(7 downto 0);
	signal sim_end : boolean := false;

	component eightBitRegister is
	port(
		reset	:	IN STD_LOGIC;
		values : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		en : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		outputs : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	end component;

begin

eightBReg: eightBitRegister
		port map (
			reset => tb_reset,
			values => tb_values,
			en => tb_en,
			clk => tb_clk,
			outputs => tb_outputs
		);

clock_process : process
begin
while (not sim_end) loop
tb_clk <= '1';
wait for 50ns;
tb_clk <= '0';
wait for 50ns;
end loop;
wait;
end process;

process 
begin
	tb_values <= "00110100";
	tb_en <= '1';
	
	wait for 100ns;
	assert (tb_outputs = "00110100")
	report "1st case " severity error;

	tb_values <= "01110110";
	tb_en <= '1';
	
	wait for 100ns;
	assert (tb_outputs = "01110110")
	report "2nd case " severity error;

	tb_values <= "11011101";
	tb_en <= '1';
	
	wait for 100ns;
	assert (tb_outputs = "11011101")
	report "3rd case " severity error;


	tb_values <= "11011101";
	tb_en <= '0';
	
	wait for 100ns;
	assert (tb_outputs = "11011101")
	report "3rd case " severity error;

	sim_end <= true;
	wait;
	
end process;

end Testbench;