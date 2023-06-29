
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
    -- Test case 1: Select input a3 (s = "011")
    a3_tb <= "10101010";
    s_tb <= "011";
    wait for 10 ns;

    -- Test case 2: Select input a7 (s = "111")
    a7_tb <= "11001100";
    s_tb <= "111";
    wait for 10 ns;

    -- Add more test cases as needed

    -- End the simulation
    wait;
  end process;

end architecture behavioral;
