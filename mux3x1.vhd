library ieee;
use ieee.std_logic_1164.all;

entity mux3x1 is
port(
		a_i, b_i, c_i	: in std_logic;
		sel : in std_logic(1 downto 0);
		o_m : out std_logic
		);
end entity;
		
architecture rtl of mux2x1 is
	begin
	
	o_m <=  ( not(sel(1)) and not(sel(0)) and a_i ) or ( not(sel(1)) and sel(0) and b_i ) or ( sel(1) and not(sel(0)) and c_i )
	
	
	end rtl;