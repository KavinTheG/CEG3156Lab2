-- Testbench for mux8x1EightBit

library ieee;
use ieee.std_logic_1164.all;

entity tb_singleCycleProc is
end entity tb_singleCycleProc;

architecture behavioral of tb_singleCycleProc is
  -- Component declaration
  component singleCycleTopLevel is
	port (
		GClock1, GClock2: in std_logic;
		GReset: in std_logic;
		valueSelect: in std_logic_vector(2 downto 0);
		muxOut: out std_logic_vector(7 downto 0);
		instructionOut: out std_logic_vector(31 downto 0);
		branchOut: out std_logic;
		zeroOut: out std_logic;
		memWriteOut: out std_logic;
		regWriteOut: out std_logic;
		
	  pcInput : out std_logic_vector(7 downto 0)  := "00000000";
		pcOutput : out std_logic_vector(7 downto 0)
	);
  end component singleCycleTopLevel;

  -- Testbench signals
		signal tb_GClock1, tb_GClock2: std_logic;
		signal tb_GReset: std_logic;
		signal tb_valueSelect: std_logic_vector(2 downto 0);
		signal tb_muxOut: std_logic_vector(7 downto 0);
		signal tb_instructionOut: std_logic_vector(31 downto 0);
		signal tb_branchOut: std_logic;
		signal tb_zeroOut: std_logic;
		signal tb_memWriteOut: std_logic;
		signal tb_regWriteOut: std_logic;
		signal tb_pcInput: std_logic_vector(7 downto 0) := "00000000";
		signal tb_pcOutput: std_logic_vector(7 downto 0) := "00000000";
		
		signal sim_end : boolean := false;

begin
  -- Instantiation of the mux8x1EightBit component
  tb_singleCycleProc: singleCycleTopLevel
  port map (
  		GClock1 => tb_GClock1,
 		GClock2 => tb_GClock2,
		GReset => tb_GReset,
		valueSelect => tb_valueSelect,
		muxOut => tb_muxOut,
		instructionOut => tb_instructionOut,
		branchOut => tb_branchOut,
		zeroOut => tb_memWriteOut,
		memWriteOut => tb_memWriteOut,
		regWriteOut => tb_regWriteOut,
		
		pcInput => tb_pcInput,
		pcOutput => tb_pcOutput
		
		
  );

  -- Stimulus process
  clock_process : process
begin
while (not sim_end) loop
tb_GClock1 <= '1';
wait for 50ps;
tb_GClock1 <= '0';
wait for 50ps;
end loop;
wait;
end process;

  clock_process2 : process
begin
while (not sim_end) loop
tb_GClock2 <= '1';
wait for 50ps;
tb_GClock2 <= '0';
wait for 50ps;
end loop;
wait;
end process;
  
  
  process
  begin

    tb_GReset <= '0';
    tb_valueSelect <= "001";
  
    wait for 95ps; 
    
    tb_GReset <= '1';

    wait for 100ps;
    
    
    wait for 2400ps; 

  sim_end <= true;
  wait;
  end process;

end architecture behavioral;
