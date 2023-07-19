--1. If (ID/EX.MemRead & ((ID/EX.RegisterRt = IF/ID.RegisterRs) or (ID/EX.RegisterRt = IF/ID.RegisterRt))) <-- lw stall (hazard detected)
--2  If (IF/ID.op = 000100 AND data1 == data2) <--branch stall

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity HazardDetectionUnit is 
	port(
		idExMemRead : in std_logic;
		isBranchAndDataEqual : in std_logic;
		
		idExRegRt : in std_logic_vector(4 downto 0);
		ifIdRegRs : in std_logic_vector(4 downto 0);
		ifIdRegRt : in std_logic_vector(4 downto 0); 
		
		ifIdWrite : out std_logic:='0';
		PCwrite : out std_logic:='0';
		ctrlMux : out std_logic:='0';
		
		--testing 
		h1 : out std_logic:='0';
		h2 : out std_logic:='0';
		
		RtEqRs : out std_logic:='0';
		RtEqRt : out std_logic:='0'
	);
end entity;

architecture structural of HazardDetectionUnit is 
	signal IdExRtEqIfIdRs,IdExRtEqIfIdRt:std_logic_vector(4 downto 0);
	signal RtRs, RtRt : std_logic;
	
	signal hazard1, hazard2 : std_logic; 
	
	
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

  -- 1 is IDEXrt and IFIDrs are equal 
	RtRs <= IdExRtEqIfIdRs(0) and IdExRtEqIfIdRs(1) and IdExRtEqIfIdRs(2) and IdExRtEqIfIdRs(3) and IdExRtEqIfIdRs(4);
	RtEqRs <= RtRs;
	
	-- 1 is IDEXrt and IFIDrt are equal 
	RtRt <= IdExRtEqIfIdRt(0) and IdExRtEqIfIdRt(1) and IdExRtEqIfIdRt(2) and IdExRtEqIfIdRt(3) and IdExRtEqIfIdRt(4); 
	RtEqRt <= RtRt;
	
	-- load word stall
	hazard1 <= idExMemRead and (RtRs or RtRt);
	h1 <= hazard1;
	
	-- branch stall 
	hazard2 <= isBranchAndDataEqual;
	h2 <= hazard2;

	
	ifIdWrite <= not(hazard1 and hazard2);
	PCwrite <= not(hazard1);
	ctrlMux <= hazard1;
	

end;

