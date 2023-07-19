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
		regWriteOut: out std_logic
		

	);
end entity;


architecture structural of pipelinedProc is


-- output from pc register, input for if/id buffer and +4 address
signal pcReg_output : std_logic_vector(7 downto 0);
-- enable signal for pc reg
signal pcWrite : std_logic;
signal pcAdder_output : std_logic_vector(7 downto 0);
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
--signal regWrite_conn : std_logic;

-- singla to flush if buffer 
signal flush : std_logic; 

-- signal from hazard logic unit to mux
signal ctrlMuxSel : std_logic;
signal controlValue : std_logic_vector(8 downto 0);

signal ctrlMuxOut : std_logic_vector(8 downto 0);

-- indicates to if/id that BEQ is occuring
signal isBEQ : std_logic;

-- bit to display if data is equal
signal dataEquality : std_logic;

-- branch
signal shiftLeftTwoOutput_conn, aluResultToMux_conn : std_logic_vector(7 downto 0);

-- alu
signal aluControl_conn: std_logic_vector(2 downto 0) :="000" ;
--control unit signal value
signal aluOp_conn: std_logic_vector(1 downto 0) := "00" ;

signal zero_conn: std_logic := '0' ;

-- BUFFER SIGNALS

signal ifIdEnable : std_logic;
signal ifIdReset : std_logic;
signal ifId_pcPlus4 : std_logic_vector(7 downto 0);
signal ifId_instrOut : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

	
signal IDEX_WB :  std_logic_vector(1 downto 0);
signal IDEX_M :  std_logic_Vector(2 downto 0);
signal IDEX_EX :  std_logic_Vector(3 downto 0);
signal IDEX_pcPlusFour :  std_logic_Vector(7 downto 0);
signal IDEX_readData1 :  std_logic_Vector(7 downto 0);
signal IDEX_readData2 :  std_logic_Vector(7 downto 0);
signal IDEX_instrEXT :  std_logic_Vector(7 downto 0);
signal IDEX_instrRS :  std_logic_Vector(4 downto 0);
signal IDEX_instrRT :  std_logic_Vector(4 downto 0);
signal IDEX_instrRD  :  std_logic_Vector(4 downto 0);


signal EXMEM_WB :  std_logic_vector(1 downto 0);
signal EXMEM_M :  std_logic_Vector(2 downto 0);

signal EXMEM_aluResult :  std_logic_Vector(7 downto 0);
signal EXMEM_aluZero :  std_logic;
signal EXMEM_instructionMuxResult :  std_logic_vector(4 downto 0);
signal EXMEM_readData2 : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal exMem_regMuxOut8bit: std_logic_vector(7 downto 0);
 
signal dataMemoryOutput_conn : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal MEMWB_WB : std_logic_vector(1 downto 0);
signal MEMWB_aluResult : std_logic_Vector(7 downto 0);
signal MEMWB_readDataMem : std_logic_vector(7 downto 0);
signal MEMWB_instructionMuxResult : std_logic_vector(4 downto 0);

-- FORWARDING
signal forwardA: std_logic_vector(1 downto 0);
signal forwardB: std_logic_vector(1 downto 0);


signal data1MuxOutput, data2MuxOutput : std_logic_vector(7 downto 0);
signal aluResultToData_conn : std_logic_vector(7 downto 0);

signal other : std_logic_vector(7 downto 0);

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
	instructionExt: IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	instruction25To21: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	instruction20To16: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	instruction15To11: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	EXSignals_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	pcPlusFour_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData1_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData2_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	instructionExt_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	instruction25To21_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rs
	instruction20To16_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rt
	instruction15To11_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0) --rd
	);
end component;

component EX_MEMRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	--aluShift2Result: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	aluZero: IN STD_LOGIC;
	instructionMuxResult: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	readData2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);

	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSignals_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	aluResult_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	--aluShift2Result_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --ALU w SL2 input
	aluZero_o: OUT STD_LOGIC;
	instructionMuxResult_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --rs or rt
	readData2_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component;

component MEM_WBRegister is
	port(
	reset	:	IN STD_LOGIC;
	en    :  IN STD_LOGIC;
	clk   :  IN STD_LOGIC;
	
	WBSignals : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	aluResult: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	readDataMem: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	instructionMuxResult: IN STD_LOGIC_VECTOR(4 DOWNTO 0);

	
	WBSignals_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	aluResult_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readDataMem_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --data memory output
	instructionMuxResult_o: OUT STD_LOGIC_VECTOR(4 DOWNTO 0) --rs or rt
	);
end component;



