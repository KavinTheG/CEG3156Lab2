LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ID_EXRegister is
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
end entity;

architecture structural of ID_EXRegister is

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

component fourBitRegister is
port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
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

component thirtyTwoBitRegister is
port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end component;

	signal WBSignals_conn : STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal MSignals_conn :  STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal EXSignals_conn: STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal pcPlusFour_conn, readData1_conn, readData2_conn: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal instructionExt_conn:  STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal instruction25To21_conn, instruction20To16_conn, instruction15To11_conn:  STD_LOGIC_VECTOR(4 DOWNTO 0);


begin

	WBSignalsOut: twoBitRegister port map(reset, WBSignals, en, clk,	WBSignals_conn );
	MSignalsOut: threeBitRegister port map(reset, MSignals, en, clk, MSignals_conn);
	EXSignalsOut: fourBitRegister port map(reset, EXSignals, en, clk, EXSignals_conn);
	pcPlusFourOut: eightBitRegister port map(reset, pcPlusFour, en, clk, pcPlusFour_conn);
	readData1Out: eightBitRegister port map(reset, readData1, en, clk, readData1_conn);
	
	readData2Out: eightBitRegister port map(reset, readData2, en, clk, readData2_conn);
	instructionExtOut: eightBitRegister port map(reset, instructionExt, en, clk, instructionExt_conn);
	instruction25To21Out: fiveBitRegister port map(reset, instruction25To21, en, clk, instruction25To21_conn);
	instruction20To16Out: fiveBitRegister port map(reset, instruction20To16, en, clk, instruction20To16_conn);
   instruction15To11Out: fiveBitRegister port map(reset, instruction15To11, en, clk, instruction15To11_conn);
	
	
	WBSignals_o <= WBSignals_conn;
	MSignals_o <= MSignals_conn;
	EXSignals_o <= EXSignals_conn;
	pcPlusFour_o <= pcPlusFour_conn;
	
	readData1_o <= readData1_conn;
	readData2_o <= readData2_conn;
	instructionExt_o <= instructionExt_conn;
	instruction25To21_o <= instruction25To21_conn;
	instruction20To16_o <= instruction20To16_conn;
	instruction15To11_o <= instruction15To11_conn;

	

end structural;