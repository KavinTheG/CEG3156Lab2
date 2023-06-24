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

-- DATE "06/24/2023 11:56:15"

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

ENTITY 	mux7x7 IS
    PORT (
	sel : IN std_logic;
	a_i : IN std_logic_vector(6 DOWNTO 0);
	b_i : IN std_logic_vector(6 DOWNTO 0);
	o_m : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END mux7x7;

-- Design Ports Information
-- o_m[0]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_m[1]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_m[2]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_m[3]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_m[4]	=>  Location: PIN_AC2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_m[5]	=>  Location: PIN_AB2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_m[6]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_i[0]	=>  Location: PIN_U5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a_i[0]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel	=>  Location: PIN_V3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_i[1]	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a_i[1]	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_i[2]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a_i[2]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_i[3]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a_i[3]	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_i[4]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a_i[4]	=>  Location: PIN_V26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_i[5]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a_i[5]	=>  Location: PIN_AD2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_i[6]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a_i[6]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF mux7x7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sel : std_logic;
SIGNAL ww_a_i : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_b_i : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_o_m : std_logic_vector(6 DOWNTO 0);
SIGNAL \o_m[0]~output_o\ : std_logic;
SIGNAL \o_m[1]~output_o\ : std_logic;
SIGNAL \o_m[2]~output_o\ : std_logic;
SIGNAL \o_m[3]~output_o\ : std_logic;
SIGNAL \o_m[4]~output_o\ : std_logic;
SIGNAL \o_m[5]~output_o\ : std_logic;
SIGNAL \o_m[6]~output_o\ : std_logic;
SIGNAL \sel~input_o\ : std_logic;
SIGNAL \a_i[0]~input_o\ : std_logic;
SIGNAL \b_i[0]~input_o\ : std_logic;
SIGNAL \lsb|o_m~0_combout\ : std_logic;
SIGNAL \a_i[1]~input_o\ : std_logic;
SIGNAL \b_i[1]~input_o\ : std_logic;
SIGNAL \bit2|o_m~0_combout\ : std_logic;
SIGNAL \b_i[2]~input_o\ : std_logic;
SIGNAL \a_i[2]~input_o\ : std_logic;
SIGNAL \bit3|o_m~0_combout\ : std_logic;
SIGNAL \b_i[3]~input_o\ : std_logic;
SIGNAL \a_i[3]~input_o\ : std_logic;
SIGNAL \bit4|o_m~0_combout\ : std_logic;
SIGNAL \b_i[4]~input_o\ : std_logic;
SIGNAL \a_i[4]~input_o\ : std_logic;
SIGNAL \bit5|o_m~0_combout\ : std_logic;
SIGNAL \a_i[5]~input_o\ : std_logic;
SIGNAL \b_i[5]~input_o\ : std_logic;
SIGNAL \bit6|o_m~0_combout\ : std_logic;
SIGNAL \b_i[6]~input_o\ : std_logic;
SIGNAL \a_i[6]~input_o\ : std_logic;
SIGNAL \msb|o_m~0_combout\ : std_logic;

BEGIN

ww_sel <= sel;
ww_a_i <= a_i;
ww_b_i <= b_i;
o_m <= ww_o_m;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y30_N2
\o_m[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsb|o_m~0_combout\,
	devoe => ww_devoe,
	o => \o_m[0]~output_o\);

-- Location: IOOBUF_X0_Y24_N9
\o_m[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bit2|o_m~0_combout\,
	devoe => ww_devoe,
	o => \o_m[1]~output_o\);

-- Location: IOOBUF_X0_Y25_N16
\o_m[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bit3|o_m~0_combout\,
	devoe => ww_devoe,
	o => \o_m[2]~output_o\);

-- Location: IOOBUF_X0_Y28_N16
\o_m[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bit4|o_m~0_combout\,
	devoe => ww_devoe,
	o => \o_m[3]~output_o\);

-- Location: IOOBUF_X0_Y24_N23
\o_m[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bit5|o_m~0_combout\,
	devoe => ww_devoe,
	o => \o_m[4]~output_o\);

-- Location: IOOBUF_X0_Y27_N16
\o_m[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bit6|o_m~0_combout\,
	devoe => ww_devoe,
	o => \o_m[5]~output_o\);

-- Location: IOOBUF_X0_Y28_N23
\o_m[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \msb|o_m~0_combout\,
	devoe => ww_devoe,
	o => \o_m[6]~output_o\);

-- Location: IOIBUF_X0_Y29_N22
\sel~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel,
	o => \sel~input_o\);

-- Location: IOIBUF_X33_Y0_N1
\a_i[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a_i(0),
	o => \a_i[0]~input_o\);

-- Location: IOIBUF_X0_Y24_N1
\b_i[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b_i(0),
	o => \b_i[0]~input_o\);

