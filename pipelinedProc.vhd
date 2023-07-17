LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity pipelinedProc is
	port(
		GClock1, GClock2: in std_logic;
		GReset: in std_logic;
		
		valueSelect: in std_logic_vector(2 downto 0);
		instrSelect: in std_logic_vector(2 downto 0);
		
		
		muxOut: out std_logic_vector(7 downto 0);
		instructionOut: out std_logic_vector(31 downto 0);
		branchOut: out std_logic;
		zeroOut: out std_logic;
		memWriteOut: out std_logic;
		regWriteOut: out std_logic;
		

	);
end entity;


architecture structural of singleCycleTopLevel is


-- output from pc register, input for if/id buffer and +4 address
signal pcReg_output : std_logic_vector(7 downto 0);
-- enable signal for pc reg
signal pcWrite : std_logic;
signal pcAdder_output : std_logic_vecto(7 downto 0);
signal pcInput_conn : std_logic_vector(7 downto 0):="00000000";

-- output from instruction memory for if/id buffer
signal instrMem_output : std_logic_vector(31 downto 0);

signal regDst_conn, jump_conn, branchNE_conn, branch_conn, memRead_conn, memtoReg_conn, memWrite_conn, aluSrc_conn, regWrite_conn : std_logic := '0';

-- connection from register mux after ID/EX, to EX/MEM
signal regDstOut : std_logic_vector(4 downto 0);


signal EXControl_IDEX : std_logic_vector(3 downto 0); 
signal MControl_IDEX : std_logic_vector(2 downto 0); 
signal WBControl_IDEX : std_logic_vector(1 downto 0);

--regfile 
signal readDataOne_conn, readDataTwo_conn, memWB_dataOut: std_logic_vector(7 downto 0) := "00000000";
signal exMem_regMuxOut : std_logic_vector(4 downto 0);
signal regWrite_conn : std_logic;

-- singla to flush if buffer 
signal flush : std_logic; 

-- signal from hazard logic unit to mux
signal ctrlMuxSel : std_logic;
signal controlValue : std_logic_vector(8 downto 0);

signal ctrlMuxOut : std_logic_vector(8 downto 0);

-- indicates to if/id that BEQ is occuring
signal isBEQ : std_logic;


-- branch
signal shiftLeftTwoOutput_conn, aluResultToMux_conn : std_logic_vector(7 downto 0);



signal zero_conn: std_logic := '0' ;

-- BUFFER SIGNALS

signal ifIdEnable : std_logic;
signal ifIdReset : std_logic;
signal ifId_pcPlus4 : std_logic_vector(7 downto 0);
signal ifId_instrOut : std_logic_vector(31 downto 0);

	
signal IDEX_WB : out std_logic_vector(1 downto 0);
signal IDEX_M : out std_logic_Vector(2 downto 0);
signal IDEX_EX : out std_logic_Vector(3 downto 0);
signal IDEX_pcPlusFour : out std_logic_Vector(7 downto 0);
signal IDEX_readData1 : out std_logic_Vector(7 downto 0);
signal IDEX_readData2 : out std_logic_Vector(7 downto 0);
signal IDEX_instrEXT : out std_logic_Vector(31 downto 0);
signal IDEX_instrRS : out std_logic_Vector(4 downto 0);
signal IDEX_instrRT : out std_logic_Vector(4 downto 0);
signal IDEX_instrRD  : out std_logic_Vector(4 downto 0);

--COMPONENT DECLARATION


--BUFFERS

component IF_IDRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	pcPlusFour : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	pcPlusFour_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end component;

component ID_EXRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	EXSignals : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	pcPlusFour: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData1: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	instructionExt: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	instruction25To21: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	instruction20To16: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	instruction15To11: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	EXSignals_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	pcPlusFour_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData1_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData2_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	instructionExt_o: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	instruction25To21_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rs
	instruction20To16_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rt
	instruction15To11_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0) --rd
	);
end component;

entity EX_MEMRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluShift2Result: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluZero: IN STD_LOGIC;
	instructionMuxResult: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	readData2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);

	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluShift2Result_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --ALU w SL2 input
	aluZero_o: OUT STD_LOGIC;
	instructionMuxResult_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rs or rt
	readData2_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end entity;

