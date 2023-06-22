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

-- DATE "06/22/2023 12:29:30"

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

ENTITY 	controlLogicUnit IS
    PORT (
	op : IN std_logic_vector(5 DOWNTO 0);
	regDst : OUT std_logic;
	aluSrc : OUT std_logic;
	memToReg : OUT std_logic;
	regWrite : OUT std_logic;
	memRead : OUT std_logic;
	memWrite : OUT std_logic;
	branch : OUT std_logic;
	jump : OUT std_logic;
	aluOp1 : OUT std_logic;
	aluOp0 : OUT std_logic
	);
END controlLogicUnit;

-- Design Ports Information
-- regDst	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aluSrc	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- memToReg	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regWrite	=>  Location: PIN_AD3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- memRead	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- memWrite	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branch	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- jump	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aluOp1	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aluOp0	=>  Location: PIN_U5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[2]	=>  Location: PIN_AD1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[1]	=>  Location: PIN_AD2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[0]	=>  Location: PIN_AC2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[3]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[4]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[5]	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF controlLogicUnit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_op : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_regDst : std_logic;
SIGNAL ww_aluSrc : std_logic;
SIGNAL ww_memToReg : std_logic;
SIGNAL ww_regWrite : std_logic;
SIGNAL ww_memRead : std_logic;
SIGNAL ww_memWrite : std_logic;
SIGNAL ww_branch : std_logic;
SIGNAL ww_jump : std_logic;
SIGNAL ww_aluOp1 : std_logic;
SIGNAL ww_aluOp0 : std_logic;
SIGNAL \regDst~output_o\ : std_logic;
SIGNAL \aluSrc~output_o\ : std_logic;
SIGNAL \memToReg~output_o\ : std_logic;
SIGNAL \regWrite~output_o\ : std_logic;
SIGNAL \memRead~output_o\ : std_logic;
SIGNAL \memWrite~output_o\ : std_logic;
SIGNAL \branch~output_o\ : std_logic;
SIGNAL \jump~output_o\ : std_logic;
SIGNAL \aluOp1~output_o\ : std_logic;
SIGNAL \aluOp0~output_o\ : std_logic;
SIGNAL \op[1]~input_o\ : std_logic;
SIGNAL \op[2]~input_o\ : std_logic;
SIGNAL \op[0]~input_o\ : std_logic;
SIGNAL \op[3]~input_o\ : std_logic;
SIGNAL \op[5]~input_o\ : std_logic;
SIGNAL \op[4]~input_o\ : std_logic;
SIGNAL \beq~0_combout\ : std_logic;
SIGNAL \rFormat~0_combout\ : std_logic;
SIGNAL \sw~0_combout\ : std_logic;
SIGNAL \sw~1_combout\ : std_logic;
SIGNAL \int_regWrite~0_combout\ : std_logic;
SIGNAL \sw~2_combout\ : std_logic;
SIGNAL \beq~1_combout\ : std_logic;
SIGNAL \jmp~0_combout\ : std_logic;
SIGNAL \ALT_INV_rFormat~0_combout\ : std_logic;

BEGIN

ww_op <= op;
regDst <= ww_regDst;
aluSrc <= ww_aluSrc;
memToReg <= ww_memToReg;
regWrite <= ww_regWrite;
memRead <= ww_memRead;
memWrite <= ww_memWrite;
branch <= ww_branch;
jump <= ww_jump;
aluOp1 <= ww_aluOp1;
aluOp0 <= ww_aluOp0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_rFormat~0_combout\ <= NOT \rFormat~0_combout\;

-- Location: IOOBUF_X0_Y19_N2
\regDst~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rFormat~0_combout\,
	devoe => ww_devoe,
	o => \regDst~output_o\);

-- Location: IOOBUF_X0_Y25_N16
\aluSrc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sw~1_combout\,
	devoe => ww_devoe,
	o => \aluSrc~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\memToReg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sw~1_combout\,
	devoe => ww_devoe,
	o => \memToReg~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\regWrite~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \int_regWrite~0_combout\,
	devoe => ww_devoe,
	o => \regWrite~output_o\);

-- Location: IOOBUF_X0_Y25_N23
\memRead~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sw~1_combout\,
	devoe => ww_devoe,
	o => \memRead~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\memWrite~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sw~2_combout\,
	devoe => ww_devoe,
	o => \memWrite~output_o\);

