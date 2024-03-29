library ieee;
use ieee.std_logic_1164.all;

entity tb_registerFile is
end entity tb_registerFile;

architecture behavioral of tb_registerFile is

  signal tb_reset, tb_clk, tb_regWrite : std_logic;
  signal tb_readReg1, tb_readReg2, tb_writeReg : std_logic_vector(4 downto 0);
  signal tb_writeData, tb_readData1, tb_readData2, tb_enableReg: std_logic_vector(7 downto 0);
  signal sim_end : boolean := false; -- signals the end of the simulation
	
	signal tb_reg1, tb_reg4 : std_logic_vector(7 downto 0);
  -- Component declaration
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
	readData2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

	enableRegister : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readRegD1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	readRegD4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
  end component;

begin
  -- Instantiation of the mux8x1EightBit component
  tb_registerFile: registerFile
  port map (
	reset => tb_reset,
	clk => tb_clk,
	readReg1 => tb_readReg1,
	readReg2 => tb_readReg2,
	writeReg => tb_writeReg, 
	writeData => tb_writeData,
	regWrite => tb_regWrite,
	readData1 => tb_readData1,
	readData2 => tb_readData2,
	enableRegister => tb_enableReg,
	readRegD1=> tb_reg1,
	readRegD4 => tb_reg4
  );

clock_process : process
begin
while (not sim_end) loop
tb_clk <= '1';
wait for 50ps;
tb_clk <= '0';
wait for 50ps;
end loop;
wait;
end process;

  -- Stimulus process
  process
  begin
	
	tb_writeReg <= "00011";
	tb_writeData <= "10001000";
	tb_regWrite <= '1';
	
	wait for 95ps;

	tb_readReg1 <= "00001";
	tb_readReg2 <= "00011";

	wait for 95ps;

	tb_writeReg <= "00001";
	tb_writeData <= "10001111";
	tb_regWrite <= '1';
	
	wait for 95ps;

	tb_readReg1 <= "00001";
	tb_readReg2 <= "00011";

	wait for 95ps;


	sim_end<=true;
	wait;

  end process;

end architecture behavioral;