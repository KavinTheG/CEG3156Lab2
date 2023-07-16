LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fiveBitRegister is
	port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
end entity;

architecture structural of fiveBitRegister is

	signal notOutputs : STD_LOGIC_VECTOR(4 DOWNTO 0);

	component enARdFF_2 IS
		PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
	END component;

begin

	bit0: enARdFF_2 port map( reset, values(0), en, clk, outputs(0), notOutputs(0) );
	bit1: enARdFF_2 port map( reset, values(1), en, clk, outputs(1), notOutputs(1) );
	bit2: enARdFF_2 port map( reset, values(2), en, clk, outputs(2), notOutputs(2) );
	bit3: enARdFF_2 port map( reset, values(3), en, clk, outputs(3), notOutputs(3) );
	bit4: enARdFF_2 port map( reset, values(4), en, clk, outputs(4), notOutputs(4) );

end structural;