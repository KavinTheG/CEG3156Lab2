-- Testbench for mux8x1EightBit

library ieee;
use ieee.std_logic_1164.all;

entity tb_ALUMain is
end entity tb_ALUMain;

architecture behavioral of tb_ALUMain is
  -- Component declaration
  component ALUMain is
	port (
		input1 : IN STD_logic_vector(7 downto 0);
		input2 : in std_logic_vector(7 downto 0);
		sel : in std_logic_vector(2 downto 0);
		
		zero : out std_logic;
		aluResult : out std_logic_vector(7 downto 0)
	);
  end component ALUMain;

  -- Testbench signals
  signal tb_input1, tb_input2 : std_logic_vector(7 downto 0) := (others => '0');
  signal tb_sel : std_logic_vector(2 downto 0) := (others => '0');
  signal tb_zero : std_logic := '0' ;
  signal tb_aluResult : std_logic_vector(7 downto 0) := (others => '0');

begin
  -- Instantiation of the mux8x1EightBit component
  tb_ALUMain: ALUMain
  port map (
    input1 => tb_input1,
    input2 => tb_input2,
    sel => tb_sel,
    zero => tb_zero,
    aluResult => tb_aluResult
  );

  -- Stimulus process
  process
  begin

    -- Add
    tb_input1 <= "01010101";
    tb_input2 <= "10101010";
    tb_sel <= "010";
    wait for 100 ps;
    assert(tb_aluResult = "11111111")
    report "Test for addition failed" severity error;

    -- Subtract
    tb_input1 <= "10011110";
    tb_input2 <= "00001100";
    tb_sel <= "110";
    wait for 100 ps;
    assert(tb_aluResult = "10010010")
    report "Test for subtraction failed" severity error;

    -- and
    tb_input1 <= "10011110";
    tb_input2 <= "00001100";
    tb_sel <= "000";
    wait for 100 ps;
    assert(tb_aluResult = "00001100")
    report "Test for AND failed" severity error;

    -- or
    tb_input1 <= "10011110";
    tb_input2 <= "00001100";
    tb_sel <= "001";
    wait for 100 ps;
    assert(tb_aluResult = "10011110")
    report "Test for OR failed" severity error;

    -- slt
    tb_input1 <= "10011110";
    tb_input2 <= "00001100";
    tb_sel <= "111";
    wait for 100 ps;
    assert(tb_aluResult = "00000000")
    report "Test for SLT failed" severity error;

    -- zero
    tb_input1 <= "10011110";
    tb_input2 <= "10011110";
    tb_sel <= "110";
    wait for 100 ps;
    assert(tb_aluResult = "00000000")
    report "Test for subtraction failed" severity error;

  end process;

end architecture behavioral;