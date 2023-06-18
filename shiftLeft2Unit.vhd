
LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity shiftLeft2Unit is
port(
	shift_input : in std_logic_vector(7 downto 0);
	shift_output: out std_logic_vector(7 downto 0));
end shiftLeft2Unit;

architecture rtl of shiftLeft2Unit is
begin

	shift_output <= shift_input(5 downto 0) & "00";
	
end rtl;