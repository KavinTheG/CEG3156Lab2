library ieee;
use ieee.std_logic_1164.all;

entity controlLogicUnit is
	port(
		op: in std_logic_vector (5 downto 0);
		regDst: out std_logic;
		aluSrc: out std_logic;
		memToReg: out std_logic;
		regWrite: out std_logic;
		memRead: out std_logic;
		memWrite: out std_logic;
		branch: out std_logic;
		branchNotEqual: out std_logic;
		jump: out std_logic;
		aluOp1: out std_logic;
		aluOp0: out std_logic
	);
end entity;

architecture rtl of controlLogicUnit is
	signal rFormat, lw, sw, beq, bne, jmp : std_logic;
	signal int_aluSrc, int_regWrite, int_aluOp0, int_aluOp1: std_logic;
	
	begin
	
		rFormat <= not(op(5)) and not(op(4)) and not(op(3)) and not(op(2)) and not(op(1)) and not(op(0));
		lw <= op(5) and not(op(4)) and not(op(2)) and not(op(2)) and op(1) and op(0);
		sw <= op(5) and not(op(4)) and op(3) and not(op(2)) and op(1) and op(0);
		beq <= not(op(5)) and not(op(4)) and not(op(3)) and op(2) and not(op(1)) and not(op(0));
		bne <= not(op(5)) and not(op(4)) and not(op(3)) and op(2) and op(1) and not(op(0));
		jmp <= not(op(5)) and not(op(4)) and not(op(3)) and not(op(2)) and op(1) and not(op(0));
		
		
		--intermediate wires to prevent overlap
		int_aluSrc <= lw or sw;
		int_regWrite <= rFormat or lw;
		int_aluOp1 <= rFormat;
		int_aluOp0 <= beq or bne;
		
		
		--output values
		regDst <= rFormat;
		aluSrc <= int_aluSrc;
		memToReg <= lw;
		regWrite <= int_regWrite;
		memRead <= lw;
		memWrite <= sw;
		branch <= beq;
		branchNotEqual <= bne;
		jump <= jmp;
		aluOp1 <= int_aluOp1;
		aluOp0 <= int_aluOp0;
	
	end rtl;
		
		
		