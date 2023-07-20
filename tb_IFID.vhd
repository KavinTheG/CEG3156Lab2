LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tb_IFID is
end entity;

architecture Testbench of tb_IFID is
	
	signal tb_reset	:	STD_LOGIC;
	signal tb_en    :  STD_LOGIC;
	signal tb_clk   :  STD_LOGIC;
	
	signal tb_pcPlusFour : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal tb_instruction: STD_LOGIC_VECTOR(31 DOWNTO 0);

	signal tb_pcPlusFour_o : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal tb_instruction_o: STD_LOGIC_VECTOR(31 DOWNTO 0);

	
	signal sim_end : boolean := false;

component IF_IDRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	pcPlusFour : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	pcPlusFour_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end component;

begin

IFID: IF_IDRegister port map(tb_reset, tb_en, tb_clk,tb_pcPlusFour,tb_instruction, tb_pcPlusFour_o, tb_instruction_o);

clock_process : process
begin
while (not sim_end) loop
tb_clk <= '1';
wait for 10ns;
tb_clk <= '0';
wait for 10ns;
end loop;
wait;
end process;

process 
begin

	tb_en <= '1';
	tb_pcPlusFour <= "10100011";
	tb_instruction <= "10101000101010001010100010101000";
	
	wait for 100ns;
	
	--tb_en <= '0';
	--sim_end <= true;
	wait;
	
end process;

end Testbench;

