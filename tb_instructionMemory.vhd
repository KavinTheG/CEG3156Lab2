
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity tb_instructionMemory is
end entity tb_instructionMemory;

architecture behavioral of tb_instructionMemory is
  -- Component declaration
  component instructionMemory IS
	PORT (	
			inclock                 : IN STD_LOGIC;
			outclock 	            : IN  STD_LOGIC;
			readAddress             : IN  STD_LOGIC_VECTOR(7 downto 0);
			instruction_out			: OUT STD_LOGIC_VECTOR(31 downto 0)
			);
END component;

  -- Testbench signals
		signal tb_inclock, tb_outclock: std_logic;
		signal tb_readAddress: std_logic_vector(7 downto 0);
		signal tb_instructionOut: std_logic_vector(31 downto 0);

		signal sim_end : boolean := false;

begin
  -- Instantiation of the mux8x1EightBit component
  tb_instructionMemory: instructionMemory
  port map (
			inclock  => tb_inclock,
			outclock => tb_outclock,
			readAddress => tb_readAddress,
			instruction_out => tb_instructionOut
  );

  -- Stimulus process
  clock_process : process
begin
while (not sim_end) loop
tb_inclock <= '1';
wait for 50ps;
tb_inclock <= '0';
wait for 50ps;
end loop;
wait;
end process;

  clock_process2 : process
begin
while (not sim_end) loop
tb_outclock <= '1';
wait for 50ps;
tb_outclock <= '0';
wait for 50ps;
end loop;
wait;
end process;
  
  
  process
  begin

    tb_readAddress <= "00000000";
    wait for 100ps;
	 tb_readAddress <= "00000100";
	 wait for 100ps;
	 
  sim_end <= true;
  wait;
  end process;

end architecture behavioral;
