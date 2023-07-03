LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--LIBRARY altera_mf;
LIBRARY lpm;
USE lpm.lpm_components.ALL;

ENTITY dataMemory IS
	PORT (	
			inclock                 : IN  STD_LOGIC;
			outclock 	            : IN  STD_LOGIC;
			memWrite						: IN  STD_LOGIC;
			memRead						: IN  STD_LOGIC;
			address                 : IN  STD_LOGIC_VECTOR(7 downto 0);
			writeData               : IN  STD_LOGIC_VECTOR(7 downto 0);
			readData			         : OUT STD_LOGIC_VECTOR(7 downto 0)
			);
END dataMemory;

architecture structural of dataMemory is

--Component declaration from intel.com
component LPM_RAM_DQ

        generic (
						LPM_WIDTH : natural;    -- MUST be greater than 0
                  LPM_WIDTHAD : natural;    -- MUST be greater than 0
                  LPM_NUMWORDS : natural := 0;
                  LPM_INDATA : string := "REGISTERED";
                  LPM_ADDRESS_CONTROL: string := "REGISTERED";
                  LPM_OUTDATA : string := "REGISTERED";
                  LPM_FILE : string := "UNUSED";
                  LPM_TYPE : string := L_RAM_DQ;
                  USE_EAB  : string := "ON";
                  INTENDED_DEVICE_FAMILY  : string := "UNUSED";
                  LPM_HINT : string := "UNUSED"
						);

         port (
					   DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
                  ADDRESS : in std_logic_vector(LPM_WIDTHAD-1 downto 0);
                  INCLOCK : in std_logic := '0';
                  OUTCLOCK : in std_logic := '0';
                  WE : in std_logic;
                  Q : out std_logic_vector(LPM_WIDTH-1 downto 0)
						);

end component;

component mux8x8 is

		port (
				sel : in std_logic;
				a_i, b_i : in std_logic_vector(7 downto 0);
				o_m : out std_logic_vector(7 downto 0)
			);
			
end component;

signal dataOutput, muxOutput : STD_LOGIC_VECTOR(7 downto 0);

begin 

dataMem: lpm_ram_dq
	GENERIC MAP (
				LPM_WIDTH => 8,
				LPM_WIDTHAD => 8,
				LPM_NUMWORDS => 256,
				LPM_FILE => "dataMemory.mif")
				
	PORT MAP (	
				DATA => writeData,
		      ADDRESS => address,
				INCLOCK => inclock,
				OUTCLOCK => outclock,
				WE => memWrite,				
            Q => dataOutput
				);
				
outputMuxSel: mux8x8 PORT MAP(sel => memRead, a_i => "00000000", b_i => dataOutput, o_m => muxOutput);

readData <= muxOutput;

end structural;
	