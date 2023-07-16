LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity thirtyTwoBitRegister is
	port(
	reset	:	IN STD_LOGIC;
	values : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	en : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	outputs : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end entity;

architecture structural of thirtyTwoBitRegister is

	signal notOutputs : STD_LOGIC_VECTOR(31 DOWNTO 0);

	component enARdFF_2 IS
		PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
	END component;

begin

	bit0 : enARdFF_2 port map( reset, values(0) , en, clk, outputs(0) , notOutputs(0)  );
	bit1 : enARdFF_2 port map( reset, values(1) , en, clk, outputs(1) , notOutputs(1)  );
	bit2 : enARdFF_2 port map( reset, values(2) , en, clk, outputs(2) , notOutputs(2)  );
	bit3 : enARdFF_2 port map( reset, values(3) , en, clk, outputs(3) , notOutputs(3)  );
	bit4 : enARdFF_2 port map( reset, values(4) , en, clk, outputs(4) , notOutputs(4)  );
	bit5 : enARdFF_2 port map( reset, values(5) , en, clk, outputs(5) , notOutputs(5)  );
	bit6 : enARdFF_2 port map( reset, values(6) , en, clk, outputs(6) , notOutputs(6)  );
	bit7 : enARdFF_2 port map( reset, values(7) , en, clk, outputs(7) , notOutputs(7)  );
	bit8 : enARdFF_2 port map( reset, values(8) , en, clk, outputs(8) , notOutputs(8)  );
	bit9 : enARdFF_2 port map( reset, values(9) , en, clk, outputs(9) , notOutputs(9)  );
	bit10: enARdFF_2 port map( reset, values(10), en, clk, outputs(10), notOutputs(10) );
	bit11: enARdFF_2 port map( reset, values(11), en, clk, outputs(11), notOutputs(11) );
	bit12: enARdFF_2 port map( reset, values(12), en, clk, outputs(12), notOutputs(12) );
	bit13: enARdFF_2 port map( reset, values(13), en, clk, outputs(13), notOutputs(13) );
	bit14: enARdFF_2 port map( reset, values(14), en, clk, outputs(14), notOutputs(14) );
	bit15: enARdFF_2 port map( reset, values(15), en, clk, outputs(15), notOutputs(15) );
	bit16: enARdFF_2 port map( reset, values(16), en, clk, outputs(16), notOutputs(16) );
	bit17: enARdFF_2 port map( reset, values(17), en, clk, outputs(17), notOutputs(17) );
	bit18: enARdFF_2 port map( reset, values(18), en, clk, outputs(18), notOutputs(18) );
	bit19: enARdFF_2 port map( reset, values(19), en, clk, outputs(19), notOutputs(19) );
	bit20: enARdFF_2 port map( reset, values(20), en, clk, outputs(20), notOutputs(20) );
	bit21: enARdFF_2 port map( reset, values(21), en, clk, outputs(21), notOutputs(21) );
	bit22: enARdFF_2 port map( reset, values(22), en, clk, outputs(22), notOutputs(22) );
	bit23: enARdFF_2 port map( reset, values(23), en, clk, outputs(23), notOutputs(23) );
	bit24: enARdFF_2 port map( reset, values(24), en, clk, outputs(24), notOutputs(24) );
	bit25: enARdFF_2 port map( reset, values(25), en, clk, outputs(25), notOutputs(25) );
	bit26: enARdFF_2 port map( reset, values(26), en, clk, outputs(26), notOutputs(26) );
	bit27: enARdFF_2 port map( reset, values(27), en, clk, outputs(27), notOutputs(27) );
	bit28: enARdFF_2 port map( reset, values(28), en, clk, outputs(28), notOutputs(28) );
	bit29: enARdFF_2 port map( reset, values(29), en, clk, outputs(29), notOutputs(29) );
	bit30: enARdFF_2 port map( reset, values(30), en, clk, outputs(30), notOutputs(30) );
	bit31: enARdFF_2 port map( reset, values(31), en, clk, outputs(31), notOutputs(31) );
	

end structural;