-- Location: LCCOMB_X1_Y24_N0
\lsb|o_m~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lsb|o_m~0_combout\ = (\sel~input_o\ & ((\b_i[0]~input_o\))) # (!\sel~input_o\ & (\a_i[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sel~input_o\,
	datac => \a_i[0]~input_o\,
	datad => \b_i[0]~input_o\,
	combout => \lsb|o_m~0_combout\);

-- Location: IOIBUF_X0_Y23_N15
\a_i[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a_i(1),
	o => \a_i[1]~input_o\);

-- Location: IOIBUF_X0_Y23_N22
\b_i[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b_i(1),
	o => \b_i[1]~input_o\);

-- Location: LCCOMB_X1_Y24_N2
\bit2|o_m~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit2|o_m~0_combout\ = (\sel~input_o\ & ((\b_i[1]~input_o\))) # (!\sel~input_o\ & (\a_i[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a_i[1]~input_o\,
	datac => \sel~input_o\,
	datad => \b_i[1]~input_o\,
	combout => \bit2|o_m~0_combout\);

-- Location: IOIBUF_X0_Y34_N15
\b_i[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b_i(2),
	o => \b_i[2]~input_o\);

-- Location: IOIBUF_X0_Y63_N15
\a_i[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a_i(2),
	o => \a_i[2]~input_o\);

-- Location: LCCOMB_X1_Y24_N20
\bit3|o_m~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit3|o_m~0_combout\ = (\sel~input_o\ & (\b_i[2]~input_o\)) # (!\sel~input_o\ & ((\a_i[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b_i[2]~input_o\,
	datab => \sel~input_o\,
	datad => \a_i[2]~input_o\,
	combout => \bit3|o_m~0_combout\);

-- Location: IOIBUF_X0_Y13_N8
\b_i[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b_i(3),
	o => \b_i[3]~input_o\);

-- Location: IOIBUF_X0_Y67_N15
\a_i[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a_i(3),
	o => \a_i[3]~input_o\);

-- Location: LCCOMB_X1_Y24_N22
\bit4|o_m~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit4|o_m~0_combout\ = (\sel~input_o\ & (\b_i[3]~input_o\)) # (!\sel~input_o\ & ((\a_i[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b_i[3]~input_o\,
	datab => \sel~input_o\,
	datac => \a_i[3]~input_o\,
	combout => \bit4|o_m~0_combout\);

-- Location: IOIBUF_X0_Y33_N22
\b_i[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b_i(4),
	o => \b_i[4]~input_o\);

-- Location: IOIBUF_X115_Y23_N8
\a_i[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a_i(4),
	o => \a_i[4]~input_o\);

-- Location: LCCOMB_X1_Y24_N16
\bit5|o_m~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit5|o_m~0_combout\ = (\sel~input_o\ & (\b_i[4]~input_o\)) # (!\sel~input_o\ & ((\a_i[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b_i[4]~input_o\,
	datac => \sel~input_o\,
	datad => \a_i[4]~input_o\,
	combout => \bit5|o_m~0_combout\);

-- Location: IOIBUF_X0_Y22_N22
\a_i[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a_i(5),
	o => \a_i[5]~input_o\);

-- Location: IOIBUF_X0_Y24_N15
\b_i[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b_i(5),
	o => \b_i[5]~input_o\);

-- Location: LCCOMB_X1_Y24_N26
\bit6|o_m~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit6|o_m~0_combout\ = (\sel~input_o\ & ((\b_i[5]~input_o\))) # (!\sel~input_o\ & (\a_i[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a_i[5]~input_o\,
	datac => \sel~input_o\,
	datad => \b_i[5]~input_o\,
	combout => \bit6|o_m~0_combout\);

-- Location: IOIBUF_X0_Y44_N1
\b_i[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b_i(6),
	o => \b_i[6]~input_o\);

-- Location: IOIBUF_X0_Y26_N15
\a_i[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a_i(6),
	o => \a_i[6]~input_o\);

-- Location: LCCOMB_X1_Y24_N12
\msb|o_m~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \msb|o_m~0_combout\ = (\sel~input_o\ & (\b_i[6]~input_o\)) # (!\sel~input_o\ & ((\a_i[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sel~input_o\,
	datac => \b_i[6]~input_o\,
	datad => \a_i[6]~input_o\,
	combout => \msb|o_m~0_combout\);

ww_o_m(0) <= \o_m[0]~output_o\;

ww_o_m(1) <= \o_m[1]~output_o\;

ww_o_m(2) <= \o_m[2]~output_o\;

ww_o_m(3) <= \o_m[3]~output_o\;

ww_o_m(4) <= \o_m[4]~output_o\;

ww_o_m(5) <= \o_m[5]~output_o\;

ww_o_m(6) <= \o_m[6]~output_o\;
END structure;


