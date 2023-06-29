
-- Testbench for mux8x1EightBit

library ieee;
use ieee.std_logic_1164.all;

entity tb_mux8x1EightBit is
end entity tb_mux8x1EightBit;

architecture behavioral of tb_mux8x1EightBit is
  -- Component declaration
  component mux8x1EightBit is
    port(
      a0, a1, a2, a3, a4, a5, a6, a7: in std_logic_vector(7 downto 0);
      s : in std_logic_vector(2 downto 0);
      o : out std_logic_vector(7 downto 0)
    );
  end component mux8x1EightBit;

  -- Testbench signals
  signal a0_tb, a1_tb, a2_tb, a3_tb, a4_tb, a5_tb, a6_tb, a7_tb : std_logic_vector(7 downto 0) := (others => '0');
  signal s_tb : std_logic_vector(2 downto 0) := (others => '0');
  signal o_tb : std_logic_vector(7 downto 0);

begin
  -- Instantiation of the mux8x1EightBit component
  uut_mux8x1EightBit: mux8x1EightBit
  port map (
    a0 => a0_tb,
    a1 => a1_tb,
    a2 => a2_tb,
    a3 => a3_tb,
    a4 => a4_tb,
    a5 => a5_tb,
    a6 => a6_tb,
    a7 => a7_tb,
    s => s_tb,
    o => o_tb
  );

  -- Stimulus process
  process
  begin

	a0_tb <= "00000001";
	s_tb <= "000";
	wait for 10ns; 

	assert(o_tb = "00000001")
	report "Test for read data 0 failed" severity error;


	a1_tb <= "00000010";
	s_tb <= "001";
	wait for 10ns; 

	assert(o_tb = "000000010")
	report "Test for read data 1 failed" severity error;


	a2_tb <= "00000100";
	s_tb <= "010";
	wait for 10ns; 

	assert(o_tb = "00000100")
	report "Test for read data 2 failed" severity error;


	a3_tb <= "00001000";
	s_tb <= "011";
	wait for 10ns; 

	assert(o_tb = "00001000")
	report "Test for read data 3 failed" severity error;


	a4_tb <= "00010000";
	s_tb <= "100";
	wait for 10ns; 

	assert(o_tb = "00000001")
	report "Test for read data 4 failed" severity error;


	a5_tb <= "00100000";
	s_tb <= "101";
	wait for 10ns; 

	assert(o_tb = "00100000")
	report "Test for read data 5 failed" severity error;


	a6_tb <= "01000000";
	s_tb <= "110";
	wait for 10ns; 

	assert(o_tb = "01000000")
	report "Test for read data 6 failed" severity error;


	a7_tb <= "10000000";
	s_tb <= "111";
	wait for 10ns; 

	assert(o_tb = "10000000")
	report "Test for read data 7 failed" severity error;

    -- End the simulation
    wait;
  end process;

end architecture behavioral;
