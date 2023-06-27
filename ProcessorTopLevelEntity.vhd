LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity ProcessorTopLevelEntity IS
	PORT (	
			GClock         : IN STD_LOGIC;
			GReset 	      : IN  STD_LOGIC;
			ValueSelect    : IN  STD_LOGIC_VECTOR(2 downto 0);
			MuxOut			: OUT STD_LOGIC_VECTOR(7 downto 0);
			InstructionOut : OUT STD_LOGIC_VECTOR(31 downto 0);
			BranchOut		: OUT STD_LOGIC;
			ZeroOut			: OUT STD_LOGIC;
			MemWriteOut		: OUT STD_LOGIC;
			RegWriteOut		: OUT STD_LOGIC
	);
END ProcessorTopLevelEntity;

architecture Structural of ProcessorTopLevelEntity is 

	component controlLogicUnit 	
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
	
	-- stores current instruction
	component pcRegister is
		port(
			reset	:	IN STD_LOGIC;
			clk : IN STD_LOGIC;
			PC_input: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			PC_output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;
	
	-- adds 4 to the current instruction to get the next  instruction
	component pcAdder8Bit IS
		PORT(
			Cin		: IN	STD_LOGIC;
			A, B		: IN	STD_LOGIC_VECTOR(7 downto 0);
			Sum	: OUT	STD_LOGIC_VECTOR(7 downto 0);
			CarryOut: OUT STD_LOGIC );
	END component; 
	
	component registerFile is
		port(
			reset : IN STD_LOGIC;
			clk : IN STD_LOGIC;
			readReg1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			readReg2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			writeReg : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			writeData : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			regWrite : IN STD_LOGIC;
			
			readData1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			readData2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)	
		);
	end component;
	
	component  shiftLeft2Unit is
		port(
			shift_input : in std_logic_vector(7 downto 0);
			shift_output: out std_logic_vector(7 downto 0)
		);
	end component;
	
	-- 8 bit 2x1 mux
	component mu8x8 is
	port (
			sel : in std_logic;
			a_i, b_i : in std_logic_vector(7 downto 0);
			o_m : out std_logic_vector(7 downto 0)
		);
	end component;	
	
	-- To perform R-type instructions 
	component ALUmain is
	port (
			input1 : IN STD_logic_vector(7 downto 0);
			input2 : in std_logic_vector(7 downto 0);
			sel : in std_logic_vector(2 downto 0);
			
			zero : out std_logic;
			aluResult : out std_logic_vector(7 downto 0)
		);
	end component; 
	
	-- To control which operation ALU  does
	component aluControlUnit is
		port(
			aluOp: in std_logic_vector (1 downto 0);
			instructionIn: in std_logic_vector (5 downto 0);
			aluCntrlOut: out std_logic_vector (2 downto 0)	
		);
	end component; 
	
begin

end;