-- Copyright (C) 1991-2011 Altera Corporation
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
-- PROGRAM "Quartus II"
-- VERSION "Version 11.0 Build 157 04/27/2011 SJ Web Edition"

-- DATE "06/20/2015 15:39:12"

-- 
-- Device: Altera EP2C8F256C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	M3 IS
    PORT (
	lcd_e : OUT std_logic;
	lcd_rs : OUT std_logic;
	lcd_rw : OUT std_logic;
	piezo : OUT std_logic;
	SRAM_nOE : OUT std_logic;
	SRAM_nWE : OUT std_logic;
	SRAM_nCS : OUT std_logic;
	dot_d : OUT std_logic_vector(6 DOWNTO 0);
	dot_scan : OUT std_logic_vector(9 DOWNTO 0);
	key_scan : OUT std_logic_vector(3 DOWNTO 0);
	lcd_data : OUT std_logic_vector(7 DOWNTO 0);
	led : OUT std_logic_vector(7 DOWNTO 0);
	seg_com : OUT std_logic_vector(5 DOWNTO 0);
	seg_disp : OUT std_logic_vector(7 DOWNTO 0);
	SRAM_ADDR : OUT std_logic_vector(17 DOWNTO 0);
	SRAM_DATA : OUT std_logic_vector(15 DOWNTO 0);
	FPGA_CLK : IN std_logic;
	nFPGA_RESET : IN std_logic;
	XnRESET : IN std_logic;
	XM0OEN : IN std_logic;
	XM0WEN : IN std_logic;
	CPLD_0 : IN std_logic;
	XM0_DATA : INOUT std_logic_vector(15 DOWNTO 0);
	XM0_ADDR : IN std_logic_vector(20 DOWNTO 0);
	M_nRESET : IN std_logic;
	XCLKOUT : IN std_logic;
	CPLD_8 : IN std_logic;
	CPLD_1 : IN std_logic;
	XEINT8 : IN std_logic;
	STEP_A : IN std_logic;
	STEP_nA : IN std_logic;
	STEP_B : IN std_logic;
	STEP_nB : IN std_logic;
	GPJ4_0 : IN std_logic;
	GPJ4_1 : IN std_logic;
	GPJ4_2 : IN std_logic;
	GPJ4_3 : IN std_logic;
	GPJ4_4 : IN std_logic;
	GPJ1_5 : IN std_logic;
	SPI_DOUT : IN std_logic;
	SPI_DIN : IN std_logic;
	SPI_SCLK : IN std_logic;
	SPI_DA_CS : IN std_logic;
	SPI_AD_CS : IN std_logic;
	dip_sw : IN std_logic_vector(15 DOWNTO 0);
	key_data : IN std_logic_vector(3 DOWNTO 0);
	sel_button : IN std_logic_vector(3 DOWNTO 0)
	);
END M3;

-- Design Ports Information
-- XM0_DATA[15]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[14]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[13]	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[12]	=>  Location: PIN_K13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[11]	=>  Location: PIN_K15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[10]	=>  Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[9]	=>  Location: PIN_L12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[8]	=>  Location: PIN_L14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[7]	=>  Location: PIN_L15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[6]	=>  Location: PIN_L16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[5]	=>  Location: PIN_M12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[4]	=>  Location: PIN_M14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[3]	=>  Location: PIN_M15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[2]	=>  Location: PIN_M16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[1]	=>  Location: PIN_N12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- XM0_DATA[0]	=>  Location: PIN_N13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_e	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- nFPGA_RESET	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[20]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- lcd_rs	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_rw	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- piezo	=>  Location: PIN_N7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_nOE	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_nWE	=>  Location: PIN_P15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_nCS	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_d[6]	=>  Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_d[5]	=>  Location: PIN_P5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_d[4]	=>  Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_d[3]	=>  Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_d[2]	=>  Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_d[1]	=>  Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_d[0]	=>  Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[9]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[8]	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[7]	=>  Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[6]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[5]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[4]	=>  Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[3]	=>  Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[2]	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[1]	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dot_scan[0]	=>  Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- key_scan[3]	=>  Location: PIN_M11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- key_scan[2]	=>  Location: PIN_N11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- key_scan[1]	=>  Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- key_scan[0]	=>  Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[7]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[6]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[5]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[4]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[3]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[2]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[1]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[0]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[7]	=>  Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[6]	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[5]	=>  Location: PIN_E6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[4]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[3]	=>  Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[2]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[1]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[0]	=>  Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_com[5]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_com[4]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_com[3]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_com[2]	=>  Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_com[1]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_com[0]	=>  Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_disp[7]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_disp[6]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_disp[5]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_disp[4]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_disp[3]	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_disp[2]	=>  Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_disp[1]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- seg_disp[0]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[17]	=>  Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[16]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[15]	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[14]	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[13]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[12]	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[11]	=>  Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[10]	=>  Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[9]	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[8]	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[7]	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[6]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[5]	=>  Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[4]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[3]	=>  Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[2]	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[1]	=>  Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[0]	=>  Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[15]	=>  Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[14]	=>  Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[13]	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[12]	=>  Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[11]	=>  Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[10]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[9]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[8]	=>  Location: PIN_P14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[7]	=>  Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[6]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[5]	=>  Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[4]	=>  Location: PIN_N16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[3]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[2]	=>  Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[1]	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DATA[0]	=>  Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- M_nRESET	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XCLKOUT	=>  Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CPLD_8	=>  Location: PIN_F5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CPLD_1	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XEINT8	=>  Location: PIN_K6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- STEP_A	=>  Location: PIN_R14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- STEP_nA	=>  Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- STEP_B	=>  Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- STEP_nB	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- GPJ4_0	=>  Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- GPJ4_1	=>  Location: PIN_N15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- GPJ4_2	=>  Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- GPJ4_3	=>  Location: PIN_P16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- GPJ4_4	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- GPJ1_5	=>  Location: PIN_N14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SPI_DOUT	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SPI_DIN	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SPI_SCLK	=>  Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SPI_DA_CS	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SPI_AD_CS	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[15]	=>  Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[14]	=>  Location: PIN_K10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[13]	=>  Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[12]	=>  Location: PIN_N10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[11]	=>  Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[10]	=>  Location: PIN_T10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[9]	=>  Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[8]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[7]	=>  Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[6]	=>  Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[5]	=>  Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[4]	=>  Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[3]	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[2]	=>  Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[1]	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dip_sw[0]	=>  Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key_data[3]	=>  Location: PIN_R12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key_data[2]	=>  Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key_data[1]	=>  Location: PIN_K11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key_data[0]	=>  Location: PIN_L11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sel_button[3]	=>  Location: PIN_P13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sel_button[2]	=>  Location: PIN_R13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sel_button[1]	=>  Location: PIN_T13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sel_button[0]	=>  Location: PIN_P12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XnRESET	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- FPGA_CLK	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0OEN	=>  Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CPLD_0	=>  Location: PIN_T14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[5]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[3]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[2]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[0]	=>  Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0WEN	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[19]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[18]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[17]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[16]	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[15]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[14]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[13]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[11]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[10]	=>  Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[9]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[8]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[7]	=>  Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[6]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[4]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[12]	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- XM0_ADDR[1]	=>  Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF M3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_lcd_e : std_logic;
SIGNAL ww_lcd_rs : std_logic;
SIGNAL ww_lcd_rw : std_logic;
SIGNAL ww_piezo : std_logic;
SIGNAL ww_SRAM_nOE : std_logic;
SIGNAL ww_SRAM_nWE : std_logic;
SIGNAL ww_SRAM_nCS : std_logic;
SIGNAL ww_dot_d : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dot_scan : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_key_scan : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_lcd_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_led : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_seg_com : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_seg_disp : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SRAM_ADDR : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_SRAM_DATA : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_FPGA_CLK : std_logic;
SIGNAL ww_nFPGA_RESET : std_logic;
SIGNAL ww_XnRESET : std_logic;
SIGNAL ww_XM0OEN : std_logic;
SIGNAL ww_XM0WEN : std_logic;
SIGNAL ww_CPLD_0 : std_logic;
SIGNAL ww_XM0_ADDR : std_logic_vector(20 DOWNTO 0);
SIGNAL ww_M_nRESET : std_logic;
SIGNAL ww_XCLKOUT : std_logic;
SIGNAL ww_CPLD_8 : std_logic;
SIGNAL ww_CPLD_1 : std_logic;
SIGNAL ww_XEINT8 : std_logic;
SIGNAL ww_STEP_A : std_logic;
SIGNAL ww_STEP_nA : std_logic;
SIGNAL ww_STEP_B : std_logic;
SIGNAL ww_STEP_nB : std_logic;
SIGNAL ww_GPJ4_0 : std_logic;
SIGNAL ww_GPJ4_1 : std_logic;
SIGNAL ww_GPJ4_2 : std_logic;
SIGNAL ww_GPJ4_3 : std_logic;
SIGNAL ww_GPJ4_4 : std_logic;
SIGNAL ww_GPJ1_5 : std_logic;
SIGNAL ww_SPI_DOUT : std_logic;
SIGNAL ww_SPI_DIN : std_logic;
SIGNAL ww_SPI_SCLK : std_logic;
SIGNAL ww_SPI_DA_CS : std_logic;
SIGNAL ww_SPI_AD_CS : std_logic;
SIGNAL ww_dip_sw : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_key_data : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sel_button : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|seg_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FPGA_CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \XnRESET~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|Add0~10_combout\ : std_logic;
SIGNAL \inst2|Add0~12_combout\ : std_logic;
SIGNAL \inst2|Add0~16_combout\ : std_logic;
SIGNAL \inst2|Add0~26_combout\ : std_logic;
SIGNAL \inst2|Add0~38_combout\ : std_logic;
SIGNAL \inst2|Add0~48_combout\ : std_logic;
SIGNAL \inst2|Add0~61\ : std_logic;
SIGNAL \inst2|Add0~62_combout\ : std_logic;
SIGNAL \inst3|Add2~0_combout\ : std_logic;
SIGNAL \inst3|Add2~2_combout\ : std_logic;
SIGNAL \inst3|Add2~6_combout\ : std_logic;
SIGNAL \inst3|Add2~8_combout\ : std_logic;
SIGNAL \inst3|Add2~10_combout\ : std_logic;
SIGNAL \inst3|Add2~12_combout\ : std_logic;
SIGNAL \inst3|Add2~14_combout\ : std_logic;
SIGNAL \inst3|Add2~16_combout\ : std_logic;
SIGNAL \inst3|Add2~18_combout\ : std_logic;
SIGNAL \inst3|Add2~20_combout\ : std_logic;
SIGNAL \inst3|Add2~22_combout\ : std_logic;
SIGNAL \inst3|Add2~26_combout\ : std_logic;
SIGNAL \inst3|Add2~28_combout\ : std_logic;
SIGNAL \inst3|Add2~30_combout\ : std_logic;
SIGNAL \inst3|Add2~34_combout\ : std_logic;
SIGNAL \inst3|Add2~36_combout\ : std_logic;
SIGNAL \inst3|Add2~48_combout\ : std_logic;
SIGNAL \inst3|Add2~50_combout\ : std_logic;
SIGNAL \inst3|Add2~52_combout\ : std_logic;
SIGNAL \inst3|Add2~54_combout\ : std_logic;
SIGNAL \inst3|Add2~61\ : std_logic;
SIGNAL \inst3|Add2~62_combout\ : std_logic;
SIGNAL \inst2|WideOr1~0_combout\ : std_logic;
SIGNAL \inst2|WideOr29~0_combout\ : std_logic;
SIGNAL \inst2|WideOr36~0_combout\ : std_logic;
SIGNAL \inst2|Mux1~2_combout\ : std_logic;
SIGNAL \inst2|WideOr9~0_combout\ : std_logic;
SIGNAL \inst2|WideOr10~0_combout\ : std_logic;
SIGNAL \inst2|WideOr33~0_combout\ : std_logic;
SIGNAL \inst2|WideOr40~0_combout\ : std_logic;
SIGNAL \inst2|Mux5~2_combout\ : std_logic;
SIGNAL \inst2|WideOr20~0_combout\ : std_logic;
SIGNAL \inst2|WideOr13~0_combout\ : std_logic;
SIGNAL \inst2|WideOr6~0_combout\ : std_logic;
SIGNAL \inst2|Mux6~0_combout\ : std_logic;
SIGNAL \inst2|WideOr27~0_combout\ : std_logic;
SIGNAL \inst2|Mux6~1_combout\ : std_logic;
SIGNAL \inst2|Equal13~3_combout\ : std_logic;
SIGNAL \inst2|Equal13~7_combout\ : std_logic;
SIGNAL \inst2|Equal13~8_combout\ : std_logic;
SIGNAL \inst2|Equal13~9_combout\ : std_logic;
SIGNAL \inst2|my_clk_cnt2~1_combout\ : std_logic;
SIGNAL \inst2|my_clk_cnt2~2_combout\ : std_logic;
SIGNAL \inst2|my_clk_cnt2~4_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[0]~2_combout\ : std_logic;
SIGNAL \inst3|Equal1~1_combout\ : std_logic;
SIGNAL \inst3|Equal1~7_combout\ : std_logic;
SIGNAL \inst3|Equal1~8_combout\ : std_logic;
SIGNAL \inst3|Equal1~9_combout\ : std_logic;
SIGNAL \inst3|Selector7~0_combout\ : std_logic;
SIGNAL \inst3|Selector8~0_combout\ : std_logic;
SIGNAL \inst3|Selector9~0_combout\ : std_logic;
SIGNAL \inst3|Selector10~0_combout\ : std_logic;
SIGNAL \inst3|Selector29~0_combout\ : std_logic;
SIGNAL \inst3|Selector31~0_combout\ : std_logic;
SIGNAL \FPGA_CLK~combout\ : std_logic;
SIGNAL \XM0WEN~combout\ : std_logic;
SIGNAL \FPGA_CLK~clkctrl_outclk\ : std_logic;
SIGNAL \inst2|x8800_1000[3]~feeder_combout\ : std_logic;
SIGNAL \CPLD_0~combout\ : std_logic;
SIGNAL \XM0OEN~combout\ : std_logic;
SIGNAL \inst|re_dly~feeder_combout\ : std_logic;
SIGNAL \inst|re_dly~regout\ : std_logic;
SIGNAL \inst|re_dly1~regout\ : std_logic;
SIGNAL \inst|Hdata[15]~16_combout\ : std_logic;
SIGNAL \inst2|Add0~0_combout\ : std_logic;
SIGNAL \XnRESET~combout\ : std_logic;
SIGNAL \XnRESET~clkctrl_outclk\ : std_logic;
SIGNAL \inst2|Add0~1\ : std_logic;
SIGNAL \inst2|Add0~2_combout\ : std_logic;
SIGNAL \inst2|Add0~3\ : std_logic;
SIGNAL \inst2|Add0~4_combout\ : std_logic;
SIGNAL \inst2|Add0~5\ : std_logic;
SIGNAL \inst2|Add0~6_combout\ : std_logic;
SIGNAL \inst2|my_clk_cnt2~5_combout\ : std_logic;
SIGNAL \inst2|Add0~7\ : std_logic;
SIGNAL \inst2|Add0~8_combout\ : std_logic;
SIGNAL \inst2|Add0~9\ : std_logic;
SIGNAL \inst2|Add0~11\ : std_logic;
SIGNAL \inst2|Add0~13\ : std_logic;
SIGNAL \inst2|Add0~14_combout\ : std_logic;
SIGNAL \inst2|my_clk_cnt2~3_combout\ : std_logic;
SIGNAL \inst2|Add0~15\ : std_logic;
SIGNAL \inst2|Add0~17\ : std_logic;
SIGNAL \inst2|Add0~18_combout\ : std_logic;
SIGNAL \inst2|Add0~19\ : std_logic;
SIGNAL \inst2|Add0~21\ : std_logic;
SIGNAL \inst2|Add0~22_combout\ : std_logic;
SIGNAL \inst2|Add0~23\ : std_logic;
SIGNAL \inst2|Add0~24_combout\ : std_logic;
SIGNAL \inst2|Add0~25\ : std_logic;
SIGNAL \inst2|Add0~27\ : std_logic;
SIGNAL \inst2|Add0~28_combout\ : std_logic;
SIGNAL \inst2|my_clk_cnt2~0_combout\ : std_logic;
SIGNAL \inst2|Add0~29\ : std_logic;
SIGNAL \inst2|Add0~30_combout\ : std_logic;
SIGNAL \inst2|Equal13~5_combout\ : std_logic;
SIGNAL \inst2|Add0~31\ : std_logic;
SIGNAL \inst2|Add0~32_combout\ : std_logic;
SIGNAL \inst2|Add0~33\ : std_logic;
SIGNAL \inst2|Add0~34_combout\ : std_logic;
SIGNAL \inst2|Add0~35\ : std_logic;
SIGNAL \inst2|Add0~36_combout\ : std_logic;
SIGNAL \inst2|Add0~37\ : std_logic;
SIGNAL \inst2|Add0~39\ : std_logic;
SIGNAL \inst2|Add0~40_combout\ : std_logic;
SIGNAL \inst2|Add0~41\ : std_logic;
SIGNAL \inst2|Add0~43\ : std_logic;
SIGNAL \inst2|Add0~45\ : std_logic;
SIGNAL \inst2|Add0~46_combout\ : std_logic;
SIGNAL \inst2|Add0~47\ : std_logic;
SIGNAL \inst2|Add0~49\ : std_logic;
SIGNAL \inst2|Add0~50_combout\ : std_logic;
SIGNAL \inst2|Add0~51\ : std_logic;
SIGNAL \inst2|Add0~53\ : std_logic;
SIGNAL \inst2|Add0~54_combout\ : std_logic;
SIGNAL \inst2|Add0~55\ : std_logic;
SIGNAL \inst2|Add0~56_combout\ : std_logic;
SIGNAL \inst2|Add0~57\ : std_logic;
SIGNAL \inst2|Add0~58_combout\ : std_logic;
SIGNAL \inst2|Add0~59\ : std_logic;
SIGNAL \inst2|Add0~60_combout\ : std_logic;
SIGNAL \inst2|Equal13~0_combout\ : std_logic;
SIGNAL \inst2|Add0~52_combout\ : std_logic;
SIGNAL \inst2|Equal13~1_combout\ : std_logic;
SIGNAL \inst2|Add0~44_combout\ : std_logic;
SIGNAL \inst2|Add0~42_combout\ : std_logic;
SIGNAL \inst2|Equal13~2_combout\ : std_logic;
SIGNAL \inst2|Equal13~4_combout\ : std_logic;
SIGNAL \inst2|Add0~20_combout\ : std_logic;
SIGNAL \inst2|Equal13~6_combout\ : std_logic;
SIGNAL \inst2|Equal13~10_combout\ : std_logic;
SIGNAL \inst2|seg_clk~0_combout\ : std_logic;
SIGNAL \inst2|seg_clk~regout\ : std_logic;
SIGNAL \inst2|seg_clk~clkctrl_outclk\ : std_logic;
SIGNAL \inst2|cnt_segcon[0]~2_combout\ : std_logic;
SIGNAL \inst2|cnt_segcon~0_combout\ : std_logic;
SIGNAL \inst2|cnt_segcon~1_combout\ : std_logic;
SIGNAL \inst2|cnt_segcon[0]~_wirecell_combout\ : std_logic;
SIGNAL \inst2|Decoder6~0_combout\ : std_logic;
SIGNAL \inst2|Decoder6~1_combout\ : std_logic;
SIGNAL \inst2|Decoder6~2_combout\ : std_logic;
SIGNAL \inst2|Decoder6~3_combout\ : std_logic;
SIGNAL \inst2|Decoder6~4_combout\ : std_logic;
SIGNAL \inst2|Decoder6~5_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[6]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[0]~4_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[0]~3_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[0]~1_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[0]~5_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[0]~6_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[0]~7_combout\ : std_logic;
SIGNAL \inst|Hdi[1]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_1000[3]~0_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[0]~0_combout\ : std_logic;
SIGNAL \inst2|x8800_1000[3]~1_combout\ : std_logic;
SIGNAL \inst|Hdi[2]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_1000[0]~feeder_combout\ : std_logic;
SIGNAL \inst3|Selector1~0_combout\ : std_logic;
SIGNAL \inst3|Selector1~1_combout\ : std_logic;
SIGNAL \inst3|state.RUNNING~regout\ : std_logic;
SIGNAL \inst3|Selector16~0_combout\ : std_logic;
SIGNAL \inst3|Selector17~0_combout\ : std_logic;
SIGNAL \inst3|Selector20~0_combout\ : std_logic;
SIGNAL \inst3|Selector23~0_combout\ : std_logic;
SIGNAL \inst3|Selector24~0_combout\ : std_logic;
SIGNAL \inst3|Selector25~0_combout\ : std_logic;
SIGNAL \inst3|Selector26~0_combout\ : std_logic;
SIGNAL \inst3|Selector27~0_combout\ : std_logic;
SIGNAL \inst3|Selector28~0_combout\ : std_logic;
SIGNAL \inst3|Selector30~0_combout\ : std_logic;
SIGNAL \inst3|Selector33~0_combout\ : std_logic;
SIGNAL \inst3|Selector34~0_combout\ : std_logic;
SIGNAL \inst3|Add2~1\ : std_logic;
SIGNAL \inst3|Add2~3\ : std_logic;
SIGNAL \inst3|Add2~4_combout\ : std_logic;
SIGNAL \inst3|Selector32~0_combout\ : std_logic;
SIGNAL \inst3|Add2~5\ : std_logic;
SIGNAL \inst3|Add2~7\ : std_logic;
SIGNAL \inst3|Add2~9\ : std_logic;
SIGNAL \inst3|Add2~11\ : std_logic;
SIGNAL \inst3|Add2~13\ : std_logic;
SIGNAL \inst3|Add2~15\ : std_logic;
SIGNAL \inst3|Add2~17\ : std_logic;
SIGNAL \inst3|Add2~19\ : std_logic;
SIGNAL \inst3|Add2~21\ : std_logic;
SIGNAL \inst3|Add2~23\ : std_logic;
SIGNAL \inst3|Add2~25\ : std_logic;
SIGNAL \inst3|Add2~27\ : std_logic;
SIGNAL \inst3|Add2~29\ : std_logic;
SIGNAL \inst3|Add2~31\ : std_logic;
SIGNAL \inst3|Add2~33\ : std_logic;
SIGNAL \inst3|Add2~35\ : std_logic;
SIGNAL \inst3|Add2~37\ : std_logic;
SIGNAL \inst3|Add2~38_combout\ : std_logic;
SIGNAL \inst3|Selector15~0_combout\ : std_logic;
SIGNAL \inst3|Add2~39\ : std_logic;
SIGNAL \inst3|Add2~40_combout\ : std_logic;
SIGNAL \inst3|Selector14~0_combout\ : std_logic;
SIGNAL \inst3|Add2~41\ : std_logic;
SIGNAL \inst3|Add2~42_combout\ : std_logic;
SIGNAL \inst3|Selector13~0_combout\ : std_logic;
SIGNAL \inst3|Add2~43\ : std_logic;
SIGNAL \inst3|Add2~44_combout\ : std_logic;
SIGNAL \inst3|Selector12~0_combout\ : std_logic;
SIGNAL \inst3|Add2~45\ : std_logic;
SIGNAL \inst3|Add2~46_combout\ : std_logic;
SIGNAL \inst3|Selector11~0_combout\ : std_logic;
SIGNAL \inst3|Equal1~2_combout\ : std_logic;
SIGNAL \inst3|Add2~32_combout\ : std_logic;
SIGNAL \inst3|Selector18~0_combout\ : std_logic;
SIGNAL \inst3|Equal1~3_combout\ : std_logic;
SIGNAL \inst3|Add2~47\ : std_logic;
SIGNAL \inst3|Add2~49\ : std_logic;
SIGNAL \inst3|Add2~51\ : std_logic;
SIGNAL \inst3|Add2~53\ : std_logic;
SIGNAL \inst3|Add2~55\ : std_logic;
SIGNAL \inst3|Add2~56_combout\ : std_logic;
SIGNAL \inst3|Selector6~0_combout\ : std_logic;
SIGNAL \inst3|Add2~57\ : std_logic;
SIGNAL \inst3|Add2~58_combout\ : std_logic;
SIGNAL \inst3|Selector5~0_combout\ : std_logic;
SIGNAL \inst3|Add2~59\ : std_logic;
SIGNAL \inst3|Add2~60_combout\ : std_logic;
SIGNAL \inst3|Selector4~0_combout\ : std_logic;
SIGNAL \inst3|Selector3~0_combout\ : std_logic;
SIGNAL \inst3|Equal1~0_combout\ : std_logic;
SIGNAL \inst3|Equal1~4_combout\ : std_logic;
SIGNAL \inst3|Selector19~0_combout\ : std_logic;
SIGNAL \inst3|Selector21~0_combout\ : std_logic;
SIGNAL \inst3|Add2~24_combout\ : std_logic;
SIGNAL \inst3|Selector22~0_combout\ : std_logic;
SIGNAL \inst3|Equal1~5_combout\ : std_logic;
SIGNAL \inst3|Equal1~6_combout\ : std_logic;
SIGNAL \inst3|Equal1~10_combout\ : std_logic;
SIGNAL \inst3|Selector0~0_combout\ : std_logic;
SIGNAL \inst3|Selector2~0_combout\ : std_logic;
SIGNAL \inst3|state.COMPLETE~regout\ : std_logic;
SIGNAL \inst3|Selector0~1_combout\ : std_logic;
SIGNAL \inst3|state.IDLE~regout\ : std_logic;
SIGNAL \inst2|x8800_0010[4]~feeder_combout\ : std_logic;
SIGNAL \inst|Hdi[5]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[5]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr7~0_combout\ : std_logic;
SIGNAL \inst|Hdi[3]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[3]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr0~0_combout\ : std_logic;
SIGNAL \inst2|Mux0~0_combout\ : std_logic;
SIGNAL \inst|Hdi[13]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[13]~feeder_combout\ : std_logic;
SIGNAL \inst|Hdi[12]~feeder_combout\ : std_logic;
SIGNAL \inst|Hdi[15]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr21~0_combout\ : std_logic;
SIGNAL \inst|Hdi[9]~feeder_combout\ : std_logic;
SIGNAL \inst|Hdi[11]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[11]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[8]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr14~0_combout\ : std_logic;
SIGNAL \inst2|Mux0~1_combout\ : std_logic;
SIGNAL \inst2|x8800_0012[6]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0012[0]~0_combout\ : std_logic;
SIGNAL \inst2|x8800_0012[4]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0012[5]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr35~0_combout\ : std_logic;
SIGNAL \inst2|x8800_0012[0]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0012[3]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr28~0_combout\ : std_logic;
SIGNAL \inst2|Mux0~2_combout\ : std_logic;
SIGNAL \inst2|Mux0~3_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[14]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr22~0_combout\ : std_logic;
SIGNAL \inst2|WideOr8~0_combout\ : std_logic;
SIGNAL \inst2|Mux1~0_combout\ : std_logic;
SIGNAL \inst2|WideOr15~0_combout\ : std_logic;
SIGNAL \inst2|Mux1~1_combout\ : std_logic;
SIGNAL \inst2|Mux1~3_combout\ : std_logic;
SIGNAL \inst2|WideOr23~0_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[2]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr2~0_combout\ : std_logic;
SIGNAL \inst2|Mux2~0_combout\ : std_logic;
SIGNAL \inst2|WideOr16~0_combout\ : std_logic;
SIGNAL \inst2|Mux2~1_combout\ : std_logic;
SIGNAL \inst2|WideOr37~0_combout\ : std_logic;
SIGNAL \inst2|WideOr30~0_combout\ : std_logic;
SIGNAL \inst2|Mux2~2_combout\ : std_logic;
SIGNAL \inst2|Mux2~3_combout\ : std_logic;
SIGNAL \inst2|WideOr38~0_combout\ : std_logic;
SIGNAL \inst2|WideOr31~0_combout\ : std_logic;
SIGNAL \inst2|Mux3~2_combout\ : std_logic;
SIGNAL \inst2|WideOr3~0_combout\ : std_logic;
SIGNAL \inst2|Mux3~0_combout\ : std_logic;
SIGNAL \inst2|WideOr24~0_combout\ : std_logic;
SIGNAL \inst|Hdi[10]~feeder_combout\ : std_logic;
SIGNAL \inst2|x8800_0010[10]~feeder_combout\ : std_logic;
SIGNAL \inst2|WideOr17~0_combout\ : std_logic;
SIGNAL \inst2|Mux3~1_combout\ : std_logic;
SIGNAL \inst2|Mux3~3_combout\ : std_logic;
SIGNAL \inst2|WideOr32~0_combout\ : std_logic;
SIGNAL \inst2|WideOr39~0_combout\ : std_logic;
SIGNAL \inst2|Mux4~2_combout\ : std_logic;
SIGNAL \inst2|WideOr4~0_combout\ : std_logic;
SIGNAL \inst2|WideOr11~0_combout\ : std_logic;
SIGNAL \inst2|Mux4~0_combout\ : std_logic;
SIGNAL \inst2|WideOr25~0_combout\ : std_logic;
SIGNAL \inst2|WideOr18~0_combout\ : std_logic;
SIGNAL \inst2|Mux4~1_combout\ : std_logic;
SIGNAL \inst2|Mux4~3_combout\ : std_logic;
SIGNAL \inst2|WideOr19~0_combout\ : std_logic;
SIGNAL \inst2|WideOr26~0_combout\ : std_logic;
SIGNAL \inst2|WideOr12~0_combout\ : std_logic;
SIGNAL \inst2|WideOr5~0_combout\ : std_logic;
SIGNAL \inst2|Mux5~0_combout\ : std_logic;
SIGNAL \inst2|Mux5~1_combout\ : std_logic;
SIGNAL \inst2|Mux5~3_combout\ : std_logic;
SIGNAL \inst2|WideOr34~0_combout\ : std_logic;
SIGNAL \inst2|WideOr41~0_combout\ : std_logic;
SIGNAL \inst2|Mux6~2_combout\ : std_logic;
SIGNAL \inst2|Mux6~3_combout\ : std_logic;
SIGNAL \XM0_ADDR~combout\ : std_logic_vector(20 DOWNTO 0);
SIGNAL \inst3|cnt_clk\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst3|s_const2\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \inst|Hdi\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst2|SEG_COM\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst2|SEG_DATA\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|cnt_segcon\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst2|my_clk_cnt2\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst2|x8800_0010\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst2|x8800_0012\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst2|x8800_1000\ : std_logic_vector(15 DOWNTO 0);
SIGNAL XM0DATA : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst3|ALT_INV_state.IDLE~regout\ : std_logic;
SIGNAL \ALT_INV_CPLD_0~combout\ : std_logic;
SIGNAL \ALT_INV_XnRESET~clkctrl_outclk\ : std_logic;

