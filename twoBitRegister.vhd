LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity twoBitRegister is
	port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
end entity;

architecture structural of twoBitRegister is

	signal notOutputs : STD_LOGIC_VECTOR(1 DOWNTO 0);

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

end structural;