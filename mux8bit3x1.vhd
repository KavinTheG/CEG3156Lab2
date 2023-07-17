LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--use as mux in between instruction memory and the register file;
entity mux8bit3x1 is
port (
		sel : in std_logic;
		a_i, b_i : in std_logic_vector(7 downto 0);
		o_m : out std_logic_vector(7 downto 0)
	);
end entity;

architecture structural of mux5x5 is

component mux3x1 is
port(
		a_i, b_i, c_i	: in std_logic;
		sel : in std_logic(1 downto 0);
		o_m : out std_logic
		);
end component;
begin
	
	msb:  mux2x1 port map(a_i => a_i(7), b_i => b_i(7), c_i => c_i(7), sel => sel, o_m => o_m(7));
	bit6: mux2x1 port map(a_i => a_i(6), b_i => b_i(6), c_i => c_i(7), sel => sel, o_m => o_m(6));
	bit5: mux2x1 port map(a_i => a_i(5), b_i => b_i(5), c_i => c_i(7), sel => sel, o_m => o_m(5));
	bit4: mux2x1 port map(a_i => a_i(4), b_i => b_i(4), c_i => c_i(7), sel => sel, o_m => o_m(4));
	bit3: mux2x1 port map(a_i => a_i(3), b_i => b_i(3), c_i => c_i(7), sel => sel, o_m => o_m(3));
	bit2: mux2x1 port map(a_i => a_i(2), b_i => b_i(2), c_i => c_i(7), sel => sel, o_m => o_m(2));
	bit1: mux2x1 port map(a_i => a_i(1), b_i => b_i(1), c_i => c_i(7), sel => sel, o_m => o_m(1));
	lsb:  mux2x1 port map(a_i => a_i(0), b_i => b_i(0), c_i => c_i(7), sel => sel, o_m => o_m(0));

end structural;