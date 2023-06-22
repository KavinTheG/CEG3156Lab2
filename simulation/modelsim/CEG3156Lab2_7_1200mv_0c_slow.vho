-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "06/21/2023 21:58:46"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	eightBitAdder IS
    PORT (
	A_i : IN std_logic_vector(7 DOWNTO 0);
	B_i : IN std_logic_vector(7 DOWNTO 0);
	C_i : IN std_logic;
	C_o : OUT std_logic;
	sum : OUT std_logic_vector(7 DOWNTO 0)
	);
END eightBitAdder;

-- Design Ports Information
-- C_o	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[0]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[1]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[2]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[3]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[4]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[5]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[6]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[7]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_i[6]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_i[6]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_i[4]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_i[4]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_i[2]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_i[2]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_i[0]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_i[0]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C_i	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_i[1]	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_i[1]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_i[3]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_i[3]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_i[5]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_i[5]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B_i[7]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A_i[7]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF eightBitAdder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A_i : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_B_i : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_C_i : std_logic;
SIGNAL ww_C_o : std_logic;
SIGNAL ww_sum : std_logic_vector(7 DOWNTO 0);
SIGNAL \C_o~output_o\ : std_logic;
SIGNAL \sum[0]~output_o\ : std_logic;
SIGNAL \sum[1]~output_o\ : std_logic;
SIGNAL \sum[2]~output_o\ : std_logic;
SIGNAL \sum[3]~output_o\ : std_logic;
SIGNAL \sum[4]~output_o\ : std_logic;
SIGNAL \sum[5]~output_o\ : std_logic;
SIGNAL \sum[6]~output_o\ : std_logic;
SIGNAL \sum[7]~output_o\ : std_logic;
SIGNAL \B_i[7]~input_o\ : std_logic;
SIGNAL \B_i[6]~input_o\ : std_logic;
SIGNAL \A_i[6]~input_o\ : std_logic;
SIGNAL \Bit7|o_CarryOut~0_combout\ : std_logic;
SIGNAL \A_i[5]~input_o\ : std_logic;
SIGNAL \A_i[4]~input_o\ : std_logic;
SIGNAL \B_i[4]~input_o\ : std_logic;
SIGNAL \Bit5|o_CarryOut~0_combout\ : std_logic;
SIGNAL \B_i[5]~input_o\ : std_logic;
SIGNAL \A_i[3]~input_o\ : std_logic;
SIGNAL \B_i[3]~input_o\ : std_logic;
SIGNAL \A_i[2]~input_o\ : std_logic;
SIGNAL \B_i[2]~input_o\ : std_logic;
SIGNAL \B_i[1]~input_o\ : std_logic;
SIGNAL \A_i[0]~input_o\ : std_logic;
SIGNAL \B_i[0]~input_o\ : std_logic;
SIGNAL \LSB|o_CarryOut~0_combout\ : std_logic;
SIGNAL \A_i[1]~input_o\ : std_logic;
SIGNAL \C_i~input_o\ : std_logic;
SIGNAL \LSB|o_CarryOut~1_combout\ : std_logic;
SIGNAL \Bit2|o_CarryOut~0_combout\ : std_logic;
SIGNAL \Bit3|o_CarryOut~1_combout\ : std_logic;
SIGNAL \Bit3|o_CarryOut~0_combout\ : std_logic;
SIGNAL \Bit4|o_CarryOut~0_combout\ : std_logic;
SIGNAL \Bit5|o_CarryOut~1_combout\ : std_logic;
SIGNAL \Bit6|o_CarryOut~0_combout\ : std_logic;
SIGNAL \Bit7|o_CarryOut~1_combout\ : std_logic;
SIGNAL \A_i[7]~input_o\ : std_logic;
SIGNAL \MSB|o_CarryOut~0_combout\ : std_logic;
SIGNAL \LSB|o_Sum~0_combout\ : std_logic;
SIGNAL \Bit2|o_Sum~combout\ : std_logic;
SIGNAL \Bit3|o_Sum~0_combout\ : std_logic;
SIGNAL \Bit4|o_Sum~combout\ : std_logic;
SIGNAL \Bit5|o_Sum~0_combout\ : std_logic;
SIGNAL \Bit6|o_Sum~combout\ : std_logic;
SIGNAL \Bit7|o_Sum~0_combout\ : std_logic;
SIGNAL \MSB|o_Sum~combout\ : std_logic;

BEGIN

ww_A_i <= A_i;
ww_B_i <= B_i;
ww_C_i <= C_i;
C_o <= ww_C_o;
sum <= ww_sum;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y42_N9
\C_o~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MSB|o_CarryOut~0_combout\,
	devoe => ww_devoe,
	o => \C_o~output_o\);

