
library ieee;
use ieee.std_logic_1164.all;

entity signExtendUnit is
	port (
	sign_input : in std_logic_vector(15 downto 0);
	sign_output : out std_logic_vector(31 downto 0)
	);
end entity;

architecture rtl of signExtendUnit is
begin

sign_output(31 downto 16) <= ( others=> sign_input(15) );
sign_output(15 downto 0) <= sign_input;

end rtl;