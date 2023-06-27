LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eighBitComparator IS
	PORT(
		A, B			: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		LT			: OUT	STD_LOGIC);
END eighBitComparator;

ARCHITECTURE rtl OF eighBitComparator IS

	signal GTPrev, LTPrev : std_logic_vector(7 downto 0);

	component oneBitComparator IS
		PORT(
			i_GTPrevious, i_LTPrevious	: IN	STD_LOGIC;
			i_Ai, i_Bi			: IN	STD_LOGIC;
			o_GT, o_LT			: OUT	STD_LOGIC);
	END component; 

BEGIN

	comp7 : oneBitComparator port map ('0', '0', A(7), B(7), GTPrev(0), LTPrev(0));
	comp6 : oneBitComparator port map (GTPrev(0), LTPrev(0), A(6), B(6), GTPrev(1), LTPrev(1));
	comp5 : oneBitComparator port map (GTPrev(1), LTPrev(1), A(5), B(5), GTPrev(2), LTPrev(2));
	comp4 : oneBitComparator port map (GTPrev(2), LTPrev(2), A(4), B(4), GTPrev(3), LTPrev(3));
	
	comp3 : oneBitComparator port map (GTPrev(3), LTPrev(3), A(3), B(3), GTPrev(4), LTPrev(4));
	comp2 : oneBitComparator port map (GTPrev(4), LTPrev(4), A(2), B(2), GTPrev(5), LTPrev(5));
	comp1 : oneBitComparator port map (GTPrev(5), LTPrev(5), A(1), B(1), GTPrev(6), LTPrev(6));
	comp0 : oneBitComparator port map (GTPrev(6), LTPrev(6), A(0), B(0), GTPrev(7), LTPrev(7));
	
	LT <= LTPrev(7);

END rtl;