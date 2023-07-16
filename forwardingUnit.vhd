LIBRARY ieee;
USE ieee.std_logic_1164.all;

--1. If (EX/MEM.RegWrite & (EX/MEM.RegisterRd != 0) & (EX/MEM.RegisterRd = ID/EX.RegisterRs)) ForwardA= 10 <-- (type 1 r-type  hazard)
--2. If (EX/MEM.RegWrite & (EX/MEM.RegisterRd != 0) & (EX/MEM.RegisterRd = ID/EX.RegisterRt)) ForwardB= 10 <-- (type 2 r-type  hazard)
--3. If (MEM/WB.RegWrite & (MEM/WB.RegisterRd != 0) & (MEM/WB.RegisterRd = ID/EX.RegisterRs)) ForwardA= 01 <-- (type 3 r-type  hazard)
--4. If (MEM/WB.RegWrite & (MEM/WB.RegisterRd != 0) & (MEM/WB.RegisterRd = ID/EX.RegisterRt)) ForwardB= 01 <-- (type 4 r-type  hazard)

--5. If (EX/MEM.RegWrite & (EX/MEM.RegisterRd != 0) & ID/EX.MemWrite & (EX/MEM.RegisterRd = ID/EX.RegisterRt)) <-- (type1 sw hazard) (not implemented)
--6. If (EX/MEM.RegWrite & (EX/MEM.RegisterRd != 0) & ID/EX.MemWrite & (EX/MEM.RegisterRd = ID/EX.RegisterRs)) <-- (type2 sw hazard) (not implemented)

entity forwardingUnit is
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
end entity;

architecture rtl of forwardingUnit is

signal EX_MEM_regReadZero, MEM_WB_regReadZero: std_logic;
signal EX_MEM_regReadEqualRs, EX_MEM_regReadEqualRt: std_logic;
signal MEM_WB_regReadEqualRs, MEM_WB_regReadEqualRt: std_logic;
signal ifCond1, ifCond2, ifCond3, ifCond4: std_logic;


begin

EX_MEM_regReadZero <= EX_MEM_regRead(4) or EX_MEM_regRead(3) or EX_MEM_regRead(2) or EX_MEM_regRead(1) or EX_MEM_regRead(0);
MEM_WB_regReadZero <= MEM_WB_regRead(4) or MEM_WB_regRead(3) or MEM_WB_regRead(2) or MEM_WB_regRead(1) or MEM_WB_regRead(0);

EX_MEM_regReadEqualRs <= (EX_MEM_regRead(4) XNOR ID_EX_regRs(4)) AND (EX_MEM_regRead(3) XNOR ID_EX_regRs(3)) AND (EX_MEM_regRead(2) XNOR ID_EX_regRs(2)) AND (EX_MEM_regRead(1) XNOR ID_EX_regRs(1)) 
									AND (EX_MEM_regRead(0) XNOR ID_EX_regRs(0));

EX_MEM_regReadEqualRt <= (EX_MEM_regRead(4) XNOR ID_EX_regRt(4)) AND (EX_MEM_regRead(3) XNOR ID_EX_regRt(3)) AND (EX_MEM_regRead(2) XNOR ID_EX_regRt(2)) AND (EX_MEM_regRead(1) XNOR ID_EX_regRt(1)) 
									AND (EX_MEM_regRead(0) XNOR ID_EX_regRt(0));

MEM_WB_regReadEqualRs <= (MEM_WB_regRead(4) XNOR ID_EX_regRs(4)) AND (MEM_WB_regRead(3) XNOR ID_EX_regRs(3)) AND (MEM_WB_regRead(2) XNOR ID_EX_regRs(2)) AND (MEM_WB_regRead(1) XNOR ID_EX_regRs(1))
									AND (MEM_WB_regRead(0) XNOR ID_EX_regRs(0));

MEM_WB_regReadEqualRt <= (MEM_WB_regRead(4) XNOR ID_EX_regRt(4)) AND (MEM_WB_regRead(3) XNOR ID_EX_regRt(3)) AND (MEM_WB_regRead(2) XNOR ID_EX_regRt(2)) AND (MEM_WB_regRead(1) XNOR ID_EX_regRt(1))
									AND (MEM_WB_regRead(0) XNOR ID_EX_regRt(0));

									
ifCond1 <= EX_MEM_regWrite AND EX_MEM_regReadZero AND EX_MEM_regReadEqualRs;
ifCond2 <= EX_MEM_regWrite AND EX_MEM_regReadZero AND EX_MEM_regReadEqualRt;
ifCond3 <= MEM_WB_regWrite AND MEM_WB_regReadZero AND MEM_WB_regReadEqualRs;
ifCond4 <= MEM_WB_regWrite AND MEM_WB_regReadZero AND MEM_WB_regReadEqualRt;

forwardA(1) <= ifCond1;
forwardA(0) <= ifCond3;
forwardB(1) <= ifCond2;
forwardB(0) <= ifCond4;

end rtl;