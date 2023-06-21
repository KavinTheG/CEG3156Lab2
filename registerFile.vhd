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

	signal registerValues0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal registerValues1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal registerValues2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal registerValues3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal registerValues4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal registerValues5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal registerValues6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal registerValues7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
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

	reg0: port map (]
		
		values => registerValues0,
		en => regWrite, 
	
	);
	
	reg: port map (
	);
	
	reg: port map (
	);
	
	reg: port map (
	);
	
	reg: port map (
	);
	
	reg: port map (
	);
	
	reg: port map (
	);
	
	reg: port map (
	);
	

end structural;