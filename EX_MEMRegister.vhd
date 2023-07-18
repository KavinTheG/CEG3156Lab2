LIBRARY ieee;
USE ieee.std_logic_1164.all;

--NOTE: KEEP IN MIND THIS IS THE PIPELINE WITHOUT HAZARD DETECTION AND FORWARDING ADDED
entity EX_MEMRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	--aluShift2Result: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluZero: IN STD_LOGIC;
	instructionMuxResult: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	readData2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);

	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	--aluShift2Result_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --ALU w SL2 input
	aluZero_o: OUT STD_LOGIC;
	instructionMuxResult_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rs or rt
	readData2_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end entity;

architecture structural of EX_MEMRegister is

component twoBitRegister is
port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
end component;

component threeBitRegister is
port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
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

component enARdFF_2 IS
		PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END component;


	signal WBSignals_conn : STD_LOGIC_VECTOR(1 DOWNTO 0);--
	signal MSignals_conn :  STD_LOGIC_VECTOR(2 DOWNTO 0);--
	signal aluResult_conn, aluShift2Result_conn, readData2_conn: STD_LOGIC_VECTOR(7 DOWNTO 0);--
	signal aluZero_conn: STD_LOGIC;
	signal instructionMuxResult_conn: STD_LOGIC_VECTOR(4 DOWNTO 0);
   signal notZero : STD_LOGIC;


begin

	WBSignalsOut: twoBitRegister port map(reset, WBSignals, en, clk,	WBSignals_conn );
	MSignalsOut: threeBitRegister port map(reset, MSignals, en, clk, MSignals_conn);
	aluResultOut: eightBitRegister port map(reset, aluResult, en, clk, aluResult_conn);
--	aluShift2ResultOut: eightBitRegister port map(reset, aluShift2Result, en, clk, aluShift2Result_conn);
	readData2Out: eightBitRegister port map(reset, readData2, en, clk, readData2_conn);
	instructionMuxResultOut: fiveBitRegister port map(reset, instructionMuxResult, en, clk, instructionMuxResult_conn);
	aluZeroOut: enARdFF_2 port map(reset, aluZero, en, clk, aluZero_conn);
	
	
	WBSignals_o <= WBSignals_conn;
	MSignals_o <= MSignals_conn;

	aluResult_o <= aluResult_conn;
	
	--aluShift2Result_o <= aluShift2Result_conn;
	readData2_o <= readData2_conn;
	instructionMuxResult_o <= instructionMuxResult_conn;
	
	aluZero_o <= aluZero_conn;

	

end structural;