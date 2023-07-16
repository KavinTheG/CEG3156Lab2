LIBRARY ieee;
USE ieee.std_logic_1164.all;

--NOTE: KEEP IN MIND THIS IS THE PIPELINE WITHOUT HAZARD DETECTION AND FORWARDING ADDED
entity MEM_WBRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	aluResult: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	readDataMem: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	instructionMuxResult: IN STD_LOGIC_VECTOR(4 DOWNTO 0);

	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	aluResult_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readDataMem_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --data memory output
	instructionMuxResult_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0) --rs or rt
	);
end entity;

architecture structural of MEM_WBRegister is

component twoBitRegister is
port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
end component;


component fiveBitRegister is
port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
end component;

component eightBitRegister is
port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component;

	signal WBSignals_conn : STD_LOGIC_VECTOR(1 DOWNTO 0);--
	signal aluResult_conn, readDataMem_conn: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal instructionMuxResult_conn: STD_LOGIC_VECTOR(4 DOWNTO 0);
 
begin

	WBSignalsOut: twoBitRegister port map(reset, WBSignals, en, clk,	WBSignals_conn );
	aluResultOut: eightBitRegister port map(reset, aluResult, en, clk, aluResult_conn);
	readDataMemOut: eightBitRegister port map(reset, readDataMem, en, clk, readDataMem_conn);
	instructionMuxResultOut: fiveBitRegister port map(reset, instructionMuxResult, en, clk, instructionMuxResult_conn);
	
	
	WBSignals_o <= WBSignals_conn;
	aluResult_o <= aluResult_conn;
	readDataMem_o <= readDataMem_conn;
	instructionMuxResult_o <= instructionMuxResult_conn;

end structural;