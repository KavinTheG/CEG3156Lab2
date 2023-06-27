LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY controlLogicUnit_tb IS
END controlLogicUnit_tb;
 
ARCHITECTURE behavior OF controlLogicUnit_tb IS
 
	
	component controlLogicUnit is
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
	end component;	
	
   --Inputs
   signal op : std_logic_vector (5 downto 0);
	
 
    --Outputs
   signal regDst : std_logic;
	signal aluSrc: std_logic;
	signal memToReg: std_logic;
	signal regWrite: std_logic;
	signal memRead: std_logic;
	signal memWrite: std_logic;
	signal branch: std_logic;
	signal branchNotEqual: std_logic;
	signal jump: std_logic;
	signal aluOp1: std_logic;
	signal aluOp0: std_logic;
 
BEGIN
 

		  
	uut: controlLogicUnit port map(
			op => op,
			regDst => regDst,
			aluSrc => aluSrc,
			memToReg => memToReg,
			regWrite => regWrite,
			memRead => memRead,
			memWrite => memWrite,
			branch => branch,
			branchNotEqual => branchNotEqual,
			jump => jump,
			aluOp1 => aluOp1,
			aluOp0 => aluOp0
	);	
 
   -- Stimulus process
   stim_proc: process
   begin
    op <= "000000";     
 
      wait for 50 ns; 
 
	 op <= "100011"; 
	 
      wait for 50 ns; 
 
    op <= "101011"; 
 
        wait for 50 ns;   
 
    op <= "000100"; 
 
        wait for 50 ns;  
		  
	 op <= "000110";  
	 
			wait for 50 ns;  
		  
	 op <= "000010"; 
	 
			wait for 50 ns;  
		  
	 op <= "111111"; 
 
    end process;
 
END;