component HazardDetectionUnit is 
	port(
		idExMemRead : in std_logic;
		idExRegRt : in std_logic_vector(4 downto 0);
		ifIdRegRs : in std_logic_vector(4 downto 0);
		ifIdRegRt : in std_logic_vector(4 downto 0); 
		
		ifIdWrite,PCwrite,ctrlMux : out std_logic:='0'
	);
end component;

-- single cycle components 


component pcRegister is
	port(
	reset	:	IN STD_LOGIC;
	clk : IN STD_LOGIC;
	PC_input: IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	PC_output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000"
	);
end component;

component eightBitAdder is
	port(
		A_i, B_i : in std_logic_vector (7 downto 0);
		C_i : in std_logic;
		C_o : out std_logic;
		sum: out std_logic_vector (7 downto 0)
		);
end component;

component instructionMemory is
	port (	
			inclock                 : in  STD_LOGIC;
			outclock 	            : in  STD_LOGIC;
			readAddress             : in  STD_LOGIC_VECTOR(7 downto 0);
			instruction_out			: out STD_LOGIC_VECTOR(31 downto 0)
			);
end component;

component mux5x5 is
	port (
		sel : in std_logic;
		a_i, b_i : in std_logic_vector(4 downto 0);
		o_m : out std_logic_vector(4 downto 0)
	);
end component;


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


component signExtendUnit is
	port (
	sign_input : in std_logic_vector(15 downto 0);
	sign_output : out std_logic_vector(31 downto 0)
	);
end component;

component mux8x8 is
port (
		sel : in std_logic;
		a_i, b_i : in std_logic_vector(7 downto 0);
		o_m : out std_logic_vector(7 downto 0)
	);
end component;

component ALUmain is
port (
		input1 : IN STD_logic_vector(7 downto 0);
		input2 : in std_logic_vector(7 downto 0);
		sel : in std_logic_vector(2 downto 0);
		
		zero : out std_logic;
		aluResult : out std_logic_vector(7 downto 0)
	);
end component;

component shiftLeft2Unit is
port(
	shift_input : in std_logic_vector(7 downto 0);
	shift_output: out std_logic_vector(7 downto 0));
end component;

component dataMemory IS
	PORT (	
			inclock                 : IN  STD_LOGIC;
			outclock 	            : IN  STD_LOGIC;
			memWrite						: IN  STD_LOGIC;
			memRead						: IN  STD_LOGIC;
			address                 : IN  STD_LOGIC_VECTOR(7 downto 0);
			writeData               : IN  STD_LOGIC_VECTOR(7 downto 0);
			readData			         : OUT STD_LOGIC_VECTOR(7 downto 0)
			);
END component;

component aluControlUnit is
	port(
		aluOp: in std_logic_vector (1 downto 0);
		instructionIn: in std_logic_vector (5 downto 0);
		aluCntrlOut: out std_logic_vector (2 downto 0)	
	);
end component;

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
		
		--pipeline 
		flush: out std_logic:='0';
		EX: out std_logic_vector(3 downto 0);
		M: out std_logic_vector(2 downto 0);
		WB: out std_logic_vector(1 downto 0);
		
		-- if BEQ will occur (if branch is 1 and data is equal)
		isBEQ : in std_logic;
	);
end component;

-- Multiplexor Output
component mux8x1EightBit is
port(
		a0, a1, a2, a3, a4, a5, a6, a7: in std_logic_vector(7 downto 0);
		s : in std_logic_vector(2 downto 0);
		o : out std_logic_vector(7 downto 0)
		);
end component;

component mux9bit2x1 is
port (
		sel : in std_logic;
		a_i, b_i : in std_logic_vector(8 downto 0);
		o_m : out std_logic_vector(8 downto 0)
	);
end component;

entity mux8bit3x1 is
port (
		sel : in std_logic;
		a_i, b_i : in std_logic_vector(7 downto 0);
		o_m : out std_logic_vector(7 downto 0)
	);
end entity;



begin


-- POST IF/ID BUFFER CONNECTIONS

