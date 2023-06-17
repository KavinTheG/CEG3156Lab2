LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY pcAdder8Bit IS
	PORT(
		Cin		: IN	STD_LOGIC;
		A, B		: IN	STD_LOGIC_VECTOR(7 downto 0);
		Sum	: OUT	STD_LOGIC_VECTOR(7 downto 0);
		CarryOut: OUT STD_LOGIC );
END pcAdder8Bit;

ARCHITECTURE structural  OF pcAdder8Bit IS
	SIGNAL int_Sum, int_CarryOut : STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL gnd : STD_LOGIC;

	COMPONENT oneBitAdder
	PORT(
		i_CarryIn		: IN	STD_LOGIC;
		i_Ai, i_Bi		: IN	STD_LOGIC;
		o_Sum, o_CarryOut	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

	-- Concurrent Signal Assignment
	gnd <= '0';

add2: oneBitAdder
	PORT MAP (i_CarryIn => gnd, 
			  i_Ai => A(2),
			  i_Bi => B(2),
			  o_Sum => int_Sum(2),
			  o_CarryOut => int_CarryOut(2));

add1: oneBitAdder
	PORT MAP (i_CarryIn => int_CarryOut(2), 
			  i_Ai => A(1),
			  i_Bi => B(1),
			  o_Sum => int_Sum(1),
			  o_CarryOut => int_CarryOut(1));

add0: oneBitAdder
	PORT MAP (i_CarryIn => int_CarryOut(1), 
			  i_Ai => A(0),
			  i_Bi => B(0),
			  o_Sum => int_Sum(0),
			  o_CarryOut => int_CarryOut(0));

	-- Output Driver
	Sum <= int_Sum;
	CarryOut <= int_CarryOut(0);


END structural;
