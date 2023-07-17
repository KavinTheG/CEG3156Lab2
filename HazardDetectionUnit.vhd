--1. If (ID/EX.MemRead & ((ID/EX.RegisterRt = IF/ID.RegisterRs) or (ID/EX.RegisterRt = IF/ID.RegisterRt))) <-- lw stall (hazard detected)
--2  If (IF/ID.op = 000100 AND data1 == data2) <--branch stall
--3  If (MEM/WB.WriteRegister = IF/ID.rt OR MEM/WB.WriteRegister = IF/ID.rs) AND (MEM/WB.RegWrite)	<-- lw stall

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity HazardDetectionUnit is 
	port(
		idExMemRead : in std_logic;
		idExRegRt : in std_logic_vector(4 downto 0);
		ifIdRegRs : in std_logic_vector(4 downto 0);
		ifIdRegRt : in std_logic_vector(4 downto 0); 
		
		ifIdWrite,PCwrite,ctrlMux : out std_logic:='0'
	);
end entity;

architecture structural of HazardDetectionUnit is 
	signal IdExRtEqIfIdRs,IdExRtEqIfIdRt:std_logic_vector(4 downto 0);
	signal RtRs, RtRt : std_logic;
	
	
begin 

	IdExRtEqIfIdRs(0) <= idExRegRt(0) xnor ifIdRegRs(0);
	IdExRtEqIfIdRs(1) <= idExRegRt(1) xnor ifIdRegRs(1);
	IdExRtEqIfIdRs(2) <= idExRegRt(2) xnor ifIdRegRs(2);
	IdExRtEqIfIdRs(3) <= idExRegRt(3) xnor ifIdRegRs(3);
	IdExRtEqIfIdRs(4) <= idExRegRt(4) xnor ifIdRegRs(4);
	
	IdExRtEqIfIdRt(0) <= idExRegRt(0) xnor ifIdRegRt(0);
	IdExRtEqIfIdRt(1) <= idExRegRt(1) xnor ifIdRegRt(1);
	IdExRtEqIfIdRt(2) <= idExRegRt(2) xnor ifIdRegRt(2);
	IdExRtEqIfIdRt(3) <= idExRegRt(3) xnor ifIdRegRt(3);
	IdExRtEqIfIdRt(4) <= idExRegRt(4) xnor ifIdRegRt(4);
		
	RtRs <= IdExRtEqIfIdRs(0) and IdExRtEqIfIdRs(1) and IdExRtEqIfIdRs(2) and IdExRtEqIfIdRs(3) and IdExRtEqIfIdRs(4);
	RtRt <= IdExRtEqIfIdRt(0) and IdExRtEqIfIdRt(1) and IdExRtEqIfIdRt(2) and IdExRtEqIfIdRt(3) and IdExRtEqIfIdRt(4); 
	
	
	ifIdWrite <= idExMemRead and (RtRs or RtRt);
	PCwrite <= idExMemRead and (RtRs or RtRt);
	ctrlMux <= not( idExMemRead ) and ( (not RtRs) or not(RtRt) );
	

end;

