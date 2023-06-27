LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY aluControlUnit_tb IS
END aluControlUnit_tb;
 
ARCHITECTURE behavior OF aluControlUnit_tb IS
	
	component aluControlUnit is
	port(
		aluOp: in std_logic_vector (1 downto 0);
		instructionIn: in std_logic_vector (5 downto 0);
		aluCntrlOut: out std_logic_vector (2 downto 0)	
	);
	end component;
	
   --Inputs
   signal aluOp : std_logic_vector (1 downto 0);
	signal instructionIn: std_logic_vector (5 downto 0);
	
 
    --Outputs
  signal aluCntrlOut: std_logic_vector (2 downto 0);
 
BEGIN
	
	uut: aluControlUnit port map(
		aluOp => aluOp,
		instructionIn => instructionIn,
		aluCntrlOut => aluCntrlOut
	);
 
   -- Stimulus process
   stim_proc: process
   begin
    
	aluOp(1) <= '0';
	aluOp(0) <= '0';
 
    wait for 50 ns; 
 
	 aluOp(1) <= '1';
	 aluOp(0) <= '1';
	 instructionIn(5) <= '0';
	 instructionIn(4) <= '0';
	 instructionIn(3) <= '0';
	 instructionIn(2) <= '0';
	 instructionIn(1) <= '0';
	 instructionIn(0) <= '0';
	
    wait for 50 ns; 
    aluOp(1) <= '1';
	 aluOp(0) <= '1';
    instructionIn(1) <= '1';
 
    wait for 50 ns;   
    aluOp(1) <= '1';
	 aluOp(0) <= '1';
    instructionIn(2) <= '1';
	 instructionIn(1) <= '0';
	
 
    wait for 50 ns;  
	 aluOp(1) <= '1';
	 aluOp(0) <= '1';
	 instructionIn(0) <= '1'; 
	 
	 wait for 50 ns;  
	 aluOp(1) <= '1';
	 aluOp(0) <= '1';
	 instructionIn(5) <= '1'; -- should not affect result
	 instructionIn(3) <= '1';
	 instructionIn(2) <= '0'; 
	 instructionIn(1) <= '1';
	 instructionIn(0) <= '0';

 
    end process;
 
END;