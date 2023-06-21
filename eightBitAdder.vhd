LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity eightBitAdder is
	port(
		A_i, B_i : in std_logic_vector (7 downto 0);
		C_i : in std_logic;
		C_o : out std_logic;
		diff: out std_logic_vector (7 downto 0)
		);
end entity;

architecture structural of eightBitAdder is
	signal c : std_logic_vector (6 downto 0);
	signal pDiff : std_logic_vector (7 downto 0);
	
	component oneBitSubtractor is
	port(
	a_i, b_i, c_i : in std_logic;
	diff, cout : out std_logic
	);
	end component;
	
begin

MSB:  oneBitSubtractor port map (A_i(7), B_i(7), c(6), pDiff(7), C_o);
Bit7: oneBitSubtractor port map (A_i(6), B_i(6), c(5), pDiff(6), c(6));
Bit6: oneBitSubtractor port map (A_i(5), B_i(5), c(4), pDiff(5), c(5));
Bit5: oneBitSubtractor port map (A_i(4), B_i(4), c(3), pDiff(4), c(4));
Bit4: oneBitSubtractor port map (A_i(3), B_i(3), c(2), pDiff(3), c(3));
Bit3: oneBitSubtractor port map (A_i(2), B_i(2), c(1), pDiff(2), c(2));
Bit2: oneBitSubtractor port map (A_i(1), B_i(1), c(0), pDiff(1), c(1));
LSB:  oneBitSubtractor port map (A_i(0), B_i(0), C_i,  pDiff(0), c(0));

diff <= pDiff;

end structural;