pcReg: pcRegister port map (GReset, GClock1, pcInput_conn, pcReg_output);

	reset	:	IN STD_LOGIC;
	clk : IN STD_LOGIC;
	PC_input: IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	PC_output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000"

instructionMem: instructionMemory port map(GClock2, Gclock1, pcReg_output, instrMem_output);

pcPlus4Adder: eightBitAdder port map(pcReg_output, "00000100", '0', open, pcAdder_output);


ifIdReset <= GReset or flush;
IFIDBuffer: IF_IDRegister port map(ifIdReset, ifIdEnable, GClock1, pcAdder_output, instrMem_output, ifId_pcPlus4, ifId_instrOut);

muxPC: mux8x8 port map (aluResultToMux_conn, pcAdder_output, pcInput_conn);


--IF/ID to ID/EX
isBEQ <= zero_conn and branch_conn; 

regFile: registerFile port map(GReset, GClock1, instructionOut_conn(25 downto 21), instructionOut_conn(20 downto 16), exMem_regMuxOut, memWB_dataOut, regWrite_conn, readDataOne_conn, readDataTwo_conn);

-- value to send to the mux in between control and ID/EX
controlValue <= WBControl_IDEX & MControl_IDEX  & EXControl_IDEX;

ctrlMux: mux9bit2x1 port map (ctrlMuxSel, controlValue, "000000000", ctrlMuxOut);


controlUnit: controlLogicUnit port map(instructionOut_conn(31 downto 26), regDst_conn, aluSrc_conn, memtoReg_conn, regWrite_conn, memRead_conn, memWrite_conn, branch_conn, branchNE_conn, jump_conn, aluOp_conn(1), aluOp_conn(0), flush, ctrlMuxOut(3 downto 0), ctrlMuxOut(6 downto 4), ctrlMuxOut(8 downto 7) );

IDEXBuffer: ID_EXRegister port map (GReset, '1', GClock1, WBControl_IDEX, MCOntrol_IDEX, EXControl_IDEX, ifId_pcPlus4, readData1,readDat2, ifId_instrOut(15 downto 0), ifId_instrOut(25 downto 21), ifId_instrOut(20 downto 16), ifId_instrOut(15 downto 11),
												IDEX_WB, IDEX_M, IDEX_EX, IDEX_pcPlusFour, IDEX_readData1, IDEX_readData2, IDEX_instrEXT, IDEX_instrRS, IDEX_instrRT, IDEX_instrRD);
												
-- ISSUES WITH HAZARD DETECTION UNIT, MISSING CONNECTION FROM IFID INSTR OP, 
hazardDection : HazardDetectionUnit port map (IDEX_M, IDEX_instrRT, ifId_instrOut(25 downto 21), ifId_instrOut(20 downto 16), ifIdEnable, pcWrite, ctrlMuxSel);

shiftLeftBranch: shiftLeft2Unit port map(ifId_instrOut(7 downto 0), shiftLeftOneOutput_conn);
branchAdder: eightBitAdder port map(IDEX_pcPlusFour, shiftLeftTwoOutput_conn, '0', open, aluResultToMux_conn);


--ID/EX to EX/MEM

-- Mux selecting between ID/EX.Rt and ID/EX.Rd
IDEXMux: mux5x5 port map(RegDst_conn, IDEX_instrRT, IDEX_instrRD, regDstOut);

data1Mux: mux8bit3x1 port map (IDEX_readData1, memWB_dataOut);


EXMEMBuffer: EX_MEMRegister port map (GReset, '1', GClock1, IDEX_WB, IDEX_M, );




-- EX/MEM to MEM/WB
dataMem: dataMemory port map(GClock2, GClock1, memWrite_conn, memRead_conn, aluResultToData_conn, readDataTwo_conn,dataMemoryOutput_conn);




entity EX_MEMRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluShift2Result: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluZero: IN STD_LOGIC;
	instructionMuxResult: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	readData2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);

	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluShift2Result_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --ALU w SL2 input
	aluZero_o: OUT STD_LOGIC;
	instructionMuxResult_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rs or rt
	readData2_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end entity;

end structural;
 