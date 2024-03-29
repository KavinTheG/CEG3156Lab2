LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--use as mux in between instruction memory and the register file;
entity ALUmain is
port (
		input1 : IN STD_logic_vector(7 downto 0);
		input2 : in std_logic_vector(7 downto 0);
		sel : in std_logic_vector(2 downto 0);
		
		zero : out std_logic;
		aluResult : out std_logic_vector(7 downto 0)
	);
end entity;

architecture structural of ALUmain is

	signal andResult, orResult, addResult, diffResult : std_logic_vector(7 downto 0);
	signal carryOut : std_logic;
	signal stlResult : std_logic;
	signal stlOutput : std_logic_vector(7 downto 0);
	signal sigAluResult : std_logic_vector(7 downto 0);
	
	component eightBitAdder is
		port(
			A_i, B_i : in std_logic_vector (7 downto 0);
			C_i : in std_logic;
			C_o : out std_logic;
			sum: out std_logic_vector (7 downto 0)
		);
	end component;
	
	component eightBitSubtractor is
		port(
			A_i, B_i : in std_logic_vector (7 downto 0);
			C_i : in std_logic;
			C_o : out std_logic;
			diff: out std_logic_vector (7 downto 0)
		);
	end component;
	
	component eighBitComparator IS
	PORT(
		A, B			: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		LT			: OUT	STD_LOGIC);
	END component;
	
	component mux8x1EightBit is
	port(
			a0, a1, a2, a3, a4, a5, a6, a7: in std_logic_vector(7 downto 0);
			s : in std_logic_vector(2 downto 0);
			o : out std_logic_vector(7 downto 0)
			);
	end component;

begin
	
	andResult(0) <= input1(0) and input2(0);
	andResult(1) <= input1(1) and input2(1);
	andResult(2) <= input1(2) and input2(2);
	andResult(3) <= input1(3) and input2(3);
	andResult(4) <= input1(4) and input2(4);
	andResult(5) <= input1(5) and input2(5);
	andResult(6) <= input1(6) and input2(6);
	andResult(7) <= input1(7) and input2(7);
	
	orResult(0) <= input1(0) or input2(0);
	orResult(1) <= input1(1) or input2(1);
	orResult(2) <= input1(2) or input2(2);
	orResult(3) <= input1(3) or input2(3);
	orResult(4) <= input1(4) or input2(4);
	orResult(5) <= input1(5) or input2(5);
	orResult(6) <= input1(6) or input2(6);
	orResult(7) <= input1(7) or input2(7);
	
	adder: eightBitAdder port map (input1, input2, '0', carryOut, addResult);
	subtractor: eightBitSubtractor port map (input1, input2, '0', carryOut, diffResult);
	stl: eighBitComparator port map (input1, input2, stlResult);

	stlOutput <= "0000000" & stlResult;
	
	ALUMux: mux8x1EightBit port map (andResult, orResult, addResult, diffResult, stlOutput, "00000000", "00000000", "00000000", sel, sigAluResult);
	
	zero <= not(sigAluResult(0)) and not(sigAluResult(1)) and not(sigAluResult(2)) and not(sigAluResult(3)) and
		not(sigAluResult(4)) and not(sigAluResult(5)) and not(sigAluResult(6)) and not(sigAluResult(7));
	aluResult <= sigAluResult;

end structural;