component HazardDetectionUnit is 
	port(
		idExMemRead : in std_logic;
		isBranchEqual : in std_logic;
		
		memWbWriteReg : in std_logic_vector(4 downto 0);
		memWbRegWrite : in std_logic; 
		
		idExRegRt : in std_logic_vector(4 downto 0);
		ifIdRegRs : in std_logic_vector(4 downto 0);
		ifIdRegRt : in std_logic_vector(4 downto 0); 
		
		ifIdWrite : out std_logic:='0';
		PCwrite : out std_logic:='0';
		ctrlMux : out std_logic:='0'
	);
end component;

component forwardingUnit is
	port(
	EX_MEM_regWrite: in std_logic;
	MEM_WB_regWrite: in std_logic;
	EX_MEM_regRead: in std_logic_vector(4 downto 0);
	MEM_WB_regRead: in std_logic_vector(4 downto 0);
	ID_EX_regRs: in std_logic_vector(4 downto 0);
	ID_EX_regRt: in std_logic_vector(4 downto 0);
	forwardA: out std_logic_vector(1 downto 0);
	forwardB: out std_logic_vector(1 downto 0)
	--still need to add values for lw and sw
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
	--regWrite : IN STD_LOGIC;
	
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
		
		-- if BEQ will occur (if branch is 1 and data is equal)
		isBEQ : in std_logic;
		
		regDst: buffer std_logic;
		aluSrc: buffer std_logic;
		memToReg: buffer std_logic;
		--regWrite: out std_logic;
		memRead: buffer std_logic;
		memWrite: buffer std_logic;
		branch: out std_logic;
		branchNotEqual: out std_logic;
		
		jump: buffer std_logic;
		aluOp1: buffer std_logic;
		aluOp0: buffer std_logic;

		--pipeline 
		flush: out std_logic:='0';
		EX: out std_logic_vector(3 downto 0);
		M: out std_logic_vector(2 downto 0);
		WB: out std_logic_vector(1 downto 0)
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

component mux8bit3x1 is
port (
		sel : in std_logic_vector(1 downto 0);
		a_i, b_i, c_i : in std_logic_vector(7 downto 0);
		o_m : out std_logic_vector(7 downto 0)
	);
end component;



begin


-- POST IF/ID BUFFER CONNECTIONS

pcReg: pcRegister port map (GReset, GClock1, pcInput_conn, pcReg_output);


instructionMem: instructionMemory port map(GClock2, Gclock1, pcReg_output, instrMem_output);

pcPlus4Adder: eightBitAdder port map(pcReg_output, "00000100", '0', open, pcAdder_output);


ifIdReset <= GReset or flush;
IFIDBuffer: IF_IDRegister port map(ifIdReset, ifIdEnable, GClock1, pcAdder_output, instrMem_output, ifId_pcPlus4, ifId_instrOut);

muxPC: mux8x8 port map (isBEQ ,aluResultToMux_conn, pcAdder_output, pcInput_conn);


--IF/ID to ID/EX

regFile: registerFile port map(GReset, GClock1, instrMem_output(25 downto 21), instrMem_output(20 downto 16), exMem_regMuxOut, memWB_dataOut, readDataOne_conn, readDataTwo_conn);

dataEquality <= ( readDataOne_conn(0) XNOR readDataTwo_conn(0) ) and ( readDataOne_conn(1) XNOR readDataTwo_conn(1) ) and ( readDataOne_conn(2) XNOR readDataTwo_conn(2) ) and ( readDataOne_conn(3) XNOR readDataTwo_conn(3) ) and
                ( readDataOne_conn(4) XNOR readDataTwo_conn(4) ) and ( readDataOne_conn(5) XNOR readDataTwo_conn(5) ) and ( readDataOne_conn(6) XNOR readDataTwo_conn(6) ) and ( readDataOne_conn(7) XNOR readDataTwo_conn(7) );

isBEQ <= dataEquality and branch_conn;

-- value to send to the mux in between control and ID/EX
--controlValue <= WBControl_IDEX & MControl_IDEX  & EXControl_IDEX;

ctrlMux: mux9bit2x1 port map (ctrlMuxSel, controlValue, "000000000", ctrlMuxOut);


controlUnit: controlLogicUnit port map(instrMem_output(31 downto 26), isBEQ, regDst_conn, aluSrc_conn, memtoReg_conn, memRead_conn, memWrite_conn, branch_conn, branchNE_conn, jump_conn, aluOp_conn(1), aluOp_conn(0), flush, controlValue(3 downto 0), controlValue(6 downto 4), controlValue(8 downto 7) );

WBControl_IDEX <= ctrlMuxOut(8 downto 7);
MControl_IDEX <= ctrlMuxOut(6 downto 4);
EXControl_IDEX <= ctrlMuxOut(3 downto 0);

IDEXBuffer: ID_EXRegister port map (GReset, '1', GClock1, WBControl_IDEX, MControl_IDEX, EXControl_IDEX, ifId_pcPlus4, readDataOne_conn, readDataTwo_conn, ifId_instrOut(7 downto 0), ifId_instrOut(25 downto 21), ifId_instrOut(20 downto 16), ifId_instrOut(15 downto 11),
												IDEX_WB, IDEX_M, IDEX_EX, IDEX_pcPlusFour, IDEX_readData1, IDEX_readData2, IDEX_instrEXT, IDEX_instrRS, IDEX_instrRT, IDEX_instrRD);
												
-- ISSUES WITH HAZARD DETECTION UNIT, MISSING CONNECTION FROM IFID INSTR OP, 
hazardDection : HazardDetectionUnit port map (IDEX_M(1), IDEX_instrRT, ifId_instrOut(25 downto 21), ifId_instrOut(20 downto 16), ifIdEnable, pcWrite, ctrlMuxSel);

shiftLeftBranch: shiftLeft2Unit port map(ifId_instrOut(7 downto 0), shiftLeftTwoOutput_conn);
branchAdder: eightBitAdder port map(IDEX_pcPlusFour, shiftLeftTwoOutput_conn, '0', open, aluResultToMux_conn);


--ID/EX to EX/MEM

-- Mux selecting between ID/EX.Rt and ID/EX.Rd
IDEXMux: mux5x5 port map(RegDst_conn, IDEX_instrRT, IDEX_instrRD, regDstOut);

data1Mux: mux8bit3x1 port map (forwardA, IDEX_readData1, memWB_dataOut, EXMEM_aluResult , data1MuxOutput);

data2Mux: mux8bit3x1 port map (forwardB, IDEX_readData2, memWB_dataOut, EXMEM_aluResult, data2MuxOutput);

aluCont: aluControlUnit port map(aluOp_conn, IDEX_instrEXT(5 DOWNTO 0), aluControl_conn);
alu: ALUmain port map(data1MuxOutput, data2MuxOutput, aluControl_conn, zero_conn, aluResultToData_conn);



EXMEMBuffer: EX_MEMRegister port map (GReset, '1', GClock1, IDEX_WB, IDEX_M, aluResultToData_conn, zero_conn, regDstOut, IDEX_readData2, EXMEM_WB, EXMEM_M, EXMEM_aluResult, EXMEM_aluZero, EXMEM_instructionMuxResult, EXMEM_readData2);

forwardUnit : forwardingUnit port map (EXMEM_WB(0), MEMWB_WB(0), EXMEM_instructionMuxResult, MEMWB_instructionMuxResult, IDEX_instrRS, IDEX_instrRT, forwardA, forwardB);


-- EX/MEM to MEM/WB
dataMem: dataMemory port map(GClock2, GClock1, memWrite_conn, memRead_conn, EXMEM_aluResult, EXMEM_readData2,dataMemoryOutput_conn);


--MEM/WB stage

MEMWBBuffer : MEM_WBRegister port map (GReset, '1', GClock1, EXMEM_WB, EXMEM_aluResult, dataMemoryOutput_conn, EXMEM_instructionMuxResult, MEMWB_WB, MEMWB_aluResult, MEMWB_readDataMem, MEMWB_instructionMuxResult);
MEMWBMuxOut : mux8x8 port map (MEMWB_WB(0), MEMWB_aluResult, MEMWB_readDataMem, memWB_dataOut);



instructionOut <= instrMem_output;
branchOut <= branch_conn;
zeroOut <= zero_conn;
memWriteOut <= memWrite_conn;
regWriteOut <= regWrite_conn;
--STILL NEED TO DO THE MUX OUT VALUE;
other(0) <= zero_conn;
other(1) <= regDst_conn;
other(2) <= jump_conn;
other(3) <= memRead_conn;
other(4) <= memtoReg_conn;
other(6 downto 5)<=aluOp_conn;
other(7)<=aluSrc_conn;

exMem_regMuxOut8bit <= "000" & exMem_regMuxOut;

-- PC, ALUResult, ReadData1, ReadData2, WriteData, , RegDst, ALUOp ,  memtoReg
outputVal: mux8x1EightBit port map(pcReg_output, aluResultToData_conn, readDataOne_conn, readDataTwo_conn, exMem_regMuxOut8bit,
                                   other, other, other, valueSelect, muxOut);


end structural;
 