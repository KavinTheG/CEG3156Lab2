LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity registerFile is
	port(
	readReg1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	readReg2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	writeReg : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	writeData : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	regWrite : IN STD_LOGIC;
	
	readData1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readData2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	);
end entity;

architecture structural of registerFile is

	signal notOutputs : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	component eightBitRegister IS
	port(
		reset	:	IN STD_LOGIC;
		values : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		en : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		outputs : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	);
	end component;

begin

	generate_regs: for i in 0 to 31 generate

		registers : eightBitRegister
			port map (
				reset 
			
			);
	end generate generate_regs;

end structural;