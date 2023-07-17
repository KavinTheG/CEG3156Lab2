LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tb_pcReg is
end entity;

architecture Testbench of tb_pcReg is
	
	signal tb_reset, tb_clk : std_logic;
	signal tb_values : std_logic_vector(7 downto 0) := "00000000" ;
	signal tb_outputs : std_logic_vector(7 downto 0) := "00000000";
	signal sim_end : boolean := false;

	component pcRegister is
	port(
	reset	:	IN STD_LOGIC;
	clk : IN STD_LOGIC;
	PC_input: IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
	PC_output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component;

begin

pcReg: pcRegister
		port map (
			reset => tb_reset,
			clk => tb_clk,
			PC_input => tb_values,
			PC_output => tb_outputs
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
  
  wait for 100ns;
  tb_reset <= '1';
	tb_values <= "00110100";
	
	wait for 100ns;
	assert (tb_outputs = "00110100")
	report "1st case " severity error;

	tb_values <= "01110110";
	
	wait for 100ns;
	assert (tb_outputs = "01110110")
	report "2nd case " severity error;

	tb_values <= "11011101";
	
	wait for 100ns;
	assert (tb_outputs = "11011101")
	report "3rd case " severity error;

  tb_reset <= '0';
  tb_values <= "11111111";
  wait for 100 ns;

	tb_values <= "10001010";
	
	wait for 100ns;
	assert (tb_outputs = "11011101")
	report "3rd case " severity error;

	sim_end <= true;
	wait;
	
end process;

end Testbench;
