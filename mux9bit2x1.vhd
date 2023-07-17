library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- used for mux inbetween control and ID/EX

entity mux9bit2x1 is
port (
		sel : in std_logic;
		a_i, b_i : in std_logic_vector(8 downto 0);
		o_m : out std_logic_vector(8 downto 0)
	);
end mux9bit2x1;

architecture structural of mux9bit2x1 is

component mux2x1 is
port(
		a_i, b_i, sel	: in std_logic;
		o_m : out std_logic
		);
end component;

begin
	
	msb:  mux2x1 port map(a_i => a_i(8), b_i => b_i(8), sel => sel, o_m => o_m(8));
	bit7: mux2x1 port map(a_i => a_i(7), b_i => b_i(7), sel => sel, o_m => o_m(7));
	bit6: mux2x1 port map(a_i => a_i(6), b_i => b_i(6), sel => sel, o_m => o_m(6));
	bit5: mux2x1 port map(a_i => a_i(5), b_i => b_i(5), sel => sel, o_m => o_m(5));
	bit4: mux2x1 port map(a_i => a_i(4), b_i => b_i(4), sel => sel, o_m => o_m(4));
	bit3: mux2x1 port map(a_i => a_i(3), b_i => b_i(3), sel => sel, o_m => o_m(3));
	bit2: mux2x1 port map(a_i => a_i(2), b_i => b_i(2), sel => sel, o_m => o_m(2));
	bit1: mux2x1 port map(a_i => a_i(1), b_i => b_i(1), sel => sel, o_m => o_m(1));
	lsb:  mux2x1 port map(a_i => a_i(0), b_i => b_i(0), sel => sel, o_m => o_m(0));

end  structural;