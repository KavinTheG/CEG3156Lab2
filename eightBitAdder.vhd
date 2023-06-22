LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity eightBitAdder is
	port(
		A_i, B_i : in std_logic_vector (7 downto 0);
		C_i : in std_logic;
		C_o : out std_logic;
		sum: out std_logic_vector (7 downto 0)
		);
end entity;

architecture structural of eightBitAdder is
	signal c : std_logic_vector (6 downto 0);
	signal pSum : std_logic_vector (7 downto 0);
	
	component oneBitAdder IS
	PORT(
		i_CarryIn		: IN	STD_LOGIC;
		i_Ai, i_Bi		: IN	STD_LOGIC;
		o_Sum, o_CarryOut	: OUT	STD_LOGIC);
		END component;
	
begin

MSB:  oneBitAdder port map (c(6), A_i(7), B_i(7), pSum(7), C_o);
Bit7: oneBitAdder port map (c(5), A_i(6), B_i(6), pSum(6), c(6));
Bit6: oneBitAdder port map (c(4), A_i(5), B_i(5), pSum(5), c(5));
Bit5: oneBitAdder port map (c(3), A_i(4), B_i(4), pSum(4), c(4));
Bit4: oneBitAdder port map (c(2), A_i(3), B_i(3), pSum(3), c(3));
Bit3: oneBitAdder port map (c(1), A_i(2), B_i(2), pSum(2), c(2));
Bit2: oneBitAdder port map (c(0), A_i(1), B_i(1), pSum(1), c(1));
LSB:  oneBitAdder port map (C_i,  A_i(0), B_i(0), pSum(0), c(0));

sum <= pSum;

end structural;





