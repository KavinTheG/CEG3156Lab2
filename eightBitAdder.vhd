LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity eightBitAdder is
	port(
	A_i, B_i : in std_logic_vector(7 downto 0);
	C_i : in std_logic;
	cout: out std_logic;
	sum: out std_logic_vector(7 downto 0)
	);
end entity

architecture structural of eightBitAdder is
	signal 