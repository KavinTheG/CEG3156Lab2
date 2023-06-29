library ieee;
use ieee.std_logic_1164.all;

entity tb_threeToEightDecoder is
end entity tb_threeToEightDecoder;

architecture behavioral of tb_threeToEightDecoder is

	signal tb_x : std_logic_vector(2 downto 0);
	signal tb_y : std_logic_vector(7 downto 0);

  -- Component declaration
  component threeToEightDecoder is
port(
	X: in std_logic_vector(2 downto 0);
	Y: out std_logic_vector(7 downto 0)
);
end component;



begin
  -- Instantiation of the mux8x1EightBit component
  tb_threeToEightDecoder: threeToEightDecoder
  port map (
	X => tb_x,
	Y => tb_y
  );

  -- Stimulus process
  process
  begin
	
	tb_x <= "010";
	wait for 100ns;
	assert(tb_y = "00000100")
	report "Test for read data 1 failed" severity error;


	tb_x <= "100";
	wait for 100ns;
	assert(tb_y = "00010000")
	report "Test for read data 2 failed" severity error;

	tb_x <= "101";
	wait for 100ns;
		assert(tb_y = "00100000")
	report "Test for read data 3 failed" severity error;

  end process;

end architecture behavioral;