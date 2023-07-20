LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tb_EXMEM is
end entity;

architecture Testbench of tb_EXMEM is
	
	signal tb_reset	:	STD_LOGIC;
	signal tb_en    :  STD_LOGIC;
	signal tb_clk   :  STD_LOGIC;
	
	signal tb_WBSignals : STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal tb_MSignals : STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal tb_aluResult: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal tb_aluZero: std_LOGIC;
	signal tb_instructionMuxResult: STD_LOGIC_VECTOR(4 DOWNTO 0);
	signal tb_readData2: STD_LOGIC_VECTOR(7 DOWNTO 0);

	
	signal tb_WBSignals_o : STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal tb_MSignals_o : STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal tb_aluResult_o: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal tb_aluZero_o: std_LOGIC;
	signal tb_instructionMuxResult_o: STD_LOGIC_VECTOR(4 DOWNTO 0);
	signal tb_readData2_o: STD_LOGIC_VECTOR(7 DOWNTO 0);

	
	signal sim_end : boolean := false;

component EX_MEMRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluZero: IN STD_LOGIC;
	instructionMuxResult: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	readData2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);

	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluZero_o: OUT STD_LOGIC;
	instructionMuxResult_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rs or rt
	readData2_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component;

begin

EXMEM: EX_MEMRegister port map(tb_reset, tb_en, tb_clk,tb_WBSignals,tb_MSignals,tb_aluResult, tb_aluZero, tb_instructionMuxResult, tb_readData2, tb_WBSignals_o, tb_MSignals_o, 
										tb_aluResult_o, tb_aluZero_o, tb_instructionMuxResult_o, tb_readData2_o);

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
	tb_WBSignals <= "10";
	tb_MSignals <= "101";
	tb_aluResult <= "10100011";
	tb_aluZero <= '0';
	tb_instructionMuxResult <= "11001";
	tb_readData2 <= "10100010";

	
	wait for 100ns;
	
	--tb_en <= '0';
	--sim_end <= true;
	wait;
	
end process;

end Testbench;
