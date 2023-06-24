LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--use as mux in between instruction memory and the register file;
entity mux5x5 is
port (
		sel : in std_logic;
		a_i, b_i : in std_logic_vector(4 downto 0);
		o_m : out std_logic_vector(4 downto 0)
	);
end entity;

architecture structural of mux5x5 is

component mux2x1 is
port(
		a_i, b_i, sel	: in std_logic;
		o_m : out std_logic
		);
end component;
begin
	
	msb:  mux2x1 port map(a_i => a_i(4), b_i => b_i(4), sel => sel, o_m => o_m(4));
	bit4: mux2x1 port map(a_i => a_i(3), b_i => b_i(3), sel => sel, o_m => o_m(3));
	bit3: mux2x1 port map(a_i => a_i(2), b_i => b_i(2), sel => sel, o_m => o_m(2));
	bit2: mux2x1 port map(a_i => a_i(1), b_i => b_i(1), sel => sel, o_m => o_m(1));
	lsb:  mux2x1 port map(a_i => a_i(0), b_i => b_i(0), sel => sel, o_m => o_m(0));

end structural;