-- Location: IOOBUF_X0_Y20_N16
\branch~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \beq~1_combout\,
	devoe => ww_devoe,
	o => \branch~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\jump~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \jmp~0_combout\,
	devoe => ww_devoe,
	o => \jump~output_o\);

-- Location: IOOBUF_X0_Y19_N9
\aluOp1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rFormat~0_combout\,
	devoe => ww_devoe,
	o => \aluOp1~output_o\);

-- Location: IOOBUF_X0_Y24_N2
\aluOp0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \beq~1_combout\,
	devoe => ww_devoe,
	o => \aluOp0~output_o\);

-- Location: IOIBUF_X0_Y22_N22
\op[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(1),
	o => \op[1]~input_o\);

-- Location: IOIBUF_X0_Y21_N15
\op[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(2),
	o => \op[2]~input_o\);

-- Location: IOIBUF_X0_Y24_N22
\op[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(0),
	o => \op[0]~input_o\);

-- Location: IOIBUF_X0_Y24_N8
\op[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(3),
	o => \op[3]~input_o\);

-- Location: IOIBUF_X0_Y23_N22
\op[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(5),
	o => \op[5]~input_o\);

-- Location: IOIBUF_X0_Y26_N15
\op[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(4),
	o => \op[4]~input_o\);

-- Location: LCCOMB_X1_Y24_N0
\beq~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \beq~0_combout\ = (!\op[0]~input_o\ & (!\op[3]~input_o\ & (!\op[5]~input_o\ & !\op[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \op[3]~input_o\,
	datac => \op[5]~input_o\,
	datad => \op[4]~input_o\,
	combout => \beq~0_combout\);

-- Location: LCCOMB_X1_Y24_N26
\rFormat~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rFormat~0_combout\ = (\op[1]~input_o\) # ((\op[2]~input_o\) # (!\beq~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \op[1]~input_o\,
	datac => \op[2]~input_o\,
	datad => \beq~0_combout\,
	combout => \rFormat~0_combout\);

-- Location: LCCOMB_X1_Y24_N12
\sw~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sw~0_combout\ = (\op[0]~input_o\ & (\op[1]~input_o\ & (!\op[2]~input_o\ & !\op[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \op[1]~input_o\,
	datac => \op[2]~input_o\,
	datad => \op[4]~input_o\,
	combout => \sw~0_combout\);

-- Location: LCCOMB_X1_Y24_N30
\sw~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sw~1_combout\ = (\op[5]~input_o\ & \sw~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[5]~input_o\,
	datad => \sw~0_combout\,
	combout => \sw~1_combout\);

-- Location: LCCOMB_X1_Y24_N8
\int_regWrite~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_regWrite~0_combout\ = (\sw~1_combout\) # ((!\op[1]~input_o\ & (!\op[2]~input_o\ & \beq~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw~1_combout\,
	datab => \op[1]~input_o\,
	datac => \op[2]~input_o\,
	datad => \beq~0_combout\,
	combout => \int_regWrite~0_combout\);

-- Location: LCCOMB_X1_Y24_N18
\sw~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sw~2_combout\ = (\op[5]~input_o\ & (\op[3]~input_o\ & \sw~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[5]~input_o\,
	datab => \op[3]~input_o\,
	datad => \sw~0_combout\,
	combout => \sw~2_combout\);

-- Location: LCCOMB_X1_Y24_N28
\beq~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \beq~1_combout\ = (!\op[1]~input_o\ & (\op[2]~input_o\ & \beq~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \op[1]~input_o\,
	datac => \op[2]~input_o\,
	datad => \beq~0_combout\,
	combout => \beq~1_combout\);

-- Location: LCCOMB_X1_Y24_N14
\jmp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \jmp~0_combout\ = (\op[1]~input_o\ & (!\op[2]~input_o\ & \beq~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \op[1]~input_o\,
	datac => \op[2]~input_o\,
	datad => \beq~0_combout\,
	combout => \jmp~0_combout\);

ww_regDst <= \regDst~output_o\;

ww_aluSrc <= \aluSrc~output_o\;

ww_memToReg <= \memToReg~output_o\;

ww_regWrite <= \regWrite~output_o\;

ww_memRead <= \memRead~output_o\;

ww_memWrite <= \memWrite~output_o\;

ww_branch <= \branch~output_o\;

ww_jump <= \jump~output_o\;

ww_aluOp1 <= \aluOp1~output_o\;

ww_aluOp0 <= \aluOp0~output_o\;
END structure;