BEGIN

lcd_e <= ww_lcd_e;
lcd_rs <= ww_lcd_rs;
lcd_rw <= ww_lcd_rw;
piezo <= ww_piezo;
SRAM_nOE <= ww_SRAM_nOE;
SRAM_nWE <= ww_SRAM_nWE;
SRAM_nCS <= ww_SRAM_nCS;
dot_d <= ww_dot_d;
dot_scan <= ww_dot_scan;
key_scan <= ww_key_scan;
lcd_data <= ww_lcd_data;
led <= ww_led;
seg_com <= ww_seg_com;
seg_disp <= ww_seg_disp;
SRAM_ADDR <= ww_SRAM_ADDR;
SRAM_DATA <= ww_SRAM_DATA;
ww_FPGA_CLK <= FPGA_CLK;
ww_nFPGA_RESET <= nFPGA_RESET;
ww_XnRESET <= XnRESET;
ww_XM0OEN <= XM0OEN;
ww_XM0WEN <= XM0WEN;
ww_CPLD_0 <= CPLD_0;
ww_XM0_ADDR <= XM0_ADDR;
ww_M_nRESET <= M_nRESET;
ww_XCLKOUT <= XCLKOUT;
ww_CPLD_8 <= CPLD_8;
ww_CPLD_1 <= CPLD_1;
ww_XEINT8 <= XEINT8;
ww_STEP_A <= STEP_A;
ww_STEP_nA <= STEP_nA;
ww_STEP_B <= STEP_B;
ww_STEP_nB <= STEP_nB;
ww_GPJ4_0 <= GPJ4_0;
ww_GPJ4_1 <= GPJ4_1;
ww_GPJ4_2 <= GPJ4_2;
ww_GPJ4_3 <= GPJ4_3;
ww_GPJ4_4 <= GPJ4_4;
ww_GPJ1_5 <= GPJ1_5;
ww_SPI_DOUT <= SPI_DOUT;
ww_SPI_DIN <= SPI_DIN;
ww_SPI_SCLK <= SPI_SCLK;
ww_SPI_DA_CS <= SPI_DA_CS;
ww_SPI_AD_CS <= SPI_AD_CS;
ww_dip_sw <= dip_sw;
ww_key_data <= key_data;
ww_sel_button <= sel_button;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst2|seg_clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst2|seg_clk~regout\);

\FPGA_CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \FPGA_CLK~combout\);

\XnRESET~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \XnRESET~combout\);
\inst3|ALT_INV_state.IDLE~regout\ <= NOT \inst3|state.IDLE~regout\;
\ALT_INV_CPLD_0~combout\ <= NOT \CPLD_0~combout\;
\ALT_INV_XnRESET~clkctrl_outclk\ <= NOT \XnRESET~clkctrl_outclk\;

-- Location: LCCOMB_X2_Y9_N10
\inst2|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~10_combout\ = (\inst2|my_clk_cnt2\(5) & (!\inst2|Add0~9\)) # (!\inst2|my_clk_cnt2\(5) & ((\inst2|Add0~9\) # (GND)))
-- \inst2|Add0~11\ = CARRY((!\inst2|Add0~9\) # (!\inst2|my_clk_cnt2\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(5),
	datad => VCC,
	cin => \inst2|Add0~9\,
	combout => \inst2|Add0~10_combout\,
	cout => \inst2|Add0~11\);