-- Location: IOOBUF_X0_Y64_N2
\sum[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LSB|o_Sum~0_combout\,
	devoe => ww_devoe,
	o => \sum[0]~output_o\);

-- Location: IOOBUF_X0_Y68_N2
\sum[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bit2|o_Sum~combout\,
	devoe => ww_devoe,
	o => \sum[1]~output_o\);

-- Location: IOOBUF_X0_Y44_N2
\sum[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bit3|o_Sum~0_combout\,
	devoe => ww_devoe,
	o => \sum[2]~output_o\);

-- Location: IOOBUF_X0_Y34_N16
\sum[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bit4|o_Sum~combout\,
	devoe => ww_devoe,
	o => \sum[3]~output_o\);

-- Location: IOOBUF_X0_Y44_N9
\sum[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bit5|o_Sum~0_combout\,
	devoe => ww_devoe,
	o => \sum[4]~output_o\);

-- Location: IOOBUF_X0_Y47_N2
\sum[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bit6|o_Sum~combout\,
	devoe => ww_devoe,
	o => \sum[5]~output_o\);

-- Location: IOOBUF_X0_Y35_N2
\sum[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bit7|o_Sum~0_combout\,
	devoe => ww_devoe,
	o => \sum[6]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\sum[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MSB|o_Sum~combout\,
	devoe => ww_devoe,
	o => \sum[7]~output_o\);

-- Location: IOIBUF_X0_Y44_N22
\B_i[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B_i(7),
	o => \B_i[7]~input_o\);

-- Location: IOIBUF_X0_Y35_N8
\B_i[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B_i(6),
	o => \B_i[6]~input_o\);

-- Location: IOIBUF_X0_Y45_N22
\A_i[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_i(6),
	o => \A_i[6]~input_o\);

-- Location: LCCOMB_X1_Y42_N8
\Bit7|o_CarryOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit7|o_CarryOut~0_combout\ = (\B_i[6]~input_o\ & \A_i[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B_i[6]~input_o\,
	datad => \A_i[6]~input_o\,
	combout => \Bit7|o_CarryOut~0_combout\);

-- Location: IOIBUF_X0_Y45_N15
\A_i[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_i(5),
	o => \A_i[5]~input_o\);

-- Location: IOIBUF_X0_Y34_N1
\A_i[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_i(4),
	o => \A_i[4]~input_o\);

-- Location: IOIBUF_X0_Y35_N15
\B_i[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B_i(4),
	o => \B_i[4]~input_o\);

-- Location: LCCOMB_X1_Y42_N18
\Bit5|o_CarryOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit5|o_CarryOut~0_combout\ = (\A_i[4]~input_o\ & \B_i[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A_i[4]~input_o\,
	datac => \B_i[4]~input_o\,
	combout => \Bit5|o_CarryOut~0_combout\);

-- Location: IOIBUF_X0_Y44_N15
\B_i[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B_i(5),
	o => \B_i[5]~input_o\);

-- Location: IOIBUF_X0_Y43_N15
\A_i[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_i(3),
	o => \A_i[3]~input_o\);

-- Location: IOIBUF_X0_Y47_N15
\B_i[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B_i(3),
	o => \B_i[3]~input_o\);

-- Location: IOIBUF_X0_Y42_N1
\A_i[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_i(2),
	o => \A_i[2]~input_o\);

-- Location: IOIBUF_X0_Y46_N15
\B_i[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B_i(2),
	o => \B_i[2]~input_o\);

-- Location: IOIBUF_X0_Y67_N15
\B_i[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B_i(1),
	o => \B_i[1]~input_o\);

-- Location: IOIBUF_X0_Y66_N15
\A_i[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_i(0),
	o => \A_i[0]~input_o\);

-- Location: IOIBUF_X0_Y67_N22
\B_i[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B_i(0),
	o => \B_i[0]~input_o\);

-- Location: LCCOMB_X1_Y67_N24
\LSB|o_CarryOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LSB|o_CarryOut~0_combout\ = (\A_i[0]~input_o\ & \B_i[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A_i[0]~input_o\,
	datad => \B_i[0]~input_o\,
	combout => \LSB|o_CarryOut~0_combout\);

-- Location: IOIBUF_X0_Y68_N15
\A_i[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_i(1),
	o => \A_i[1]~input_o\);

-- Location: IOIBUF_X0_Y66_N22
\C_i~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C_i,
	o => \C_i~input_o\);

-- Location: LCCOMB_X1_Y67_N2
\LSB|o_CarryOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LSB|o_CarryOut~1_combout\ = (\C_i~input_o\ & ((\A_i[0]~input_o\) # (\B_i[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_i~input_o\,
	datac => \A_i[0]~input_o\,
	datad => \B_i[0]~input_o\,
	combout => \LSB|o_CarryOut~1_combout\);

-- Location: LCCOMB_X1_Y67_N20
\Bit2|o_CarryOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit2|o_CarryOut~0_combout\ = (\B_i[1]~input_o\ & ((\LSB|o_CarryOut~0_combout\) # ((\A_i[1]~input_o\) # (\LSB|o_CarryOut~1_combout\)))) # (!\B_i[1]~input_o\ & (\A_i[1]~input_o\ & ((\LSB|o_CarryOut~0_combout\) # (\LSB|o_CarryOut~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B_i[1]~input_o\,
	datab => \LSB|o_CarryOut~0_combout\,
	datac => \A_i[1]~input_o\,
	datad => \LSB|o_CarryOut~1_combout\,
	combout => \Bit2|o_CarryOut~0_combout\);

-- Location: LCCOMB_X1_Y42_N14
\Bit3|o_CarryOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit3|o_CarryOut~1_combout\ = (\Bit2|o_CarryOut~0_combout\ & ((\A_i[2]~input_o\) # (\B_i[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A_i[2]~input_o\,
	datab => \B_i[2]~input_o\,
	datac => \Bit2|o_CarryOut~0_combout\,
	combout => \Bit3|o_CarryOut~1_combout\);

-- Location: LCCOMB_X1_Y42_N20
\Bit3|o_CarryOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit3|o_CarryOut~0_combout\ = (\A_i[2]~input_o\ & \B_i[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A_i[2]~input_o\,
	datac => \B_i[2]~input_o\,
	combout => \Bit3|o_CarryOut~0_combout\);

-- Location: LCCOMB_X1_Y42_N24
\Bit4|o_CarryOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit4|o_CarryOut~0_combout\ = (\A_i[3]~input_o\ & ((\B_i[3]~input_o\) # ((\Bit3|o_CarryOut~1_combout\) # (\Bit3|o_CarryOut~0_combout\)))) # (!\A_i[3]~input_o\ & (\B_i[3]~input_o\ & ((\Bit3|o_CarryOut~1_combout\) # (\Bit3|o_CarryOut~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A_i[3]~input_o\,
	datab => \B_i[3]~input_o\,
	datac => \Bit3|o_CarryOut~1_combout\,
	datad => \Bit3|o_CarryOut~0_combout\,
	combout => \Bit4|o_CarryOut~0_combout\);

-- Location: LCCOMB_X1_Y42_N2
\Bit5|o_CarryOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit5|o_CarryOut~1_combout\ = (\Bit4|o_CarryOut~0_combout\ & ((\A_i[4]~input_o\) # (\B_i[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A_i[4]~input_o\,
	datac => \B_i[4]~input_o\,
	datad => \Bit4|o_CarryOut~0_combout\,
	combout => \Bit5|o_CarryOut~1_combout\);

-- Location: LCCOMB_X1_Y42_N12
\Bit6|o_CarryOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit6|o_CarryOut~0_combout\ = (\A_i[5]~input_o\ & ((\Bit5|o_CarryOut~0_combout\) # ((\B_i[5]~input_o\) # (\Bit5|o_CarryOut~1_combout\)))) # (!\A_i[5]~input_o\ & (\B_i[5]~input_o\ & ((\Bit5|o_CarryOut~0_combout\) # (\Bit5|o_CarryOut~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A_i[5]~input_o\,
	datab => \Bit5|o_CarryOut~0_combout\,
	datac => \B_i[5]~input_o\,
	datad => \Bit5|o_CarryOut~1_combout\,
	combout => \Bit6|o_CarryOut~0_combout\);

-- Location: LCCOMB_X1_Y42_N22
\Bit7|o_CarryOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit7|o_CarryOut~1_combout\ = (\Bit6|o_CarryOut~0_combout\ & ((\A_i[6]~input_o\) # (\B_i[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A_i[6]~input_o\,
	datac => \B_i[6]~input_o\,
	datad => \Bit6|o_CarryOut~0_combout\,
	combout => \Bit7|o_CarryOut~1_combout\);

-- Location: IOIBUF_X0_Y46_N22
\A_i[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A_i(7),
	o => \A_i[7]~input_o\);

-- Location: LCCOMB_X1_Y42_N16
\MSB|o_CarryOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MSB|o_CarryOut~0_combout\ = (\B_i[7]~input_o\ & ((\Bit7|o_CarryOut~0_combout\) # ((\Bit7|o_CarryOut~1_combout\) # (\A_i[7]~input_o\)))) # (!\B_i[7]~input_o\ & (\A_i[7]~input_o\ & ((\Bit7|o_CarryOut~0_combout\) # (\Bit7|o_CarryOut~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B_i[7]~input_o\,
	datab => \Bit7|o_CarryOut~0_combout\,
	datac => \Bit7|o_CarryOut~1_combout\,
	datad => \A_i[7]~input_o\,
	combout => \MSB|o_CarryOut~0_combout\);

-- Location: LCCOMB_X1_Y67_N22
\LSB|o_Sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LSB|o_Sum~0_combout\ = \C_i~input_o\ $ (\A_i[0]~input_o\ $ (\B_i[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_i~input_o\,
	datac => \A_i[0]~input_o\,
	datad => \B_i[0]~input_o\,
	combout => \LSB|o_Sum~0_combout\);

-- Location: LCCOMB_X1_Y67_N0
\Bit2|o_Sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit2|o_Sum~combout\ = \B_i[1]~input_o\ $ (\A_i[1]~input_o\ $ (((\LSB|o_CarryOut~0_combout\) # (\LSB|o_CarryOut~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B_i[1]~input_o\,
	datab => \LSB|o_CarryOut~0_combout\,
	datac => \A_i[1]~input_o\,
	datad => \LSB|o_CarryOut~1_combout\,
	combout => \Bit2|o_Sum~combout\);

-- Location: LCCOMB_X1_Y42_N10
\Bit3|o_Sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit3|o_Sum~0_combout\ = \A_i[2]~input_o\ $ (\B_i[2]~input_o\ $ (\Bit2|o_CarryOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A_i[2]~input_o\,
	datab => \B_i[2]~input_o\,
	datac => \Bit2|o_CarryOut~0_combout\,
	combout => \Bit3|o_Sum~0_combout\);

-- Location: LCCOMB_X1_Y42_N28
\Bit4|o_Sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit4|o_Sum~combout\ = \A_i[3]~input_o\ $ (\B_i[3]~input_o\ $ (((\Bit3|o_CarryOut~1_combout\) # (\Bit3|o_CarryOut~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A_i[3]~input_o\,
	datab => \B_i[3]~input_o\,
	datac => \Bit3|o_CarryOut~1_combout\,
	datad => \Bit3|o_CarryOut~0_combout\,
	combout => \Bit4|o_Sum~combout\);

-- Location: LCCOMB_X1_Y42_N6
\Bit5|o_Sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit5|o_Sum~0_combout\ = \A_i[4]~input_o\ $ (\B_i[4]~input_o\ $ (\Bit4|o_CarryOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A_i[4]~input_o\,
	datac => \B_i[4]~input_o\,
	datad => \Bit4|o_CarryOut~0_combout\,
	combout => \Bit5|o_Sum~0_combout\);

-- Location: LCCOMB_X1_Y42_N0
\Bit6|o_Sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit6|o_Sum~combout\ = \A_i[5]~input_o\ $ (\B_i[5]~input_o\ $ (((\Bit5|o_CarryOut~0_combout\) # (\Bit5|o_CarryOut~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A_i[5]~input_o\,
	datab => \Bit5|o_CarryOut~0_combout\,
	datac => \B_i[5]~input_o\,
	datad => \Bit5|o_CarryOut~1_combout\,
	combout => \Bit6|o_Sum~combout\);

-- Location: LCCOMB_X1_Y42_N26
\Bit7|o_Sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bit7|o_Sum~0_combout\ = \A_i[6]~input_o\ $ (\B_i[6]~input_o\ $ (\Bit6|o_CarryOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A_i[6]~input_o\,
	datac => \B_i[6]~input_o\,
	datad => \Bit6|o_CarryOut~0_combout\,
	combout => \Bit7|o_Sum~0_combout\);

-- Location: LCCOMB_X1_Y42_N4
\MSB|o_Sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \MSB|o_Sum~combout\ = \B_i[7]~input_o\ $ (\A_i[7]~input_o\ $ (((\Bit7|o_CarryOut~0_combout\) # (\Bit7|o_CarryOut~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B_i[7]~input_o\,
	datab => \Bit7|o_CarryOut~0_combout\,
	datac => \Bit7|o_CarryOut~1_combout\,
	datad => \A_i[7]~input_o\,
	combout => \MSB|o_Sum~combout\);

ww_C_o <= \C_o~output_o\;

ww_sum(0) <= \sum[0]~output_o\;

ww_sum(1) <= \sum[1]~output_o\;

ww_sum(2) <= \sum[2]~output_o\;

ww_sum(3) <= \sum[3]~output_o\;

ww_sum(4) <= \sum[4]~output_o\;

ww_sum(5) <= \sum[5]~output_o\;

ww_sum(6) <= \sum[6]~output_o\;

ww_sum(7) <= \sum[7]~output_o\;
END structure;


