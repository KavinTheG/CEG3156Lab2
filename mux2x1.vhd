library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
port(
		a_i, b_i, sel	: in std_logic;
		o_m : out std_logic
		);
end entity;
		
architecture rtl of mux2x1 is
	begin
	
	o_m <= (not(sel) and a_i) or (sel and b_i);
	
	
	end rtl;