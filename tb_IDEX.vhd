LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tb_IDEX is
end entity;

architecture Testbench of tb_IDEX is
	
	signal tb_reset	:	STD_LOGIC;
	signal tb_en    :  STD_LOGIC;
	signal tb_clk   :  STD_LOGIC;
	
	signal tb_WBSignals : STD_LOGIC_VECTOR(1 DOWNTO 0);--
	signal tb_MSignals : STD_LOGIC_VECTOR(2 DOWNTO 0);--
	signal tb_EXSignals : STD_LOGIC_VECTOR(3 DOWNTO 0);--
	signal tb_pcPlusFour: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal tb_readData1: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal tb_readData2: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal tb_instructionExt: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal tb_instruction25To21: STD_LOGIC_VECTOR(4 DOWNTO 0);--
	signal tb_instruction20To16: STD_LOGIC_VECTOR(4 DOWNTO 0);--
	signal tb_instruction15To11: STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	signal tb_WBSignals_o : STD_LOGIC_VECTOR(1 DOWNTO 0);--
	signal tb_MSignals_o : STD_LOGIC_VECTOR(2 DOWNTO 0);--
	signal tb_EXSignals_o : STD_LOGIC_VECTOR(3 DOWNTO 0);--
	signal tb_pcPlusFour_o: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal tb_readData1_o: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal tb_readData2_o: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal tb_instructionExt_o: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal tb_instruction25To21_o: STD_LOGIC_VECTOR(4 DOWNTO 0); --rs
	signal tb_instruction20To16_o: STD_LOGIC_VECTOR(4 DOWNTO 0); --rt
	signal tb_instruction15To11_o: STD_LOGIC_VECTOR(4 DOWNTO 0); --rd
	
	signal sim_end : boolean := false;

component ID_EXRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	EXSignals : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	pcPlusFour: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData1: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	instructionExt: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction25To21: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	instruction20To16: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	instruction15To11: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	EXSignals_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	pcPlusFour_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData1_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData2_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	instructionExt_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction25To21_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rs
	instruction20To16_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rt
	instruction15To11_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0) --rd
	);
end component;

begin

IDEX: ID_EXRegister port map(tb_reset, tb_en, tb_clk,tb_WBSignals,tb_MSignals,tb_EXSignals, tb_pcPlusFour, tb_readData1, tb_readData2, tb_instructionExt, tb_instruction25To21, tb_instruction20To16,
								tb_instruction15To11, tb_WBSignals_o, tb_MSignals_o, tb_EXSignals_o, tb_pcPlusFour_o, tb_readData1_o, tb_readData2_o, tb_instructionExt_o, tb_instruction25To21_o,
									tb_instruction20To16_o, tb_instruction15To11_o);

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
	tb_EXSignals <= "1000";
	tb_pcPlusFour <= "10100001";
	tb_readData1 <= "10100011";
	tb_readData2 <= "10100010";
	tb_instructionExt <= "11100001";
	tb_instruction25To21 <= "10000";
	tb_instruction20To16 <= "10011";
	tb_instruction15To11 <= "10010";
	
	wait for 100ns;
	
	--tb_en <= '0';
	--sim_end <= true;
	wait;
	
end process;

end Testbench;