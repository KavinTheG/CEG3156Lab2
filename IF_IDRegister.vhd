LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity IF_IDRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	pcPlusFour : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	pcPlusFour_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end entity;

architecture structural of IF_IDRegister is

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

signal instruction_conn : std_LOGIC_VECTOR(31 downto 0);
signal pcPlusFour_conn  : std_LOGIC_VECTOR(7 downto 0);

begin

	pcPlusFourOut: eightBitRegister port map(reset, pcPlusFour, en, clk, pcPlusFour_conn);
	instructionOut: thirtyTwoBitRegister port map(reset, instruction, en, clk, instruction_conn);
	
	pcPlusFour_out <= pcPlusFour_conn;
	instruction_out <= instruction_conn;

end structural;