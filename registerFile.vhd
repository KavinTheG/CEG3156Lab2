LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity registerFile is
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
end entity;

architecture structural of registerFile is

	signal enWReg : STD_LOGIC_VECTOR(7 downto 0);
	signal writeDecoderOutput : STD_LOGIC_VECTOR(7 downto 0);
	
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
			outputs : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;
	
	component threeToEightDecoder IS
		port(
			X: in std_logic_vector(2 downto 0);
			Y: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component mux8x1EightBit IS
		port(
			a0, a1, a2, a3, a4, a5, a6, a7: in std_logic_vector(7 downto 0);
			s : in std_logic_vector(2 downto 0);
			o: out std_logic_vector(7 downto 0)
		);
	end component;

begin

	writeDecoder: threeToEightDecoder port map(writeReg(2 downto 0), writeDecoderOutput);

	enWReg(0) <= regWrite and writeDecoderOutput(0);
	enWReg(1) <= regWrite and writeDecoderOutput(1);
	enWReg(2) <= regWrite and writeDecoderOutput(2);
	enWReg(3) <= regWrite and writeDecoderOutput(3);
	enWReg(4) <= regWrite and writeDecoderOutput(4);
	enWReg(5) <= regWrite and writeDecoderOutput(5);
	enWReg(6) <= regWrite and writeDecoderOutput(6);
	enWReg(7) <= regWrite and writeDecoderOutput(7);

	reg0: eightBitRegister port map (
		reset => reset,
		values => writeData,
		en => enWReg(0), 
		clk => clk,
		outputs => registerValues0
	);
	
	reg1: eightBitRegister port map (
		reset => reset,
		values => writeData,
		en => enWReg(1), 
		clk => clk,
		outputs => registerValues1
	);
	
	reg2: eightBitRegister port map (
		reset => reset,
		values => writeData,
		en => enWReg(2), 
		clk => clk,
		outputs => registerValues2
	);
	
	reg3: eightBitRegister port map (
		reset => reset,
		values => writeData,
		en => enWReg(3), 
		clk => clk,
		outputs => registerValues3
	);
	
	reg4: eightBitRegister port map (
		reset => reset,
		values => writeData,
		en => enWReg(4), 
		clk => clk,
		outputs => registerValues4
	);
	
	reg5: eightBitRegister port map (
		reset => reset,
		values => writeData,
		en => enWReg(5), 
		clk => clk,
		outputs => registerValues5
	);
	
	reg6: eightBitRegister port map (
		reset => reset,
		values => writeData,
		en => enWReg(6), 
		clk => clk,
		outputs => registerValues6
	);
	
	reg7: eightBitRegister port map (
		reset => reset,
		values => writeData,
		en => enWReg(7), 
		clk => clk,
		outputs => registerValues7
	);
	
	readRegister1: mux8x1EightBit port map (registerValues0, registerValues1, registerValues2, registerValues3, 
														 registerValues4, registerValues5, registerValues6, registerValues7,
														 readReg1(2 downto 0), readData1 );
	readRegister2: mux8x1EightBit port map (registerValues0, registerValues1, registerValues2, registerValues3, 
														 registerValues4, registerValues5, registerValues6, registerValues7,
														 readReg2(2 downto 0), readData2 );

end structural;