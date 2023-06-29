library ieee;
use ieee.std_logic_1164.all;

entity tb_registerFile is
end entity tb_registerFile;

architecture behavioral of tb_registerFile is

  signal tb_reset, tb_clk, tb_regWrite : std_logic;
  signal tb_readReg1, tb_readReg2, tb_writeReg : std_logic_vector(4 downto 0);
  signal tb_writeData, tb_readData1, tb_readData2: std_logic_vector(7 downto 0);
  signal sim_end : boolean := false; -- signals the end of the simulation

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
	readData2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)	
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
	readData2 => tb_readData2	
  );

clock_process : process
begin
while (not sim_end) loop
tb_clk <= '1';
wait for 50ns;
tb_clk <= '0';
wait for 50ns;
end loop;
wait;
end process;

  -- Stimulus process
  process
  begin
	
	tb_writeData <= "10100010";
	tb_writeReg <= "00011";
	tb_regWrite <= '1';
	
	wait for 100ns; 
	
	tb_writeData <= "10110010";
	tb_writeReg <= "00001";
	tb_regWrite <= '1';

	wait for 100ns;

	tb_readReg1 <= "00011";
	tb_readReg2 <= "00001";
	tb_regWrite <= '0';

	wait for 100ns;
	
	assert(tb_readData1 = "10100010")
	report "Test for read data 1 failed" severity error;

	assert(tb_readData2 = "10110010")
    	report "Test for read data 2 failed" severity error;
	

	sim_end<=true;
	wait;

  end process;

end architecture behavioral;