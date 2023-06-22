library ieee;
use ieee.std_logic_1164.all;

entity threeToEightDecoder is
port(
	X: in std_logic_vector(2 downto 0);
	Y: out std_logic_vector(7 downto 0)
);
end threeToEightDecoder;

architecture Structural of threeToEightDecoder is
begin
	Y(0) <= not(x(0)) and not(x(1)) and not(x(2));
	Y(1) <= not(x(0)) and not(x(1)) and x(2);
	Y(2) <= not(x(0)) and x(1) and not(x(2));
	Y(3) <= not(x(0)) and x(1) and x(2);
	Y(4) <= x(0) and not(x(1)) and not(x(2));
	Y(5) <= x(0) and not(x(1)) and x(2);
	Y(6) <= x(0) and x(1) and not(x(2));
	Y(7) <= x(0) and x(1) and x(2);
end Structural;