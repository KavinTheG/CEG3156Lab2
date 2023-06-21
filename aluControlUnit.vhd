library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aluControlUnit is
	port(
		aluOp: in std_logic_vector (1 downto 0);
		instructionIn: in std_logic_vector (5 downto 0);
		aluCntrlOut: out std_logic_vector (2 downto 0)	
	);
	end entity;
	
	
	architecture rtl of aluControlUnit is 
	
	signal sig0, sig1, op2, op1, op0 : std_logic;
	
	begin
	
	sig0 <= aluOp(1) and instructionIn(1);
	sig1 <= instructionIn(3) or instructionIn(0);
	op2 <= aluOp(0) or sig0;
	op1 <= not(aluOp(1)) or not(instructionIn(2));
	op0 <= aluOp(1) and sig1;
	
	aluCntrlOut(2) <= op2;
	aluCntrlOut(1) <= op1;
	aluCntrlOut(0) <= op0;
	
	end rtl;