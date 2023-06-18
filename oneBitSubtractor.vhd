LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity oneBitSubtractor is
	port(
	a_i, b_i, c_i : in std_logic;
	diff, cout : out std_logic
	);
end entity;

architecture  rtl of oneBitSubtractor is
begin

	diff <= a_i XOR b_i XOR c_i;
	cout <= (b_i and c_i) OR (not(a_i) and c_i) OR (not(a_i) and b_i);

end rtl;