-- Location: LCCOMB_X2_Y9_N12
\inst2|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~12_combout\ = (\inst2|my_clk_cnt2\(6) & (\inst2|Add0~11\ $ (GND))) # (!\inst2|my_clk_cnt2\(6) & (!\inst2|Add0~11\ & VCC))
-- \inst2|Add0~13\ = CARRY((\inst2|my_clk_cnt2\(6) & !\inst2|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(6),
	datad => VCC,
	cin => \inst2|Add0~11\,
	combout => \inst2|Add0~12_combout\,
	cout => \inst2|Add0~13\);

-- Location: LCCOMB_X2_Y9_N16
\inst2|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~16_combout\ = (\inst2|my_clk_cnt2\(8) & (\inst2|Add0~15\ $ (GND))) # (!\inst2|my_clk_cnt2\(8) & (!\inst2|Add0~15\ & VCC))
-- \inst2|Add0~17\ = CARRY((\inst2|my_clk_cnt2\(8) & !\inst2|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(8),
	datad => VCC,
	cin => \inst2|Add0~15\,
	combout => \inst2|Add0~16_combout\,
	cout => \inst2|Add0~17\);

-- Location: LCCOMB_X2_Y9_N26
\inst2|Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~26_combout\ = (\inst2|my_clk_cnt2\(13) & (!\inst2|Add0~25\)) # (!\inst2|my_clk_cnt2\(13) & ((\inst2|Add0~25\) # (GND)))
-- \inst2|Add0~27\ = CARRY((!\inst2|Add0~25\) # (!\inst2|my_clk_cnt2\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(13),
	datad => VCC,
	cin => \inst2|Add0~25\,
	combout => \inst2|Add0~26_combout\,
	cout => \inst2|Add0~27\);

-- Location: LCCOMB_X2_Y8_N6
\inst2|Add0~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~38_combout\ = (\inst2|my_clk_cnt2\(19) & (!\inst2|Add0~37\)) # (!\inst2|my_clk_cnt2\(19) & ((\inst2|Add0~37\) # (GND)))
-- \inst2|Add0~39\ = CARRY((!\inst2|Add0~37\) # (!\inst2|my_clk_cnt2\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(19),
	datad => VCC,
	cin => \inst2|Add0~37\,
	combout => \inst2|Add0~38_combout\,
	cout => \inst2|Add0~39\);

-- Location: LCCOMB_X2_Y8_N16
\inst2|Add0~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~48_combout\ = (\inst2|my_clk_cnt2\(24) & (\inst2|Add0~47\ $ (GND))) # (!\inst2|my_clk_cnt2\(24) & (!\inst2|Add0~47\ & VCC))
-- \inst2|Add0~49\ = CARRY((\inst2|my_clk_cnt2\(24) & !\inst2|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(24),
	datad => VCC,
	cin => \inst2|Add0~47\,
	combout => \inst2|Add0~48_combout\,
	cout => \inst2|Add0~49\);

-- Location: LCCOMB_X2_Y8_N28
\inst2|Add0~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~60_combout\ = (\inst2|my_clk_cnt2\(30) & (\inst2|Add0~59\ $ (GND))) # (!\inst2|my_clk_cnt2\(30) & (!\inst2|Add0~59\ & VCC))
-- \inst2|Add0~61\ = CARRY((\inst2|my_clk_cnt2\(30) & !\inst2|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(30),
	datad => VCC,
	cin => \inst2|Add0~59\,
	combout => \inst2|Add0~60_combout\,
	cout => \inst2|Add0~61\);

-- Location: LCCOMB_X2_Y8_N30
\inst2|Add0~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~62_combout\ = \inst2|Add0~61\ $ (\inst2|my_clk_cnt2\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst2|my_clk_cnt2\(31),
	cin => \inst2|Add0~61\,
	combout => \inst2|Add0~62_combout\);

-- Location: LCCOMB_X17_Y16_N0
\inst3|Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~0_combout\ = \inst3|cnt_clk\(0) $ (VCC)
-- \inst3|Add2~1\ = CARRY(\inst3|cnt_clk\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(0),
	datad => VCC,
	combout => \inst3|Add2~0_combout\,
	cout => \inst3|Add2~1\);

-- Location: LCCOMB_X17_Y16_N2
\inst3|Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~2_combout\ = (\inst3|cnt_clk\(1) & (!\inst3|Add2~1\)) # (!\inst3|cnt_clk\(1) & ((\inst3|Add2~1\) # (GND)))
-- \inst3|Add2~3\ = CARRY((!\inst3|Add2~1\) # (!\inst3|cnt_clk\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(1),
	datad => VCC,
	cin => \inst3|Add2~1\,
	combout => \inst3|Add2~2_combout\,
	cout => \inst3|Add2~3\);

-- Location: LCCOMB_X17_Y16_N6
\inst3|Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~6_combout\ = (\inst3|cnt_clk\(3) & (!\inst3|Add2~5\)) # (!\inst3|cnt_clk\(3) & ((\inst3|Add2~5\) # (GND)))
-- \inst3|Add2~7\ = CARRY((!\inst3|Add2~5\) # (!\inst3|cnt_clk\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(3),
	datad => VCC,
	cin => \inst3|Add2~5\,
	combout => \inst3|Add2~6_combout\,
	cout => \inst3|Add2~7\);

-- Location: LCCOMB_X17_Y16_N8
\inst3|Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~8_combout\ = (\inst3|cnt_clk\(4) & (\inst3|Add2~7\ $ (GND))) # (!\inst3|cnt_clk\(4) & (!\inst3|Add2~7\ & VCC))
-- \inst3|Add2~9\ = CARRY((\inst3|cnt_clk\(4) & !\inst3|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(4),
	datad => VCC,
	cin => \inst3|Add2~7\,
	combout => \inst3|Add2~8_combout\,
	cout => \inst3|Add2~9\);

-- Location: LCCOMB_X17_Y16_N10
\inst3|Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~10_combout\ = (\inst3|cnt_clk\(5) & (!\inst3|Add2~9\)) # (!\inst3|cnt_clk\(5) & ((\inst3|Add2~9\) # (GND)))
-- \inst3|Add2~11\ = CARRY((!\inst3|Add2~9\) # (!\inst3|cnt_clk\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(5),
	datad => VCC,
	cin => \inst3|Add2~9\,
	combout => \inst3|Add2~10_combout\,
	cout => \inst3|Add2~11\);

-- Location: LCCOMB_X17_Y16_N12
\inst3|Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~12_combout\ = (\inst3|cnt_clk\(6) & (\inst3|Add2~11\ $ (GND))) # (!\inst3|cnt_clk\(6) & (!\inst3|Add2~11\ & VCC))
-- \inst3|Add2~13\ = CARRY((\inst3|cnt_clk\(6) & !\inst3|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(6),
	datad => VCC,
	cin => \inst3|Add2~11\,
	combout => \inst3|Add2~12_combout\,
	cout => \inst3|Add2~13\);

-- Location: LCCOMB_X17_Y16_N14
\inst3|Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~14_combout\ = (\inst3|cnt_clk\(7) & (!\inst3|Add2~13\)) # (!\inst3|cnt_clk\(7) & ((\inst3|Add2~13\) # (GND)))
-- \inst3|Add2~15\ = CARRY((!\inst3|Add2~13\) # (!\inst3|cnt_clk\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(7),
	datad => VCC,
	cin => \inst3|Add2~13\,
	combout => \inst3|Add2~14_combout\,
	cout => \inst3|Add2~15\);

-- Location: LCCOMB_X17_Y16_N16
\inst3|Add2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~16_combout\ = (\inst3|cnt_clk\(8) & (\inst3|Add2~15\ $ (GND))) # (!\inst3|cnt_clk\(8) & (!\inst3|Add2~15\ & VCC))
-- \inst3|Add2~17\ = CARRY((\inst3|cnt_clk\(8) & !\inst3|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(8),
	datad => VCC,
	cin => \inst3|Add2~15\,
	combout => \inst3|Add2~16_combout\,
	cout => \inst3|Add2~17\);

-- Location: LCCOMB_X17_Y16_N18
\inst3|Add2~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~18_combout\ = (\inst3|cnt_clk\(9) & (!\inst3|Add2~17\)) # (!\inst3|cnt_clk\(9) & ((\inst3|Add2~17\) # (GND)))
-- \inst3|Add2~19\ = CARRY((!\inst3|Add2~17\) # (!\inst3|cnt_clk\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(9),
	datad => VCC,
	cin => \inst3|Add2~17\,
	combout => \inst3|Add2~18_combout\,
	cout => \inst3|Add2~19\);

-- Location: LCCOMB_X17_Y16_N20
\inst3|Add2~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~20_combout\ = (\inst3|cnt_clk\(10) & (\inst3|Add2~19\ $ (GND))) # (!\inst3|cnt_clk\(10) & (!\inst3|Add2~19\ & VCC))
-- \inst3|Add2~21\ = CARRY((\inst3|cnt_clk\(10) & !\inst3|Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(10),
	datad => VCC,
	cin => \inst3|Add2~19\,
	combout => \inst3|Add2~20_combout\,
	cout => \inst3|Add2~21\);

-- Location: LCCOMB_X17_Y16_N22
\inst3|Add2~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~22_combout\ = (\inst3|cnt_clk\(11) & (!\inst3|Add2~21\)) # (!\inst3|cnt_clk\(11) & ((\inst3|Add2~21\) # (GND)))
-- \inst3|Add2~23\ = CARRY((!\inst3|Add2~21\) # (!\inst3|cnt_clk\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(11),
	datad => VCC,
	cin => \inst3|Add2~21\,
	combout => \inst3|Add2~22_combout\,
	cout => \inst3|Add2~23\);

-- Location: LCCOMB_X17_Y16_N26
\inst3|Add2~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~26_combout\ = (\inst3|cnt_clk\(13) & (!\inst3|Add2~25\)) # (!\inst3|cnt_clk\(13) & ((\inst3|Add2~25\) # (GND)))
-- \inst3|Add2~27\ = CARRY((!\inst3|Add2~25\) # (!\inst3|cnt_clk\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(13),
	datad => VCC,
	cin => \inst3|Add2~25\,
	combout => \inst3|Add2~26_combout\,
	cout => \inst3|Add2~27\);

-- Location: LCCOMB_X17_Y16_N28
\inst3|Add2~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~28_combout\ = (\inst3|cnt_clk\(14) & (\inst3|Add2~27\ $ (GND))) # (!\inst3|cnt_clk\(14) & (!\inst3|Add2~27\ & VCC))
-- \inst3|Add2~29\ = CARRY((\inst3|cnt_clk\(14) & !\inst3|Add2~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(14),
	datad => VCC,
	cin => \inst3|Add2~27\,
	combout => \inst3|Add2~28_combout\,
	cout => \inst3|Add2~29\);

-- Location: LCCOMB_X17_Y16_N30
\inst3|Add2~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~30_combout\ = (\inst3|cnt_clk\(15) & (!\inst3|Add2~29\)) # (!\inst3|cnt_clk\(15) & ((\inst3|Add2~29\) # (GND)))
-- \inst3|Add2~31\ = CARRY((!\inst3|Add2~29\) # (!\inst3|cnt_clk\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(15),
	datad => VCC,
	cin => \inst3|Add2~29\,
	combout => \inst3|Add2~30_combout\,
	cout => \inst3|Add2~31\);

-- Location: LCCOMB_X17_Y15_N2
\inst3|Add2~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~34_combout\ = (\inst3|cnt_clk\(17) & (!\inst3|Add2~33\)) # (!\inst3|cnt_clk\(17) & ((\inst3|Add2~33\) # (GND)))
-- \inst3|Add2~35\ = CARRY((!\inst3|Add2~33\) # (!\inst3|cnt_clk\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(17),
	datad => VCC,
	cin => \inst3|Add2~33\,
	combout => \inst3|Add2~34_combout\,
	cout => \inst3|Add2~35\);

-- Location: LCCOMB_X17_Y15_N4
\inst3|Add2~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~36_combout\ = (\inst3|cnt_clk\(18) & (\inst3|Add2~35\ $ (GND))) # (!\inst3|cnt_clk\(18) & (!\inst3|Add2~35\ & VCC))
-- \inst3|Add2~37\ = CARRY((\inst3|cnt_clk\(18) & !\inst3|Add2~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(18),
	datad => VCC,
	cin => \inst3|Add2~35\,
	combout => \inst3|Add2~36_combout\,
	cout => \inst3|Add2~37\);

-- Location: LCCOMB_X17_Y15_N16
\inst3|Add2~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~48_combout\ = (\inst3|cnt_clk\(24) & (\inst3|Add2~47\ $ (GND))) # (!\inst3|cnt_clk\(24) & (!\inst3|Add2~47\ & VCC))
-- \inst3|Add2~49\ = CARRY((\inst3|cnt_clk\(24) & !\inst3|Add2~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(24),
	datad => VCC,
	cin => \inst3|Add2~47\,
	combout => \inst3|Add2~48_combout\,
	cout => \inst3|Add2~49\);

-- Location: LCCOMB_X17_Y15_N18
\inst3|Add2~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~50_combout\ = (\inst3|cnt_clk\(25) & (!\inst3|Add2~49\)) # (!\inst3|cnt_clk\(25) & ((\inst3|Add2~49\) # (GND)))
-- \inst3|Add2~51\ = CARRY((!\inst3|Add2~49\) # (!\inst3|cnt_clk\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(25),
	datad => VCC,
	cin => \inst3|Add2~49\,
	combout => \inst3|Add2~50_combout\,
	cout => \inst3|Add2~51\);

-- Location: LCCOMB_X17_Y15_N20
\inst3|Add2~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~52_combout\ = (\inst3|cnt_clk\(26) & (\inst3|Add2~51\ $ (GND))) # (!\inst3|cnt_clk\(26) & (!\inst3|Add2~51\ & VCC))
-- \inst3|Add2~53\ = CARRY((\inst3|cnt_clk\(26) & !\inst3|Add2~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(26),
	datad => VCC,
	cin => \inst3|Add2~51\,
	combout => \inst3|Add2~52_combout\,
	cout => \inst3|Add2~53\);

-- Location: LCCOMB_X17_Y15_N22
\inst3|Add2~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~54_combout\ = (\inst3|cnt_clk\(27) & (!\inst3|Add2~53\)) # (!\inst3|cnt_clk\(27) & ((\inst3|Add2~53\) # (GND)))
-- \inst3|Add2~55\ = CARRY((!\inst3|Add2~53\) # (!\inst3|cnt_clk\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(27),
	datad => VCC,
	cin => \inst3|Add2~53\,
	combout => \inst3|Add2~54_combout\,
	cout => \inst3|Add2~55\);

-- Location: LCCOMB_X17_Y15_N28
\inst3|Add2~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~60_combout\ = (\inst3|cnt_clk\(30) & (\inst3|Add2~59\ $ (GND))) # (!\inst3|cnt_clk\(30) & (!\inst3|Add2~59\ & VCC))
-- \inst3|Add2~61\ = CARRY((\inst3|cnt_clk\(30) & !\inst3|Add2~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(30),
	datad => VCC,
	cin => \inst3|Add2~59\,
	combout => \inst3|Add2~60_combout\,
	cout => \inst3|Add2~61\);

-- Location: LCCOMB_X17_Y15_N30
\inst3|Add2~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~62_combout\ = \inst3|Add2~61\ $ (\inst3|cnt_clk\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst3|cnt_clk\(31),
	cin => \inst3|Add2~61\,
	combout => \inst3|Add2~62_combout\);

-- Location: LCFF_X25_Y15_N15
\inst3|s_const2[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(7),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(7));

-- Location: LCFF_X26_Y17_N7
\inst3|s_const2[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0012\(1),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(17));

-- Location: LCCOMB_X25_Y15_N2
\inst2|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr1~0_combout\ = (\inst3|s_const2\(2) & ((\inst3|s_const2\(3)) # (\inst3|s_const2\(0) $ (\inst3|s_const2\(1))))) # (!\inst3|s_const2\(2) & (((\inst3|s_const2\(1) & \inst3|s_const2\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(2),
	datab => \inst3|s_const2\(0),
	datac => \inst3|s_const2\(1),
	datad => \inst3|s_const2\(3),
	combout => \inst2|WideOr1~0_combout\);

-- Location: LCCOMB_X26_Y17_N6
\inst2|WideOr29~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr29~0_combout\ = (\inst3|s_const2\(19) & (((\inst3|s_const2\(17)) # (\inst3|s_const2\(18))))) # (!\inst3|s_const2\(19) & (\inst3|s_const2\(18) & (\inst3|s_const2\(16) $ (\inst3|s_const2\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(16),
	datab => \inst3|s_const2\(19),
	datac => \inst3|s_const2\(17),
	datad => \inst3|s_const2\(18),
	combout => \inst2|WideOr29~0_combout\);

-- Location: LCCOMB_X26_Y17_N10
\inst2|WideOr36~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr36~0_combout\ = (\inst3|s_const2\(23) & ((\inst3|s_const2\(22)) # ((\inst3|s_const2\(21))))) # (!\inst3|s_const2\(23) & (\inst3|s_const2\(22) & (\inst3|s_const2\(21) $ (\inst3|s_const2\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(23),
	datab => \inst3|s_const2\(22),
	datac => \inst3|s_const2\(21),
	datad => \inst3|s_const2\(20),
	combout => \inst2|WideOr36~0_combout\);

-- Location: LCCOMB_X25_Y16_N6
\inst2|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux1~2_combout\ = (\inst2|cnt_segcon\(0) & (!\inst2|WideOr36~0_combout\)) # (!\inst2|cnt_segcon\(0) & ((!\inst2|WideOr29~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr36~0_combout\,
	datad => \inst2|WideOr29~0_combout\,
	combout => \inst2|Mux1~2_combout\);

-- Location: LCCOMB_X25_Y15_N4
\inst2|WideOr9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr9~0_combout\ = (\inst3|s_const2\(6) & (((\inst3|s_const2\(7))))) # (!\inst3|s_const2\(6) & (\inst3|s_const2\(5) & ((\inst3|s_const2\(7)) # (!\inst3|s_const2\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(4),
	datab => \inst3|s_const2\(5),
	datac => \inst3|s_const2\(6),
	datad => \inst3|s_const2\(7),
	combout => \inst2|WideOr9~0_combout\);

-- Location: LCCOMB_X25_Y15_N14
\inst2|WideOr10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr10~0_combout\ = (\inst3|s_const2\(5) & ((\inst3|s_const2\(7)) # ((\inst3|s_const2\(4) & \inst3|s_const2\(6))))) # (!\inst3|s_const2\(5) & (\inst3|s_const2\(6) $ (((\inst3|s_const2\(4) & !\inst3|s_const2\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(4),
	datab => \inst3|s_const2\(6),
	datac => \inst3|s_const2\(7),
	datad => \inst3|s_const2\(5),
	combout => \inst2|WideOr10~0_combout\);

-- Location: LCCOMB_X26_Y17_N4
\inst2|WideOr33~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr33~0_combout\ = (\inst3|s_const2\(16) & ((\inst3|s_const2\(17)) # (\inst3|s_const2\(19) $ (!\inst3|s_const2\(18))))) # (!\inst3|s_const2\(16) & ((\inst3|s_const2\(18) & ((\inst3|s_const2\(19)))) # (!\inst3|s_const2\(18) & 
-- (\inst3|s_const2\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(17),
	datab => \inst3|s_const2\(19),
	datac => \inst3|s_const2\(16),
	datad => \inst3|s_const2\(18),
	combout => \inst2|WideOr33~0_combout\);

-- Location: LCCOMB_X25_Y17_N4
\inst2|WideOr40~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr40~0_combout\ = (\inst3|s_const2\(22) & ((\inst3|s_const2\(23)) # ((\inst3|s_const2\(21) & \inst3|s_const2\(20))))) # (!\inst3|s_const2\(22) & ((\inst3|s_const2\(21)) # ((!\inst3|s_const2\(23) & \inst3|s_const2\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(23),
	datab => \inst3|s_const2\(22),
	datac => \inst3|s_const2\(21),
	datad => \inst3|s_const2\(20),
	combout => \inst2|WideOr40~0_combout\);

-- Location: LCCOMB_X25_Y17_N6
\inst2|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux5~2_combout\ = (\inst2|cnt_segcon\(0) & (!\inst2|WideOr40~0_combout\)) # (!\inst2|cnt_segcon\(0) & ((!\inst2|WideOr33~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr40~0_combout\,
	datad => \inst2|WideOr33~0_combout\,
	combout => \inst2|Mux5~2_combout\);

-- Location: LCCOMB_X26_Y16_N26
\inst2|WideOr20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr20~0_combout\ = (\inst3|s_const2\(10) & (!\inst3|s_const2\(11) & ((!\inst3|s_const2\(8)) # (!\inst3|s_const2\(9))))) # (!\inst3|s_const2\(10) & (\inst3|s_const2\(11) $ ((\inst3|s_const2\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(10),
	datab => \inst3|s_const2\(11),
	datac => \inst3|s_const2\(9),
	datad => \inst3|s_const2\(8),
	combout => \inst2|WideOr20~0_combout\);

-- Location: LCCOMB_X25_Y15_N12
\inst2|WideOr13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr13~0_combout\ = (\inst3|s_const2\(5) & (!\inst3|s_const2\(7) & ((!\inst3|s_const2\(4)) # (!\inst3|s_const2\(6))))) # (!\inst3|s_const2\(5) & (\inst3|s_const2\(7) $ ((\inst3|s_const2\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(7),
	datab => \inst3|s_const2\(5),
	datac => \inst3|s_const2\(6),
	datad => \inst3|s_const2\(4),
	combout => \inst2|WideOr13~0_combout\);

-- Location: LCCOMB_X25_Y15_N6
\inst2|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr6~0_combout\ = (\inst3|s_const2\(1) & (!\inst3|s_const2\(3) & ((!\inst3|s_const2\(0)) # (!\inst3|s_const2\(2))))) # (!\inst3|s_const2\(1) & (\inst3|s_const2\(3) $ ((\inst3|s_const2\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(3),
	datab => \inst3|s_const2\(1),
	datac => \inst3|s_const2\(2),
	datad => \inst3|s_const2\(0),
	combout => \inst2|WideOr6~0_combout\);

-- Location: LCCOMB_X24_Y16_N28
\inst2|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux6~0_combout\ = (\inst2|cnt_segcon\(0) & (((\inst2|cnt_segcon\(1)) # (\inst2|WideOr13~0_combout\)))) # (!\inst2|cnt_segcon\(0) & (\inst2|WideOr6~0_combout\ & (!\inst2|cnt_segcon\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|WideOr6~0_combout\,
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|cnt_segcon\(1),
	datad => \inst2|WideOr13~0_combout\,
	combout => \inst2|Mux6~0_combout\);

-- Location: LCCOMB_X26_Y16_N22
\inst2|WideOr27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr27~0_combout\ = (\inst3|s_const2\(13) & (!\inst3|s_const2\(15) & ((!\inst3|s_const2\(14)) # (!\inst3|s_const2\(12))))) # (!\inst3|s_const2\(13) & ((\inst3|s_const2\(14) $ (\inst3|s_const2\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(12),
	datab => \inst3|s_const2\(13),
	datac => \inst3|s_const2\(14),
	datad => \inst3|s_const2\(15),
	combout => \inst2|WideOr27~0_combout\);

-- Location: LCCOMB_X24_Y16_N30
\inst2|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux6~1_combout\ = (\inst2|Mux6~0_combout\ & ((\inst2|WideOr27~0_combout\) # ((!\inst2|cnt_segcon\(1))))) # (!\inst2|Mux6~0_combout\ & (((\inst2|cnt_segcon\(1) & \inst2|WideOr20~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|WideOr27~0_combout\,
	datab => \inst2|Mux6~0_combout\,
	datac => \inst2|cnt_segcon\(1),
	datad => \inst2|WideOr20~0_combout\,
	combout => \inst2|Mux6~1_combout\);

-- Location: LCFF_X2_Y8_N31
\inst2|my_clk_cnt2[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~62_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(31));

-- Location: LCFF_X2_Y8_N17
\inst2|my_clk_cnt2[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~48_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(24));

-- Location: LCFF_X2_Y8_N7
\inst2|my_clk_cnt2[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~38_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(19));

-- Location: LCCOMB_X1_Y9_N12
\inst2|Equal13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~3_combout\ = (!\inst2|my_clk_cnt2\(16) & (!\inst2|my_clk_cnt2\(17) & (!\inst2|my_clk_cnt2\(18) & !\inst2|my_clk_cnt2\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(16),
	datab => \inst2|my_clk_cnt2\(17),
	datac => \inst2|my_clk_cnt2\(18),
	datad => \inst2|my_clk_cnt2\(19),
	combout => \inst2|Equal13~3_combout\);

-- Location: LCFF_X1_Y9_N31
\inst2|my_clk_cnt2[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|my_clk_cnt2~1_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(13));

-- Location: LCFF_X1_Y9_N15
\inst2|my_clk_cnt2[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|my_clk_cnt2~2_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(8));

-- Location: LCFF_X1_Y9_N11
\inst2|my_clk_cnt2[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|my_clk_cnt2~4_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(5));

-- Location: LCCOMB_X1_Y9_N2
\inst2|Equal13~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~7_combout\ = (!\inst2|my_clk_cnt2\(4) & \inst2|my_clk_cnt2\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|my_clk_cnt2\(4),
	datad => \inst2|my_clk_cnt2\(5),
	combout => \inst2|Equal13~7_combout\);

-- Location: LCCOMB_X1_Y9_N0
\inst2|Equal13~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~8_combout\ = (\inst2|my_clk_cnt2\(2) & (\inst2|my_clk_cnt2\(0) & (!\inst2|my_clk_cnt2\(3) & \inst2|my_clk_cnt2\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(2),
	datab => \inst2|my_clk_cnt2\(0),
	datac => \inst2|my_clk_cnt2\(3),
	datad => \inst2|my_clk_cnt2\(1),
	combout => \inst2|Equal13~8_combout\);

-- Location: LCFF_X2_Y9_N13
\inst2|my_clk_cnt2[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~12_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(6));

-- Location: LCCOMB_X1_Y9_N24
\inst2|Equal13~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~9_combout\ = (\inst2|my_clk_cnt2\(7) & (\inst2|Equal13~7_combout\ & (!\inst2|my_clk_cnt2\(6) & \inst2|Equal13~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(7),
	datab => \inst2|Equal13~7_combout\,
	datac => \inst2|my_clk_cnt2\(6),
	datad => \inst2|Equal13~8_combout\,
	combout => \inst2|Equal13~9_combout\);

-- Location: LCFF_X26_Y15_N7
\inst2|x8800_0010[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(7),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(7));

-- Location: LCFF_X26_Y17_N17
\inst2|x8800_0012[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(1),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0012[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0012\(1));

-- Location: LCCOMB_X1_Y9_N30
\inst2|my_clk_cnt2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|my_clk_cnt2~1_combout\ = (\inst2|Add0~26_combout\ & !\inst2|Equal13~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Add0~26_combout\,
	datad => \inst2|Equal13~10_combout\,
	combout => \inst2|my_clk_cnt2~1_combout\);

-- Location: LCCOMB_X1_Y9_N14
\inst2|my_clk_cnt2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|my_clk_cnt2~2_combout\ = (\inst2|Add0~16_combout\ & !\inst2|Equal13~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Add0~16_combout\,
	datad => \inst2|Equal13~10_combout\,
	combout => \inst2|my_clk_cnt2~2_combout\);

-- Location: LCCOMB_X1_Y9_N10
\inst2|my_clk_cnt2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|my_clk_cnt2~4_combout\ = (\inst2|Add0~10_combout\ & !\inst2|Equal13~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Add0~10_combout\,
	datad => \inst2|Equal13~10_combout\,
	combout => \inst2|my_clk_cnt2~4_combout\);

-- Location: LCCOMB_X33_Y11_N8
\inst2|x8800_0010[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[0]~2_combout\ = (!\XM0_ADDR~combout\(17) & (!\XM0_ADDR~combout\(16) & (!\XM0_ADDR~combout\(18) & !\XM0_ADDR~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XM0_ADDR~combout\(17),
	datab => \XM0_ADDR~combout\(16),
	datac => \XM0_ADDR~combout\(18),
	datad => \XM0_ADDR~combout\(15),
	combout => \inst2|x8800_0010[0]~2_combout\);

-- Location: LCFF_X33_Y15_N21
\inst2|x8800_1000[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_1000[3]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_1000[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_1000\(3));

-- Location: LCFF_X16_Y15_N9
\inst3|cnt_clk[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector7~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(27));

-- Location: LCFF_X16_Y15_N11
\inst3|cnt_clk[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector8~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(26));

-- Location: LCFF_X16_Y15_N13
\inst3|cnt_clk[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector9~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(25));

-- Location: LCFF_X16_Y15_N15
\inst3|cnt_clk[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector10~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(24));

-- Location: LCCOMB_X18_Y15_N16
\inst3|Equal1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~1_combout\ = (!\inst3|cnt_clk\(25) & (!\inst3|cnt_clk\(27) & (!\inst3|cnt_clk\(26) & !\inst3|cnt_clk\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(25),
	datab => \inst3|cnt_clk\(27),
	datac => \inst3|cnt_clk\(26),
	datad => \inst3|cnt_clk\(24),
	combout => \inst3|Equal1~1_combout\);

-- Location: LCFF_X18_Y16_N7
\inst3|cnt_clk[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector29~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(5));

-- Location: LCCOMB_X18_Y15_N0
\inst3|Equal1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~7_combout\ = (\inst3|cnt_clk\(4) & \inst3|cnt_clk\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(4),
	datac => \inst3|cnt_clk\(5),
	combout => \inst3|Equal1~7_combout\);

-- Location: LCFF_X18_Y16_N27
\inst3|cnt_clk[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector31~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(3));

-- Location: LCCOMB_X18_Y15_N2
\inst3|Equal1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~8_combout\ = (\inst3|cnt_clk\(3) & (\inst3|cnt_clk\(1) & (!\inst3|cnt_clk\(0) & !\inst3|cnt_clk\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(3),
	datab => \inst3|cnt_clk\(1),
	datac => \inst3|cnt_clk\(0),
	datad => \inst3|cnt_clk\(2),
	combout => \inst3|Equal1~8_combout\);

-- Location: LCCOMB_X18_Y15_N20
\inst3|Equal1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~9_combout\ = (!\inst3|cnt_clk\(6) & (\inst3|Equal1~8_combout\ & (\inst3|cnt_clk\(7) & \inst3|Equal1~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(6),
	datab => \inst3|Equal1~8_combout\,
	datac => \inst3|cnt_clk\(7),
	datad => \inst3|Equal1~7_combout\,
	combout => \inst3|Equal1~9_combout\);

-- Location: LCCOMB_X16_Y15_N8
\inst3|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~54_combout\) # ((\inst3|cnt_clk\(27) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(27) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~54_combout\,
	datac => \inst3|cnt_clk\(27),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector7~0_combout\);

-- Location: LCCOMB_X16_Y15_N10
\inst3|Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector8~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~52_combout\) # ((\inst3|cnt_clk\(26) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(26) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~52_combout\,
	datac => \inst3|cnt_clk\(26),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector8~0_combout\);

-- Location: LCCOMB_X16_Y15_N12
\inst3|Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector9~0_combout\ = (\inst3|Add2~50_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|state.COMPLETE~regout\ & \inst3|cnt_clk\(25))))) # (!\inst3|Add2~50_combout\ & (\inst3|state.COMPLETE~regout\ & (\inst3|cnt_clk\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~50_combout\,
	datab => \inst3|state.COMPLETE~regout\,
	datac => \inst3|cnt_clk\(25),
	datad => \inst3|state.RUNNING~regout\,
	combout => \inst3|Selector9~0_combout\);

-- Location: LCCOMB_X16_Y15_N14
\inst3|Selector10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector10~0_combout\ = (\inst3|Add2~48_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|state.COMPLETE~regout\ & \inst3|cnt_clk\(24))))) # (!\inst3|Add2~48_combout\ & (\inst3|state.COMPLETE~regout\ & (\inst3|cnt_clk\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~48_combout\,
	datab => \inst3|state.COMPLETE~regout\,
	datac => \inst3|cnt_clk\(24),
	datad => \inst3|state.RUNNING~regout\,
	combout => \inst3|Selector10~0_combout\);

-- Location: LCCOMB_X18_Y16_N6
\inst3|Selector29~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector29~0_combout\ = (\inst3|Add2~10_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(5) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~10_combout\ & (((\inst3|cnt_clk\(5) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~10_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(5),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector29~0_combout\);

-- Location: LCCOMB_X18_Y16_N26
\inst3|Selector31~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector31~0_combout\ = (\inst3|Add2~6_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(3) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~6_combout\ & (((\inst3|cnt_clk\(3) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~6_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(3),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector31~0_combout\);

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\FPGA_CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_FPGA_CLK,
	combout => \FPGA_CLK~combout\);

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(5),
	combout => \XM0_ADDR~combout\(5));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0WEN~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0WEN,
	combout => \XM0WEN~combout\);

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(18),
	combout => \XM0_ADDR~combout\(18));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(17),
	combout => \XM0_ADDR~combout\(17));

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(16),
	combout => \XM0_ADDR~combout\(16));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(15),
	combout => \XM0_ADDR~combout\(15));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(14),
	combout => \XM0_ADDR~combout\(14));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(9),
	combout => \XM0_ADDR~combout\(9));

-- Location: CLKCTRL_G2
\FPGA_CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \FPGA_CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \FPGA_CLK~clkctrl_outclk\);

-- Location: LCCOMB_X33_Y15_N20
\inst2|x8800_1000[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_1000[3]~feeder_combout\ = \inst|Hdi\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(3),
	combout => \inst2|x8800_1000[3]~feeder_combout\);

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(15),
	combout => XM0DATA(15));

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(14),
	combout => XM0DATA(14));

-- Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(13),
	combout => XM0DATA(13));

-- Location: PIN_K13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(12),
	combout => XM0DATA(12));

-- Location: PIN_K15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(11),
	combout => XM0DATA(11));

-- Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(10),
	combout => XM0DATA(10));

-- Location: PIN_L12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(9),
	combout => XM0DATA(9));

-- Location: PIN_L14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(8),
	combout => XM0DATA(8));

-- Location: PIN_L15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(7),
	combout => XM0DATA(7));

-- Location: PIN_L16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(6),
	combout => XM0DATA(6));

-- Location: PIN_M12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(5),
	combout => XM0DATA(5));

-- Location: PIN_M14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(4),
	combout => XM0DATA(4));

-- Location: PIN_M15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(3),
	combout => XM0DATA(3));

-- Location: PIN_M16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(2),
	combout => XM0DATA(2));

-- Location: PIN_N12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(1),
	combout => XM0DATA(1));

-- Location: PIN_N13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\XM0_DATA[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	open_drain_output => "true",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst|Hdata[15]~16_combout\,
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => XM0_DATA(0),
	combout => XM0DATA(0));

-- Location: PIN_T14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CPLD_0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CPLD_0,
	combout => \CPLD_0~combout\);

-- Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0OEN~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0OEN,
	combout => \XM0OEN~combout\);

-- Location: LCCOMB_X30_Y15_N2
\inst|re_dly~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|re_dly~feeder_combout\ = \XM0OEN~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \XM0OEN~combout\,
	combout => \inst|re_dly~feeder_combout\);

-- Location: LCFF_X30_Y15_N3
\inst|re_dly\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst|re_dly~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|re_dly~regout\);

-- Location: LCFF_X30_Y15_N25
\inst|re_dly1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|re_dly~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|re_dly1~regout\);

-- Location: LCCOMB_X30_Y15_N24
\inst|Hdata[15]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdata[15]~16_combout\ = (\CPLD_0~combout\) # ((\inst|re_dly1~regout\ & \XM0OEN~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPLD_0~combout\,
	datac => \inst|re_dly1~regout\,
	datad => \XM0OEN~combout\,
	combout => \inst|Hdata[15]~16_combout\);

-- Location: LCCOMB_X2_Y9_N0
\inst2|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~0_combout\ = \inst2|my_clk_cnt2\(0) $ (VCC)
-- \inst2|Add0~1\ = CARRY(\inst2|my_clk_cnt2\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(0),
	datad => VCC,
	combout => \inst2|Add0~0_combout\,
	cout => \inst2|Add0~1\);

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XnRESET~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XnRESET,
	combout => \XnRESET~combout\);

-- Location: CLKCTRL_G6
\XnRESET~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \XnRESET~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \XnRESET~clkctrl_outclk\);

-- Location: LCFF_X2_Y9_N1
\inst2|my_clk_cnt2[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(0));

-- Location: LCCOMB_X2_Y9_N2
\inst2|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~2_combout\ = (\inst2|my_clk_cnt2\(1) & (!\inst2|Add0~1\)) # (!\inst2|my_clk_cnt2\(1) & ((\inst2|Add0~1\) # (GND)))
-- \inst2|Add0~3\ = CARRY((!\inst2|Add0~1\) # (!\inst2|my_clk_cnt2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(1),
	datad => VCC,
	cin => \inst2|Add0~1\,
	combout => \inst2|Add0~2_combout\,
	cout => \inst2|Add0~3\);

-- Location: LCFF_X2_Y9_N3
\inst2|my_clk_cnt2[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~2_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(1));

-- Location: LCCOMB_X2_Y9_N4
\inst2|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~4_combout\ = (\inst2|my_clk_cnt2\(2) & (\inst2|Add0~3\ $ (GND))) # (!\inst2|my_clk_cnt2\(2) & (!\inst2|Add0~3\ & VCC))
-- \inst2|Add0~5\ = CARRY((\inst2|my_clk_cnt2\(2) & !\inst2|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(2),
	datad => VCC,
	cin => \inst2|Add0~3\,
	combout => \inst2|Add0~4_combout\,
	cout => \inst2|Add0~5\);

-- Location: LCFF_X2_Y9_N5
\inst2|my_clk_cnt2[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~4_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(2));

-- Location: LCCOMB_X2_Y9_N6
\inst2|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~6_combout\ = (\inst2|my_clk_cnt2\(3) & (!\inst2|Add0~5\)) # (!\inst2|my_clk_cnt2\(3) & ((\inst2|Add0~5\) # (GND)))
-- \inst2|Add0~7\ = CARRY((!\inst2|Add0~5\) # (!\inst2|my_clk_cnt2\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(3),
	datad => VCC,
	cin => \inst2|Add0~5\,
	combout => \inst2|Add0~6_combout\,
	cout => \inst2|Add0~7\);

-- Location: LCCOMB_X1_Y9_N16
\inst2|my_clk_cnt2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|my_clk_cnt2~5_combout\ = (!\inst2|Equal13~10_combout\ & \inst2|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|Equal13~10_combout\,
	datad => \inst2|Add0~6_combout\,
	combout => \inst2|my_clk_cnt2~5_combout\);

-- Location: LCFF_X1_Y9_N17
\inst2|my_clk_cnt2[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|my_clk_cnt2~5_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(3));

-- Location: LCCOMB_X2_Y9_N8
\inst2|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~8_combout\ = (\inst2|my_clk_cnt2\(4) & (\inst2|Add0~7\ $ (GND))) # (!\inst2|my_clk_cnt2\(4) & (!\inst2|Add0~7\ & VCC))
-- \inst2|Add0~9\ = CARRY((\inst2|my_clk_cnt2\(4) & !\inst2|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(4),
	datad => VCC,
	cin => \inst2|Add0~7\,
	combout => \inst2|Add0~8_combout\,
	cout => \inst2|Add0~9\);

-- Location: LCFF_X2_Y9_N9
\inst2|my_clk_cnt2[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~8_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(4));

-- Location: LCCOMB_X2_Y9_N14
\inst2|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~14_combout\ = (\inst2|my_clk_cnt2\(7) & (!\inst2|Add0~13\)) # (!\inst2|my_clk_cnt2\(7) & ((\inst2|Add0~13\) # (GND)))
-- \inst2|Add0~15\ = CARRY((!\inst2|Add0~13\) # (!\inst2|my_clk_cnt2\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(7),
	datad => VCC,
	cin => \inst2|Add0~13\,
	combout => \inst2|Add0~14_combout\,
	cout => \inst2|Add0~15\);

-- Location: LCCOMB_X1_Y9_N6
\inst2|my_clk_cnt2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|my_clk_cnt2~3_combout\ = (\inst2|Add0~14_combout\ & !\inst2|Equal13~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Add0~14_combout\,
	datad => \inst2|Equal13~10_combout\,
	combout => \inst2|my_clk_cnt2~3_combout\);

-- Location: LCFF_X1_Y9_N7
\inst2|my_clk_cnt2[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|my_clk_cnt2~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(7));

-- Location: LCCOMB_X2_Y9_N18
\inst2|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~18_combout\ = (\inst2|my_clk_cnt2\(9) & (!\inst2|Add0~17\)) # (!\inst2|my_clk_cnt2\(9) & ((\inst2|Add0~17\) # (GND)))
-- \inst2|Add0~19\ = CARRY((!\inst2|Add0~17\) # (!\inst2|my_clk_cnt2\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(9),
	datad => VCC,
	cin => \inst2|Add0~17\,
	combout => \inst2|Add0~18_combout\,
	cout => \inst2|Add0~19\);

-- Location: LCFF_X2_Y9_N19
\inst2|my_clk_cnt2[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~18_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(9));

-- Location: LCCOMB_X2_Y9_N20
\inst2|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~20_combout\ = (\inst2|my_clk_cnt2\(10) & (\inst2|Add0~19\ $ (GND))) # (!\inst2|my_clk_cnt2\(10) & (!\inst2|Add0~19\ & VCC))
-- \inst2|Add0~21\ = CARRY((\inst2|my_clk_cnt2\(10) & !\inst2|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(10),
	datad => VCC,
	cin => \inst2|Add0~19\,
	combout => \inst2|Add0~20_combout\,
	cout => \inst2|Add0~21\);

-- Location: LCCOMB_X2_Y9_N22
\inst2|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~22_combout\ = (\inst2|my_clk_cnt2\(11) & (!\inst2|Add0~21\)) # (!\inst2|my_clk_cnt2\(11) & ((\inst2|Add0~21\) # (GND)))
-- \inst2|Add0~23\ = CARRY((!\inst2|Add0~21\) # (!\inst2|my_clk_cnt2\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(11),
	datad => VCC,
	cin => \inst2|Add0~21\,
	combout => \inst2|Add0~22_combout\,
	cout => \inst2|Add0~23\);

-- Location: LCFF_X2_Y9_N23
\inst2|my_clk_cnt2[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~22_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(11));

-- Location: LCCOMB_X2_Y9_N24
\inst2|Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~24_combout\ = (\inst2|my_clk_cnt2\(12) & (\inst2|Add0~23\ $ (GND))) # (!\inst2|my_clk_cnt2\(12) & (!\inst2|Add0~23\ & VCC))
-- \inst2|Add0~25\ = CARRY((\inst2|my_clk_cnt2\(12) & !\inst2|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(12),
	datad => VCC,
	cin => \inst2|Add0~23\,
	combout => \inst2|Add0~24_combout\,
	cout => \inst2|Add0~25\);

-- Location: LCFF_X2_Y9_N25
\inst2|my_clk_cnt2[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~24_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(12));

-- Location: LCCOMB_X2_Y9_N28
\inst2|Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~28_combout\ = (\inst2|my_clk_cnt2\(14) & (\inst2|Add0~27\ $ (GND))) # (!\inst2|my_clk_cnt2\(14) & (!\inst2|Add0~27\ & VCC))
-- \inst2|Add0~29\ = CARRY((\inst2|my_clk_cnt2\(14) & !\inst2|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(14),
	datad => VCC,
	cin => \inst2|Add0~27\,
	combout => \inst2|Add0~28_combout\,
	cout => \inst2|Add0~29\);

-- Location: LCCOMB_X1_Y9_N18
\inst2|my_clk_cnt2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|my_clk_cnt2~0_combout\ = (!\inst2|Equal13~10_combout\ & \inst2|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|Equal13~10_combout\,
	datad => \inst2|Add0~28_combout\,
	combout => \inst2|my_clk_cnt2~0_combout\);

-- Location: LCFF_X1_Y9_N19
\inst2|my_clk_cnt2[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|my_clk_cnt2~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(14));

-- Location: LCCOMB_X2_Y9_N30
\inst2|Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~30_combout\ = (\inst2|my_clk_cnt2\(15) & (!\inst2|Add0~29\)) # (!\inst2|my_clk_cnt2\(15) & ((\inst2|Add0~29\) # (GND)))
-- \inst2|Add0~31\ = CARRY((!\inst2|Add0~29\) # (!\inst2|my_clk_cnt2\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(15),
	datad => VCC,
	cin => \inst2|Add0~29\,
	combout => \inst2|Add0~30_combout\,
	cout => \inst2|Add0~31\);

-- Location: LCFF_X2_Y9_N31
\inst2|my_clk_cnt2[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~30_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(15));

-- Location: LCCOMB_X1_Y8_N0
\inst2|Equal13~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~5_combout\ = (\inst2|my_clk_cnt2\(13) & (!\inst2|my_clk_cnt2\(12) & (!\inst2|my_clk_cnt2\(15) & \inst2|my_clk_cnt2\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(13),
	datab => \inst2|my_clk_cnt2\(12),
	datac => \inst2|my_clk_cnt2\(15),
	datad => \inst2|my_clk_cnt2\(14),
	combout => \inst2|Equal13~5_combout\);

-- Location: LCCOMB_X2_Y8_N0
\inst2|Add0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~32_combout\ = (\inst2|my_clk_cnt2\(16) & (\inst2|Add0~31\ $ (GND))) # (!\inst2|my_clk_cnt2\(16) & (!\inst2|Add0~31\ & VCC))
-- \inst2|Add0~33\ = CARRY((\inst2|my_clk_cnt2\(16) & !\inst2|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(16),
	datad => VCC,
	cin => \inst2|Add0~31\,
	combout => \inst2|Add0~32_combout\,
	cout => \inst2|Add0~33\);

-- Location: LCFF_X2_Y8_N1
\inst2|my_clk_cnt2[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~32_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(16));

-- Location: LCCOMB_X2_Y8_N2
\inst2|Add0~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~34_combout\ = (\inst2|my_clk_cnt2\(17) & (!\inst2|Add0~33\)) # (!\inst2|my_clk_cnt2\(17) & ((\inst2|Add0~33\) # (GND)))
-- \inst2|Add0~35\ = CARRY((!\inst2|Add0~33\) # (!\inst2|my_clk_cnt2\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(17),
	datad => VCC,
	cin => \inst2|Add0~33\,
	combout => \inst2|Add0~34_combout\,
	cout => \inst2|Add0~35\);

-- Location: LCFF_X2_Y8_N3
\inst2|my_clk_cnt2[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~34_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(17));

-- Location: LCCOMB_X2_Y8_N4
\inst2|Add0~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~36_combout\ = (\inst2|my_clk_cnt2\(18) & (\inst2|Add0~35\ $ (GND))) # (!\inst2|my_clk_cnt2\(18) & (!\inst2|Add0~35\ & VCC))
-- \inst2|Add0~37\ = CARRY((\inst2|my_clk_cnt2\(18) & !\inst2|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(18),
	datad => VCC,
	cin => \inst2|Add0~35\,
	combout => \inst2|Add0~36_combout\,
	cout => \inst2|Add0~37\);

-- Location: LCFF_X2_Y8_N5
\inst2|my_clk_cnt2[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~36_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(18));

-- Location: LCCOMB_X2_Y8_N8
\inst2|Add0~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~40_combout\ = (\inst2|my_clk_cnt2\(20) & (\inst2|Add0~39\ $ (GND))) # (!\inst2|my_clk_cnt2\(20) & (!\inst2|Add0~39\ & VCC))
-- \inst2|Add0~41\ = CARRY((\inst2|my_clk_cnt2\(20) & !\inst2|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(20),
	datad => VCC,
	cin => \inst2|Add0~39\,
	combout => \inst2|Add0~40_combout\,
	cout => \inst2|Add0~41\);

-- Location: LCFF_X2_Y8_N9
\inst2|my_clk_cnt2[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~40_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(20));

-- Location: LCCOMB_X2_Y8_N10
\inst2|Add0~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~42_combout\ = (\inst2|my_clk_cnt2\(21) & (!\inst2|Add0~41\)) # (!\inst2|my_clk_cnt2\(21) & ((\inst2|Add0~41\) # (GND)))
-- \inst2|Add0~43\ = CARRY((!\inst2|Add0~41\) # (!\inst2|my_clk_cnt2\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(21),
	datad => VCC,
	cin => \inst2|Add0~41\,
	combout => \inst2|Add0~42_combout\,
	cout => \inst2|Add0~43\);

-- Location: LCCOMB_X2_Y8_N12
\inst2|Add0~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~44_combout\ = (\inst2|my_clk_cnt2\(22) & (\inst2|Add0~43\ $ (GND))) # (!\inst2|my_clk_cnt2\(22) & (!\inst2|Add0~43\ & VCC))
-- \inst2|Add0~45\ = CARRY((\inst2|my_clk_cnt2\(22) & !\inst2|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(22),
	datad => VCC,
	cin => \inst2|Add0~43\,
	combout => \inst2|Add0~44_combout\,
	cout => \inst2|Add0~45\);

-- Location: LCCOMB_X2_Y8_N14
\inst2|Add0~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~46_combout\ = (\inst2|my_clk_cnt2\(23) & (!\inst2|Add0~45\)) # (!\inst2|my_clk_cnt2\(23) & ((\inst2|Add0~45\) # (GND)))
-- \inst2|Add0~47\ = CARRY((!\inst2|Add0~45\) # (!\inst2|my_clk_cnt2\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(23),
	datad => VCC,
	cin => \inst2|Add0~45\,
	combout => \inst2|Add0~46_combout\,
	cout => \inst2|Add0~47\);

-- Location: LCFF_X2_Y8_N15
\inst2|my_clk_cnt2[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~46_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(23));

-- Location: LCCOMB_X2_Y8_N18
\inst2|Add0~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~50_combout\ = (\inst2|my_clk_cnt2\(25) & (!\inst2|Add0~49\)) # (!\inst2|my_clk_cnt2\(25) & ((\inst2|Add0~49\) # (GND)))
-- \inst2|Add0~51\ = CARRY((!\inst2|Add0~49\) # (!\inst2|my_clk_cnt2\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(25),
	datad => VCC,
	cin => \inst2|Add0~49\,
	combout => \inst2|Add0~50_combout\,
	cout => \inst2|Add0~51\);

-- Location: LCFF_X2_Y8_N19
\inst2|my_clk_cnt2[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~50_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(25));

-- Location: LCCOMB_X2_Y8_N20
\inst2|Add0~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~52_combout\ = (\inst2|my_clk_cnt2\(26) & (\inst2|Add0~51\ $ (GND))) # (!\inst2|my_clk_cnt2\(26) & (!\inst2|Add0~51\ & VCC))
-- \inst2|Add0~53\ = CARRY((\inst2|my_clk_cnt2\(26) & !\inst2|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(26),
	datad => VCC,
	cin => \inst2|Add0~51\,
	combout => \inst2|Add0~52_combout\,
	cout => \inst2|Add0~53\);

-- Location: LCCOMB_X2_Y8_N22
\inst2|Add0~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~54_combout\ = (\inst2|my_clk_cnt2\(27) & (!\inst2|Add0~53\)) # (!\inst2|my_clk_cnt2\(27) & ((\inst2|Add0~53\) # (GND)))
-- \inst2|Add0~55\ = CARRY((!\inst2|Add0~53\) # (!\inst2|my_clk_cnt2\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(27),
	datad => VCC,
	cin => \inst2|Add0~53\,
	combout => \inst2|Add0~54_combout\,
	cout => \inst2|Add0~55\);

-- Location: LCFF_X2_Y8_N23
\inst2|my_clk_cnt2[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~54_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(27));

-- Location: LCCOMB_X2_Y8_N24
\inst2|Add0~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~56_combout\ = (\inst2|my_clk_cnt2\(28) & (\inst2|Add0~55\ $ (GND))) # (!\inst2|my_clk_cnt2\(28) & (!\inst2|Add0~55\ & VCC))
-- \inst2|Add0~57\ = CARRY((\inst2|my_clk_cnt2\(28) & !\inst2|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(28),
	datad => VCC,
	cin => \inst2|Add0~55\,
	combout => \inst2|Add0~56_combout\,
	cout => \inst2|Add0~57\);

-- Location: LCFF_X2_Y8_N25
\inst2|my_clk_cnt2[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~56_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(28));

-- Location: LCCOMB_X2_Y8_N26
\inst2|Add0~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~58_combout\ = (\inst2|my_clk_cnt2\(29) & (!\inst2|Add0~57\)) # (!\inst2|my_clk_cnt2\(29) & ((\inst2|Add0~57\) # (GND)))
-- \inst2|Add0~59\ = CARRY((!\inst2|Add0~57\) # (!\inst2|my_clk_cnt2\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|my_clk_cnt2\(29),
	datad => VCC,
	cin => \inst2|Add0~57\,
	combout => \inst2|Add0~58_combout\,
	cout => \inst2|Add0~59\);

-- Location: LCFF_X2_Y8_N27
\inst2|my_clk_cnt2[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~58_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(29));

-- Location: LCFF_X2_Y8_N29
\inst2|my_clk_cnt2[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~60_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(30));

-- Location: LCCOMB_X1_Y9_N22
\inst2|Equal13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~0_combout\ = (!\inst2|my_clk_cnt2\(31) & (!\inst2|my_clk_cnt2\(28) & (!\inst2|my_clk_cnt2\(29) & !\inst2|my_clk_cnt2\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(31),
	datab => \inst2|my_clk_cnt2\(28),
	datac => \inst2|my_clk_cnt2\(29),
	datad => \inst2|my_clk_cnt2\(30),
	combout => \inst2|Equal13~0_combout\);

-- Location: LCFF_X2_Y8_N21
\inst2|my_clk_cnt2[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~52_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(26));

-- Location: LCCOMB_X1_Y9_N4
\inst2|Equal13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~1_combout\ = (!\inst2|my_clk_cnt2\(24) & (!\inst2|my_clk_cnt2\(25) & (!\inst2|my_clk_cnt2\(26) & !\inst2|my_clk_cnt2\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(24),
	datab => \inst2|my_clk_cnt2\(25),
	datac => \inst2|my_clk_cnt2\(26),
	datad => \inst2|my_clk_cnt2\(27),
	combout => \inst2|Equal13~1_combout\);

-- Location: LCFF_X2_Y8_N13
\inst2|my_clk_cnt2[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~44_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(22));

-- Location: LCFF_X2_Y8_N11
\inst2|my_clk_cnt2[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~42_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(21));

-- Location: LCCOMB_X1_Y9_N28
\inst2|Equal13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~2_combout\ = (!\inst2|my_clk_cnt2\(23) & (!\inst2|my_clk_cnt2\(22) & (!\inst2|my_clk_cnt2\(21) & !\inst2|my_clk_cnt2\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(23),
	datab => \inst2|my_clk_cnt2\(22),
	datac => \inst2|my_clk_cnt2\(21),
	datad => \inst2|my_clk_cnt2\(20),
	combout => \inst2|Equal13~2_combout\);

-- Location: LCCOMB_X1_Y9_N8
\inst2|Equal13~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~4_combout\ = (\inst2|Equal13~3_combout\ & (\inst2|Equal13~0_combout\ & (\inst2|Equal13~1_combout\ & \inst2|Equal13~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Equal13~3_combout\,
	datab => \inst2|Equal13~0_combout\,
	datac => \inst2|Equal13~1_combout\,
	datad => \inst2|Equal13~2_combout\,
	combout => \inst2|Equal13~4_combout\);

-- Location: LCFF_X2_Y9_N21
\inst2|my_clk_cnt2[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|Add0~20_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|my_clk_cnt2\(10));

-- Location: LCCOMB_X3_Y9_N24
\inst2|Equal13~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~6_combout\ = (\inst2|my_clk_cnt2\(8) & (!\inst2|my_clk_cnt2\(9) & (!\inst2|my_clk_cnt2\(10) & !\inst2|my_clk_cnt2\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|my_clk_cnt2\(8),
	datab => \inst2|my_clk_cnt2\(9),
	datac => \inst2|my_clk_cnt2\(10),
	datad => \inst2|my_clk_cnt2\(11),
	combout => \inst2|Equal13~6_combout\);

-- Location: LCCOMB_X1_Y9_N26
\inst2|Equal13~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal13~10_combout\ = (\inst2|Equal13~9_combout\ & (\inst2|Equal13~5_combout\ & (\inst2|Equal13~4_combout\ & \inst2|Equal13~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Equal13~9_combout\,
	datab => \inst2|Equal13~5_combout\,
	datac => \inst2|Equal13~4_combout\,
	datad => \inst2|Equal13~6_combout\,
	combout => \inst2|Equal13~10_combout\);

-- Location: LCCOMB_X1_Y9_N20
\inst2|seg_clk~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|seg_clk~0_combout\ = \inst2|seg_clk~regout\ $ (\inst2|Equal13~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|seg_clk~regout\,
	datad => \inst2|Equal13~10_combout\,
	combout => \inst2|seg_clk~0_combout\);

-- Location: LCFF_X1_Y9_N21
\inst2|seg_clk\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~combout\,
	datain => \inst2|seg_clk~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|seg_clk~regout\);

-- Location: CLKCTRL_G3
\inst2|seg_clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst2|seg_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst2|seg_clk~clkctrl_outclk\);

-- Location: LCCOMB_X24_Y16_N18
\inst2|cnt_segcon[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|cnt_segcon[0]~2_combout\ = !\inst2|cnt_segcon\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|cnt_segcon\(0),
	combout => \inst2|cnt_segcon[0]~2_combout\);

-- Location: LCFF_X24_Y16_N19
\inst2|cnt_segcon[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|cnt_segcon[0]~2_combout\,
	ena => \XnRESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|cnt_segcon\(0));

-- Location: LCCOMB_X25_Y16_N12
\inst2|cnt_segcon~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|cnt_segcon~0_combout\ = (\inst2|cnt_segcon\(0) & (!\inst2|cnt_segcon\(1) & !\inst2|cnt_segcon\(2))) # (!\inst2|cnt_segcon\(0) & (\inst2|cnt_segcon\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|cnt_segcon\(1),
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|cnt_segcon~0_combout\);

-- Location: LCFF_X25_Y16_N13
\inst2|cnt_segcon[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|cnt_segcon~0_combout\,
	ena => \XnRESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|cnt_segcon\(1));

-- Location: LCCOMB_X25_Y16_N0
\inst2|cnt_segcon~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|cnt_segcon~1_combout\ = (\inst2|cnt_segcon\(0) & \inst2|cnt_segcon\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|cnt_segcon\(0),
	datad => \inst2|cnt_segcon\(1),
	combout => \inst2|cnt_segcon~1_combout\);

-- Location: LCCOMB_X25_Y16_N14
\inst2|cnt_segcon[0]~_wirecell\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|cnt_segcon[0]~_wirecell_combout\ = !\inst2|cnt_segcon\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2|cnt_segcon\(0),
	combout => \inst2|cnt_segcon[0]~_wirecell_combout\);

-- Location: LCFF_X25_Y16_N1
\inst2|cnt_segcon[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|cnt_segcon~1_combout\,
	sdata => \inst2|cnt_segcon[0]~_wirecell_combout\,
	sload => \inst2|cnt_segcon\(2),
	ena => \XnRESET~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|cnt_segcon\(2));

-- Location: LCCOMB_X25_Y17_N8
\inst2|Decoder6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Decoder6~0_combout\ = (\inst2|cnt_segcon\(1)) # ((\inst2|cnt_segcon\(0)) # (\inst2|cnt_segcon\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|cnt_segcon\(0),
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|Decoder6~0_combout\);

-- Location: LCFF_X25_Y17_N9
\inst2|SEG_COM[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Decoder6~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_COM\(5));

-- Location: LCCOMB_X25_Y17_N2
\inst2|Decoder6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Decoder6~1_combout\ = (\inst2|cnt_segcon\(1)) # ((\inst2|cnt_segcon\(2)) # (!\inst2|cnt_segcon\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|cnt_segcon\(0),
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|Decoder6~1_combout\);

-- Location: LCFF_X25_Y17_N3
\inst2|SEG_COM[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Decoder6~1_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_COM\(4));

-- Location: LCCOMB_X25_Y17_N20
\inst2|Decoder6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Decoder6~2_combout\ = ((\inst2|cnt_segcon\(0)) # (\inst2|cnt_segcon\(2))) # (!\inst2|cnt_segcon\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|cnt_segcon\(0),
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|Decoder6~2_combout\);

-- Location: LCFF_X25_Y17_N21
\inst2|SEG_COM[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Decoder6~2_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_COM\(3));

-- Location: LCCOMB_X25_Y17_N22
\inst2|Decoder6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Decoder6~3_combout\ = ((\inst2|cnt_segcon\(2)) # (!\inst2|cnt_segcon\(0))) # (!\inst2|cnt_segcon\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|cnt_segcon\(0),
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|Decoder6~3_combout\);

-- Location: LCFF_X25_Y17_N23
\inst2|SEG_COM[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Decoder6~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_COM\(2));

-- Location: LCCOMB_X25_Y16_N2
\inst2|Decoder6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Decoder6~4_combout\ = (\inst2|cnt_segcon\(1)) # ((\inst2|cnt_segcon\(0)) # (!\inst2|cnt_segcon\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|cnt_segcon\(0),
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|Decoder6~4_combout\);

-- Location: LCFF_X25_Y16_N3
\inst2|SEG_COM[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Decoder6~4_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_COM\(1));

-- Location: LCCOMB_X25_Y16_N20
\inst2|Decoder6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Decoder6~5_combout\ = (\inst2|cnt_segcon\(1)) # ((!\inst2|cnt_segcon\(2)) # (!\inst2|cnt_segcon\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|cnt_segcon\(0),
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|Decoder6~5_combout\);

-- Location: LCFF_X25_Y16_N21
\inst2|SEG_COM[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Decoder6~5_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_COM\(0));

-- Location: LCFF_X30_Y15_N15
\inst|Hdi[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	sdata => XM0DATA(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(6));

-- Location: LCCOMB_X26_Y15_N12
\inst2|x8800_0010[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[6]~feeder_combout\ = \inst|Hdi\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(6),
	combout => \inst2|x8800_0010[6]~feeder_combout\);

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(12),
	combout => \XM0_ADDR~combout\(12));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(6),
	combout => \XM0_ADDR~combout\(6));

-- Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(7),
	combout => \XM0_ADDR~combout\(7));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(8),
	combout => \XM0_ADDR~combout\(8));

-- Location: LCCOMB_X33_Y14_N0
\inst2|x8800_0010[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[0]~4_combout\ = (!\XM0_ADDR~combout\(9) & (!\XM0_ADDR~combout\(6) & (!\XM0_ADDR~combout\(7) & !\XM0_ADDR~combout\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XM0_ADDR~combout\(9),
	datab => \XM0_ADDR~combout\(6),
	datac => \XM0_ADDR~combout\(7),
	datad => \XM0_ADDR~combout\(8),
	combout => \inst2|x8800_0010[0]~4_combout\);

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(13),
	combout => \XM0_ADDR~combout\(13));

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(11),
	combout => \XM0_ADDR~combout\(11));

-- Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(10),
	combout => \XM0_ADDR~combout\(10));

-- Location: LCCOMB_X33_Y12_N0
\inst2|x8800_0010[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[0]~3_combout\ = (!\XM0_ADDR~combout\(14) & (!\XM0_ADDR~combout\(13) & (!\XM0_ADDR~combout\(11) & !\XM0_ADDR~combout\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XM0_ADDR~combout\(14),
	datab => \XM0_ADDR~combout\(13),
	datac => \XM0_ADDR~combout\(11),
	datad => \XM0_ADDR~combout\(10),
	combout => \inst2|x8800_0010[0]~3_combout\);

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(19),
	combout => \XM0_ADDR~combout\(19));

-- Location: LCCOMB_X33_Y15_N28
\inst2|x8800_0010[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[0]~1_combout\ = (!\XM0WEN~combout\ & (\XM0OEN~combout\ & (!\CPLD_0~combout\ & !\XM0_ADDR~combout\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XM0WEN~combout\,
	datab => \XM0OEN~combout\,
	datac => \CPLD_0~combout\,
	datad => \XM0_ADDR~combout\(19),
	combout => \inst2|x8800_0010[0]~1_combout\);

-- Location: LCCOMB_X33_Y15_N4
\inst2|x8800_0010[0]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[0]~5_combout\ = (\inst2|x8800_0010[0]~2_combout\ & (\inst2|x8800_0010[0]~4_combout\ & (\inst2|x8800_0010[0]~3_combout\ & \inst2|x8800_0010[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|x8800_0010[0]~2_combout\,
	datab => \inst2|x8800_0010[0]~4_combout\,
	datac => \inst2|x8800_0010[0]~3_combout\,
	datad => \inst2|x8800_0010[0]~1_combout\,
	combout => \inst2|x8800_0010[0]~5_combout\);

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(4),
	combout => \XM0_ADDR~combout\(4));

-- Location: LCCOMB_X33_Y15_N30
\inst2|x8800_0010[0]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[0]~6_combout\ = (\inst2|x8800_0010[0]~0_combout\ & (!\XM0_ADDR~combout\(12) & (\inst2|x8800_0010[0]~5_combout\ & \XM0_ADDR~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|x8800_0010[0]~0_combout\,
	datab => \XM0_ADDR~combout\(12),
	datac => \inst2|x8800_0010[0]~5_combout\,
	datad => \XM0_ADDR~combout\(4),
	combout => \inst2|x8800_0010[0]~6_combout\);

-- Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(1),
	combout => \XM0_ADDR~combout\(1));

-- Location: LCCOMB_X33_Y15_N26
\inst2|x8800_0010[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[0]~7_combout\ = (\inst2|x8800_0010[0]~6_combout\ & !\XM0_ADDR~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|x8800_0010[0]~6_combout\,
	datad => \XM0_ADDR~combout\(1),
	combout => \inst2|x8800_0010[0]~7_combout\);

-- Location: LCFF_X26_Y15_N13
\inst2|x8800_0010[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[6]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(6));

-- Location: LCCOMB_X33_Y15_N24
\inst|Hdi[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[1]~feeder_combout\ = XM0DATA(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(1),
	combout => \inst|Hdi[1]~feeder_combout\);

-- Location: LCFF_X33_Y15_N25
\inst|Hdi[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(1));

-- Location: LCCOMB_X33_Y15_N18
\inst2|x8800_1000[3]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_1000[3]~0_combout\ = (!\XM0_ADDR~combout\(1) & (\XM0_ADDR~combout\(12) & !\XM0_ADDR~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XM0_ADDR~combout\(1),
	datac => \XM0_ADDR~combout\(12),
	datad => \XM0_ADDR~combout\(4),
	combout => \inst2|x8800_1000[3]~0_combout\);

-- Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(2),
	combout => \XM0_ADDR~combout\(2));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(3),
	combout => \XM0_ADDR~combout\(3));

-- Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(0),
	combout => \XM0_ADDR~combout\(0));

-- Location: LCCOMB_X33_Y15_N12
\inst2|x8800_0010[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[0]~0_combout\ = (!\XM0_ADDR~combout\(5) & (!\XM0_ADDR~combout\(2) & (!\XM0_ADDR~combout\(3) & !\XM0_ADDR~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XM0_ADDR~combout\(5),
	datab => \XM0_ADDR~combout\(2),
	datac => \XM0_ADDR~combout\(3),
	datad => \XM0_ADDR~combout\(0),
	combout => \inst2|x8800_0010[0]~0_combout\);

-- Location: LCCOMB_X33_Y15_N16
\inst2|x8800_1000[3]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_1000[3]~1_combout\ = (\inst2|x8800_1000[3]~0_combout\ & (\inst2|x8800_0010[0]~5_combout\ & \inst2|x8800_0010[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|x8800_1000[3]~0_combout\,
	datac => \inst2|x8800_0010[0]~5_combout\,
	datad => \inst2|x8800_0010[0]~0_combout\,
	combout => \inst2|x8800_1000[3]~1_combout\);

-- Location: LCFF_X33_Y15_N1
\inst2|x8800_1000[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(1),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_1000[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_1000\(1));

-- Location: LCCOMB_X33_Y15_N14
\inst|Hdi[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[2]~feeder_combout\ = XM0DATA(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(2),
	combout => \inst|Hdi[2]~feeder_combout\);

-- Location: LCFF_X33_Y15_N15
\inst|Hdi[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(2));

-- Location: LCFF_X33_Y15_N23
\inst2|x8800_1000[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(2),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_1000[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_1000\(2));

-- Location: LCFF_X33_Y15_N11
\inst|Hdi[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	sdata => XM0DATA(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(0));

-- Location: LCCOMB_X33_Y15_N6
\inst2|x8800_1000[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_1000[0]~feeder_combout\ = \inst|Hdi\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(0),
	combout => \inst2|x8800_1000[0]~feeder_combout\);

-- Location: LCFF_X33_Y15_N7
\inst2|x8800_1000[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_1000[0]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_1000[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_1000\(0));

-- Location: LCCOMB_X33_Y15_N22
\inst3|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~0_combout\ = (!\inst2|x8800_1000\(3) & (!\inst2|x8800_1000\(1) & (!\inst2|x8800_1000\(2) & \inst2|x8800_1000\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|x8800_1000\(3),
	datab => \inst2|x8800_1000\(1),
	datac => \inst2|x8800_1000\(2),
	datad => \inst2|x8800_1000\(0),
	combout => \inst3|Selector1~0_combout\);

-- Location: LCCOMB_X18_Y15_N12
\inst3|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~1_combout\ = (\inst3|state.IDLE~regout\ & (!\inst3|Equal1~10_combout\ & (\inst3|state.RUNNING~regout\))) # (!\inst3|state.IDLE~regout\ & ((\inst3|Selector1~0_combout\) # ((!\inst3|Equal1~10_combout\ & \inst3|state.RUNNING~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.IDLE~regout\,
	datab => \inst3|Equal1~10_combout\,
	datac => \inst3|state.RUNNING~regout\,
	datad => \inst3|Selector1~0_combout\,
	combout => \inst3|Selector1~1_combout\);

-- Location: LCFF_X18_Y15_N13
\inst3|state.RUNNING\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector1~1_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|state.RUNNING~regout\);

-- Location: LCCOMB_X16_Y15_N18
\inst3|Selector16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector16~0_combout\ = (\inst3|Add2~36_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|state.COMPLETE~regout\ & \inst3|cnt_clk\(18))))) # (!\inst3|Add2~36_combout\ & (\inst3|state.COMPLETE~regout\ & (\inst3|cnt_clk\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~36_combout\,
	datab => \inst3|state.COMPLETE~regout\,
	datac => \inst3|cnt_clk\(18),
	datad => \inst3|state.RUNNING~regout\,
	combout => \inst3|Selector16~0_combout\);

-- Location: LCFF_X16_Y15_N19
\inst3|cnt_clk[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector16~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(18));

-- Location: LCCOMB_X16_Y15_N28
\inst3|Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector17~0_combout\ = (\inst3|Add2~34_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|state.COMPLETE~regout\ & \inst3|cnt_clk\(17))))) # (!\inst3|Add2~34_combout\ & (\inst3|state.COMPLETE~regout\ & (\inst3|cnt_clk\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~34_combout\,
	datab => \inst3|state.COMPLETE~regout\,
	datac => \inst3|cnt_clk\(17),
	datad => \inst3|state.RUNNING~regout\,
	combout => \inst3|Selector17~0_combout\);

-- Location: LCFF_X16_Y15_N29
\inst3|cnt_clk[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector17~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(17));

-- Location: LCCOMB_X16_Y15_N20
\inst3|Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector20~0_combout\ = (\inst3|Add2~28_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|state.COMPLETE~regout\ & \inst3|cnt_clk\(14))))) # (!\inst3|Add2~28_combout\ & (\inst3|state.COMPLETE~regout\ & (\inst3|cnt_clk\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~28_combout\,
	datab => \inst3|state.COMPLETE~regout\,
	datac => \inst3|cnt_clk\(14),
	datad => \inst3|state.RUNNING~regout\,
	combout => \inst3|Selector20~0_combout\);

-- Location: LCFF_X16_Y15_N21
\inst3|cnt_clk[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector20~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(14));

-- Location: LCCOMB_X18_Y16_N14
\inst3|Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector23~0_combout\ = (\inst3|Add2~22_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(11) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~22_combout\ & (((\inst3|cnt_clk\(11) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~22_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(11),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector23~0_combout\);

-- Location: LCFF_X18_Y16_N15
\inst3|cnt_clk[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector23~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(11));

-- Location: LCCOMB_X18_Y16_N10
\inst3|Selector24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector24~0_combout\ = (\inst3|Add2~20_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(10) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~20_combout\ & (((\inst3|cnt_clk\(10) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~20_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(10),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector24~0_combout\);

-- Location: LCFF_X18_Y16_N11
\inst3|cnt_clk[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector24~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(10));

-- Location: LCCOMB_X18_Y16_N12
\inst3|Selector25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector25~0_combout\ = (\inst3|Add2~18_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(9) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~18_combout\ & (((\inst3|cnt_clk\(9) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~18_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(9),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector25~0_combout\);

-- Location: LCFF_X18_Y16_N13
\inst3|cnt_clk[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector25~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(9));

-- Location: LCCOMB_X18_Y16_N24
\inst3|Selector26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector26~0_combout\ = (\inst3|Add2~16_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(8) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~16_combout\ & (((\inst3|cnt_clk\(8) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~16_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(8),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector26~0_combout\);

-- Location: LCFF_X18_Y16_N25
\inst3|cnt_clk[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector26~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(8));

-- Location: LCCOMB_X18_Y16_N28
\inst3|Selector27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector27~0_combout\ = (\inst3|Add2~14_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(7) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~14_combout\ & (((\inst3|cnt_clk\(7) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~14_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(7),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector27~0_combout\);

-- Location: LCFF_X18_Y16_N29
\inst3|cnt_clk[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector27~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(7));

-- Location: LCCOMB_X18_Y16_N18
\inst3|Selector28~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector28~0_combout\ = (\inst3|Add2~12_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(6) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~12_combout\ & (((\inst3|cnt_clk\(6) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~12_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(6),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector28~0_combout\);

-- Location: LCFF_X18_Y16_N19
\inst3|cnt_clk[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector28~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(6));

-- Location: LCCOMB_X18_Y16_N0
\inst3|Selector30~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector30~0_combout\ = (\inst3|Add2~8_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(4) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~8_combout\ & (((\inst3|cnt_clk\(4) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~8_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(4),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector30~0_combout\);

-- Location: LCFF_X18_Y16_N1
\inst3|cnt_clk[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector30~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(4));

-- Location: LCCOMB_X18_Y16_N20
\inst3|Selector33~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector33~0_combout\ = (\inst3|Add2~2_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(1) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~2_combout\ & (((\inst3|cnt_clk\(1) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~2_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(1),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector33~0_combout\);

-- Location: LCFF_X18_Y16_N21
\inst3|cnt_clk[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector33~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(1));

-- Location: LCCOMB_X18_Y16_N8
\inst3|Selector34~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector34~0_combout\ = (\inst3|Add2~0_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(0) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~0_combout\ & (((\inst3|cnt_clk\(0) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~0_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(0),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector34~0_combout\);

-- Location: LCFF_X18_Y16_N9
\inst3|cnt_clk[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector34~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(0));

-- Location: LCCOMB_X17_Y16_N4
\inst3|Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~4_combout\ = (\inst3|cnt_clk\(2) & (\inst3|Add2~3\ $ (GND))) # (!\inst3|cnt_clk\(2) & (!\inst3|Add2~3\ & VCC))
-- \inst3|Add2~5\ = CARRY((\inst3|cnt_clk\(2) & !\inst3|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(2),
	datad => VCC,
	cin => \inst3|Add2~3\,
	combout => \inst3|Add2~4_combout\,
	cout => \inst3|Add2~5\);

-- Location: LCCOMB_X18_Y16_N30
\inst3|Selector32~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector32~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~4_combout\) # ((\inst3|cnt_clk\(2) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(2) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~4_combout\,
	datac => \inst3|cnt_clk\(2),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector32~0_combout\);

-- Location: LCFF_X18_Y16_N31
\inst3|cnt_clk[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector32~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(2));

-- Location: LCCOMB_X17_Y16_N24
\inst3|Add2~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~24_combout\ = (\inst3|cnt_clk\(12) & (\inst3|Add2~23\ $ (GND))) # (!\inst3|cnt_clk\(12) & (!\inst3|Add2~23\ & VCC))
-- \inst3|Add2~25\ = CARRY((\inst3|cnt_clk\(12) & !\inst3|Add2~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(12),
	datad => VCC,
	cin => \inst3|Add2~23\,
	combout => \inst3|Add2~24_combout\,
	cout => \inst3|Add2~25\);

-- Location: LCCOMB_X17_Y15_N0
\inst3|Add2~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~32_combout\ = (\inst3|cnt_clk\(16) & (\inst3|Add2~31\ $ (GND))) # (!\inst3|cnt_clk\(16) & (!\inst3|Add2~31\ & VCC))
-- \inst3|Add2~33\ = CARRY((\inst3|cnt_clk\(16) & !\inst3|Add2~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(16),
	datad => VCC,
	cin => \inst3|Add2~31\,
	combout => \inst3|Add2~32_combout\,
	cout => \inst3|Add2~33\);

-- Location: LCCOMB_X17_Y15_N6
\inst3|Add2~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~38_combout\ = (\inst3|cnt_clk\(19) & (!\inst3|Add2~37\)) # (!\inst3|cnt_clk\(19) & ((\inst3|Add2~37\) # (GND)))
-- \inst3|Add2~39\ = CARRY((!\inst3|Add2~37\) # (!\inst3|cnt_clk\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(19),
	datad => VCC,
	cin => \inst3|Add2~37\,
	combout => \inst3|Add2~38_combout\,
	cout => \inst3|Add2~39\);

-- Location: LCCOMB_X16_Y15_N16
\inst3|Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector15~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~38_combout\) # ((\inst3|cnt_clk\(19) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(19) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~38_combout\,
	datac => \inst3|cnt_clk\(19),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector15~0_combout\);

-- Location: LCFF_X16_Y15_N17
\inst3|cnt_clk[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector15~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(19));

-- Location: LCCOMB_X17_Y15_N8
\inst3|Add2~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~40_combout\ = (\inst3|cnt_clk\(20) & (\inst3|Add2~39\ $ (GND))) # (!\inst3|cnt_clk\(20) & (!\inst3|Add2~39\ & VCC))
-- \inst3|Add2~41\ = CARRY((\inst3|cnt_clk\(20) & !\inst3|Add2~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(20),
	datad => VCC,
	cin => \inst3|Add2~39\,
	combout => \inst3|Add2~40_combout\,
	cout => \inst3|Add2~41\);

-- Location: LCCOMB_X16_Y15_N26
\inst3|Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector14~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~40_combout\) # ((\inst3|cnt_clk\(20) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(20) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~40_combout\,
	datac => \inst3|cnt_clk\(20),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector14~0_combout\);

-- Location: LCFF_X16_Y15_N27
\inst3|cnt_clk[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector14~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(20));

-- Location: LCCOMB_X17_Y15_N10
\inst3|Add2~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~42_combout\ = (\inst3|cnt_clk\(21) & (!\inst3|Add2~41\)) # (!\inst3|cnt_clk\(21) & ((\inst3|Add2~41\) # (GND)))
-- \inst3|Add2~43\ = CARRY((!\inst3|Add2~41\) # (!\inst3|cnt_clk\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(21),
	datad => VCC,
	cin => \inst3|Add2~41\,
	combout => \inst3|Add2~42_combout\,
	cout => \inst3|Add2~43\);

-- Location: LCCOMB_X16_Y15_N6
\inst3|Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector13~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~42_combout\) # ((\inst3|cnt_clk\(21) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(21) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~42_combout\,
	datac => \inst3|cnt_clk\(21),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector13~0_combout\);

-- Location: LCFF_X16_Y15_N7
\inst3|cnt_clk[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector13~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(21));

-- Location: LCCOMB_X17_Y15_N12
\inst3|Add2~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~44_combout\ = (\inst3|cnt_clk\(22) & (\inst3|Add2~43\ $ (GND))) # (!\inst3|cnt_clk\(22) & (!\inst3|Add2~43\ & VCC))
-- \inst3|Add2~45\ = CARRY((\inst3|cnt_clk\(22) & !\inst3|Add2~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(22),
	datad => VCC,
	cin => \inst3|Add2~43\,
	combout => \inst3|Add2~44_combout\,
	cout => \inst3|Add2~45\);

-- Location: LCCOMB_X16_Y15_N4
\inst3|Selector12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector12~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~44_combout\) # ((\inst3|cnt_clk\(22) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(22) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~44_combout\,
	datac => \inst3|cnt_clk\(22),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector12~0_combout\);

-- Location: LCFF_X16_Y15_N5
\inst3|cnt_clk[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector12~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(22));

-- Location: LCCOMB_X17_Y15_N14
\inst3|Add2~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~46_combout\ = (\inst3|cnt_clk\(23) & (!\inst3|Add2~45\)) # (!\inst3|cnt_clk\(23) & ((\inst3|Add2~45\) # (GND)))
-- \inst3|Add2~47\ = CARRY((!\inst3|Add2~45\) # (!\inst3|cnt_clk\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(23),
	datad => VCC,
	cin => \inst3|Add2~45\,
	combout => \inst3|Add2~46_combout\,
	cout => \inst3|Add2~47\);

-- Location: LCCOMB_X16_Y15_N24
\inst3|Selector11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector11~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~46_combout\) # ((\inst3|cnt_clk\(23) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(23) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~46_combout\,
	datac => \inst3|cnt_clk\(23),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector11~0_combout\);

-- Location: LCFF_X16_Y15_N25
\inst3|cnt_clk[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector11~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(23));

-- Location: LCCOMB_X18_Y15_N18
\inst3|Equal1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~2_combout\ = (\inst3|cnt_clk\(20) & (!\inst3|cnt_clk\(21) & (\inst3|cnt_clk\(23) & !\inst3|cnt_clk\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(20),
	datab => \inst3|cnt_clk\(21),
	datac => \inst3|cnt_clk\(23),
	datad => \inst3|cnt_clk\(22),
	combout => \inst3|Equal1~2_combout\);

-- Location: LCCOMB_X16_Y15_N30
\inst3|Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector18~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~32_combout\) # ((\inst3|cnt_clk\(16) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(16) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~32_combout\,
	datac => \inst3|cnt_clk\(16),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector18~0_combout\);

-- Location: LCFF_X16_Y15_N31
\inst3|cnt_clk[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector18~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(16));

-- Location: LCCOMB_X18_Y15_N4
\inst3|Equal1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~3_combout\ = (\inst3|cnt_clk\(19) & (!\inst3|cnt_clk\(17) & (!\inst3|cnt_clk\(18) & !\inst3|cnt_clk\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(19),
	datab => \inst3|cnt_clk\(17),
	datac => \inst3|cnt_clk\(18),
	datad => \inst3|cnt_clk\(16),
	combout => \inst3|Equal1~3_combout\);

-- Location: LCCOMB_X17_Y15_N24
\inst3|Add2~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~56_combout\ = (\inst3|cnt_clk\(28) & (\inst3|Add2~55\ $ (GND))) # (!\inst3|cnt_clk\(28) & (!\inst3|Add2~55\ & VCC))
-- \inst3|Add2~57\ = CARRY((\inst3|cnt_clk\(28) & !\inst3|Add2~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(28),
	datad => VCC,
	cin => \inst3|Add2~55\,
	combout => \inst3|Add2~56_combout\,
	cout => \inst3|Add2~57\);

-- Location: LCCOMB_X18_Y15_N28
\inst3|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector6~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~56_combout\) # ((\inst3|cnt_clk\(28) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(28) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~56_combout\,
	datac => \inst3|cnt_clk\(28),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector6~0_combout\);

-- Location: LCFF_X18_Y15_N29
\inst3|cnt_clk[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector6~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(28));

-- Location: LCCOMB_X17_Y15_N26
\inst3|Add2~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~58_combout\ = (\inst3|cnt_clk\(29) & (!\inst3|Add2~57\)) # (!\inst3|cnt_clk\(29) & ((\inst3|Add2~57\) # (GND)))
-- \inst3|Add2~59\ = CARRY((!\inst3|Add2~57\) # (!\inst3|cnt_clk\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst3|cnt_clk\(29),
	datad => VCC,
	cin => \inst3|Add2~57\,
	combout => \inst3|Add2~58_combout\,
	cout => \inst3|Add2~59\);

-- Location: LCCOMB_X18_Y15_N10
\inst3|Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector5~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~58_combout\) # ((\inst3|cnt_clk\(29) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(29) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~58_combout\,
	datac => \inst3|cnt_clk\(29),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector5~0_combout\);

-- Location: LCFF_X18_Y15_N11
\inst3|cnt_clk[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector5~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(29));

-- Location: LCCOMB_X18_Y15_N8
\inst3|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~60_combout\) # ((\inst3|cnt_clk\(30) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(30) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~60_combout\,
	datac => \inst3|cnt_clk\(30),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector4~0_combout\);

-- Location: LCFF_X18_Y15_N9
\inst3|cnt_clk[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector4~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(30));

-- Location: LCCOMB_X18_Y15_N6
\inst3|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector3~0_combout\ = (\inst3|Add2~62_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|state.COMPLETE~regout\ & \inst3|cnt_clk\(31))))) # (!\inst3|Add2~62_combout\ & (\inst3|state.COMPLETE~regout\ & (\inst3|cnt_clk\(31))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~62_combout\,
	datab => \inst3|state.COMPLETE~regout\,
	datac => \inst3|cnt_clk\(31),
	datad => \inst3|state.RUNNING~regout\,
	combout => \inst3|Selector3~0_combout\);

-- Location: LCFF_X18_Y15_N7
\inst3|cnt_clk[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector3~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(31));

-- Location: LCCOMB_X18_Y15_N30
\inst3|Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~0_combout\ = (!\inst3|cnt_clk\(29) & (!\inst3|cnt_clk\(28) & (!\inst3|cnt_clk\(30) & !\inst3|cnt_clk\(31))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(29),
	datab => \inst3|cnt_clk\(28),
	datac => \inst3|cnt_clk\(30),
	datad => \inst3|cnt_clk\(31),
	combout => \inst3|Equal1~0_combout\);

-- Location: LCCOMB_X18_Y15_N22
\inst3|Equal1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~4_combout\ = (\inst3|Equal1~1_combout\ & (\inst3|Equal1~2_combout\ & (\inst3|Equal1~3_combout\ & \inst3|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~1_combout\,
	datab => \inst3|Equal1~2_combout\,
	datac => \inst3|Equal1~3_combout\,
	datad => \inst3|Equal1~0_combout\,
	combout => \inst3|Equal1~4_combout\);

-- Location: LCCOMB_X16_Y15_N0
\inst3|Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector19~0_combout\ = (\inst3|Add2~30_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|state.COMPLETE~regout\ & \inst3|cnt_clk\(15))))) # (!\inst3|Add2~30_combout\ & (\inst3|state.COMPLETE~regout\ & (\inst3|cnt_clk\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~30_combout\,
	datab => \inst3|state.COMPLETE~regout\,
	datac => \inst3|cnt_clk\(15),
	datad => \inst3|state.RUNNING~regout\,
	combout => \inst3|Selector19~0_combout\);

-- Location: LCFF_X16_Y15_N1
\inst3|cnt_clk[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector19~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(15));

-- Location: LCCOMB_X18_Y16_N16
\inst3|Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector21~0_combout\ = (\inst3|Add2~26_combout\ & ((\inst3|state.RUNNING~regout\) # ((\inst3|cnt_clk\(13) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|Add2~26_combout\ & (((\inst3|cnt_clk\(13) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~26_combout\,
	datab => \inst3|state.RUNNING~regout\,
	datac => \inst3|cnt_clk\(13),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector21~0_combout\);

-- Location: LCFF_X18_Y16_N17
\inst3|cnt_clk[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector21~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(13));

-- Location: LCCOMB_X16_Y15_N2
\inst3|Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector22~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Add2~24_combout\) # ((\inst3|cnt_clk\(12) & \inst3|state.COMPLETE~regout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|cnt_clk\(12) & \inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Add2~24_combout\,
	datac => \inst3|cnt_clk\(12),
	datad => \inst3|state.COMPLETE~regout\,
	combout => \inst3|Selector22~0_combout\);

-- Location: LCFF_X16_Y15_N3
\inst3|cnt_clk[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector22~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|cnt_clk\(12));

-- Location: LCCOMB_X16_Y15_N22
\inst3|Equal1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~5_combout\ = (!\inst3|cnt_clk\(14) & (\inst3|cnt_clk\(15) & (!\inst3|cnt_clk\(13) & \inst3|cnt_clk\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(14),
	datab => \inst3|cnt_clk\(15),
	datac => \inst3|cnt_clk\(13),
	datad => \inst3|cnt_clk\(12),
	combout => \inst3|Equal1~5_combout\);

-- Location: LCCOMB_X18_Y16_N2
\inst3|Equal1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~6_combout\ = (\inst3|cnt_clk\(10) & (!\inst3|cnt_clk\(8) & (!\inst3|cnt_clk\(11) & \inst3|cnt_clk\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|cnt_clk\(10),
	datab => \inst3|cnt_clk\(8),
	datac => \inst3|cnt_clk\(11),
	datad => \inst3|cnt_clk\(9),
	combout => \inst3|Equal1~6_combout\);

-- Location: LCCOMB_X18_Y15_N14
\inst3|Equal1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Equal1~10_combout\ = (\inst3|Equal1~9_combout\ & (\inst3|Equal1~4_combout\ & (\inst3|Equal1~5_combout\ & \inst3|Equal1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Equal1~9_combout\,
	datab => \inst3|Equal1~4_combout\,
	datac => \inst3|Equal1~5_combout\,
	datad => \inst3|Equal1~6_combout\,
	combout => \inst3|Equal1~10_combout\);

-- Location: LCCOMB_X33_Y15_N0
\inst3|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~0_combout\ = (!\inst2|x8800_1000\(3) & (!\inst2|x8800_1000\(2) & (\inst2|x8800_1000\(1) & !\inst2|x8800_1000\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|x8800_1000\(3),
	datab => \inst2|x8800_1000\(2),
	datac => \inst2|x8800_1000\(1),
	datad => \inst2|x8800_1000\(0),
	combout => \inst3|Selector0~0_combout\);

-- Location: LCCOMB_X18_Y15_N26
\inst3|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector2~0_combout\ = (\inst3|state.RUNNING~regout\ & ((\inst3|Equal1~10_combout\) # ((\inst3|state.COMPLETE~regout\ & !\inst3|Selector0~0_combout\)))) # (!\inst3|state.RUNNING~regout\ & (((\inst3|state.COMPLETE~regout\ & 
-- !\inst3|Selector0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|state.RUNNING~regout\,
	datab => \inst3|Equal1~10_combout\,
	datac => \inst3|state.COMPLETE~regout\,
	datad => \inst3|Selector0~0_combout\,
	combout => \inst3|Selector2~0_combout\);

-- Location: LCFF_X18_Y15_N27
\inst3|state.COMPLETE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector2~0_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|state.COMPLETE~regout\);

-- Location: LCCOMB_X18_Y15_N24
\inst3|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~1_combout\ = (\inst3|Selector1~0_combout\ & (((!\inst3|Selector0~0_combout\)) # (!\inst3|state.COMPLETE~regout\))) # (!\inst3|Selector1~0_combout\ & (\inst3|state.IDLE~regout\ & ((!\inst3|Selector0~0_combout\) # 
-- (!\inst3|state.COMPLETE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector1~0_combout\,
	datab => \inst3|state.COMPLETE~regout\,
	datac => \inst3|state.IDLE~regout\,
	datad => \inst3|Selector0~0_combout\,
	combout => \inst3|Selector0~1_combout\);

-- Location: LCFF_X18_Y15_N25
\inst3|state.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst3|Selector0~1_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|state.IDLE~regout\);

-- Location: LCFF_X25_Y15_N5
\inst3|s_const2[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(6),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(6));

-- Location: LCFF_X30_Y15_N27
\inst|Hdi[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	sdata => XM0DATA(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(4));

-- Location: LCCOMB_X26_Y15_N8
\inst2|x8800_0010[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[4]~feeder_combout\ = \inst|Hdi\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(4),
	combout => \inst2|x8800_0010[4]~feeder_combout\);

-- Location: LCFF_X26_Y15_N9
\inst2|x8800_0010[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[4]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(4));

-- Location: LCFF_X25_Y15_N9
\inst3|s_const2[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(4),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(4));

-- Location: LCCOMB_X30_Y15_N28
\inst|Hdi[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[5]~feeder_combout\ = XM0DATA(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(5),
	combout => \inst|Hdi[5]~feeder_combout\);

-- Location: LCFF_X30_Y15_N29
\inst|Hdi[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(5));

-- Location: LCCOMB_X26_Y15_N26
\inst2|x8800_0010[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[5]~feeder_combout\ = \inst|Hdi\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(5),
	combout => \inst2|x8800_0010[5]~feeder_combout\);

-- Location: LCFF_X26_Y15_N27
\inst2|x8800_0010[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[5]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(5));

-- Location: LCFF_X25_Y15_N19
\inst3|s_const2[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(5),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(5));

-- Location: LCCOMB_X25_Y15_N8
\inst2|WideOr7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr7~0_combout\ = (\inst3|s_const2\(5) & (\inst3|s_const2\(7))) # (!\inst3|s_const2\(5) & (\inst3|s_const2\(6) $ (((!\inst3|s_const2\(7) & \inst3|s_const2\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(7),
	datab => \inst3|s_const2\(6),
	datac => \inst3|s_const2\(4),
	datad => \inst3|s_const2\(5),
	combout => \inst2|WideOr7~0_combout\);

-- Location: LCFF_X26_Y15_N19
\inst2|x8800_0010[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(1),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(1));

-- Location: LCFF_X25_Y15_N3
\inst3|s_const2[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(1),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(1));

-- Location: LCFF_X26_Y15_N1
\inst2|x8800_0010[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(0),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(0));

-- Location: LCFF_X25_Y15_N17
\inst3|s_const2[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(0),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(0));

-- Location: LCCOMB_X33_Y15_N2
\inst|Hdi[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[3]~feeder_combout\ = XM0DATA(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(3),
	combout => \inst|Hdi[3]~feeder_combout\);

-- Location: LCFF_X33_Y15_N3
\inst|Hdi[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(3));

-- Location: LCCOMB_X26_Y15_N14
\inst2|x8800_0010[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[3]~feeder_combout\ = \inst|Hdi\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(3),
	combout => \inst2|x8800_0010[3]~feeder_combout\);

-- Location: LCFF_X26_Y15_N15
\inst2|x8800_0010[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[3]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(3));

-- Location: LCFF_X25_Y15_N23
\inst3|s_const2[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(3),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(3));

-- Location: LCCOMB_X25_Y15_N16
\inst2|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr0~0_combout\ = (\inst3|s_const2\(1) & (((\inst3|s_const2\(3))))) # (!\inst3|s_const2\(1) & (\inst3|s_const2\(2) $ (((\inst3|s_const2\(0) & !\inst3|s_const2\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(2),
	datab => \inst3|s_const2\(1),
	datac => \inst3|s_const2\(0),
	datad => \inst3|s_const2\(3),
	combout => \inst2|WideOr0~0_combout\);

-- Location: LCCOMB_X25_Y15_N0
\inst2|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux0~0_combout\ = (\inst2|cnt_segcon\(0) & (((\inst2|cnt_segcon\(1))) # (!\inst2|WideOr7~0_combout\))) # (!\inst2|cnt_segcon\(0) & (((!\inst2|WideOr0~0_combout\ & !\inst2|cnt_segcon\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(0),
	datab => \inst2|WideOr7~0_combout\,
	datac => \inst2|WideOr0~0_combout\,
	datad => \inst2|cnt_segcon\(1),
	combout => \inst2|Mux0~0_combout\);

-- Location: LCCOMB_X30_Y15_N4
\inst|Hdi[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[13]~feeder_combout\ = XM0DATA(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(13),
	combout => \inst|Hdi[13]~feeder_combout\);

-- Location: LCFF_X30_Y15_N5
\inst|Hdi[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(13));

-- Location: LCCOMB_X29_Y15_N2
\inst2|x8800_0010[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[13]~feeder_combout\ = \inst|Hdi\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(13),
	combout => \inst2|x8800_0010[13]~feeder_combout\);

-- Location: LCFF_X29_Y15_N3
\inst2|x8800_0010[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[13]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(13));

-- Location: LCFF_X26_Y16_N19
\inst3|s_const2[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(13),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(13));

-- Location: LCCOMB_X30_Y15_N10
\inst|Hdi[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[12]~feeder_combout\ = XM0DATA(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(12),
	combout => \inst|Hdi[12]~feeder_combout\);

-- Location: LCFF_X30_Y15_N11
\inst|Hdi[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(12));

-- Location: LCFF_X29_Y15_N1
\inst2|x8800_0010[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(12),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(12));

-- Location: LCFF_X26_Y16_N17
\inst3|s_const2[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(12),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(12));

-- Location: LCCOMB_X30_Y15_N8
\inst|Hdi[15]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[15]~feeder_combout\ = XM0DATA(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(15),
	combout => \inst|Hdi[15]~feeder_combout\);

-- Location: LCFF_X30_Y15_N9
\inst|Hdi[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(15));

-- Location: LCFF_X29_Y15_N23
\inst2|x8800_0010[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(15),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(15));

-- Location: LCFF_X26_Y16_N15
\inst3|s_const2[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(15),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(15));

-- Location: LCCOMB_X26_Y16_N16
\inst2|WideOr21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr21~0_combout\ = (\inst3|s_const2\(13) & (((\inst3|s_const2\(15))))) # (!\inst3|s_const2\(13) & (\inst3|s_const2\(14) $ (((\inst3|s_const2\(12) & !\inst3|s_const2\(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(14),
	datab => \inst3|s_const2\(13),
	datac => \inst3|s_const2\(12),
	datad => \inst3|s_const2\(15),
	combout => \inst2|WideOr21~0_combout\);

-- Location: LCCOMB_X30_Y15_N12
\inst|Hdi[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[9]~feeder_combout\ = XM0DATA(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(9),
	combout => \inst|Hdi[9]~feeder_combout\);

-- Location: LCFF_X30_Y15_N13
\inst|Hdi[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(9));

-- Location: LCFF_X26_Y15_N3
\inst2|x8800_0010[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(9),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(9));

-- Location: LCFF_X26_Y16_N27
\inst3|s_const2[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(9),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(9));

-- Location: LCCOMB_X30_Y15_N16
\inst|Hdi[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[11]~feeder_combout\ = XM0DATA(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(11),
	combout => \inst|Hdi[11]~feeder_combout\);

-- Location: LCFF_X30_Y15_N17
\inst|Hdi[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[11]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(11));

-- Location: LCCOMB_X26_Y15_N22
\inst2|x8800_0010[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[11]~feeder_combout\ = \inst|Hdi\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(11),
	combout => \inst2|x8800_0010[11]~feeder_combout\);

-- Location: LCFF_X26_Y15_N23
\inst2|x8800_0010[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[11]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(11));

-- Location: LCFF_X26_Y16_N31
\inst3|s_const2[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(11),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(11));

-- Location: LCFF_X30_Y15_N19
\inst|Hdi[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	sdata => XM0DATA(8),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(8));

-- Location: LCCOMB_X26_Y15_N16
\inst2|x8800_0010[8]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[8]~feeder_combout\ = \inst|Hdi\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(8),
	combout => \inst2|x8800_0010[8]~feeder_combout\);

-- Location: LCFF_X26_Y15_N17
\inst2|x8800_0010[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[8]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(8));

-- Location: LCFF_X26_Y16_N1
\inst3|s_const2[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(8),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(8));

-- Location: LCCOMB_X26_Y16_N30
\inst2|WideOr14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr14~0_combout\ = (\inst3|s_const2\(9) & (((\inst3|s_const2\(11))))) # (!\inst3|s_const2\(9) & (\inst3|s_const2\(10) $ (((!\inst3|s_const2\(11) & \inst3|s_const2\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(10),
	datab => \inst3|s_const2\(9),
	datac => \inst3|s_const2\(11),
	datad => \inst3|s_const2\(8),
	combout => \inst2|WideOr14~0_combout\);

-- Location: LCCOMB_X25_Y16_N30
\inst2|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux0~1_combout\ = (\inst2|cnt_segcon\(1) & ((\inst2|Mux0~0_combout\ & (!\inst2|WideOr21~0_combout\)) # (!\inst2|Mux0~0_combout\ & ((!\inst2|WideOr14~0_combout\))))) # (!\inst2|cnt_segcon\(1) & (\inst2|Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|Mux0~0_combout\,
	datac => \inst2|WideOr21~0_combout\,
	datad => \inst2|WideOr14~0_combout\,
	combout => \inst2|Mux0~1_combout\);

-- Location: LCCOMB_X26_Y15_N20
\inst2|x8800_0012[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0012[6]~feeder_combout\ = \inst|Hdi\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(6),
	combout => \inst2|x8800_0012[6]~feeder_combout\);

-- Location: LCCOMB_X33_Y15_N8
\inst2|x8800_0012[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0012[0]~0_combout\ = (\inst2|x8800_0010[0]~6_combout\ & \XM0_ADDR~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|x8800_0010[0]~6_combout\,
	datad => \XM0_ADDR~combout\(1),
	combout => \inst2|x8800_0012[0]~0_combout\);

-- Location: LCFF_X26_Y15_N21
\inst2|x8800_0012[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0012[6]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0012[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0012\(6));

-- Location: LCFF_X26_Y17_N3
\inst3|s_const2[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0012\(6),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(22));

-- Location: LCCOMB_X26_Y15_N24
\inst2|x8800_0012[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0012[4]~feeder_combout\ = \inst|Hdi\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(4),
	combout => \inst2|x8800_0012[4]~feeder_combout\);

-- Location: LCFF_X26_Y15_N25
\inst2|x8800_0012[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0012[4]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0012[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0012\(4));

-- Location: LCFF_X26_Y17_N31
\inst3|s_const2[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0012\(4),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(20));

-- Location: LCCOMB_X26_Y15_N10
\inst2|x8800_0012[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0012[5]~feeder_combout\ = \inst|Hdi\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(5),
	combout => \inst2|x8800_0012[5]~feeder_combout\);

-- Location: LCFF_X26_Y15_N11
\inst2|x8800_0012[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0012[5]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0012[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0012\(5));

-- Location: LCFF_X26_Y17_N11
\inst3|s_const2[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0012\(5),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(21));

-- Location: LCCOMB_X26_Y17_N30
\inst2|WideOr35~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr35~0_combout\ = (\inst3|s_const2\(21) & (\inst3|s_const2\(23))) # (!\inst3|s_const2\(21) & (\inst3|s_const2\(22) $ (((!\inst3|s_const2\(23) & \inst3|s_const2\(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(23),
	datab => \inst3|s_const2\(22),
	datac => \inst3|s_const2\(20),
	datad => \inst3|s_const2\(21),
	combout => \inst2|WideOr35~0_combout\);

-- Location: LCFF_X26_Y17_N25
\inst2|x8800_0012[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(2),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0012[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0012\(2));

-- Location: LCFF_X26_Y17_N19
\inst3|s_const2[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0012\(2),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(18));

-- Location: LCCOMB_X26_Y17_N14
\inst2|x8800_0012[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0012[0]~feeder_combout\ = \inst|Hdi\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(0),
	combout => \inst2|x8800_0012[0]~feeder_combout\);

-- Location: LCFF_X26_Y17_N15
\inst2|x8800_0012[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0012[0]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0012[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0012\(0));

-- Location: LCFF_X26_Y17_N29
\inst3|s_const2[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0012\(0),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(16));

-- Location: LCCOMB_X26_Y17_N8
\inst2|x8800_0012[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0012[3]~feeder_combout\ = \inst|Hdi\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(3),
	combout => \inst2|x8800_0012[3]~feeder_combout\);

-- Location: LCFF_X26_Y17_N9
\inst2|x8800_0012[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0012[3]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0012[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0012\(3));

-- Location: LCFF_X26_Y17_N1
\inst3|s_const2[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0012\(3),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(19));

-- Location: LCCOMB_X26_Y17_N28
\inst2|WideOr28~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr28~0_combout\ = (\inst3|s_const2\(17) & (((\inst3|s_const2\(19))))) # (!\inst3|s_const2\(17) & (\inst3|s_const2\(18) $ (((\inst3|s_const2\(16) & !\inst3|s_const2\(19))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(17),
	datab => \inst3|s_const2\(18),
	datac => \inst3|s_const2\(16),
	datad => \inst3|s_const2\(19),
	combout => \inst2|WideOr28~0_combout\);

-- Location: LCCOMB_X25_Y16_N24
\inst2|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux0~2_combout\ = (\inst2|cnt_segcon\(0) & (!\inst2|WideOr35~0_combout\)) # (!\inst2|cnt_segcon\(0) & ((!\inst2|WideOr28~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr35~0_combout\,
	datad => \inst2|WideOr28~0_combout\,
	combout => \inst2|Mux0~2_combout\);

-- Location: LCCOMB_X25_Y16_N22
\inst2|Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux0~3_combout\ = (\inst2|cnt_segcon\(2) & (!\inst2|cnt_segcon\(1) & ((\inst2|Mux0~2_combout\)))) # (!\inst2|cnt_segcon\(2) & (((\inst2|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|Mux0~1_combout\,
	datac => \inst2|Mux0~2_combout\,
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|Mux0~3_combout\);

-- Location: LCFF_X25_Y16_N23
\inst2|SEG_DATA[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Mux0~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_DATA\(7));

-- Location: LCFF_X30_Y15_N31
\inst|Hdi[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	sdata => XM0DATA(14),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(14));

-- Location: LCCOMB_X29_Y15_N20
\inst2|x8800_0010[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[14]~feeder_combout\ = \inst|Hdi\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(14),
	combout => \inst2|x8800_0010[14]~feeder_combout\);

-- Location: LCFF_X29_Y15_N21
\inst2|x8800_0010[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[14]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(14));

-- Location: LCFF_X26_Y16_N21
\inst3|s_const2[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(14),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(14));

-- Location: LCCOMB_X26_Y16_N18
\inst2|WideOr22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr22~0_combout\ = (\inst3|s_const2\(14) & ((\inst3|s_const2\(15)) # (\inst3|s_const2\(12) $ (\inst3|s_const2\(13))))) # (!\inst3|s_const2\(14) & (((\inst3|s_const2\(13) & \inst3|s_const2\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(12),
	datab => \inst3|s_const2\(14),
	datac => \inst3|s_const2\(13),
	datad => \inst3|s_const2\(15),
	combout => \inst2|WideOr22~0_combout\);

-- Location: LCCOMB_X25_Y15_N18
\inst2|WideOr8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr8~0_combout\ = (\inst3|s_const2\(7) & ((\inst3|s_const2\(6)) # ((\inst3|s_const2\(5))))) # (!\inst3|s_const2\(7) & (\inst3|s_const2\(6) & (\inst3|s_const2\(5) $ (\inst3|s_const2\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(7),
	datab => \inst3|s_const2\(6),
	datac => \inst3|s_const2\(5),
	datad => \inst3|s_const2\(4),
	combout => \inst2|WideOr8~0_combout\);

-- Location: LCCOMB_X25_Y16_N18
\inst2|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux1~0_combout\ = (\inst2|cnt_segcon\(0) & (((\inst2|cnt_segcon\(1)) # (!\inst2|WideOr8~0_combout\)))) # (!\inst2|cnt_segcon\(0) & (!\inst2|WideOr1~0_combout\ & ((!\inst2|cnt_segcon\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|WideOr1~0_combout\,
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr8~0_combout\,
	datad => \inst2|cnt_segcon\(1),
	combout => \inst2|Mux1~0_combout\);

-- Location: LCCOMB_X26_Y16_N24
\inst2|WideOr15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr15~0_combout\ = (\inst3|s_const2\(10) & ((\inst3|s_const2\(11)) # (\inst3|s_const2\(9) $ (\inst3|s_const2\(8))))) # (!\inst3|s_const2\(10) & (\inst3|s_const2\(9) & (\inst3|s_const2\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(10),
	datab => \inst3|s_const2\(9),
	datac => \inst3|s_const2\(11),
	datad => \inst3|s_const2\(8),
	combout => \inst2|WideOr15~0_combout\);

-- Location: LCCOMB_X25_Y16_N28
\inst2|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux1~1_combout\ = (\inst2|cnt_segcon\(1) & ((\inst2|Mux1~0_combout\ & (!\inst2|WideOr22~0_combout\)) # (!\inst2|Mux1~0_combout\ & ((!\inst2|WideOr15~0_combout\))))) # (!\inst2|cnt_segcon\(1) & (((\inst2|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|WideOr22~0_combout\,
	datac => \inst2|Mux1~0_combout\,
	datad => \inst2|WideOr15~0_combout\,
	combout => \inst2|Mux1~1_combout\);

-- Location: LCCOMB_X25_Y16_N16
\inst2|Mux1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux1~3_combout\ = (\inst2|cnt_segcon\(2) & (\inst2|Mux1~2_combout\ & ((!\inst2|cnt_segcon\(1))))) # (!\inst2|cnt_segcon\(2) & (((\inst2|Mux1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Mux1~2_combout\,
	datab => \inst2|Mux1~1_combout\,
	datac => \inst2|cnt_segcon\(2),
	datad => \inst2|cnt_segcon\(1),
	combout => \inst2|Mux1~3_combout\);

-- Location: LCFF_X25_Y16_N17
\inst2|SEG_DATA[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Mux1~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_DATA\(6));

-- Location: LCCOMB_X26_Y16_N20
\inst2|WideOr23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr23~0_combout\ = (\inst3|s_const2\(14) & (((\inst3|s_const2\(15))))) # (!\inst3|s_const2\(14) & (\inst3|s_const2\(13) & ((\inst3|s_const2\(15)) # (!\inst3|s_const2\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(12),
	datab => \inst3|s_const2\(13),
	datac => \inst3|s_const2\(14),
	datad => \inst3|s_const2\(15),
	combout => \inst2|WideOr23~0_combout\);

-- Location: LCCOMB_X26_Y15_N28
\inst2|x8800_0010[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[2]~feeder_combout\ = \inst|Hdi\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(2),
	combout => \inst2|x8800_0010[2]~feeder_combout\);

-- Location: LCFF_X26_Y15_N29
\inst2|x8800_0010[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[2]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(2));

-- Location: LCFF_X25_Y15_N29
\inst3|s_const2[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(2),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(2));

-- Location: LCCOMB_X25_Y15_N28
\inst2|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr2~0_combout\ = (\inst3|s_const2\(2) & (((\inst3|s_const2\(3))))) # (!\inst3|s_const2\(2) & (\inst3|s_const2\(1) & ((\inst3|s_const2\(3)) # (!\inst3|s_const2\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(1),
	datab => \inst3|s_const2\(3),
	datac => \inst3|s_const2\(2),
	datad => \inst3|s_const2\(0),
	combout => \inst2|WideOr2~0_combout\);

-- Location: LCCOMB_X25_Y16_N8
\inst2|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux2~0_combout\ = (\inst2|cnt_segcon\(0) & (((\inst2|cnt_segcon\(1))) # (!\inst2|WideOr9~0_combout\))) # (!\inst2|cnt_segcon\(0) & (((!\inst2|WideOr2~0_combout\ & !\inst2|cnt_segcon\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|WideOr9~0_combout\,
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr2~0_combout\,
	datad => \inst2|cnt_segcon\(1),
	combout => \inst2|Mux2~0_combout\);

-- Location: LCCOMB_X26_Y16_N2
\inst2|WideOr16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr16~0_combout\ = (\inst3|s_const2\(10) & (((\inst3|s_const2\(11))))) # (!\inst3|s_const2\(10) & (\inst3|s_const2\(9) & ((\inst3|s_const2\(11)) # (!\inst3|s_const2\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(10),
	datab => \inst3|s_const2\(9),
	datac => \inst3|s_const2\(11),
	datad => \inst3|s_const2\(8),
	combout => \inst2|WideOr16~0_combout\);

-- Location: LCCOMB_X25_Y16_N26
\inst2|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux2~1_combout\ = (\inst2|cnt_segcon\(1) & ((\inst2|Mux2~0_combout\ & (!\inst2|WideOr23~0_combout\)) # (!\inst2|Mux2~0_combout\ & ((!\inst2|WideOr16~0_combout\))))) # (!\inst2|cnt_segcon\(1) & (((\inst2|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|WideOr23~0_combout\,
	datac => \inst2|Mux2~0_combout\,
	datad => \inst2|WideOr16~0_combout\,
	combout => \inst2|Mux2~1_combout\);

-- Location: LCCOMB_X26_Y17_N2
\inst2|WideOr37~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr37~0_combout\ = (\inst3|s_const2\(22) & (\inst3|s_const2\(23))) # (!\inst3|s_const2\(22) & (\inst3|s_const2\(21) & ((\inst3|s_const2\(23)) # (!\inst3|s_const2\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(23),
	datab => \inst3|s_const2\(20),
	datac => \inst3|s_const2\(22),
	datad => \inst3|s_const2\(21),
	combout => \inst2|WideOr37~0_combout\);

-- Location: LCCOMB_X26_Y17_N18
\inst2|WideOr30~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr30~0_combout\ = (\inst3|s_const2\(18) & (((\inst3|s_const2\(19))))) # (!\inst3|s_const2\(18) & (\inst3|s_const2\(17) & ((\inst3|s_const2\(19)) # (!\inst3|s_const2\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(17),
	datab => \inst3|s_const2\(19),
	datac => \inst3|s_const2\(18),
	datad => \inst3|s_const2\(16),
	combout => \inst2|WideOr30~0_combout\);

-- Location: LCCOMB_X25_Y16_N4
\inst2|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux2~2_combout\ = (\inst2|cnt_segcon\(0) & (!\inst2|WideOr37~0_combout\)) # (!\inst2|cnt_segcon\(0) & ((!\inst2|WideOr30~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr37~0_combout\,
	datad => \inst2|WideOr30~0_combout\,
	combout => \inst2|Mux2~2_combout\);

-- Location: LCCOMB_X25_Y16_N10
\inst2|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux2~3_combout\ = (\inst2|cnt_segcon\(2) & (!\inst2|cnt_segcon\(1) & ((\inst2|Mux2~2_combout\)))) # (!\inst2|cnt_segcon\(2) & (((\inst2|Mux2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|Mux2~1_combout\,
	datac => \inst2|Mux2~2_combout\,
	datad => \inst2|cnt_segcon\(2),
	combout => \inst2|Mux2~3_combout\);

-- Location: LCFF_X25_Y16_N11
\inst2|SEG_DATA[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Mux2~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_DATA\(5));

-- Location: LCFF_X30_Y15_N1
\inst|Hdi[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	sdata => XM0DATA(7),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(7));

-- Location: LCFF_X26_Y15_N31
\inst2|x8800_0012[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst|Hdi\(7),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst2|x8800_0012[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0012\(7));

-- Location: LCFF_X25_Y17_N15
\inst3|s_const2[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0012\(7),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(23));

-- Location: LCCOMB_X25_Y17_N14
\inst2|WideOr38~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr38~0_combout\ = (\inst3|s_const2\(21) & ((\inst3|s_const2\(23)) # ((\inst3|s_const2\(22) & \inst3|s_const2\(20))))) # (!\inst3|s_const2\(21) & (\inst3|s_const2\(22) $ (((!\inst3|s_const2\(23) & \inst3|s_const2\(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(22),
	datab => \inst3|s_const2\(21),
	datac => \inst3|s_const2\(23),
	datad => \inst3|s_const2\(20),
	combout => \inst2|WideOr38~0_combout\);

-- Location: LCCOMB_X26_Y17_N0
\inst2|WideOr31~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr31~0_combout\ = (\inst3|s_const2\(17) & ((\inst3|s_const2\(19)) # ((\inst3|s_const2\(18) & \inst3|s_const2\(16))))) # (!\inst3|s_const2\(17) & (\inst3|s_const2\(18) $ (((!\inst3|s_const2\(19) & \inst3|s_const2\(16))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(17),
	datab => \inst3|s_const2\(18),
	datac => \inst3|s_const2\(19),
	datad => \inst3|s_const2\(16),
	combout => \inst2|WideOr31~0_combout\);

-- Location: LCCOMB_X25_Y17_N24
\inst2|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux3~2_combout\ = (\inst2|cnt_segcon\(0) & (!\inst2|WideOr38~0_combout\)) # (!\inst2|cnt_segcon\(0) & ((!\inst2|WideOr31~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr38~0_combout\,
	datad => \inst2|WideOr31~0_combout\,
	combout => \inst2|Mux3~2_combout\);

-- Location: LCCOMB_X25_Y15_N22
\inst2|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr3~0_combout\ = (\inst3|s_const2\(1) & ((\inst3|s_const2\(3)) # ((\inst3|s_const2\(2) & \inst3|s_const2\(0))))) # (!\inst3|s_const2\(1) & (\inst3|s_const2\(2) $ (((!\inst3|s_const2\(3) & \inst3|s_const2\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(2),
	datab => \inst3|s_const2\(1),
	datac => \inst3|s_const2\(3),
	datad => \inst3|s_const2\(0),
	combout => \inst2|WideOr3~0_combout\);

-- Location: LCCOMB_X26_Y16_N4
\inst2|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux3~0_combout\ = (\inst2|cnt_segcon\(0) & (((\inst2|cnt_segcon\(1))) # (!\inst2|WideOr10~0_combout\))) # (!\inst2|cnt_segcon\(0) & (((!\inst2|WideOr3~0_combout\ & !\inst2|cnt_segcon\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|WideOr10~0_combout\,
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr3~0_combout\,
	datad => \inst2|cnt_segcon\(1),
	combout => \inst2|Mux3~0_combout\);

-- Location: LCCOMB_X26_Y16_N14
\inst2|WideOr24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr24~0_combout\ = (\inst3|s_const2\(13) & ((\inst3|s_const2\(15)) # ((\inst3|s_const2\(12) & \inst3|s_const2\(14))))) # (!\inst3|s_const2\(13) & (\inst3|s_const2\(14) $ (((\inst3|s_const2\(12) & !\inst3|s_const2\(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100111000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(12),
	datab => \inst3|s_const2\(13),
	datac => \inst3|s_const2\(15),
	datad => \inst3|s_const2\(14),
	combout => \inst2|WideOr24~0_combout\);

-- Location: LCCOMB_X30_Y15_N22
\inst|Hdi[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|Hdi[10]~feeder_combout\ = XM0DATA(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => XM0DATA(10),
	combout => \inst|Hdi[10]~feeder_combout\);

-- Location: LCFF_X30_Y15_N23
\inst|Hdi[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_CPLD_0~combout\,
	datain => \inst|Hdi[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Hdi\(10));

-- Location: LCCOMB_X26_Y15_N4
\inst2|x8800_0010[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|x8800_0010[10]~feeder_combout\ = \inst|Hdi\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Hdi\(10),
	combout => \inst2|x8800_0010[10]~feeder_combout\);

-- Location: LCFF_X26_Y15_N5
\inst2|x8800_0010[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	datain => \inst2|x8800_0010[10]~feeder_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	ena => \inst2|x8800_0010[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|x8800_0010\(10));

-- Location: LCFF_X26_Y16_N29
\inst3|s_const2[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \FPGA_CLK~clkctrl_outclk\,
	sdata => \inst2|x8800_0010\(10),
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	sload => VCC,
	ena => \inst3|ALT_INV_state.IDLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|s_const2\(10));

-- Location: LCCOMB_X26_Y16_N28
\inst2|WideOr17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr17~0_combout\ = (\inst3|s_const2\(9) & ((\inst3|s_const2\(11)) # ((\inst3|s_const2\(10) & \inst3|s_const2\(8))))) # (!\inst3|s_const2\(9) & (\inst3|s_const2\(10) $ (((!\inst3|s_const2\(11) & \inst3|s_const2\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(11),
	datab => \inst3|s_const2\(9),
	datac => \inst3|s_const2\(10),
	datad => \inst3|s_const2\(8),
	combout => \inst2|WideOr17~0_combout\);

-- Location: LCCOMB_X26_Y16_N6
\inst2|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux3~1_combout\ = (\inst2|cnt_segcon\(1) & ((\inst2|Mux3~0_combout\ & (!\inst2|WideOr24~0_combout\)) # (!\inst2|Mux3~0_combout\ & ((!\inst2|WideOr17~0_combout\))))) # (!\inst2|cnt_segcon\(1) & (\inst2|Mux3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|Mux3~0_combout\,
	datac => \inst2|WideOr24~0_combout\,
	datad => \inst2|WideOr17~0_combout\,
	combout => \inst2|Mux3~1_combout\);

-- Location: LCCOMB_X25_Y17_N0
\inst2|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux3~3_combout\ = (\inst2|cnt_segcon\(2) & (!\inst2|cnt_segcon\(1) & (\inst2|Mux3~2_combout\))) # (!\inst2|cnt_segcon\(2) & (((\inst2|Mux3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|cnt_segcon\(2),
	datac => \inst2|Mux3~2_combout\,
	datad => \inst2|Mux3~1_combout\,
	combout => \inst2|Mux3~3_combout\);

-- Location: LCFF_X25_Y17_N1
\inst2|SEG_DATA[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Mux3~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_DATA\(4));

-- Location: LCCOMB_X26_Y17_N26
\inst2|WideOr32~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr32~0_combout\ = (\inst3|s_const2\(16)) # ((\inst3|s_const2\(17) & (\inst3|s_const2\(19))) # (!\inst3|s_const2\(17) & ((\inst3|s_const2\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(17),
	datab => \inst3|s_const2\(19),
	datac => \inst3|s_const2\(16),
	datad => \inst3|s_const2\(18),
	combout => \inst2|WideOr32~0_combout\);

-- Location: LCCOMB_X25_Y17_N30
\inst2|WideOr39~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr39~0_combout\ = (\inst3|s_const2\(20)) # ((\inst3|s_const2\(21) & (\inst3|s_const2\(23))) # (!\inst3|s_const2\(21) & ((\inst3|s_const2\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(23),
	datab => \inst3|s_const2\(22),
	datac => \inst3|s_const2\(21),
	datad => \inst3|s_const2\(20),
	combout => \inst2|WideOr39~0_combout\);

-- Location: LCCOMB_X25_Y17_N16
\inst2|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux4~2_combout\ = (\inst2|cnt_segcon\(0) & ((!\inst2|WideOr39~0_combout\))) # (!\inst2|cnt_segcon\(0) & (!\inst2|WideOr32~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|cnt_segcon\(0),
	datac => \inst2|WideOr32~0_combout\,
	datad => \inst2|WideOr39~0_combout\,
	combout => \inst2|Mux4~2_combout\);

-- Location: LCCOMB_X25_Y15_N20
\inst2|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr4~0_combout\ = (\inst3|s_const2\(0)) # ((\inst3|s_const2\(1) & (\inst3|s_const2\(3))) # (!\inst3|s_const2\(1) & ((\inst3|s_const2\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(3),
	datab => \inst3|s_const2\(1),
	datac => \inst3|s_const2\(2),
	datad => \inst3|s_const2\(0),
	combout => \inst2|WideOr4~0_combout\);

-- Location: LCCOMB_X25_Y15_N26
\inst2|WideOr11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr11~0_combout\ = (\inst3|s_const2\(4)) # ((\inst3|s_const2\(5) & (\inst3|s_const2\(7))) # (!\inst3|s_const2\(5) & ((\inst3|s_const2\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(7),
	datab => \inst3|s_const2\(5),
	datac => \inst3|s_const2\(6),
	datad => \inst3|s_const2\(4),
	combout => \inst2|WideOr11~0_combout\);

-- Location: LCCOMB_X25_Y17_N18
\inst2|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux4~0_combout\ = (\inst2|cnt_segcon\(1) & (((\inst2|cnt_segcon\(0))))) # (!\inst2|cnt_segcon\(1) & ((\inst2|cnt_segcon\(0) & ((!\inst2|WideOr11~0_combout\))) # (!\inst2|cnt_segcon\(0) & (!\inst2|WideOr4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|WideOr4~0_combout\,
	datac => \inst2|WideOr11~0_combout\,
	datad => \inst2|cnt_segcon\(0),
	combout => \inst2|Mux4~0_combout\);

-- Location: LCCOMB_X26_Y16_N10
\inst2|WideOr25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr25~0_combout\ = (\inst3|s_const2\(12)) # ((\inst3|s_const2\(13) & ((\inst3|s_const2\(15)))) # (!\inst3|s_const2\(13) & (\inst3|s_const2\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(12),
	datab => \inst3|s_const2\(13),
	datac => \inst3|s_const2\(14),
	datad => \inst3|s_const2\(15),
	combout => \inst2|WideOr25~0_combout\);

-- Location: LCCOMB_X26_Y16_N8
\inst2|WideOr18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr18~0_combout\ = (\inst3|s_const2\(8)) # ((\inst3|s_const2\(9) & ((\inst3|s_const2\(11)))) # (!\inst3|s_const2\(9) & (\inst3|s_const2\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(10),
	datab => \inst3|s_const2\(9),
	datac => \inst3|s_const2\(11),
	datad => \inst3|s_const2\(8),
	combout => \inst2|WideOr18~0_combout\);

-- Location: LCCOMB_X25_Y17_N28
\inst2|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux4~1_combout\ = (\inst2|cnt_segcon\(1) & ((\inst2|Mux4~0_combout\ & (!\inst2|WideOr25~0_combout\)) # (!\inst2|Mux4~0_combout\ & ((!\inst2|WideOr18~0_combout\))))) # (!\inst2|cnt_segcon\(1) & (\inst2|Mux4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|Mux4~0_combout\,
	datac => \inst2|WideOr25~0_combout\,
	datad => \inst2|WideOr18~0_combout\,
	combout => \inst2|Mux4~1_combout\);

-- Location: LCCOMB_X25_Y17_N26
\inst2|Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux4~3_combout\ = (\inst2|cnt_segcon\(2) & (!\inst2|cnt_segcon\(1) & (\inst2|Mux4~2_combout\))) # (!\inst2|cnt_segcon\(2) & (((\inst2|Mux4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|cnt_segcon\(2),
	datac => \inst2|Mux4~2_combout\,
	datad => \inst2|Mux4~1_combout\,
	combout => \inst2|Mux4~3_combout\);

-- Location: LCFF_X25_Y17_N27
\inst2|SEG_DATA[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Mux4~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_DATA\(3));

-- Location: LCCOMB_X26_Y16_N0
\inst2|WideOr19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr19~0_combout\ = (\inst3|s_const2\(10) & ((\inst3|s_const2\(11)) # ((\inst3|s_const2\(8) & \inst3|s_const2\(9))))) # (!\inst3|s_const2\(10) & ((\inst3|s_const2\(9)) # ((!\inst3|s_const2\(11) & \inst3|s_const2\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(10),
	datab => \inst3|s_const2\(11),
	datac => \inst3|s_const2\(8),
	datad => \inst3|s_const2\(9),
	combout => \inst2|WideOr19~0_combout\);

-- Location: LCCOMB_X26_Y16_N12
\inst2|WideOr26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr26~0_combout\ = (\inst3|s_const2\(12) & ((\inst3|s_const2\(13)) # (\inst3|s_const2\(14) $ (!\inst3|s_const2\(15))))) # (!\inst3|s_const2\(12) & ((\inst3|s_const2\(14) & ((\inst3|s_const2\(15)))) # (!\inst3|s_const2\(14) & 
-- (\inst3|s_const2\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(12),
	datab => \inst3|s_const2\(13),
	datac => \inst3|s_const2\(14),
	datad => \inst3|s_const2\(15),
	combout => \inst2|WideOr26~0_combout\);

-- Location: LCCOMB_X25_Y15_N30
\inst2|WideOr12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr12~0_combout\ = (\inst3|s_const2\(6) & ((\inst3|s_const2\(7)) # ((\inst3|s_const2\(5) & \inst3|s_const2\(4))))) # (!\inst3|s_const2\(6) & ((\inst3|s_const2\(5)) # ((!\inst3|s_const2\(7) & \inst3|s_const2\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(7),
	datab => \inst3|s_const2\(5),
	datac => \inst3|s_const2\(6),
	datad => \inst3|s_const2\(4),
	combout => \inst2|WideOr12~0_combout\);

-- Location: LCCOMB_X25_Y15_N24
\inst2|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr5~0_combout\ = (\inst3|s_const2\(2) & ((\inst3|s_const2\(3)) # ((\inst3|s_const2\(1) & \inst3|s_const2\(0))))) # (!\inst3|s_const2\(2) & ((\inst3|s_const2\(1)) # ((!\inst3|s_const2\(3) & \inst3|s_const2\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(3),
	datab => \inst3|s_const2\(1),
	datac => \inst3|s_const2\(2),
	datad => \inst3|s_const2\(0),
	combout => \inst2|WideOr5~0_combout\);

-- Location: LCCOMB_X25_Y15_N10
\inst2|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux5~0_combout\ = (\inst2|cnt_segcon\(0) & (((\inst2|cnt_segcon\(1))) # (!\inst2|WideOr12~0_combout\))) # (!\inst2|cnt_segcon\(0) & (((!\inst2|WideOr5~0_combout\ & !\inst2|cnt_segcon\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(0),
	datab => \inst2|WideOr12~0_combout\,
	datac => \inst2|WideOr5~0_combout\,
	datad => \inst2|cnt_segcon\(1),
	combout => \inst2|Mux5~0_combout\);

-- Location: LCCOMB_X25_Y17_N10
\inst2|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux5~1_combout\ = (\inst2|cnt_segcon\(1) & ((\inst2|Mux5~0_combout\ & ((!\inst2|WideOr26~0_combout\))) # (!\inst2|Mux5~0_combout\ & (!\inst2|WideOr19~0_combout\)))) # (!\inst2|cnt_segcon\(1) & (((\inst2|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|cnt_segcon\(1),
	datab => \inst2|WideOr19~0_combout\,
	datac => \inst2|WideOr26~0_combout\,
	datad => \inst2|Mux5~0_combout\,
	combout => \inst2|Mux5~1_combout\);

-- Location: LCCOMB_X25_Y17_N12
\inst2|Mux5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux5~3_combout\ = (\inst2|cnt_segcon\(2) & (\inst2|Mux5~2_combout\ & (!\inst2|cnt_segcon\(1)))) # (!\inst2|cnt_segcon\(2) & (((\inst2|Mux5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Mux5~2_combout\,
	datab => \inst2|cnt_segcon\(2),
	datac => \inst2|cnt_segcon\(1),
	datad => \inst2|Mux5~1_combout\,
	combout => \inst2|Mux5~3_combout\);

-- Location: LCFF_X25_Y17_N13
\inst2|SEG_DATA[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Mux5~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_DATA\(2));

-- Location: LCCOMB_X26_Y17_N22
\inst2|WideOr34~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr34~0_combout\ = (\inst3|s_const2\(17) & (!\inst3|s_const2\(19) & ((!\inst3|s_const2\(18)) # (!\inst3|s_const2\(16))))) # (!\inst3|s_const2\(17) & (\inst3|s_const2\(19) $ (((\inst3|s_const2\(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(17),
	datab => \inst3|s_const2\(19),
	datac => \inst3|s_const2\(16),
	datad => \inst3|s_const2\(18),
	combout => \inst2|WideOr34~0_combout\);

-- Location: LCCOMB_X26_Y17_N12
\inst2|WideOr41~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|WideOr41~0_combout\ = (\inst3|s_const2\(21) & (!\inst3|s_const2\(23) & ((!\inst3|s_const2\(20)) # (!\inst3|s_const2\(22))))) # (!\inst3|s_const2\(21) & (\inst3|s_const2\(22) $ ((\inst3|s_const2\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|s_const2\(21),
	datab => \inst3|s_const2\(22),
	datac => \inst3|s_const2\(23),
	datad => \inst3|s_const2\(20),
	combout => \inst2|WideOr41~0_combout\);

-- Location: LCCOMB_X26_Y17_N20
\inst2|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux6~2_combout\ = (\inst2|cnt_segcon\(0) & ((\inst2|WideOr41~0_combout\))) # (!\inst2|cnt_segcon\(0) & (\inst2|WideOr34~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|WideOr34~0_combout\,
	datac => \inst2|cnt_segcon\(0),
	datad => \inst2|WideOr41~0_combout\,
	combout => \inst2|Mux6~2_combout\);

-- Location: LCCOMB_X24_Y16_N0
\inst2|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Mux6~3_combout\ = (\inst2|cnt_segcon\(2) & (((!\inst2|cnt_segcon\(1) & \inst2|Mux6~2_combout\)))) # (!\inst2|cnt_segcon\(2) & (\inst2|Mux6~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Mux6~1_combout\,
	datab => \inst2|cnt_segcon\(2),
	datac => \inst2|cnt_segcon\(1),
	datad => \inst2|Mux6~2_combout\,
	combout => \inst2|Mux6~3_combout\);

-- Location: LCFF_X24_Y16_N1
\inst2|SEG_DATA[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|seg_clk~clkctrl_outclk\,
	datain => \inst2|Mux6~3_combout\,
	aclr => \ALT_INV_XnRESET~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|SEG_DATA\(1));

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_e~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_e);

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\nFPGA_RESET~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_nFPGA_RESET);

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XM0_ADDR[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XM0_ADDR(20));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_rs~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_rs);

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_rw~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_rw);

-- Location: PIN_N7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\piezo~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_piezo);

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_nOE~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_nOE);

-- Location: PIN_P15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_nWE~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_nWE);

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_nCS~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_nCS);

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_d[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_d(6));

-- Location: PIN_P5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_d[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_d(5));

-- Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_d[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_d(4));

-- Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_d[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_d(3));

-- Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_d[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_d(2));

-- Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_d[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_d(1));

-- Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_d[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_d(0));

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(9));

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(8));

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(7));

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(6));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(5));

-- Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(4));

-- Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(3));

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(2));

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(1));

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dot_scan[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dot_scan(0));

-- Location: PIN_M11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\key_scan[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_key_scan(3));

-- Location: PIN_N11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\key_scan[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_key_scan(2));

-- Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\key_scan[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_key_scan(1));

-- Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\key_scan[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_key_scan(0));

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_data(7));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_data(6));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_data(5));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_data(4));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_data(3));

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_data(2));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_data(1));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_lcd_data(0));

-- Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(7));

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(6));

-- Location: PIN_E6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(5));

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(4));

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(3));

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(2));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(1));

-- Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(0));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_com[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_COM\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_com(5));

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_com[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_COM\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_com(4));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_com[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_COM\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_com(3));

-- Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_com[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_COM\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_com(2));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_com[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_COM\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_com(1));

-- Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_com[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_COM\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_com(0));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_disp[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_DATA\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_disp(7));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_disp[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_DATA\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_disp(6));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_disp[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_DATA\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_disp(5));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_disp[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_DATA\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_disp(4));

-- Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_disp[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_DATA\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_disp(3));

-- Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_disp[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_DATA\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_disp(2));

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_disp[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst2|SEG_DATA\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_disp(1));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\seg_disp[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_seg_disp(0));

-- Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(17));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(16));

-- Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(15));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(14));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(13));

-- Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(12));

-- Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(11));

-- Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(10));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(9));

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(8));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(7));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(6));

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(5));

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(4));

-- Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(3));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(2));

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(1));

-- Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(0));

-- Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(15));

-- Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(14));

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(13));

-- Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(12));

-- Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(11));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(10));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(9));

-- Location: PIN_P14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(8));

-- Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(7));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(6));

-- Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(5));

-- Location: PIN_N16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(4));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(3));

-- Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(2));

-- Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(1));

-- Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DATA[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_DATA(0));

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\M_nRESET~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_M_nRESET);

-- Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XCLKOUT~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XCLKOUT);

-- Location: PIN_F5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CPLD_8~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CPLD_8);

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CPLD_1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CPLD_1);

-- Location: PIN_K6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\XEINT8~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_XEINT8);

-- Location: PIN_R14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\STEP_A~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_STEP_A);

-- Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\STEP_nA~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_STEP_nA);

-- Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\STEP_B~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_STEP_B);

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\STEP_nB~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_STEP_nB);

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\GPJ4_0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_GPJ4_0);

-- Location: PIN_N15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\GPJ4_1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_GPJ4_1);

-- Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\GPJ4_2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_GPJ4_2);

-- Location: PIN_P16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\GPJ4_3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_GPJ4_3);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\GPJ4_4~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_GPJ4_4);

-- Location: PIN_N14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\GPJ1_5~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_GPJ1_5);

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SPI_DOUT~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SPI_DOUT);

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SPI_DIN~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SPI_DIN);

-- Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SPI_SCLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SPI_SCLK);

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SPI_DA_CS~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SPI_DA_CS);

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SPI_AD_CS~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SPI_AD_CS);

-- Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(15));

-- Location: PIN_K10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(14));

-- Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(13));

-- Location: PIN_N10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(12));

-- Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(11));

-- Location: PIN_T10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(10));

-- Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(9));

-- Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(8));

-- Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(7));

-- Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(6));

-- Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(5));

-- Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(4));

-- Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(3));

-- Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(2));

-- Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(1));

-- Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dip_sw[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dip_sw(0));

-- Location: PIN_R12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key_data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key_data(3));

-- Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key_data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key_data(2));

-- Location: PIN_K11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key_data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key_data(1));

-- Location: PIN_L11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\key_data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key_data(0));

-- Location: PIN_P13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sel_button[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sel_button(3));

-- Location: PIN_R13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sel_button[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sel_button(2));

-- Location: PIN_T13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sel_button[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sel_button(1));

-- Location: PIN_P12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sel_button[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sel_button(0));
END structure;


