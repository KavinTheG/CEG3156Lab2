library ieee;
use ieee.std_logic_1164.all;

entity mux8x1EightBit is
port(
		a0, a1, a2, a3, a4, a5, a6, a7: in std_logic_vector(7 downto 0);
		s : in std_logic_vector(2 downto 0);
		o : out std_logic_vector(7 downto 0)
		);
end entity;
		
architecture Structural of mux8x1EightBit is
	
begin
	
	o(0) <=  ( a0(0) and ( not(s(0)) and not(s(1)) and not(s(2)) ) ) or 
				( a1(0) and ( not(s(0)) and not(s(1)) and s(2) ) ) or 
				( a2(0) and ( not(s(0)) and s(1) and not(s(2)) ) ) or 
				( a3(0) and ( not(s(0)) and s(1) and s(2) ) ) or 
				( a4(0) and ( s(0) and not(s(1)) and not(s(2)) ) ) or 
				( a5(0) and ( s(0) and not(s(1)) and s(2) ) ) or 
				( a6(0) and ( s(0) and s(1) and not(s(2)) ) ) or 
				( a7(0) and ( s(0) and s(1) and s(2) ) ) ;
				
	o(1) <=  ( a0(1) and ( not(s(0)) and not(s(1)) and not(s(2)) ) ) or 
				( a1(1) and ( not(s(0)) and not(s(1)) and s(2) ) ) or 
				( a2(1) and ( not(s(0)) and s(1) and not(s(2)) ) ) or 
				( a3(1) and ( not(s(0)) and s(1) and s(2) ) ) or 
				( a4(1) and ( s(0) and not(s(1)) and not(s(2)) ) ) or 
				( a5(1) and ( s(0) and not(s(1)) and s(2) ) ) or 
				( a6(1) and ( s(0) and s(1) and not(s(2)) ) ) or 
				( a7(1) and ( s(0) and s(1) and s(2) ) ) ;

	o(2) <=  ( a0(2) and ( not(s(0)) and not(s(1)) and not(s(2)) ) ) or 
				( a1(2) and ( not(s(0)) and not(s(1)) and s(2) ) ) or 
				( a2(2) and ( not(s(0)) and s(1) and not(s(2)) ) ) or 
				( a3(2) and ( not(s(0)) and s(1) and s(2) ) ) or 
				( a4(2) and ( s(0) and not(s(1)) and not(s(2)) ) ) or 
				( a5(2) and ( s(0) and not(s(1)) and s(2) ) ) or 
				( a6(2) and ( s(0) and s(1) and not(s(2)) ) ) or 
				( a7(2) and ( s(0) and s(1) and s(2) ) ) ;
				
	o(3) <=  ( a0(3) and ( not(s(0)) and not(s(1)) and not(s(2)) ) ) or 
				( a1(3) and ( not(s(0)) and not(s(1)) and s(2) ) ) or 
				( a2(3) and ( not(s(0)) and s(1) and not(s(2)) ) ) or 
				( a3(3) and ( not(s(0)) and s(1) and s(2) ) ) or 
				( a4(3) and ( s(0) and not(s(1)) and not(s(2)) ) ) or 
				( a5(3) and ( s(0) and not(s(1)) and s(2) ) ) or 
				( a6(3) and ( s(0) and s(1) and not(s(2)) ) ) or 
				( a7(3) and ( s(0) and s(1) and s(2) ) ) ;
				
	o(4) <=  ( a0(4) and ( not(s(0)) and not(s(1)) and not(s(2)) ) ) or 
				( a1(4) and ( not(s(0)) and not(s(1)) and s(2) ) ) or 
				( a2(4) and ( not(s(0)) and s(1) and not(s(2)) ) ) or 
				( a3(4) and ( not(s(0)) and s(1) and s(2) ) ) or 
				( a4(4) and ( s(0) and not(s(1)) and not(s(2)) ) ) or 
				( a5(4) and ( s(0) and not(s(1)) and s(2) ) ) or 
				( a6(4) and ( s(0) and s(1) and not(s(2)) ) ) or 
				( a7(4) and ( s(0) and s(1) and s(2) ) ) ;
				
	o(5) <=  ( a0(5) and ( not(s(0)) and not(s(1)) and not(s(2)) ) ) or 
				( a1(5) and ( not(s(0)) and not(s(1)) and s(2) ) ) or 
				( a2(5) and ( not(s(0)) and s(1) and not(s(2)) ) ) or 
				( a3(5) and ( not(s(0)) and s(1) and s(2) ) ) or 
				( a4(5) and ( s(0) and not(s(1)) and not(s(2)) ) ) or 
				( a5(5) and ( s(0) and not(s(1)) and s(2) ) ) or 
				( a6(5) and ( s(0) and s(1) and not(s(2)) ) ) or 
				( a7(5) and ( s(0) and s(1) and s(2) ) ) ;

	o(6) <=  ( a0(6) and ( not(s(0)) and not(s(1)) and not(s(2)) ) ) or 
				( a1(6) and ( not(s(0)) and not(s(1)) and s(2) ) ) or 
				( a2(6) and ( not(s(0)) and s(1) and not(s(2)) ) ) or 
				( a3(6) and ( not(s(0)) and s(1) and s(2) ) ) or 
				( a4(6) and ( s(0) and not(s(1)) and not(s(2)) ) ) or 
				( a5(6) and ( s(0) and not(s(1)) and s(2) ) ) or 
				( a6(6) and ( s(0) and s(1) and not(s(2)) ) ) or 
				( a7(6) and ( s(0) and s(1) and s(2) ) ) ;
				
	o(7) <=  ( a0(7) and ( not(s(0)) and not(s(1)) and not(s(2)) ) ) or 
				( a1(7) and ( not(s(0)) and not(s(1)) and s(2) ) ) or 
				( a2(7) and ( not(s(0)) and s(1) and not(s(2)) ) ) or 
				( a3(7) and ( not(s(0)) and s(1) and s(2) ) ) or 
				( a4(7) and ( s(0) and not(s(1)) and not(s(2)) ) ) or 
				( a5(7) and ( s(0) and not(s(1)) and s(2) ) ) or 
				( a6(7) and ( s(0) and s(1) and not(s(2)) ) ) or 
				( a7(7) and ( s(0) and s(1) and s(2) ) ) ;
	
end Structural;