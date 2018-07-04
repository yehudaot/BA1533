-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

-- DATE "06/12/2018 15:01:54"

-- 
-- Device: Altera 10M08SAU169I7G Package UFBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	BA1533_TX IS
    PORT (
	clk : IN std_logic;
	UART_RXD : IN std_logic;
	UART_TXD : BUFFER std_logic;
	led1 : BUFFER std_logic;
	led2 : BUFFER std_logic;
	led3 : BUFFER std_logic;
	led4 : BUFFER std_logic;
	tx_bit_data : BUFFER std_logic
	);
END BA1533_TX;

-- Design Ports Information
-- UART_TXD	=>  Location: PIN_J5,	 I/O Standard: 2.5 V,	 Current Strength: 12mA
-- led1	=>  Location: PIN_M12,	 I/O Standard: 2.5 V,	 Current Strength: 12mA
-- led2	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: 12mA
-- led3	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: 12mA
-- led4	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: 12mA
-- tx_bit_data	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: 12mA
-- clk	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UART_RXD	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BA1533_TX IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_UART_RXD : std_logic;
SIGNAL ww_UART_TXD : std_logic;
SIGNAL ww_led1 : std_logic;
SIGNAL ww_led2 : std_logic;
SIGNAL ww_led3 : std_logic;
SIGNAL ww_led4 : std_logic;
SIGNAL ww_tx_bit_data : std_logic;
SIGNAL \tx_pll_c|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \tx_pll_c|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \tx_pll_c|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire[0]~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~8_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~9\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~10_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~11\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~13_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~14\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~15_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~16\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~17_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~18\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~19_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~20\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~21_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~22\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[7]~23_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[0]~8_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[1]~6_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~5_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[3]~7_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~9_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~8_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~7_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~6_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~5_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~4_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~3_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~2_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out~q\ : std_logic;
SIGNAL \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \tx_c|index~1_combout\ : std_logic;
SIGNAL \tx_c|index~0_combout\ : std_logic;
SIGNAL \tx_c|index~2_combout\ : std_logic;
SIGNAL \tx_c|tx_count[0]~93_combout\ : std_logic;
SIGNAL \tx_c|tx_count[1]~31_combout\ : std_logic;
SIGNAL \tx_c|Equal0~0_combout\ : std_logic;
SIGNAL \tx_c|tx_count[1]~32\ : std_logic;
SIGNAL \tx_c|tx_count[2]~33_combout\ : std_logic;
SIGNAL \tx_c|tx_count[2]~34\ : std_logic;
SIGNAL \tx_c|tx_count[3]~35_combout\ : std_logic;
SIGNAL \tx_c|tx_count[3]~36\ : std_logic;
SIGNAL \tx_c|tx_count[4]~37_combout\ : std_logic;
SIGNAL \tx_c|tx_count[4]~38\ : std_logic;
SIGNAL \tx_c|tx_count[5]~39_combout\ : std_logic;
SIGNAL \tx_c|tx_count[5]~40\ : std_logic;
SIGNAL \tx_c|tx_count[6]~41_combout\ : std_logic;
SIGNAL \tx_c|tx_count[6]~42\ : std_logic;
SIGNAL \tx_c|tx_count[7]~43_combout\ : std_logic;
SIGNAL \tx_c|tx_count[7]~44\ : std_logic;
SIGNAL \tx_c|tx_count[8]~45_combout\ : std_logic;
SIGNAL \tx_c|tx_count[8]~46\ : std_logic;
SIGNAL \tx_c|tx_count[9]~47_combout\ : std_logic;
SIGNAL \tx_c|tx_count[9]~48\ : std_logic;
SIGNAL \tx_c|tx_count[10]~49_combout\ : std_logic;
SIGNAL \tx_c|tx_count[10]~50\ : std_logic;
SIGNAL \tx_c|tx_count[11]~51_combout\ : std_logic;
SIGNAL \tx_c|tx_count[11]~52\ : std_logic;
SIGNAL \tx_c|tx_count[12]~53_combout\ : std_logic;
SIGNAL \tx_c|tx_count[12]~54\ : std_logic;
SIGNAL \tx_c|tx_count[13]~55_combout\ : std_logic;
SIGNAL \tx_c|tx_count[13]~56\ : std_logic;
SIGNAL \tx_c|tx_count[14]~57_combout\ : std_logic;
SIGNAL \tx_c|tx_count[14]~58\ : std_logic;
SIGNAL \tx_c|tx_count[15]~59_combout\ : std_logic;
SIGNAL \tx_c|tx_count[15]~60\ : std_logic;
SIGNAL \tx_c|tx_count[16]~61_combout\ : std_logic;
SIGNAL \tx_c|tx_count[16]~62\ : std_logic;
SIGNAL \tx_c|tx_count[17]~63_combout\ : std_logic;
SIGNAL \tx_c|tx_count[17]~64\ : std_logic;
SIGNAL \tx_c|tx_count[18]~65_combout\ : std_logic;
SIGNAL \tx_c|tx_count[18]~66\ : std_logic;
SIGNAL \tx_c|tx_count[19]~67_combout\ : std_logic;
SIGNAL \tx_c|tx_count[19]~68\ : std_logic;
SIGNAL \tx_c|tx_count[20]~69_combout\ : std_logic;
SIGNAL \tx_c|tx_count[20]~70\ : std_logic;
SIGNAL \tx_c|tx_count[21]~71_combout\ : std_logic;
SIGNAL \tx_c|tx_count[21]~72\ : std_logic;
SIGNAL \tx_c|tx_count[22]~73_combout\ : std_logic;
SIGNAL \tx_c|tx_count[22]~74\ : std_logic;
SIGNAL \tx_c|tx_count[23]~75_combout\ : std_logic;
SIGNAL \tx_c|tx_count[23]~76\ : std_logic;
SIGNAL \tx_c|tx_count[24]~77_combout\ : std_logic;
SIGNAL \tx_c|tx_count[24]~78\ : std_logic;
SIGNAL \tx_c|tx_count[25]~79_combout\ : std_logic;
SIGNAL \tx_c|tx_count[25]~80\ : std_logic;
SIGNAL \tx_c|tx_count[26]~81_combout\ : std_logic;
SIGNAL \tx_c|tx_count[26]~82\ : std_logic;
SIGNAL \tx_c|tx_count[27]~83_combout\ : std_logic;
SIGNAL \tx_c|tx_count[27]~84\ : std_logic;
SIGNAL \tx_c|tx_count[28]~85_combout\ : std_logic;
SIGNAL \tx_c|tx_count[28]~86\ : std_logic;
SIGNAL \tx_c|tx_count[29]~87_combout\ : std_logic;
SIGNAL \tx_c|tx_count[29]~88\ : std_logic;
SIGNAL \tx_c|tx_count[30]~89_combout\ : std_logic;
SIGNAL \tx_c|LessThan0~54_combout\ : std_logic;
SIGNAL \tx_c|tx_count[30]~90\ : std_logic;
SIGNAL \tx_c|tx_count[31]~91_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~combout\ : std_logic;
SIGNAL \UART_RXD~input_o\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_0_dff~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~7_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~8_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~2_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~8_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~18\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~19_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~20\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~21_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~9\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~10_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~11\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~12_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~13\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~15_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~16\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~17_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~22\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[7]~23_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[0]~6_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[1]~4_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~3_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[3]~5_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~10_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~4_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~3_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~5_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[9]~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~2_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[8]~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[6]~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[5]~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[2]~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[1]~feeder_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5~combout\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\ : std_logic;
SIGNAL \uart_control_c|always0~1_combout\ : std_logic;
SIGNAL \uart_control_c|always0~0_combout\ : std_logic;
SIGNAL \uart_control_c|Selector3~0_combout\ : std_logic;
SIGNAL \uart_control_c|Equal0~0_combout\ : std_logic;
SIGNAL \uart_control_c|state~23_combout\ : std_logic;
SIGNAL \uart_control_c|Selector0~0_combout\ : std_logic;
SIGNAL \uart_control_c|Selector4~0_combout\ : std_logic;
SIGNAL \uart_control_c|Equal0~2_combout\ : std_logic;
SIGNAL \uart_control_c|Equal0~1_combout\ : std_logic;
SIGNAL \uart_control_c|state~22_combout\ : std_logic;
SIGNAL \uart_control_c|Selector4~1_combout\ : std_logic;
SIGNAL \uart_control_c|state.CH_REG_DATA1~q\ : std_logic;
SIGNAL \uart_control_c|Selector5~0_combout\ : std_logic;
SIGNAL \uart_control_c|state.CH_REG_DATA2~q\ : std_logic;
SIGNAL \uart_control_c|Selector0~1_combout\ : std_logic;
SIGNAL \uart_control_c|Selector0~2_combout\ : std_logic;
SIGNAL \uart_control_c|state.0000~q\ : std_logic;
SIGNAL \uart_control_c|Selector1~0_combout\ : std_logic;
SIGNAL \uart_control_c|Selector1~1_combout\ : std_logic;
SIGNAL \uart_control_c|state.CH_MAX_TX_COUNT1~q\ : std_logic;
SIGNAL \uart_control_c|Selector2~0_combout\ : std_logic;
SIGNAL \uart_control_c|state.CH_MAX_TX_COUNT2~q\ : std_logic;
SIGNAL \uart_control_c|Add1~1\ : std_logic;
SIGNAL \uart_control_c|Add1~3\ : std_logic;
SIGNAL \uart_control_c|Add1~4_combout\ : std_logic;
SIGNAL \uart_control_c|Add0~2_combout\ : std_logic;
SIGNAL \uart_control_c|Add1~0_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~0_combout\ : std_logic;
SIGNAL \uart_control_c|new_tx_max_count[0]~1_combout\ : std_logic;
SIGNAL \uart_control_c|new_tx_max_count[0]~2_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~1\ : std_logic;
SIGNAL \uart_control_c|Add2~2_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~22_combout\ : std_logic;
SIGNAL \uart_control_c|new_tx_max_count[1]~0_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~3\ : std_logic;
SIGNAL \uart_control_c|Add2~4_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~21_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~5\ : std_logic;
SIGNAL \uart_control_c|Add2~6_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~20_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~7\ : std_logic;
SIGNAL \uart_control_c|Add2~8_combout\ : std_logic;
SIGNAL \uart_control_c|Add1~2_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~17_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~9\ : std_logic;
SIGNAL \uart_control_c|Add2~10_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~19_combout\ : std_logic;
SIGNAL \uart_control_c|Add0~0_combout\ : std_logic;
SIGNAL \uart_control_c|Add0~1_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~11\ : std_logic;
SIGNAL \uart_control_c|Add2~12_combout\ : std_logic;
SIGNAL \uart_control_c|Add1~5\ : std_logic;
SIGNAL \uart_control_c|Add1~6_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~18_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~13\ : std_logic;
SIGNAL \uart_control_c|Add2~14_combout\ : std_logic;
SIGNAL \uart_control_c|Add1~7\ : std_logic;
SIGNAL \uart_control_c|Add1~8_combout\ : std_logic;
SIGNAL \uart_control_c|Add2~16_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][23]~0_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][22]~1_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][21]~2_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][20]~3_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][19]~4_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][23]~5_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][18]~6_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][22]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][21]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][17]~7_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][20]~9_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][19]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][18]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][17]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|_~0_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][12]~10_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][10]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][9]~13_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|_~1_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][12]~14_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][10]~15_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][11]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][6]~16_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][10]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][9]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][5]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][4]~17_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][3]~18_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][10]~19_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][6]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][5]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~23\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~27\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~31\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~35\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~39\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~43\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~44_combout\ : std_logic;
SIGNAL \uart_control_c|Selector3~1_combout\ : std_logic;
SIGNAL \uart_control_c|state.CH_MAX_TX_COUNT3~q\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~42_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~40_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~36_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~32_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~28_combout\ : std_logic;
SIGNAL \uart_control_c|max_tx_count[19]~0_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26_combout\ : std_logic;
SIGNAL \uart_control_c|max_tx_count[18]~1_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~24_combout\ : std_logic;
SIGNAL \uart_control_c|max_tx_count[17]~2_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22_combout\ : std_logic;
SIGNAL \uart_control_c|max_tx_count[16]~3_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ : std_logic;
SIGNAL \uart_control_c|max_tx_count[14]~4_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ : std_logic;
SIGNAL \uart_control_c|max_tx_count[9]~5_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\ : std_logic;
SIGNAL \uart_control_c|max_tx_count[6]~6_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][4]~combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][3]~21_combout\ : std_logic;
SIGNAL \uart_control_c|Mult0|mult_core|romout[0][2]~22_combout\ : std_logic;
SIGNAL \uart_control_c|max_tx_count[1]~8_combout\ : std_logic;
SIGNAL \tx_c|LessThan0~1_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~3_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~5_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~7_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~9_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~11_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~13_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~15_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~17_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~19_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~21_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~23_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~25_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~27_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~29_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~31_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~33_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~35_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~37_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~39_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~41_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~43_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~45_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~47_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~49_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~51_cout\ : std_logic;
SIGNAL \tx_c|LessThan0~52_combout\ : std_logic;
SIGNAL \tx_c|LessThan0~55_combout\ : std_logic;
SIGNAL \tx_c|max_tx_flag~q\ : std_logic;
SIGNAL \uart_control_c|Add3~0_combout\ : std_logic;
SIGNAL \uart_control_c|new_reg_data[0]~1_combout\ : std_logic;
SIGNAL \uart_control_c|new_reg_data[0]~2_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~1\ : std_logic;
SIGNAL \uart_control_c|Add3~2_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~7_combout\ : std_logic;
SIGNAL \uart_control_c|new_reg_data[7]~0_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~3\ : std_logic;
SIGNAL \uart_control_c|Add3~4_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~6_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~5\ : std_logic;
SIGNAL \uart_control_c|Add3~8_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~10_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~9\ : std_logic;
SIGNAL \uart_control_c|Add3~11_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~19_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~12\ : std_logic;
SIGNAL \uart_control_c|Add3~13_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~18_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~14\ : std_logic;
SIGNAL \uart_control_c|Add3~15_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~17_combout\ : std_logic;
SIGNAL \uart_control_c|reg_data[6]~feeder_combout\ : std_logic;
SIGNAL \uart_control_c|Selector6~0_combout\ : std_logic;
SIGNAL \uart_control_c|state.CH_REG_DATA3~q\ : std_logic;
SIGNAL \uart_control_c|Add3~16\ : std_logic;
SIGNAL \uart_control_c|Add3~20_combout\ : std_logic;
SIGNAL \uart_control_c|Add3~22_combout\ : std_logic;
SIGNAL \uart_control_c|reg_data[7]~3_combout\ : std_logic;
SIGNAL \uart_control_c|reg_data[4]~2_combout\ : std_logic;
SIGNAL \uart_control_c|reg_data[5]~feeder_combout\ : std_logic;
SIGNAL \tx_c|Mux0~2_combout\ : std_logic;
SIGNAL \tx_c|Mux0~3_combout\ : std_logic;
SIGNAL \uart_control_c|reg_data[3]~1_combout\ : std_logic;
SIGNAL \uart_control_c|reg_data[1]~0_combout\ : std_logic;
SIGNAL \uart_control_c|reg_data[0]~feeder_combout\ : std_logic;
SIGNAL \tx_c|Mux0~0_combout\ : std_logic;
SIGNAL \tx_c|Mux0~1_combout\ : std_logic;
SIGNAL \tx_c|tx_bit_data~0_combout\ : std_logic;
SIGNAL \tx_c|tx_bit_data~q\ : std_logic;
SIGNAL \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \tx_c|tx_count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \uart_control_c|max_tx_count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \uart_control_c|reg_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \tx_c|index\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \uart_control_c|new_tx_max_count\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \uart_control_c|new_reg_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \tx_c|ALT_INV_max_tx_flag~q\ : std_logic;
SIGNAL \uart_mcu_c|rs232_0|RS232_Out_Serializer|ALT_INV_serial_data_out~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_UART_RXD <= UART_RXD;
UART_TXD <= ww_UART_TXD;
led1 <= ww_led1;
led2 <= ww_led2;
led3 <= ww_led3;
led4 <= ww_led4;
tx_bit_data <= ww_tx_bit_data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\tx_pll_c|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk~inputclkctrl_outclk\);

\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk\(0) <= \tx_pll_c|altpll_component|auto_generated|pll1_CLK_bus\(0);
\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk\(1) <= \tx_pll_c|altpll_component|auto_generated|pll1_CLK_bus\(1);
\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk\(2) <= \tx_pll_c|altpll_component|auto_generated|pll1_CLK_bus\(2);
\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk\(3) <= \tx_pll_c|altpll_component|auto_generated|pll1_CLK_bus\(3);
\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk\(4) <= \tx_pll_c|altpll_component|auto_generated|pll1_CLK_bus\(4);

\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ <= (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\ & 
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\ & \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\ & 
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\ & \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\ & 
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\ & \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\);

\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) <= \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(0);
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) <= \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(1);
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) <= \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(2);
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) <= \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(3);
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) <= \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(4);
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5) <= \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(5);
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6) <= \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(6);
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(7) <= \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(7);

\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(8) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(7) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(6) & 
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(5) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(4) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(3) & 
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(2) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(1));

\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ <= (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & 
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & 
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ <= (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\ & 
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\ & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\ & 
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\ & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\ & 
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\ & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\);

\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) <= \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(0);
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) <= \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(1);
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) <= \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(2);
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) <= \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(3);
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) <= \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(4);
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5) <= \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(5);
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6) <= \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(6);
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(7) <= \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(7);

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk\(1));

\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk\(0));

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\tx_c|ALT_INV_max_tx_flag~q\ <= NOT \tx_c|max_tx_flag~q\;
\uart_mcu_c|rs232_0|RS232_Out_Serializer|ALT_INV_serial_data_out~q\ <= NOT \uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out~q\;

-- Location: IOOBUF_X6_Y0_N16
\UART_TXD~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uart_mcu_c|rs232_0|RS232_Out_Serializer|ALT_INV_serial_data_out~q\,
	devoe => ww_devoe,
	o => ww_UART_TXD);

-- Location: IOOBUF_X13_Y0_N9
\led1~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_led1);

-- Location: IOOBUF_X13_Y0_N30
\led2~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tx_c|ALT_INV_max_tx_flag~q\,
	devoe => ww_devoe,
	o => ww_led2);

-- Location: IOOBUF_X15_Y0_N23
\led3~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tx_c|ALT_INV_max_tx_flag~q\,
	devoe => ww_devoe,
	o => ww_led3);

-- Location: IOOBUF_X13_Y0_N23
\led4~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tx_c|ALT_INV_max_tx_flag~q\,
	devoe => ww_devoe,
	o => ww_led4);

-- Location: IOOBUF_X17_Y25_N23
\tx_bit_data~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tx_c|tx_bit_data~q\,
	devoe => ww_devoe,
	o => ww_tx_bit_data);

-- Location: IOIBUF_X31_Y11_N15
\clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G8
\clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: PLL_1
\tx_pll_c|altpll_component|auto_generated|pll1\ : fiftyfivenm_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 10,
	c0_initial => 1,
	c0_low => 10,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 27,
	c1_initial => 1,
	c1_low => 26,
	c1_mode => "odd",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 4,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "c1",
	clk1_divide_by => 53,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 5,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 10000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 28,
	m => 5,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "functional",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 250,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \tx_pll_c|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \tx_pll_c|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \tx_pll_c|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \tx_pll_c|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G3
\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X25_Y12_N6
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~combout\ = !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0)
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\ = 
-- CARRY(!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\);

-- Location: LCCOMB_X25_Y13_N18
\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\ & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\ & 
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\);

-- Location: FF_X25_Y12_N7
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0));

-- Location: LCCOMB_X25_Y12_N8
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1) 
-- & ((GND) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1) & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\ $ 
-- (GND)))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\ = 
-- CARRY((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\);

-- Location: FF_X25_Y12_N9
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1));

-- Location: LCCOMB_X25_Y12_N10
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2) 
-- & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\ & VCC)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2) & 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\ = 
-- CARRY((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2) & 
-- !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\);

-- Location: FF_X25_Y12_N11
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2));

-- Location: LCCOMB_X25_Y12_N12
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3) 
-- & ((GND) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3) & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\ $ 
-- (GND)))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\ = 
-- CARRY((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\);

-- Location: FF_X25_Y12_N13
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3));

-- Location: LCCOMB_X25_Y12_N14
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4) 
-- & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\ & VCC)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4) & 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\ = 
-- CARRY((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4) & 
-- !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\);

-- Location: FF_X25_Y12_N15
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4));

-- Location: LCCOMB_X25_Y12_N16
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5) 
-- & ((GND) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5) & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\ $ 
-- (GND)))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\ = 
-- CARRY((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\);

-- Location: FF_X25_Y12_N17
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5));

-- Location: LCCOMB_X25_Y12_N18
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6~combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6) $ 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6),
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6~combout\);

-- Location: FF_X25_Y12_N19
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6));

-- Location: LCCOMB_X25_Y12_N26
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire[0]~0_combout\ = 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3)) # ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5)) # 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4)) # (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3),
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire[0]~0_combout\);

-- Location: LCCOMB_X25_Y12_N24
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire\(0) = (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2) & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1) & 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire[0]~0_combout\ & 
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2),
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire[0]~0_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire\(0));

-- Location: FF_X25_Y12_N25
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|three_comparison|aneb_result_wire\(0),
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\);

-- Location: LCCOMB_X25_Y12_N22
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~feeder_combout\);

-- Location: FF_X25_Y12_N23
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~feeder_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\);

-- Location: LCCOMB_X25_Y12_N0
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~0_combout\ = !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~0_combout\);

-- Location: FF_X25_Y12_N1
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~0_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\);

-- Location: LCCOMB_X25_Y13_N2
\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\) # (\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~0_combout\);

-- Location: FF_X25_Y13_N3
\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\);

-- Location: LCCOMB_X25_Y14_N12
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~8_combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(0) $ (VCC)
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~9\ = CARRY(\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(0),
	datad => VCC,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~8_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~9\);

-- Location: LCCOMB_X25_Y14_N10
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~0_combout\ = (((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(1)) # (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(2))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(3))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(0),
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(3),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(1),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(2),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~0_combout\);

-- Location: LCCOMB_X25_Y14_N8
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\ = ((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~1_combout\ & !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~0_combout\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~1_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\);

-- Location: FF_X25_Y14_N13
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~8_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(0));

-- Location: LCCOMB_X25_Y14_N14
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~10_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(1) & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~9\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(1) & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~9\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~11\ = CARRY((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~9\) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(1),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[0]~9\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~10_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~11\);

-- Location: FF_X25_Y14_N15
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~10_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(1));

-- Location: LCCOMB_X25_Y14_N16
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~13_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(2) & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~11\ $ 
-- (GND))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(2) & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~11\ & VCC))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~14\ = CARRY((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(2) & !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(2),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[1]~11\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~13_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~14\);

-- Location: FF_X25_Y14_N17
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~13_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(2));

-- Location: LCCOMB_X25_Y14_N18
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~15_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(3) & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~14\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(3) & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~14\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~16\ = CARRY((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~14\) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(3),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[2]~14\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~15_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~16\);

-- Location: FF_X25_Y14_N19
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~15_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(3));

-- Location: LCCOMB_X25_Y14_N20
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~17_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(4) & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~16\ $ 
-- (GND))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(4) & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~16\ & VCC))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~18\ = CARRY((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(4) & !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(4),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[3]~16\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~17_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~18\);

-- Location: FF_X25_Y14_N21
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~17_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(4));

-- Location: LCCOMB_X25_Y14_N22
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~19_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(5) & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~18\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(5) & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~18\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~20\ = CARRY((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~18\) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(5),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[4]~18\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~19_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~20\);

-- Location: FF_X25_Y14_N23
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~19_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(5));

-- Location: LCCOMB_X25_Y14_N24
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~21_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(6) & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~20\ $ 
-- (GND))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(6) & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~20\ & VCC))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~22\ = CARRY((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(6) & !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(6),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~20\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~21_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~22\);

-- Location: FF_X25_Y14_N25
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~21_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(6));

-- Location: LCCOMB_X25_Y14_N26
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[7]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[7]~23_combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(7) $ (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~22\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(7),
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[6]~22\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[7]~23_combout\);

-- Location: FF_X25_Y14_N27
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[7]~23_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(7));

-- Location: LCCOMB_X25_Y14_N4
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~1_combout\ = (((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(5)) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(6))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(4))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(7),
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(4),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(5),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_counter\(6),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~1_combout\);

-- Location: LCCOMB_X25_Y14_N2
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\ = (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~1_combout\ & !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~1_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\);

-- Location: LCCOMB_X24_Y14_N6
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[0]~8_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\ & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0) $ (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[0]~8_combout\);

-- Location: FF_X24_Y14_N7
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0));

-- Location: LCCOMB_X24_Y14_N10
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\ = (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\ & \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\);

-- Location: LCCOMB_X24_Y14_N4
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[1]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[1]~6_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1) $ 
-- (((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0) & \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0),
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[1]~6_combout\);

-- Location: FF_X24_Y14_N5
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1));

-- Location: LCCOMB_X24_Y14_N8
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~0_combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2) $ (((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0) & 
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~0_combout\);

-- Location: LCCOMB_X24_Y14_N12
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~5_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~0_combout\)) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~5_combout\);

-- Location: FF_X24_Y14_N13
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2));

-- Location: LCCOMB_X24_Y14_N2
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~1_combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(3) $ (((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0) & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1) & \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0),
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(3),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~1_combout\);

-- Location: LCCOMB_X24_Y14_N18
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[3]~7_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~1_combout\)) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[2]~4_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Add1~1_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(3),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[3]~7_combout\);

-- Location: FF_X24_Y14_N19
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(3));

-- Location: LCCOMB_X24_Y14_N28
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0) & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(3) & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1) & !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(0),
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(3),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(1),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|bit_counter\(2),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\);

-- Location: LCCOMB_X25_Y13_N12
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal2~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~feeder_combout\);

-- Location: FF_X25_Y13_N13
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\);

-- Location: LCCOMB_X24_Y20_N16
\~GND\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X25_Y12_N28
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0_combout\ = !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0_combout\);

-- Location: FF_X25_Y12_N29
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\);

-- Location: FF_X25_Y13_N25
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(0));

-- Location: LCCOMB_X25_Y13_N24
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\)) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(0),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\);

-- Location: FF_X27_Y13_N29
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(1));

-- Location: LCCOMB_X27_Y13_N6
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0) $ (VCC)
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\ = CARRY(\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0),
	datad => VCC,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\);

-- Location: LCCOMB_X25_Y13_N20
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\ & 
-- !\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\);

-- Location: FF_X27_Y13_N7
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0));

-- Location: LCCOMB_X27_Y13_N28
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0)))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(1),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\);

-- Location: LCCOMB_X27_Y13_N8
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1) & 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\)) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1) & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\ = 
-- CARRY((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\);

-- Location: FF_X27_Y13_N9
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1));

-- Location: FF_X27_Y13_N31
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(2));

-- Location: LCCOMB_X27_Y13_N30
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(2),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\);

-- Location: FF_X27_Y13_N21
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(3));

-- Location: LCCOMB_X27_Y13_N10
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2) & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\ $ (GND))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2) & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\ & 
-- VCC))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\ = CARRY((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2) & 
-- !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\);

-- Location: FF_X27_Y13_N11
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2));

-- Location: LCCOMB_X27_Y13_N20
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2)))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(3),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\);

-- Location: FF_X27_Y13_N23
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(4));

-- Location: LCCOMB_X27_Y13_N12
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3) & 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\)) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3) & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\ = 
-- CARRY((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\);

-- Location: FF_X27_Y13_N13
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3));

-- Location: LCCOMB_X27_Y13_N22
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3)))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(4),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\);

-- Location: LCCOMB_X27_Y13_N14
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4) & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\ $ (GND))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4) & (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\ & 
-- VCC))
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\ = CARRY((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4) & 
-- !\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\);

-- Location: FF_X27_Y13_N15
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4));

-- Location: FF_X27_Y13_N25
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(5));

-- Location: LCCOMB_X27_Y13_N24
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(5),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\);

-- Location: LCCOMB_X27_Y13_N16
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5~combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5) $ 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5),
	cin => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5~combout\);

-- Location: FF_X27_Y13_N17
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5));

-- Location: FF_X27_Y13_N27
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(6));

-- Location: LCCOMB_X27_Y13_N26
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5))) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(6),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\);

-- Location: M9K_X26_Y13_N0
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "uart_mcu:uart_mcu_c|uart_mcu_rs232_0:rs232_0|altera_up_rs232_out_serializer:RS232_Out_Serializer|altera_up_sync_fifo:RS232_Out_FIFO|scfifo:Sync_FIFO|scfifo_0e31:auto_generated|a_dpfifo_j531:dpfifo|altsyncram_35b1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 7,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 127,
	port_a_logical_ram_depth => 128,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 7,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 36,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 127,
	port_b_logical_ram_depth => 128,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbre => VCC,
	clk0 => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	ena0 => GND,
	portadatain => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X25_Y13_N26
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~9_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\) # 
-- (((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(7)) # (\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(7),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~9_combout\);

-- Location: LCCOMB_X25_Y14_N28
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|Equal0~2_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~feeder_combout\);

-- Location: FF_X25_Y14_N29
\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~q\);

-- Location: LCCOMB_X25_Y13_N14
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~q\) # ((!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\ & 
-- (\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & !\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|baud_clock_rising_edge~q\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\);

-- Location: FF_X25_Y13_N27
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~9_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(8));

-- Location: LCCOMB_X25_Y13_N8
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~8_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6)))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(8),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~8_combout\);

-- Location: FF_X25_Y13_N9
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~8_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(7));

-- Location: LCCOMB_X25_Y13_N22
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~7_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5)))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(7),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~7_combout\);

-- Location: FF_X25_Y13_N23
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~7_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(6));

-- Location: LCCOMB_X25_Y13_N4
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~6_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4)))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(6),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~6_combout\);

-- Location: FF_X25_Y13_N5
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~6_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(5));

-- Location: LCCOMB_X25_Y13_N30
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~5_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3)))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(5),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~5_combout\);

-- Location: FF_X25_Y13_N31
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~5_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(4));

-- Location: LCCOMB_X25_Y13_N6
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~4_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2)))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(4),
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~4_combout\);

-- Location: FF_X25_Y13_N7
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~4_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(3));

-- Location: LCCOMB_X25_Y13_N16
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~3_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1)))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(3),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~3_combout\);

-- Location: FF_X25_Y13_N17
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~3_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(2));

-- Location: LCCOMB_X25_Y13_N28
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~2_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0)))) # 
-- (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\ & (\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(2),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|read_fifo_en~0_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~2_combout\);

-- Location: FF_X25_Y13_N29
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~2_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(1));

-- Location: LCCOMB_X25_Y13_N10
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~0_combout\ = (\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(1) & ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\) # 
-- ((\uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\) # (!\uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_Counters|all_bits_transmitted~q\,
	datab => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(1),
	datac => \uart_mcu_c|rs232_0|RS232_Out_Serializer|transmitting_data~q\,
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|RS232_Out_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~0_combout\);

-- Location: FF_X25_Y13_N11
\uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~0_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(0));

-- Location: LCCOMB_X25_Y13_N0
\uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_Out_Serializer|data_out_shift_reg\(0),
	combout => \uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out~feeder_combout\);

-- Location: FF_X25_Y13_N1
\uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_Out_Serializer|serial_data_out~q\);

-- Location: CLKCTRL_G4
\tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

-- Location: LCCOMB_X23_Y8_N16
\tx_c|index~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|index~1_combout\ = (!\tx_c|max_tx_flag~q\ & !\tx_c|index\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|max_tx_flag~q\,
	datac => \tx_c|index\(0),
	combout => \tx_c|index~1_combout\);

-- Location: FF_X23_Y8_N17
\tx_c|index[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|index~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|index\(0));

-- Location: LCCOMB_X23_Y8_N8
\tx_c|index~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|index~0_combout\ = (!\tx_c|max_tx_flag~q\ & (\tx_c|index\(1) $ (\tx_c|index\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|max_tx_flag~q\,
	datac => \tx_c|index\(1),
	datad => \tx_c|index\(0),
	combout => \tx_c|index~0_combout\);

-- Location: FF_X23_Y8_N9
\tx_c|index[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|index~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|index\(1));

-- Location: LCCOMB_X23_Y8_N22
\tx_c|index~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|index~2_combout\ = (!\tx_c|max_tx_flag~q\ & (\tx_c|index\(2) $ (((\tx_c|index\(1) & \tx_c|index\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|max_tx_flag~q\,
	datab => \tx_c|index\(1),
	datac => \tx_c|index\(2),
	datad => \tx_c|index\(0),
	combout => \tx_c|index~2_combout\);

-- Location: FF_X23_Y8_N23
\tx_c|index[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|index~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|index\(2));

-- Location: LCCOMB_X23_Y8_N20
\tx_c|tx_count[0]~93\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[0]~93_combout\ = \tx_c|tx_count\(0) $ (((!\tx_c|index\(2) & (!\tx_c|index\(1) & \tx_c|index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|index\(2),
	datab => \tx_c|index\(1),
	datac => \tx_c|tx_count\(0),
	datad => \tx_c|index\(0),
	combout => \tx_c|tx_count[0]~93_combout\);

-- Location: FF_X23_Y8_N21
\tx_c|tx_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[0]~93_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(0));

-- Location: LCCOMB_X18_Y5_N2
\tx_c|tx_count[1]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[1]~31_combout\ = (\tx_c|tx_count\(1) & (\tx_c|tx_count\(0) $ (VCC))) # (!\tx_c|tx_count\(1) & (\tx_c|tx_count\(0) & VCC))
-- \tx_c|tx_count[1]~32\ = CARRY((\tx_c|tx_count\(1) & \tx_c|tx_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(1),
	datab => \tx_c|tx_count\(0),
	datad => VCC,
	combout => \tx_c|tx_count[1]~31_combout\,
	cout => \tx_c|tx_count[1]~32\);

-- Location: LCCOMB_X23_Y8_N14
\tx_c|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|Equal0~0_combout\ = (!\tx_c|index\(2) & (\tx_c|index\(0) & !\tx_c|index\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|index\(2),
	datab => \tx_c|index\(0),
	datac => \tx_c|index\(1),
	combout => \tx_c|Equal0~0_combout\);

-- Location: FF_X18_Y5_N3
\tx_c|tx_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[1]~31_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(1));

-- Location: LCCOMB_X18_Y5_N4
\tx_c|tx_count[2]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[2]~33_combout\ = (\tx_c|tx_count\(2) & (!\tx_c|tx_count[1]~32\)) # (!\tx_c|tx_count\(2) & ((\tx_c|tx_count[1]~32\) # (GND)))
-- \tx_c|tx_count[2]~34\ = CARRY((!\tx_c|tx_count[1]~32\) # (!\tx_c|tx_count\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(2),
	datad => VCC,
	cin => \tx_c|tx_count[1]~32\,
	combout => \tx_c|tx_count[2]~33_combout\,
	cout => \tx_c|tx_count[2]~34\);

-- Location: FF_X18_Y5_N5
\tx_c|tx_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[2]~33_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(2));

-- Location: LCCOMB_X18_Y5_N6
\tx_c|tx_count[3]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[3]~35_combout\ = (\tx_c|tx_count\(3) & (\tx_c|tx_count[2]~34\ $ (GND))) # (!\tx_c|tx_count\(3) & (!\tx_c|tx_count[2]~34\ & VCC))
-- \tx_c|tx_count[3]~36\ = CARRY((\tx_c|tx_count\(3) & !\tx_c|tx_count[2]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(3),
	datad => VCC,
	cin => \tx_c|tx_count[2]~34\,
	combout => \tx_c|tx_count[3]~35_combout\,
	cout => \tx_c|tx_count[3]~36\);

-- Location: FF_X18_Y5_N7
\tx_c|tx_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[3]~35_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(3));

-- Location: LCCOMB_X18_Y5_N8
\tx_c|tx_count[4]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[4]~37_combout\ = (\tx_c|tx_count\(4) & (!\tx_c|tx_count[3]~36\)) # (!\tx_c|tx_count\(4) & ((\tx_c|tx_count[3]~36\) # (GND)))
-- \tx_c|tx_count[4]~38\ = CARRY((!\tx_c|tx_count[3]~36\) # (!\tx_c|tx_count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(4),
	datad => VCC,
	cin => \tx_c|tx_count[3]~36\,
	combout => \tx_c|tx_count[4]~37_combout\,
	cout => \tx_c|tx_count[4]~38\);

-- Location: FF_X18_Y5_N9
\tx_c|tx_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[4]~37_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(4));

-- Location: LCCOMB_X18_Y5_N10
\tx_c|tx_count[5]~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[5]~39_combout\ = (\tx_c|tx_count\(5) & (\tx_c|tx_count[4]~38\ $ (GND))) # (!\tx_c|tx_count\(5) & (!\tx_c|tx_count[4]~38\ & VCC))
-- \tx_c|tx_count[5]~40\ = CARRY((\tx_c|tx_count\(5) & !\tx_c|tx_count[4]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(5),
	datad => VCC,
	cin => \tx_c|tx_count[4]~38\,
	combout => \tx_c|tx_count[5]~39_combout\,
	cout => \tx_c|tx_count[5]~40\);

-- Location: FF_X18_Y5_N11
\tx_c|tx_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[5]~39_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(5));

-- Location: LCCOMB_X18_Y5_N12
\tx_c|tx_count[6]~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[6]~41_combout\ = (\tx_c|tx_count\(6) & (!\tx_c|tx_count[5]~40\)) # (!\tx_c|tx_count\(6) & ((\tx_c|tx_count[5]~40\) # (GND)))
-- \tx_c|tx_count[6]~42\ = CARRY((!\tx_c|tx_count[5]~40\) # (!\tx_c|tx_count\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(6),
	datad => VCC,
	cin => \tx_c|tx_count[5]~40\,
	combout => \tx_c|tx_count[6]~41_combout\,
	cout => \tx_c|tx_count[6]~42\);

-- Location: FF_X18_Y5_N13
\tx_c|tx_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[6]~41_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(6));

-- Location: LCCOMB_X18_Y5_N14
\tx_c|tx_count[7]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[7]~43_combout\ = (\tx_c|tx_count\(7) & (\tx_c|tx_count[6]~42\ $ (GND))) # (!\tx_c|tx_count\(7) & (!\tx_c|tx_count[6]~42\ & VCC))
-- \tx_c|tx_count[7]~44\ = CARRY((\tx_c|tx_count\(7) & !\tx_c|tx_count[6]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(7),
	datad => VCC,
	cin => \tx_c|tx_count[6]~42\,
	combout => \tx_c|tx_count[7]~43_combout\,
	cout => \tx_c|tx_count[7]~44\);

-- Location: FF_X18_Y5_N15
\tx_c|tx_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[7]~43_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(7));

-- Location: LCCOMB_X18_Y5_N16
\tx_c|tx_count[8]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[8]~45_combout\ = (\tx_c|tx_count\(8) & (!\tx_c|tx_count[7]~44\)) # (!\tx_c|tx_count\(8) & ((\tx_c|tx_count[7]~44\) # (GND)))
-- \tx_c|tx_count[8]~46\ = CARRY((!\tx_c|tx_count[7]~44\) # (!\tx_c|tx_count\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(8),
	datad => VCC,
	cin => \tx_c|tx_count[7]~44\,
	combout => \tx_c|tx_count[8]~45_combout\,
	cout => \tx_c|tx_count[8]~46\);

-- Location: FF_X18_Y5_N17
\tx_c|tx_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[8]~45_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(8));

-- Location: LCCOMB_X18_Y5_N18
\tx_c|tx_count[9]~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[9]~47_combout\ = (\tx_c|tx_count\(9) & (\tx_c|tx_count[8]~46\ $ (GND))) # (!\tx_c|tx_count\(9) & (!\tx_c|tx_count[8]~46\ & VCC))
-- \tx_c|tx_count[9]~48\ = CARRY((\tx_c|tx_count\(9) & !\tx_c|tx_count[8]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(9),
	datad => VCC,
	cin => \tx_c|tx_count[8]~46\,
	combout => \tx_c|tx_count[9]~47_combout\,
	cout => \tx_c|tx_count[9]~48\);

-- Location: FF_X18_Y5_N19
\tx_c|tx_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[9]~47_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(9));

-- Location: LCCOMB_X18_Y5_N20
\tx_c|tx_count[10]~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[10]~49_combout\ = (\tx_c|tx_count\(10) & (!\tx_c|tx_count[9]~48\)) # (!\tx_c|tx_count\(10) & ((\tx_c|tx_count[9]~48\) # (GND)))
-- \tx_c|tx_count[10]~50\ = CARRY((!\tx_c|tx_count[9]~48\) # (!\tx_c|tx_count\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(10),
	datad => VCC,
	cin => \tx_c|tx_count[9]~48\,
	combout => \tx_c|tx_count[10]~49_combout\,
	cout => \tx_c|tx_count[10]~50\);

-- Location: FF_X18_Y5_N21
\tx_c|tx_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[10]~49_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(10));

-- Location: LCCOMB_X18_Y5_N22
\tx_c|tx_count[11]~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[11]~51_combout\ = (\tx_c|tx_count\(11) & (\tx_c|tx_count[10]~50\ $ (GND))) # (!\tx_c|tx_count\(11) & (!\tx_c|tx_count[10]~50\ & VCC))
-- \tx_c|tx_count[11]~52\ = CARRY((\tx_c|tx_count\(11) & !\tx_c|tx_count[10]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(11),
	datad => VCC,
	cin => \tx_c|tx_count[10]~50\,
	combout => \tx_c|tx_count[11]~51_combout\,
	cout => \tx_c|tx_count[11]~52\);

-- Location: FF_X18_Y5_N23
\tx_c|tx_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[11]~51_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(11));

-- Location: LCCOMB_X18_Y5_N24
\tx_c|tx_count[12]~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[12]~53_combout\ = (\tx_c|tx_count\(12) & (!\tx_c|tx_count[11]~52\)) # (!\tx_c|tx_count\(12) & ((\tx_c|tx_count[11]~52\) # (GND)))
-- \tx_c|tx_count[12]~54\ = CARRY((!\tx_c|tx_count[11]~52\) # (!\tx_c|tx_count\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(12),
	datad => VCC,
	cin => \tx_c|tx_count[11]~52\,
	combout => \tx_c|tx_count[12]~53_combout\,
	cout => \tx_c|tx_count[12]~54\);

-- Location: FF_X18_Y5_N25
\tx_c|tx_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[12]~53_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(12));

-- Location: LCCOMB_X18_Y5_N26
\tx_c|tx_count[13]~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[13]~55_combout\ = (\tx_c|tx_count\(13) & (\tx_c|tx_count[12]~54\ $ (GND))) # (!\tx_c|tx_count\(13) & (!\tx_c|tx_count[12]~54\ & VCC))
-- \tx_c|tx_count[13]~56\ = CARRY((\tx_c|tx_count\(13) & !\tx_c|tx_count[12]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(13),
	datad => VCC,
	cin => \tx_c|tx_count[12]~54\,
	combout => \tx_c|tx_count[13]~55_combout\,
	cout => \tx_c|tx_count[13]~56\);

-- Location: FF_X18_Y5_N27
\tx_c|tx_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[13]~55_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(13));

-- Location: LCCOMB_X18_Y5_N28
\tx_c|tx_count[14]~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[14]~57_combout\ = (\tx_c|tx_count\(14) & (!\tx_c|tx_count[13]~56\)) # (!\tx_c|tx_count\(14) & ((\tx_c|tx_count[13]~56\) # (GND)))
-- \tx_c|tx_count[14]~58\ = CARRY((!\tx_c|tx_count[13]~56\) # (!\tx_c|tx_count\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(14),
	datad => VCC,
	cin => \tx_c|tx_count[13]~56\,
	combout => \tx_c|tx_count[14]~57_combout\,
	cout => \tx_c|tx_count[14]~58\);

-- Location: FF_X18_Y5_N29
\tx_c|tx_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[14]~57_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(14));

-- Location: LCCOMB_X18_Y5_N30
\tx_c|tx_count[15]~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[15]~59_combout\ = (\tx_c|tx_count\(15) & (\tx_c|tx_count[14]~58\ $ (GND))) # (!\tx_c|tx_count\(15) & (!\tx_c|tx_count[14]~58\ & VCC))
-- \tx_c|tx_count[15]~60\ = CARRY((\tx_c|tx_count\(15) & !\tx_c|tx_count[14]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(15),
	datad => VCC,
	cin => \tx_c|tx_count[14]~58\,
	combout => \tx_c|tx_count[15]~59_combout\,
	cout => \tx_c|tx_count[15]~60\);

-- Location: FF_X18_Y5_N31
\tx_c|tx_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[15]~59_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(15));

-- Location: LCCOMB_X18_Y4_N0
\tx_c|tx_count[16]~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[16]~61_combout\ = (\tx_c|tx_count\(16) & (!\tx_c|tx_count[15]~60\)) # (!\tx_c|tx_count\(16) & ((\tx_c|tx_count[15]~60\) # (GND)))
-- \tx_c|tx_count[16]~62\ = CARRY((!\tx_c|tx_count[15]~60\) # (!\tx_c|tx_count\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(16),
	datad => VCC,
	cin => \tx_c|tx_count[15]~60\,
	combout => \tx_c|tx_count[16]~61_combout\,
	cout => \tx_c|tx_count[16]~62\);

-- Location: FF_X18_Y4_N1
\tx_c|tx_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[16]~61_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(16));

-- Location: LCCOMB_X18_Y4_N2
\tx_c|tx_count[17]~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[17]~63_combout\ = (\tx_c|tx_count\(17) & (\tx_c|tx_count[16]~62\ $ (GND))) # (!\tx_c|tx_count\(17) & (!\tx_c|tx_count[16]~62\ & VCC))
-- \tx_c|tx_count[17]~64\ = CARRY((\tx_c|tx_count\(17) & !\tx_c|tx_count[16]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(17),
	datad => VCC,
	cin => \tx_c|tx_count[16]~62\,
	combout => \tx_c|tx_count[17]~63_combout\,
	cout => \tx_c|tx_count[17]~64\);

-- Location: FF_X18_Y4_N3
\tx_c|tx_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[17]~63_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(17));

-- Location: LCCOMB_X18_Y4_N4
\tx_c|tx_count[18]~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[18]~65_combout\ = (\tx_c|tx_count\(18) & (!\tx_c|tx_count[17]~64\)) # (!\tx_c|tx_count\(18) & ((\tx_c|tx_count[17]~64\) # (GND)))
-- \tx_c|tx_count[18]~66\ = CARRY((!\tx_c|tx_count[17]~64\) # (!\tx_c|tx_count\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(18),
	datad => VCC,
	cin => \tx_c|tx_count[17]~64\,
	combout => \tx_c|tx_count[18]~65_combout\,
	cout => \tx_c|tx_count[18]~66\);

-- Location: FF_X18_Y4_N5
\tx_c|tx_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[18]~65_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(18));

-- Location: LCCOMB_X18_Y4_N6
\tx_c|tx_count[19]~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[19]~67_combout\ = (\tx_c|tx_count\(19) & (\tx_c|tx_count[18]~66\ $ (GND))) # (!\tx_c|tx_count\(19) & (!\tx_c|tx_count[18]~66\ & VCC))
-- \tx_c|tx_count[19]~68\ = CARRY((\tx_c|tx_count\(19) & !\tx_c|tx_count[18]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(19),
	datad => VCC,
	cin => \tx_c|tx_count[18]~66\,
	combout => \tx_c|tx_count[19]~67_combout\,
	cout => \tx_c|tx_count[19]~68\);

-- Location: FF_X18_Y4_N7
\tx_c|tx_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[19]~67_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(19));

-- Location: LCCOMB_X18_Y4_N8
\tx_c|tx_count[20]~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[20]~69_combout\ = (\tx_c|tx_count\(20) & (!\tx_c|tx_count[19]~68\)) # (!\tx_c|tx_count\(20) & ((\tx_c|tx_count[19]~68\) # (GND)))
-- \tx_c|tx_count[20]~70\ = CARRY((!\tx_c|tx_count[19]~68\) # (!\tx_c|tx_count\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(20),
	datad => VCC,
	cin => \tx_c|tx_count[19]~68\,
	combout => \tx_c|tx_count[20]~69_combout\,
	cout => \tx_c|tx_count[20]~70\);

-- Location: FF_X18_Y4_N9
\tx_c|tx_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[20]~69_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(20));

-- Location: LCCOMB_X18_Y4_N10
\tx_c|tx_count[21]~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[21]~71_combout\ = (\tx_c|tx_count\(21) & (\tx_c|tx_count[20]~70\ $ (GND))) # (!\tx_c|tx_count\(21) & (!\tx_c|tx_count[20]~70\ & VCC))
-- \tx_c|tx_count[21]~72\ = CARRY((\tx_c|tx_count\(21) & !\tx_c|tx_count[20]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(21),
	datad => VCC,
	cin => \tx_c|tx_count[20]~70\,
	combout => \tx_c|tx_count[21]~71_combout\,
	cout => \tx_c|tx_count[21]~72\);

-- Location: FF_X18_Y4_N11
\tx_c|tx_count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[21]~71_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(21));

-- Location: LCCOMB_X18_Y4_N12
\tx_c|tx_count[22]~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[22]~73_combout\ = (\tx_c|tx_count\(22) & (!\tx_c|tx_count[21]~72\)) # (!\tx_c|tx_count\(22) & ((\tx_c|tx_count[21]~72\) # (GND)))
-- \tx_c|tx_count[22]~74\ = CARRY((!\tx_c|tx_count[21]~72\) # (!\tx_c|tx_count\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(22),
	datad => VCC,
	cin => \tx_c|tx_count[21]~72\,
	combout => \tx_c|tx_count[22]~73_combout\,
	cout => \tx_c|tx_count[22]~74\);

-- Location: FF_X18_Y4_N13
\tx_c|tx_count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[22]~73_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(22));

-- Location: LCCOMB_X18_Y4_N14
\tx_c|tx_count[23]~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[23]~75_combout\ = (\tx_c|tx_count\(23) & (\tx_c|tx_count[22]~74\ $ (GND))) # (!\tx_c|tx_count\(23) & (!\tx_c|tx_count[22]~74\ & VCC))
-- \tx_c|tx_count[23]~76\ = CARRY((\tx_c|tx_count\(23) & !\tx_c|tx_count[22]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(23),
	datad => VCC,
	cin => \tx_c|tx_count[22]~74\,
	combout => \tx_c|tx_count[23]~75_combout\,
	cout => \tx_c|tx_count[23]~76\);

-- Location: FF_X18_Y4_N15
\tx_c|tx_count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[23]~75_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(23));

-- Location: LCCOMB_X18_Y4_N16
\tx_c|tx_count[24]~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[24]~77_combout\ = (\tx_c|tx_count\(24) & (!\tx_c|tx_count[23]~76\)) # (!\tx_c|tx_count\(24) & ((\tx_c|tx_count[23]~76\) # (GND)))
-- \tx_c|tx_count[24]~78\ = CARRY((!\tx_c|tx_count[23]~76\) # (!\tx_c|tx_count\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(24),
	datad => VCC,
	cin => \tx_c|tx_count[23]~76\,
	combout => \tx_c|tx_count[24]~77_combout\,
	cout => \tx_c|tx_count[24]~78\);

-- Location: FF_X18_Y4_N17
\tx_c|tx_count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[24]~77_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(24));

-- Location: LCCOMB_X18_Y4_N18
\tx_c|tx_count[25]~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[25]~79_combout\ = (\tx_c|tx_count\(25) & (\tx_c|tx_count[24]~78\ $ (GND))) # (!\tx_c|tx_count\(25) & (!\tx_c|tx_count[24]~78\ & VCC))
-- \tx_c|tx_count[25]~80\ = CARRY((\tx_c|tx_count\(25) & !\tx_c|tx_count[24]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(25),
	datad => VCC,
	cin => \tx_c|tx_count[24]~78\,
	combout => \tx_c|tx_count[25]~79_combout\,
	cout => \tx_c|tx_count[25]~80\);

-- Location: FF_X18_Y4_N19
\tx_c|tx_count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[25]~79_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(25));

-- Location: LCCOMB_X18_Y4_N20
\tx_c|tx_count[26]~81\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[26]~81_combout\ = (\tx_c|tx_count\(26) & (!\tx_c|tx_count[25]~80\)) # (!\tx_c|tx_count\(26) & ((\tx_c|tx_count[25]~80\) # (GND)))
-- \tx_c|tx_count[26]~82\ = CARRY((!\tx_c|tx_count[25]~80\) # (!\tx_c|tx_count\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(26),
	datad => VCC,
	cin => \tx_c|tx_count[25]~80\,
	combout => \tx_c|tx_count[26]~81_combout\,
	cout => \tx_c|tx_count[26]~82\);

-- Location: FF_X18_Y4_N21
\tx_c|tx_count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[26]~81_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(26));

-- Location: LCCOMB_X18_Y4_N22
\tx_c|tx_count[27]~83\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[27]~83_combout\ = (\tx_c|tx_count\(27) & (\tx_c|tx_count[26]~82\ $ (GND))) # (!\tx_c|tx_count\(27) & (!\tx_c|tx_count[26]~82\ & VCC))
-- \tx_c|tx_count[27]~84\ = CARRY((\tx_c|tx_count\(27) & !\tx_c|tx_count[26]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(27),
	datad => VCC,
	cin => \tx_c|tx_count[26]~82\,
	combout => \tx_c|tx_count[27]~83_combout\,
	cout => \tx_c|tx_count[27]~84\);

-- Location: FF_X18_Y4_N23
\tx_c|tx_count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[27]~83_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(27));

-- Location: LCCOMB_X18_Y4_N24
\tx_c|tx_count[28]~85\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[28]~85_combout\ = (\tx_c|tx_count\(28) & (!\tx_c|tx_count[27]~84\)) # (!\tx_c|tx_count\(28) & ((\tx_c|tx_count[27]~84\) # (GND)))
-- \tx_c|tx_count[28]~86\ = CARRY((!\tx_c|tx_count[27]~84\) # (!\tx_c|tx_count\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(28),
	datad => VCC,
	cin => \tx_c|tx_count[27]~84\,
	combout => \tx_c|tx_count[28]~85_combout\,
	cout => \tx_c|tx_count[28]~86\);

-- Location: FF_X18_Y4_N25
\tx_c|tx_count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[28]~85_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(28));

-- Location: LCCOMB_X18_Y4_N26
\tx_c|tx_count[29]~87\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[29]~87_combout\ = (\tx_c|tx_count\(29) & (\tx_c|tx_count[28]~86\ $ (GND))) # (!\tx_c|tx_count\(29) & (!\tx_c|tx_count[28]~86\ & VCC))
-- \tx_c|tx_count[29]~88\ = CARRY((\tx_c|tx_count\(29) & !\tx_c|tx_count[28]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(29),
	datad => VCC,
	cin => \tx_c|tx_count[28]~86\,
	combout => \tx_c|tx_count[29]~87_combout\,
	cout => \tx_c|tx_count[29]~88\);

-- Location: FF_X18_Y4_N27
\tx_c|tx_count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[29]~87_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(29));

-- Location: LCCOMB_X18_Y4_N28
\tx_c|tx_count[30]~89\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[30]~89_combout\ = (\tx_c|tx_count\(30) & (!\tx_c|tx_count[29]~88\)) # (!\tx_c|tx_count\(30) & ((\tx_c|tx_count[29]~88\) # (GND)))
-- \tx_c|tx_count[30]~90\ = CARRY((!\tx_c|tx_count[29]~88\) # (!\tx_c|tx_count\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(30),
	datad => VCC,
	cin => \tx_c|tx_count[29]~88\,
	combout => \tx_c|tx_count[30]~89_combout\,
	cout => \tx_c|tx_count[30]~90\);

-- Location: FF_X18_Y4_N29
\tx_c|tx_count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[30]~89_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(30));

-- Location: LCCOMB_X17_Y4_N0
\tx_c|LessThan0~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~54_combout\ = (!\tx_c|tx_count\(30) & !\tx_c|tx_count\(29))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(30),
	datad => \tx_c|tx_count\(29),
	combout => \tx_c|LessThan0~54_combout\);

-- Location: LCCOMB_X18_Y4_N30
\tx_c|tx_count[31]~91\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_count[31]~91_combout\ = \tx_c|tx_count\(31) $ (!\tx_c|tx_count[30]~90\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(31),
	cin => \tx_c|tx_count[30]~90\,
	combout => \tx_c|tx_count[31]~91_combout\);

-- Location: FF_X18_Y4_N31
\tx_c|tx_count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_count[31]~91_combout\,
	ena => \tx_c|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_count\(31));

-- Location: LCCOMB_X24_Y5_N2
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0) $ 
-- (((VCC) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\ = CARRY(\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ $ 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110011001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0),
	datad => VCC,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\);

-- Location: IOIBUF_X6_Y0_N22
\UART_RXD~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_UART_RXD,
	o => \UART_RXD~input_o\);

-- Location: LCCOMB_X23_Y5_N30
\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ = (!\UART_RXD~input_o\ & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \UART_RXD~input_o\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\);

-- Location: FF_X23_Y5_N23
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_0_dff\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_0_dff~q\);

-- Location: LCCOMB_X23_Y5_N4
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~0_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ & ((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_0_dff~q\))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_0_dff~q\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~0_combout\);

-- Location: LCCOMB_X24_Y5_N6
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~combout\ = 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2) & 
-- ((VCC)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2) $ (((VCC) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\)))))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\ = 
-- CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2) $ (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\);

-- Location: LCCOMB_X24_Y5_N8
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~combout\ = 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3) $ 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\) # (VCC))))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\ & 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3)) # (GND))))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ $ 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\);

-- Location: FF_X24_Y5_N9
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3));

-- Location: LCCOMB_X24_Y5_N10
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~combout\ = 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4) & 
-- ((VCC)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4) $ (((VCC) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\)))))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\ = 
-- CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4) $ (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita3~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\);

-- Location: FF_X24_Y5_N11
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4));

-- Location: LCCOMB_X24_Y5_N12
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~combout\ = 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5) $ 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\) # (VCC))))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5)) # ((GND))))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\ = 
-- CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5) $ (\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita4~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\);

-- Location: FF_X24_Y5_N13
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5));

-- Location: LCCOMB_X24_Y5_N14
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6~combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6) $ 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6),
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita5~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6~combout\);

-- Location: FF_X24_Y5_N15
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita6~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6));

-- Location: LCCOMB_X24_Y5_N24
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~7_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1) & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~7_combout\);

-- Location: LCCOMB_X24_Y5_N30
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~8_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~7_combout\ & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3) & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~7_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~8_combout\);

-- Location: LCCOMB_X23_Y5_N20
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~0_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\ & \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~0_combout\);

-- Location: LCCOMB_X23_Y5_N26
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~1_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~0_combout\) # 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~8_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~1_combout\);

-- Location: FF_X23_Y5_N27
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\);

-- Location: LCCOMB_X23_Y5_N24
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~1_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~0_combout\) # 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\ & !\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_2_dff~q\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~1_combout\);

-- Location: FF_X23_Y5_N25
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\);

-- Location: LCCOMB_X23_Y5_N22
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~2_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_0_dff~q\))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_0_dff~q\) # (\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_1_dff~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_is_0_dff~q\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~2_combout\);

-- Location: LCCOMB_X24_Y7_N16
\uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\ & ((\UART_RXD~input_o\) # (\uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_RXD~input_o\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~0_combout\);

-- Location: FF_X24_Y7_N17
\uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\);

-- Location: LCCOMB_X25_Y7_N4
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~8_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0) $ (VCC)
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~9\ = CARRY(\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0),
	datad => VCC,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~8_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~9\);

-- Location: LCCOMB_X25_Y7_N12
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~17_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~16\ $ 
-- (GND))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~16\ & VCC))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~18\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4) & !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~16\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~17_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~18\);

-- Location: LCCOMB_X25_Y7_N14
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~19_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~18\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5) & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~18\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~20\ = CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~18\) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~18\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~19_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~20\);

-- Location: FF_X25_Y7_N15
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~19_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5));

-- Location: LCCOMB_X25_Y7_N16
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~21_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(6) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~20\ $ 
-- (GND))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(6) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~20\ & VCC))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~22\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(6) & !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(6),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[5]~20\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~21_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~22\);

-- Location: FF_X25_Y7_N17
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~21_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(6));

-- Location: LCCOMB_X25_Y7_N28
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(3) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(6) & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(3),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(6),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(1),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\);

-- Location: LCCOMB_X25_Y7_N30
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\ = ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~0_combout\ & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~0_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\);

-- Location: FF_X25_Y7_N5
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~8_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0));

-- Location: LCCOMB_X25_Y7_N6
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~10_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(1) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~9\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(1) & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~9\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~11\ = CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~9\) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(1),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[0]~9\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~10_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~11\);

-- Location: FF_X25_Y7_N7
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~10_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(1));

-- Location: LCCOMB_X25_Y7_N8
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~12_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~11\ $ 
-- (GND))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~11\ & VCC))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~13\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2) & !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[1]~11\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~12_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~13\);

-- Location: FF_X25_Y7_N9
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~12_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2));

-- Location: LCCOMB_X25_Y7_N10
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~15_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(3) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~13\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(3) & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~13\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~16\ = CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~13\) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(3),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[2]~13\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~15_combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~16\);

-- Location: FF_X25_Y7_N11
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~15_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(3));

-- Location: FF_X25_Y7_N13
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[4]~17_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4));

-- Location: LCCOMB_X25_Y7_N18
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[7]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[7]~23_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(7) $ (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~22\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(7),
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[6]~22\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[7]~23_combout\);

-- Location: FF_X25_Y7_N19
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[7]~23_combout\,
	sclr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter[3]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(7));

-- Location: LCCOMB_X25_Y7_N22
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~0_combout\ = ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2)) # ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(7)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(7),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~0_combout\);

-- Location: LCCOMB_X25_Y7_N26
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~0_combout\) # ((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~0_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\);

-- Location: LCCOMB_X24_Y7_N12
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[0]~6_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0) $ (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[0]~6_combout\);

-- Location: FF_X24_Y7_N13
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0));

-- Location: LCCOMB_X24_Y7_N2
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\ & \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|receiving_data~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\);

-- Location: LCCOMB_X24_Y7_N14
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[1]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[1]~4_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1) $ 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0) & !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[1]~4_combout\);

-- Location: FF_X24_Y7_N15
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1));

-- Location: LCCOMB_X24_Y7_N20
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~0_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2) $ (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0) & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~0_combout\);

-- Location: LCCOMB_X24_Y7_N22
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~3_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~0_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~3_combout\);

-- Location: FF_X24_Y7_N23
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2));

-- Location: LCCOMB_X24_Y7_N10
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~1_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(3) $ (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(3),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~1_combout\);

-- Location: LCCOMB_X24_Y7_N28
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[3]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[3]~5_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(3)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Add1~1_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[2]~2_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(3),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal0~1_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[3]~5_combout\);

-- Location: FF_X24_Y7_N29
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(3));

-- Location: LCCOMB_X24_Y7_N18
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(0),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(1),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(2),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|bit_counter\(3),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\);

-- Location: LCCOMB_X24_Y7_N8
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal2~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~feeder_combout\);

-- Location: FF_X24_Y7_N9
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\);

-- Location: LCCOMB_X24_Y5_N28
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~10_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~2_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\) # ((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~2_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_will_be_1~1_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~10_combout\);

-- Location: FF_X24_Y5_N29
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\);

-- Location: LCCOMB_X24_Y5_N20
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (\UART_RXD~input_o\ $ 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\))))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\,
	datac => \UART_RXD~input_o\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\);

-- Location: FF_X24_Y5_N3
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0));

-- Location: LCCOMB_X24_Y5_N4
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~combout\ = 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1) $ 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\) # (VCC))))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\ & 
-- (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1)) # (GND))))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ $ 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita0~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~COUT\);

-- Location: FF_X24_Y5_N5
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita1~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1));

-- Location: FF_X24_Y5_N7
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_comb_bita2~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2));

-- Location: LCCOMB_X24_Y5_N22
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~4_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1) & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(2),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(0),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(1),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~4_combout\);

-- Location: LCCOMB_X24_Y5_N16
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~3_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3) & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(4),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(6),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(3),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|usedw_counter|counter_reg_bit\(5),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~3_combout\);

-- Location: LCCOMB_X24_Y5_N0
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~5_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\) # ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~4_combout\ & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~4_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~3_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~5_combout\);

-- Location: FF_X24_Y5_N1
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\);

-- Location: LCCOMB_X24_Y5_N18
\uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\ & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|full_dff~q\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|all_bits_transmitted~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\);

-- Location: LCCOMB_X25_Y6_N2
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[9]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[9]~0_combout\ = !\UART_RXD~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \UART_RXD~input_o\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[9]~0_combout\);

-- Location: LCCOMB_X25_Y7_N24
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~1_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5) & !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(4),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(2),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(5),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(7),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~1_combout\);

-- Location: LCCOMB_X25_Y7_N20
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~2_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~1_combout\ & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0) & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~1_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_counter\(0),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~0_combout\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~2_combout\);

-- Location: FF_X25_Y7_N21
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|Equal1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\);

-- Location: FF_X25_Y6_N3
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[9]~0_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(9));

-- Location: LCCOMB_X25_Y6_N30
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[8]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[8]~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(9),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[8]~feeder_combout\);

-- Location: FF_X25_Y6_N31
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[8]~feeder_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(8));

-- Location: FF_X25_Y6_N1
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(8),
	sload => VCC,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(7));

-- Location: LCCOMB_X25_Y6_N10
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[6]~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(7),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[6]~feeder_combout\);

-- Location: FF_X25_Y6_N11
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[6]~feeder_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(6));

-- Location: LCCOMB_X25_Y6_N8
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[5]~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(6),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[5]~feeder_combout\);

-- Location: FF_X25_Y6_N9
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[5]~feeder_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(5));

-- Location: FF_X25_Y6_N5
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(5),
	sload => VCC,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(4));

-- Location: FF_X25_Y6_N7
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(4),
	sload => VCC,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(3));

-- Location: LCCOMB_X25_Y6_N28
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[2]~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(3),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[2]~feeder_combout\);

-- Location: FF_X25_Y6_N29
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[2]~feeder_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(2));

-- Location: LCCOMB_X25_Y6_N12
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[1]~feeder_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(2),
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[1]~feeder_combout\);

-- Location: FF_X25_Y6_N13
\uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg[1]~feeder_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_Counters|baud_clock_falling_edge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|data_in_shift_reg\(1));

-- Location: LCCOMB_X25_Y6_N14
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0) $ (VCC)
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ = CARRY(\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0),
	datad => VCC,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\);

-- Location: FF_X25_Y6_N15
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

-- Location: LCCOMB_X25_Y6_N16
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ = CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\);

-- Location: FF_X25_Y6_N17
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1));

-- Location: LCCOMB_X25_Y6_N18
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ $ (GND))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ & VCC))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\);

-- Location: FF_X25_Y6_N19
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2));

-- Location: LCCOMB_X25_Y6_N20
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ = CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\);

-- Location: FF_X25_Y6_N21
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3));

-- Location: LCCOMB_X25_Y6_N22
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ $ (GND))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ & VCC))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\);

-- Location: FF_X25_Y6_N23
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4));

-- Location: LCCOMB_X25_Y6_N24
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ = CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\);

-- Location: FF_X25_Y6_N25
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5));

-- Location: LCCOMB_X25_Y6_N26
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) $ 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6),
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\);

-- Location: FF_X25_Y6_N27
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6));

-- Location: LCCOMB_X23_Y5_N28
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0_combout\ = !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0_combout\);

-- Location: FF_X23_Y5_N29
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~0_combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\);

-- Location: FF_X27_Y7_N9
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(0));

-- Location: LCCOMB_X27_Y7_N8
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\ = (\UART_RXD~input_o\ & (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(0))))) 
-- # (!\UART_RXD~input_o\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\,
	datab => \UART_RXD~input_o\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(0),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[0]~0_combout\);

-- Location: LCCOMB_X27_Y7_N16
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0) $ (VCC)
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\ = CARRY(\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0),
	datad => VCC,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\);

-- Location: LCCOMB_X27_Y7_N2
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (!\UART_RXD~input_o\ & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datac => \UART_RXD~input_o\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_lsb~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\);

-- Location: FF_X27_Y7_N17
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0));

-- Location: FF_X27_Y7_N7
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(1));

-- Location: LCCOMB_X27_Y7_N6
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\ = (\UART_RXD~input_o\ & (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(1))))) 
-- # (!\UART_RXD~input_o\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_RXD~input_o\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(0),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(1),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[1]~1_combout\);

-- Location: LCCOMB_X27_Y7_N18
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1) & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\ = 
-- CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita0~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\);

-- Location: FF_X27_Y7_N19
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1));

-- Location: FF_X27_Y7_N29
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(2));

-- Location: LCCOMB_X27_Y7_N28
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\ = (\UART_RXD~input_o\ & (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(2))))) 
-- # (!\UART_RXD~input_o\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_RXD~input_o\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(1),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(2),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[2]~2_combout\);

-- Location: LCCOMB_X27_Y7_N20
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\ $ (GND))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\ & 
-- VCC))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2) & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita1~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\);

-- Location: FF_X27_Y7_N21
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2));

-- Location: FF_X27_Y7_N15
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(3));

-- Location: LCCOMB_X27_Y7_N14
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\ = (\UART_RXD~input_o\ & (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(3))))) 
-- # (!\UART_RXD~input_o\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_RXD~input_o\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(2),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(3),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[3]~3_combout\);

-- Location: LCCOMB_X27_Y7_N22
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3) & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\) # (GND)))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\ = 
-- CARRY((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita2~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\);

-- Location: FF_X27_Y7_N23
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3));

-- Location: FF_X27_Y7_N5
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(4));

-- Location: LCCOMB_X27_Y7_N4
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\ = (\UART_RXD~input_o\ & (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(4))))) 
-- # (!\UART_RXD~input_o\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(3),
	datab => \UART_RXD~input_o\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(4),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[4]~4_combout\);

-- Location: LCCOMB_X27_Y7_N24
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\ $ (GND))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\ & 
-- VCC))
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4) & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4),
	datad => VCC,
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita3~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~combout\,
	cout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\);

-- Location: FF_X27_Y7_N25
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4));

-- Location: FF_X27_Y7_N31
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(5));

-- Location: LCCOMB_X27_Y7_N30
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\ = (\UART_RXD~input_o\ & (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(5))))) 
-- # (!\UART_RXD~input_o\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_RXD~input_o\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(4),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(5),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[5]~5_combout\);

-- Location: LCCOMB_X27_Y7_N26
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5~combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5) $ 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5),
	cin => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita4~COUT\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5~combout\);

-- Location: FF_X27_Y7_N27
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_comb_bita5~combout\,
	ena => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|_~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5));

-- Location: FF_X27_Y7_N1
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(6));

-- Location: LCCOMB_X27_Y7_N0
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\ = (\UART_RXD~input_o\ & (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(6))))) 
-- # (!\UART_RXD~input_o\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|rd_ptr_msb|counter_reg_bit\(5),
	datab => \UART_RXD~input_o\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|low_addressa\(6),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	combout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|ram_read_address[6]~6_combout\);

-- Location: M9K_X26_Y6_N0
\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "uart_mcu:uart_mcu_c|uart_mcu_rs232_0:rs232_0|altera_up_rs232_in_deserializer:RS232_In_Deserializer|altera_up_sync_fifo:RS232_In_FIFO|scfifo:Sync_FIFO|scfifo_0e31:auto_generated|a_dpfifo_j531:dpfifo|altsyncram_35b1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 7,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 127,
	port_a_logical_ram_depth => 128,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 7,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 36,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 127,
	port_b_logical_ram_depth => 128,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	portbre => VCC,
	clk0 => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	ena0 => \uart_mcu_c|rs232_0|RS232_In_Deserializer|comb~0_combout\,
	portadatain => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X25_Y8_N26
\uart_control_c|always0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|always0~1_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) & (((!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	combout => \uart_control_c|always0~1_combout\);

-- Location: LCCOMB_X25_Y8_N16
\uart_control_c|always0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|always0~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5) & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(7),
	combout => \uart_control_c|always0~0_combout\);

-- Location: LCCOMB_X24_Y8_N22
\uart_control_c|Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector3~0_combout\ = (\uart_control_c|always0~1_combout\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & \uart_control_c|always0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|always0~1_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datad => \uart_control_c|always0~0_combout\,
	combout => \uart_control_c|Selector3~0_combout\);

-- Location: LCCOMB_X25_Y8_N0
\uart_control_c|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Equal0~0_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & (\uart_control_c|always0~0_combout\ & 
-- !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3),
	datac => \uart_control_c|always0~0_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	combout => \uart_control_c|Equal0~0_combout\);

-- Location: LCCOMB_X25_Y8_N12
\uart_control_c|state~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|state~23_combout\ = (\uart_control_c|Equal0~0_combout\ & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	datad => \uart_control_c|Equal0~0_combout\,
	combout => \uart_control_c|state~23_combout\);

-- Location: LCCOMB_X24_Y8_N26
\uart_control_c|Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector0~0_combout\ = (\uart_control_c|state.0000~q\ & (((!\uart_control_c|always0~0_combout\)) # (!\uart_control_c|always0~1_combout\))) # (!\uart_control_c|state.0000~q\ & (!\uart_control_c|state~23_combout\ & 
-- ((!\uart_control_c|always0~0_combout\) # (!\uart_control_c|always0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|state.0000~q\,
	datab => \uart_control_c|always0~1_combout\,
	datac => \uart_control_c|state~23_combout\,
	datad => \uart_control_c|always0~0_combout\,
	combout => \uart_control_c|Selector0~0_combout\);

-- Location: LCCOMB_X24_Y8_N28
\uart_control_c|Selector4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector4~0_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (\uart_control_c|state~23_combout\ & !\uart_control_c|state.0000~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datab => \uart_control_c|state~23_combout\,
	datad => \uart_control_c|state.0000~q\,
	combout => \uart_control_c|Selector4~0_combout\);

-- Location: LCCOMB_X25_Y8_N18
\uart_control_c|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Equal0~2_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & \uart_control_c|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	datad => \uart_control_c|Equal0~0_combout\,
	combout => \uart_control_c|Equal0~2_combout\);

-- Location: LCCOMB_X25_Y8_N30
\uart_control_c|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Equal0~1_combout\ = (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & !\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	combout => \uart_control_c|Equal0~1_combout\);

-- Location: LCCOMB_X25_Y8_N28
\uart_control_c|state~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|state~22_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2)) # 
-- (!\uart_control_c|Equal0~0_combout\)) # (!\uart_control_c|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Equal0~1_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datad => \uart_control_c|Equal0~0_combout\,
	combout => \uart_control_c|state~22_combout\);

-- Location: LCCOMB_X24_Y8_N18
\uart_control_c|Selector4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector4~1_combout\ = (\uart_control_c|Selector4~0_combout\ & (((\uart_control_c|state.CH_REG_DATA1~q\ & !\uart_control_c|state~22_combout\)) # (!\uart_control_c|Equal0~2_combout\))) # (!\uart_control_c|Selector4~0_combout\ & 
-- (((\uart_control_c|state.CH_REG_DATA1~q\ & !\uart_control_c|state~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Selector4~0_combout\,
	datab => \uart_control_c|Equal0~2_combout\,
	datac => \uart_control_c|state.CH_REG_DATA1~q\,
	datad => \uart_control_c|state~22_combout\,
	combout => \uart_control_c|Selector4~1_combout\);

-- Location: FF_X24_Y8_N19
\uart_control_c|state.CH_REG_DATA1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|state.CH_REG_DATA1~q\);

-- Location: LCCOMB_X24_Y8_N0
\uart_control_c|Selector5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector5~0_combout\ = (\uart_control_c|Selector3~0_combout\ & ((\uart_control_c|state.CH_REG_DATA1~q\) # ((\uart_control_c|state.CH_REG_DATA2~q\ & !\uart_control_c|state~22_combout\)))) # (!\uart_control_c|Selector3~0_combout\ & 
-- (((\uart_control_c|state.CH_REG_DATA2~q\ & !\uart_control_c|state~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Selector3~0_combout\,
	datab => \uart_control_c|state.CH_REG_DATA1~q\,
	datac => \uart_control_c|state.CH_REG_DATA2~q\,
	datad => \uart_control_c|state~22_combout\,
	combout => \uart_control_c|Selector5~0_combout\);

-- Location: FF_X24_Y8_N1
\uart_control_c|state.CH_REG_DATA2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Selector5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|state.CH_REG_DATA2~q\);

-- Location: LCCOMB_X24_Y8_N4
\uart_control_c|Selector0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector0~1_combout\ = (!\uart_control_c|state.CH_REG_DATA1~q\ & (!\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & (!\uart_control_c|state.CH_REG_DATA2~q\ & !\uart_control_c|state.CH_MAX_TX_COUNT1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|state.CH_REG_DATA1~q\,
	datab => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datac => \uart_control_c|state.CH_REG_DATA2~q\,
	datad => \uart_control_c|state.CH_MAX_TX_COUNT1~q\,
	combout => \uart_control_c|Selector0~1_combout\);

-- Location: LCCOMB_X24_Y8_N12
\uart_control_c|Selector0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector0~2_combout\ = (\uart_control_c|Selector0~0_combout\ & (!\uart_control_c|state~22_combout\ & ((\uart_control_c|Selector4~0_combout\) # (!\uart_control_c|Selector0~1_combout\)))) # (!\uart_control_c|Selector0~0_combout\ & 
-- ((\uart_control_c|Selector4~0_combout\) # ((!\uart_control_c|Selector0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Selector0~0_combout\,
	datab => \uart_control_c|Selector4~0_combout\,
	datac => \uart_control_c|Selector0~1_combout\,
	datad => \uart_control_c|state~22_combout\,
	combout => \uart_control_c|Selector0~2_combout\);

-- Location: FF_X24_Y8_N13
\uart_control_c|state.0000\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Selector0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|state.0000~q\);

-- Location: LCCOMB_X24_Y8_N6
\uart_control_c|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector1~0_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & !\uart_control_c|state.0000~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datad => \uart_control_c|state.0000~q\,
	combout => \uart_control_c|Selector1~0_combout\);

-- Location: LCCOMB_X24_Y8_N24
\uart_control_c|Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector1~1_combout\ = (\uart_control_c|Selector1~0_combout\ & ((\uart_control_c|Equal0~2_combout\) # ((\uart_control_c|state.CH_MAX_TX_COUNT1~q\ & !\uart_control_c|state~22_combout\)))) # (!\uart_control_c|Selector1~0_combout\ & 
-- (((\uart_control_c|state.CH_MAX_TX_COUNT1~q\ & !\uart_control_c|state~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Selector1~0_combout\,
	datab => \uart_control_c|Equal0~2_combout\,
	datac => \uart_control_c|state.CH_MAX_TX_COUNT1~q\,
	datad => \uart_control_c|state~22_combout\,
	combout => \uart_control_c|Selector1~1_combout\);

-- Location: FF_X24_Y8_N25
\uart_control_c|state.CH_MAX_TX_COUNT1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|state.CH_MAX_TX_COUNT1~q\);

-- Location: LCCOMB_X24_Y8_N2
\uart_control_c|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector2~0_combout\ = (\uart_control_c|Selector3~0_combout\ & ((\uart_control_c|state.CH_MAX_TX_COUNT1~q\) # ((\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & !\uart_control_c|state~22_combout\)))) # (!\uart_control_c|Selector3~0_combout\ & 
-- (((\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & !\uart_control_c|state~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Selector3~0_combout\,
	datab => \uart_control_c|state.CH_MAX_TX_COUNT1~q\,
	datac => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datad => \uart_control_c|state~22_combout\,
	combout => \uart_control_c|Selector2~0_combout\);

-- Location: FF_X24_Y8_N3
\uart_control_c|state.CH_MAX_TX_COUNT2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|state.CH_MAX_TX_COUNT2~q\);

-- Location: LCCOMB_X25_Y8_N2
\uart_control_c|Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add1~0_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) $ (VCC))) 
-- # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & VCC))
-- \uart_control_c|Add1~1\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	datad => VCC,
	combout => \uart_control_c|Add1~0_combout\,
	cout => \uart_control_c|Add1~1\);

-- Location: LCCOMB_X25_Y8_N4
\uart_control_c|Add1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add1~2_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & 
-- (\uart_control_c|Add1~1\ & VCC)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & (!\uart_control_c|Add1~1\)))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & (!\uart_control_c|Add1~1\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & ((\uart_control_c|Add1~1\) # (GND)))))
-- \uart_control_c|Add1~3\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & 
-- !\uart_control_c|Add1~1\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((!\uart_control_c|Add1~1\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	datad => VCC,
	cin => \uart_control_c|Add1~1\,
	combout => \uart_control_c|Add1~2_combout\,
	cout => \uart_control_c|Add1~3\);

-- Location: LCCOMB_X25_Y8_N6
\uart_control_c|Add1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add1~4_combout\ = ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) $ (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) $ 
-- (\uart_control_c|Add1~3\)))) # (GND)
-- \uart_control_c|Add1~5\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & ((!\uart_control_c|Add1~3\) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) & !\uart_control_c|Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	datad => VCC,
	cin => \uart_control_c|Add1~3\,
	combout => \uart_control_c|Add1~4_combout\,
	cout => \uart_control_c|Add1~5\);

-- Location: LCCOMB_X25_Y8_N22
\uart_control_c|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add0~2_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5) $ (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	combout => \uart_control_c|Add0~2_combout\);

-- Location: LCCOMB_X25_Y5_N8
\uart_control_c|Add2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~0_combout\ = (\uart_control_c|new_tx_max_count\(0) & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) $ (VCC))) # (!\uart_control_c|new_tx_max_count\(0) & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & VCC))
-- \uart_control_c|Add2~1\ = CARRY((\uart_control_c|new_tx_max_count\(0) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(0),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	datad => VCC,
	combout => \uart_control_c|Add2~0_combout\,
	cout => \uart_control_c|Add2~1\);

-- Location: LCCOMB_X24_Y8_N10
\uart_control_c|new_tx_max_count[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|new_tx_max_count[0]~1_combout\ = (\uart_control_c|new_tx_max_count\(0) & (((!\uart_control_c|state.CH_MAX_TX_COUNT1~q\ & !\uart_control_c|state.CH_MAX_TX_COUNT2~q\)) # (!\uart_control_c|Selector3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Selector3~0_combout\,
	datab => \uart_control_c|state.CH_MAX_TX_COUNT1~q\,
	datac => \uart_control_c|new_tx_max_count\(0),
	datad => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	combout => \uart_control_c|new_tx_max_count[0]~1_combout\);

-- Location: LCCOMB_X24_Y8_N20
\uart_control_c|new_tx_max_count[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|new_tx_max_count[0]~2_combout\ = (\uart_control_c|new_tx_max_count[0]~1_combout\) # ((\uart_control_c|Selector3~0_combout\ & (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & \uart_control_c|Add2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Selector3~0_combout\,
	datab => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datac => \uart_control_c|Add2~0_combout\,
	datad => \uart_control_c|new_tx_max_count[0]~1_combout\,
	combout => \uart_control_c|new_tx_max_count[0]~2_combout\);

-- Location: FF_X24_Y8_N21
\uart_control_c|new_tx_max_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|new_tx_max_count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_tx_max_count\(0));

-- Location: LCCOMB_X25_Y5_N10
\uart_control_c|Add2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~2_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & ((\uart_control_c|new_tx_max_count\(1) & (\uart_control_c|Add2~1\ & VCC)) # (!\uart_control_c|new_tx_max_count\(1) 
-- & (!\uart_control_c|Add2~1\)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & ((\uart_control_c|new_tx_max_count\(1) & (!\uart_control_c|Add2~1\)) # (!\uart_control_c|new_tx_max_count\(1) & 
-- ((\uart_control_c|Add2~1\) # (GND)))))
-- \uart_control_c|Add2~3\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & (!\uart_control_c|new_tx_max_count\(1) & !\uart_control_c|Add2~1\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & ((!\uart_control_c|Add2~1\) # (!\uart_control_c|new_tx_max_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	datab => \uart_control_c|new_tx_max_count\(1),
	datad => VCC,
	cin => \uart_control_c|Add2~1\,
	combout => \uart_control_c|Add2~2_combout\,
	cout => \uart_control_c|Add2~3\);

-- Location: LCCOMB_X25_Y5_N28
\uart_control_c|Add2~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~22_combout\ = (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & ((\uart_control_c|Add2~2_combout\))) # (!\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	datac => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datad => \uart_control_c|Add2~2_combout\,
	combout => \uart_control_c|Add2~22_combout\);

-- Location: LCCOMB_X24_Y8_N16
\uart_control_c|new_tx_max_count[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|new_tx_max_count[1]~0_combout\ = (\uart_control_c|Selector3~0_combout\ & ((\uart_control_c|state.CH_MAX_TX_COUNT1~q\) # (\uart_control_c|state.CH_MAX_TX_COUNT2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|state.CH_MAX_TX_COUNT1~q\,
	datac => \uart_control_c|Selector3~0_combout\,
	datad => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	combout => \uart_control_c|new_tx_max_count[1]~0_combout\);

-- Location: FF_X25_Y5_N29
\uart_control_c|new_tx_max_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add2~22_combout\,
	ena => \uart_control_c|new_tx_max_count[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_tx_max_count\(1));

-- Location: LCCOMB_X25_Y5_N12
\uart_control_c|Add2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~4_combout\ = ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) $ (\uart_control_c|new_tx_max_count\(2) $ (!\uart_control_c|Add2~3\)))) # (GND)
-- \uart_control_c|Add2~5\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & ((\uart_control_c|new_tx_max_count\(2)) # (!\uart_control_c|Add2~3\))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & (\uart_control_c|new_tx_max_count\(2) & !\uart_control_c|Add2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	datab => \uart_control_c|new_tx_max_count\(2),
	datad => VCC,
	cin => \uart_control_c|Add2~3\,
	combout => \uart_control_c|Add2~4_combout\,
	cout => \uart_control_c|Add2~5\);

-- Location: LCCOMB_X25_Y5_N30
\uart_control_c|Add2~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~21_combout\ = (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & ((\uart_control_c|Add2~4_combout\))) # (!\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	datad => \uart_control_c|Add2~4_combout\,
	combout => \uart_control_c|Add2~21_combout\);

-- Location: FF_X25_Y5_N31
\uart_control_c|new_tx_max_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add2~21_combout\,
	ena => \uart_control_c|new_tx_max_count[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_tx_max_count\(2));

-- Location: LCCOMB_X25_Y5_N14
\uart_control_c|Add2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~6_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((\uart_control_c|new_tx_max_count\(3) & (\uart_control_c|Add2~5\ & VCC)) # (!\uart_control_c|new_tx_max_count\(3) 
-- & (!\uart_control_c|Add2~5\)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((\uart_control_c|new_tx_max_count\(3) & (!\uart_control_c|Add2~5\)) # (!\uart_control_c|new_tx_max_count\(3) & 
-- ((\uart_control_c|Add2~5\) # (GND)))))
-- \uart_control_c|Add2~7\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & (!\uart_control_c|new_tx_max_count\(3) & !\uart_control_c|Add2~5\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((!\uart_control_c|Add2~5\) # (!\uart_control_c|new_tx_max_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3),
	datab => \uart_control_c|new_tx_max_count\(3),
	datad => VCC,
	cin => \uart_control_c|Add2~5\,
	combout => \uart_control_c|Add2~6_combout\,
	cout => \uart_control_c|Add2~7\);

-- Location: LCCOMB_X25_Y5_N0
\uart_control_c|Add2~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~20_combout\ = (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & ((\uart_control_c|Add2~6_combout\))) # (!\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & (\uart_control_c|Add1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datac => \uart_control_c|Add1~0_combout\,
	datad => \uart_control_c|Add2~6_combout\,
	combout => \uart_control_c|Add2~20_combout\);

-- Location: FF_X25_Y5_N1
\uart_control_c|new_tx_max_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add2~20_combout\,
	ena => \uart_control_c|new_tx_max_count[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_tx_max_count\(3));

-- Location: LCCOMB_X25_Y5_N16
\uart_control_c|Add2~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~8_combout\ = ((\uart_control_c|new_tx_max_count\(4) $ (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) $ (\uart_control_c|Add2~7\)))) # (GND)
-- \uart_control_c|Add2~9\ = CARRY((\uart_control_c|new_tx_max_count\(4) & ((!\uart_control_c|Add2~7\) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4)))) # (!\uart_control_c|new_tx_max_count\(4) & 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) & !\uart_control_c|Add2~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(4),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	datad => VCC,
	cin => \uart_control_c|Add2~7\,
	combout => \uart_control_c|Add2~8_combout\,
	cout => \uart_control_c|Add2~9\);

-- Location: LCCOMB_X25_Y5_N26
\uart_control_c|Add2~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~17_combout\ = (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & (\uart_control_c|Add2~8_combout\)) # (!\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & ((\uart_control_c|Add1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Add2~8_combout\,
	datac => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datad => \uart_control_c|Add1~2_combout\,
	combout => \uart_control_c|Add2~17_combout\);

-- Location: FF_X25_Y5_N27
\uart_control_c|new_tx_max_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add2~17_combout\,
	ena => \uart_control_c|new_tx_max_count[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_tx_max_count\(4));

-- Location: LCCOMB_X25_Y5_N18
\uart_control_c|Add2~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~10_combout\ = (\uart_control_c|new_tx_max_count\(5) & ((\uart_control_c|Add0~2_combout\ & (\uart_control_c|Add2~9\ & VCC)) # (!\uart_control_c|Add0~2_combout\ & (!\uart_control_c|Add2~9\)))) # (!\uart_control_c|new_tx_max_count\(5) & 
-- ((\uart_control_c|Add0~2_combout\ & (!\uart_control_c|Add2~9\)) # (!\uart_control_c|Add0~2_combout\ & ((\uart_control_c|Add2~9\) # (GND)))))
-- \uart_control_c|Add2~11\ = CARRY((\uart_control_c|new_tx_max_count\(5) & (!\uart_control_c|Add0~2_combout\ & !\uart_control_c|Add2~9\)) # (!\uart_control_c|new_tx_max_count\(5) & ((!\uart_control_c|Add2~9\) # (!\uart_control_c|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(5),
	datab => \uart_control_c|Add0~2_combout\,
	datad => VCC,
	cin => \uart_control_c|Add2~9\,
	combout => \uart_control_c|Add2~10_combout\,
	cout => \uart_control_c|Add2~11\);

-- Location: LCCOMB_X25_Y5_N6
\uart_control_c|Add2~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~19_combout\ = (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & ((\uart_control_c|Add2~10_combout\))) # (!\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & (\uart_control_c|Add1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datac => \uart_control_c|Add1~4_combout\,
	datad => \uart_control_c|Add2~10_combout\,
	combout => \uart_control_c|Add2~19_combout\);

-- Location: FF_X25_Y5_N7
\uart_control_c|new_tx_max_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add2~19_combout\,
	ena => \uart_control_c|new_tx_max_count[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_tx_max_count\(5));

-- Location: LCCOMB_X25_Y8_N24
\uart_control_c|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add0~0_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(7) $ (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6)) # 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) & \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(7),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6),
	combout => \uart_control_c|Add0~0_combout\);

-- Location: LCCOMB_X25_Y8_N20
\uart_control_c|Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add0~1_combout\ = \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6) $ (((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5) & 
-- \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(6),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(5),
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	combout => \uart_control_c|Add0~1_combout\);

-- Location: LCCOMB_X25_Y5_N20
\uart_control_c|Add2~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~12_combout\ = ((\uart_control_c|Add0~1_combout\ $ (\uart_control_c|new_tx_max_count\(6) $ (\uart_control_c|Add2~11\)))) # (GND)
-- \uart_control_c|Add2~13\ = CARRY((\uart_control_c|Add0~1_combout\ & (\uart_control_c|new_tx_max_count\(6) & !\uart_control_c|Add2~11\)) # (!\uart_control_c|Add0~1_combout\ & ((\uart_control_c|new_tx_max_count\(6)) # (!\uart_control_c|Add2~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Add0~1_combout\,
	datab => \uart_control_c|new_tx_max_count\(6),
	datad => VCC,
	cin => \uart_control_c|Add2~11\,
	combout => \uart_control_c|Add2~12_combout\,
	cout => \uart_control_c|Add2~13\);

-- Location: LCCOMB_X25_Y8_N8
\uart_control_c|Add1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add1~6_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((\uart_control_c|Add0~2_combout\ & (\uart_control_c|Add1~5\ & VCC)) # (!\uart_control_c|Add0~2_combout\ & 
-- (!\uart_control_c|Add1~5\)))) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((\uart_control_c|Add0~2_combout\ & (!\uart_control_c|Add1~5\)) # (!\uart_control_c|Add0~2_combout\ & 
-- ((\uart_control_c|Add1~5\) # (GND)))))
-- \uart_control_c|Add1~7\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & (!\uart_control_c|Add0~2_combout\ & !\uart_control_c|Add1~5\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & ((!\uart_control_c|Add1~5\) # (!\uart_control_c|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3),
	datab => \uart_control_c|Add0~2_combout\,
	datad => VCC,
	cin => \uart_control_c|Add1~5\,
	combout => \uart_control_c|Add1~6_combout\,
	cout => \uart_control_c|Add1~7\);

-- Location: LCCOMB_X25_Y5_N24
\uart_control_c|Add2~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~18_combout\ = (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & (\uart_control_c|Add2~12_combout\)) # (!\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & ((\uart_control_c|Add1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Add2~12_combout\,
	datac => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datad => \uart_control_c|Add1~6_combout\,
	combout => \uart_control_c|Add2~18_combout\);

-- Location: FF_X25_Y5_N25
\uart_control_c|new_tx_max_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add2~18_combout\,
	ena => \uart_control_c|new_tx_max_count[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_tx_max_count\(6));

-- Location: LCCOMB_X25_Y5_N22
\uart_control_c|Add2~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~14_combout\ = \uart_control_c|new_tx_max_count\(7) $ (\uart_control_c|Add2~13\ $ (!\uart_control_c|Add0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|new_tx_max_count\(7),
	datad => \uart_control_c|Add0~0_combout\,
	cin => \uart_control_c|Add2~13\,
	combout => \uart_control_c|Add2~14_combout\);

-- Location: LCCOMB_X25_Y8_N10
\uart_control_c|Add1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add1~8_combout\ = \uart_control_c|Add0~1_combout\ $ (\uart_control_c|Add1~7\ $ (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Add0~1_combout\,
	datad => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	cin => \uart_control_c|Add1~7\,
	combout => \uart_control_c|Add1~8_combout\);

-- Location: LCCOMB_X25_Y5_N4
\uart_control_c|Add2~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add2~16_combout\ = (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & (\uart_control_c|Add2~14_combout\)) # (!\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & ((\uart_control_c|Add1~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datac => \uart_control_c|Add2~14_combout\,
	datad => \uart_control_c|Add1~8_combout\,
	combout => \uart_control_c|Add2~16_combout\);

-- Location: FF_X25_Y5_N5
\uart_control_c|new_tx_max_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add2~16_combout\,
	ena => \uart_control_c|new_tx_max_count[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_tx_max_count\(7));

-- Location: LCCOMB_X20_Y4_N28
\uart_control_c|Mult0|mult_core|romout[1][23]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][23]~0_combout\ = (\uart_control_c|new_tx_max_count\(7) & ((\uart_control_c|new_tx_max_count\(5)) # ((\uart_control_c|new_tx_max_count\(4)) # (\uart_control_c|new_tx_max_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(5),
	datab => \uart_control_c|new_tx_max_count\(7),
	datac => \uart_control_c|new_tx_max_count\(4),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][23]~0_combout\);

-- Location: LCCOMB_X22_Y5_N4
\uart_control_c|Mult0|mult_core|romout[1][22]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][22]~1_combout\ = (\uart_control_c|new_tx_max_count\(4) & (((\uart_control_c|new_tx_max_count\(6))))) # (!\uart_control_c|new_tx_max_count\(4) & ((\uart_control_c|new_tx_max_count\(5) & 
-- ((\uart_control_c|new_tx_max_count\(6)))) # (!\uart_control_c|new_tx_max_count\(5) & (\uart_control_c|new_tx_max_count\(7) & !\uart_control_c|new_tx_max_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][22]~1_combout\);

-- Location: LCCOMB_X23_Y4_N4
\uart_control_c|Mult0|mult_core|romout[1][21]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][21]~2_combout\ = (\uart_control_c|new_tx_max_count\(4) & (((\uart_control_c|new_tx_max_count\(5))))) # (!\uart_control_c|new_tx_max_count\(4) & (!\uart_control_c|new_tx_max_count\(5) & 
-- ((\uart_control_c|new_tx_max_count\(7)) # (\uart_control_c|new_tx_max_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][21]~2_combout\);

-- Location: LCCOMB_X23_Y4_N22
\uart_control_c|Mult0|mult_core|romout[1][20]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][20]~3_combout\ = (!\uart_control_c|new_tx_max_count\(4) & ((\uart_control_c|new_tx_max_count\(7)) # ((\uart_control_c|new_tx_max_count\(5)) # (\uart_control_c|new_tx_max_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][20]~3_combout\);

-- Location: LCCOMB_X22_Y4_N28
\uart_control_c|Mult0|mult_core|romout[1][19]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][19]~4_combout\ = (\uart_control_c|new_tx_max_count\(7) & (!\uart_control_c|new_tx_max_count\(6) & ((!\uart_control_c|new_tx_max_count\(5)) # (!\uart_control_c|new_tx_max_count\(4))))) # 
-- (!\uart_control_c|new_tx_max_count\(7) & ((\uart_control_c|new_tx_max_count\(4)) # ((\uart_control_c|new_tx_max_count\(6)) # (\uart_control_c|new_tx_max_count\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(4),
	datab => \uart_control_c|new_tx_max_count\(7),
	datac => \uart_control_c|new_tx_max_count\(6),
	datad => \uart_control_c|new_tx_max_count\(5),
	combout => \uart_control_c|Mult0|mult_core|romout[1][19]~4_combout\);

-- Location: LCCOMB_X20_Y6_N8
\uart_control_c|Mult0|mult_core|romout[0][23]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][23]~5_combout\ = (\uart_control_c|new_tx_max_count\(3) & ((\uart_control_c|new_tx_max_count\(1)) # ((\uart_control_c|new_tx_max_count\(2)) # (\uart_control_c|new_tx_max_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][23]~5_combout\);

-- Location: LCCOMB_X20_Y4_N26
\uart_control_c|Mult0|mult_core|romout[1][18]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][18]~6_combout\ = (\uart_control_c|new_tx_max_count\(5) & ((\uart_control_c|new_tx_max_count\(7) & ((\uart_control_c|new_tx_max_count\(4)) # (\uart_control_c|new_tx_max_count\(6)))) # 
-- (!\uart_control_c|new_tx_max_count\(7) & ((!\uart_control_c|new_tx_max_count\(6)))))) # (!\uart_control_c|new_tx_max_count\(5) & ((\uart_control_c|new_tx_max_count\(6)) # ((!\uart_control_c|new_tx_max_count\(7) & \uart_control_c|new_tx_max_count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(5),
	datab => \uart_control_c|new_tx_max_count\(7),
	datac => \uart_control_c|new_tx_max_count\(4),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][18]~6_combout\);

-- Location: LCCOMB_X20_Y6_N26
\uart_control_c|Mult0|mult_core|romout[0][22]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][22]~combout\ = (\uart_control_c|new_tx_max_count\(1) & (((\uart_control_c|new_tx_max_count\(2))))) # (!\uart_control_c|new_tx_max_count\(1) & ((\uart_control_c|new_tx_max_count\(2) & 
-- ((\uart_control_c|new_tx_max_count\(0)))) # (!\uart_control_c|new_tx_max_count\(2) & (\uart_control_c|new_tx_max_count\(3) & !\uart_control_c|new_tx_max_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][22]~combout\);

-- Location: LCCOMB_X20_Y6_N12
\uart_control_c|Mult0|mult_core|romout[0][21]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][21]~combout\ = (\uart_control_c|new_tx_max_count\(1) & (((\uart_control_c|new_tx_max_count\(0))))) # (!\uart_control_c|new_tx_max_count\(1) & (!\uart_control_c|new_tx_max_count\(0) & 
-- ((\uart_control_c|new_tx_max_count\(3)) # (\uart_control_c|new_tx_max_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][21]~combout\);

-- Location: LCCOMB_X22_Y5_N30
\uart_control_c|Mult0|mult_core|romout[1][17]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][17]~7_combout\ = \uart_control_c|new_tx_max_count\(7) $ (\uart_control_c|new_tx_max_count\(5) $ (((\uart_control_c|new_tx_max_count\(4) & !\uart_control_c|new_tx_max_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][17]~7_combout\);

-- Location: LCCOMB_X20_Y6_N14
\uart_control_c|Mult0|mult_core|romout[0][20]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][20]~9_combout\ = (!\uart_control_c|new_tx_max_count\(0) & ((\uart_control_c|new_tx_max_count\(3)) # ((\uart_control_c|new_tx_max_count\(1)) # (\uart_control_c|new_tx_max_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][20]~9_combout\);

-- Location: LCCOMB_X23_Y4_N12
\uart_control_c|Mult0|mult_core|romout[1][16]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\ = \uart_control_c|new_tx_max_count\(4) $ (\uart_control_c|new_tx_max_count\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_control_c|new_tx_max_count\(4),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\);

-- Location: LCCOMB_X20_Y6_N16
\uart_control_c|Mult0|mult_core|romout[0][19]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][19]~combout\ = (\uart_control_c|new_tx_max_count\(3) & (!\uart_control_c|new_tx_max_count\(2) & ((!\uart_control_c|new_tx_max_count\(0)) # (!\uart_control_c|new_tx_max_count\(1))))) # 
-- (!\uart_control_c|new_tx_max_count\(3) & ((\uart_control_c|new_tx_max_count\(1)) # ((\uart_control_c|new_tx_max_count\(2)) # (\uart_control_c|new_tx_max_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][19]~combout\);

-- Location: LCCOMB_X20_Y6_N18
\uart_control_c|Mult0|mult_core|romout[0][18]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][18]~combout\ = (\uart_control_c|new_tx_max_count\(3) & ((\uart_control_c|new_tx_max_count\(2)) # ((\uart_control_c|new_tx_max_count\(1) & \uart_control_c|new_tx_max_count\(0))))) # 
-- (!\uart_control_c|new_tx_max_count\(3) & ((\uart_control_c|new_tx_max_count\(1) & (!\uart_control_c|new_tx_max_count\(2))) # (!\uart_control_c|new_tx_max_count\(1) & ((\uart_control_c|new_tx_max_count\(2)) # (\uart_control_c|new_tx_max_count\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110110110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][18]~combout\);

-- Location: LCCOMB_X20_Y6_N28
\uart_control_c|Mult0|mult_core|romout[0][17]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][17]~combout\ = \uart_control_c|new_tx_max_count\(3) $ (\uart_control_c|new_tx_max_count\(1) $ (((!\uart_control_c|new_tx_max_count\(2) & \uart_control_c|new_tx_max_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][17]~combout\);

-- Location: LCCOMB_X20_Y4_N24
\uart_control_c|Mult0|mult_core|_~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|_~0_combout\ = (\uart_control_c|new_tx_max_count\(5) & (\uart_control_c|new_tx_max_count\(7) & (\uart_control_c|new_tx_max_count\(4) & \uart_control_c|new_tx_max_count\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(5),
	datab => \uart_control_c|new_tx_max_count\(7),
	datac => \uart_control_c|new_tx_max_count\(4),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|_~0_combout\);

-- Location: LCCOMB_X23_Y4_N10
\uart_control_c|Mult0|mult_core|romout[1][12]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][12]~10_combout\ = (\uart_control_c|new_tx_max_count\(7) & (((!\uart_control_c|new_tx_max_count\(6)) # (!\uart_control_c|new_tx_max_count\(5))) # (!\uart_control_c|new_tx_max_count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][12]~10_combout\);

-- Location: LCCOMB_X20_Y6_N2
\uart_control_c|Mult0|mult_core|romout[0][16]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\ = \uart_control_c|new_tx_max_count\(2) $ (\uart_control_c|new_tx_max_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\);

-- Location: LCCOMB_X22_Y5_N12
\uart_control_c|Mult0|mult_core|romout[1][11]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ = \uart_control_c|new_tx_max_count\(6) $ (((\uart_control_c|new_tx_max_count\(7) & (\uart_control_c|new_tx_max_count\(4) & \uart_control_c|new_tx_max_count\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\);

-- Location: LCCOMB_X22_Y5_N10
\uart_control_c|Mult0|mult_core|romout[1][10]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][10]~combout\ = \uart_control_c|new_tx_max_count\(5) $ (((\uart_control_c|new_tx_max_count\(7) & \uart_control_c|new_tx_max_count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	combout => \uart_control_c|Mult0|mult_core|romout[1][10]~combout\);

-- Location: LCCOMB_X22_Y5_N20
\uart_control_c|Mult0|mult_core|romout[1][9]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][9]~13_combout\ = (\uart_control_c|new_tx_max_count\(7) & (((\uart_control_c|new_tx_max_count\(5) & \uart_control_c|new_tx_max_count\(6))) # (!\uart_control_c|new_tx_max_count\(4)))) # 
-- (!\uart_control_c|new_tx_max_count\(7) & (\uart_control_c|new_tx_max_count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][9]~13_combout\);

-- Location: LCCOMB_X20_Y6_N4
\uart_control_c|Mult0|mult_core|_~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|_~1_combout\ = (\uart_control_c|new_tx_max_count\(3) & (\uart_control_c|new_tx_max_count\(1) & (\uart_control_c|new_tx_max_count\(2) & \uart_control_c|new_tx_max_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|_~1_combout\);

-- Location: LCCOMB_X20_Y6_N6
\uart_control_c|Mult0|mult_core|romout[0][12]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][12]~14_combout\ = (\uart_control_c|new_tx_max_count\(3) & (((!\uart_control_c|new_tx_max_count\(0)) # (!\uart_control_c|new_tx_max_count\(2))) # (!\uart_control_c|new_tx_max_count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][12]~14_combout\);

-- Location: LCCOMB_X22_Y5_N14
\uart_control_c|Mult0|mult_core|romout[1][10]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][10]~15_combout\ = (\uart_control_c|new_tx_max_count\(7) & ((\uart_control_c|new_tx_max_count\(4) & ((\uart_control_c|new_tx_max_count\(5)) # (!\uart_control_c|new_tx_max_count\(6)))) # 
-- (!\uart_control_c|new_tx_max_count\(4) & (!\uart_control_c|new_tx_max_count\(5))))) # (!\uart_control_c|new_tx_max_count\(7) & (((!\uart_control_c|new_tx_max_count\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][10]~15_combout\);

-- Location: LCCOMB_X20_Y5_N0
\uart_control_c|Mult0|mult_core|romout[0][11]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][11]~combout\ = \uart_control_c|new_tx_max_count\(2) $ (((\uart_control_c|new_tx_max_count\(3) & (\uart_control_c|new_tx_max_count\(0) & \uart_control_c|new_tx_max_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(0),
	datac => \uart_control_c|new_tx_max_count\(1),
	datad => \uart_control_c|new_tx_max_count\(2),
	combout => \uart_control_c|Mult0|mult_core|romout[0][11]~combout\);

-- Location: LCCOMB_X22_Y5_N8
\uart_control_c|Mult0|mult_core|romout[1][6]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][6]~16_combout\ = (\uart_control_c|new_tx_max_count\(7) & ((\uart_control_c|new_tx_max_count\(4) & (!\uart_control_c|new_tx_max_count\(5) & !\uart_control_c|new_tx_max_count\(6))) # 
-- (!\uart_control_c|new_tx_max_count\(4) & ((\uart_control_c|new_tx_max_count\(6)))))) # (!\uart_control_c|new_tx_max_count\(7) & (\uart_control_c|new_tx_max_count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][6]~16_combout\);

-- Location: LCCOMB_X20_Y6_N20
\uart_control_c|Mult0|mult_core|romout[0][10]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][10]~combout\ = \uart_control_c|new_tx_max_count\(1) $ (((\uart_control_c|new_tx_max_count\(3) & \uart_control_c|new_tx_max_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][10]~combout\);

-- Location: LCCOMB_X20_Y5_N6
\uart_control_c|Mult0|mult_core|romout[0][9]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][9]~combout\ = (\uart_control_c|new_tx_max_count\(3) & (((\uart_control_c|new_tx_max_count\(1) & \uart_control_c|new_tx_max_count\(2))) # (!\uart_control_c|new_tx_max_count\(0)))) # 
-- (!\uart_control_c|new_tx_max_count\(3) & (\uart_control_c|new_tx_max_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(0),
	datac => \uart_control_c|new_tx_max_count\(1),
	datad => \uart_control_c|new_tx_max_count\(2),
	combout => \uart_control_c|Mult0|mult_core|romout[0][9]~combout\);

-- Location: LCCOMB_X22_Y5_N22
\uart_control_c|Mult0|mult_core|romout[1][5]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][5]~combout\ = (\uart_control_c|new_tx_max_count\(7) & (!\uart_control_c|new_tx_max_count\(6) & ((!\uart_control_c|new_tx_max_count\(5)) # (!\uart_control_c|new_tx_max_count\(4))))) # 
-- (!\uart_control_c|new_tx_max_count\(7) & (((\uart_control_c|new_tx_max_count\(5) & \uart_control_c|new_tx_max_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][5]~combout\);

-- Location: LCCOMB_X22_Y5_N24
\uart_control_c|Mult0|mult_core|romout[1][4]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][4]~17_combout\ = \uart_control_c|new_tx_max_count\(7) $ (((\uart_control_c|new_tx_max_count\(5) & (\uart_control_c|new_tx_max_count\(4) & !\uart_control_c|new_tx_max_count\(6))) # 
-- (!\uart_control_c|new_tx_max_count\(5) & ((\uart_control_c|new_tx_max_count\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(7),
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][4]~17_combout\);

-- Location: LCCOMB_X22_Y5_N18
\uart_control_c|Mult0|mult_core|romout[1][3]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][3]~18_combout\ = \uart_control_c|new_tx_max_count\(6) $ (((!\uart_control_c|new_tx_max_count\(4) & \uart_control_c|new_tx_max_count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|new_tx_max_count\(4),
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(6),
	combout => \uart_control_c|Mult0|mult_core|romout[1][3]~18_combout\);

-- Location: LCCOMB_X20_Y5_N4
\uart_control_c|Mult0|mult_core|romout[0][10]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][10]~19_combout\ = (\uart_control_c|new_tx_max_count\(3) & ((\uart_control_c|new_tx_max_count\(0) & ((\uart_control_c|new_tx_max_count\(1)) # (!\uart_control_c|new_tx_max_count\(2)))) # 
-- (!\uart_control_c|new_tx_max_count\(0) & (!\uart_control_c|new_tx_max_count\(1))))) # (!\uart_control_c|new_tx_max_count\(3) & (((!\uart_control_c|new_tx_max_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(0),
	datac => \uart_control_c|new_tx_max_count\(1),
	datad => \uart_control_c|new_tx_max_count\(2),
	combout => \uart_control_c|Mult0|mult_core|romout[0][10]~19_combout\);

-- Location: LCCOMB_X20_Y6_N30
\uart_control_c|Mult0|mult_core|romout[0][6]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][6]~combout\ = (\uart_control_c|new_tx_max_count\(3) & ((\uart_control_c|new_tx_max_count\(2) & ((!\uart_control_c|new_tx_max_count\(0)))) # (!\uart_control_c|new_tx_max_count\(2) & 
-- (!\uart_control_c|new_tx_max_count\(1) & \uart_control_c|new_tx_max_count\(0))))) # (!\uart_control_c|new_tx_max_count\(3) & (((\uart_control_c|new_tx_max_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][6]~combout\);

-- Location: LCCOMB_X22_Y5_N28
\uart_control_c|Mult0|mult_core|romout[1][2]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\ = \uart_control_c|new_tx_max_count\(5) $ (\uart_control_c|new_tx_max_count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_control_c|new_tx_max_count\(5),
	datad => \uart_control_c|new_tx_max_count\(4),
	combout => \uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\);

-- Location: LCCOMB_X20_Y6_N24
\uart_control_c|Mult0|mult_core|romout[0][5]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][5]~combout\ = (\uart_control_c|new_tx_max_count\(3) & (!\uart_control_c|new_tx_max_count\(2) & ((!\uart_control_c|new_tx_max_count\(0)) # (!\uart_control_c|new_tx_max_count\(1))))) # 
-- (!\uart_control_c|new_tx_max_count\(3) & (\uart_control_c|new_tx_max_count\(1) & (\uart_control_c|new_tx_max_count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][5]~combout\);

-- Location: LCCOMB_X20_Y5_N10
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\ = (\uart_control_c|new_tx_max_count\(4) & (\uart_control_c|Mult0|mult_core|romout[0][5]~combout\ $ (VCC))) # (!\uart_control_c|new_tx_max_count\(4) & 
-- (\uart_control_c|Mult0|mult_core|romout[0][5]~combout\ & VCC))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ = CARRY((\uart_control_c|new_tx_max_count\(4) & \uart_control_c|Mult0|mult_core|romout[0][5]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(4),
	datab => \uart_control_c|Mult0|mult_core|romout[0][5]~combout\,
	datad => VCC,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\);

-- Location: LCCOMB_X20_Y5_N12
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\ = (\uart_control_c|Mult0|mult_core|romout[0][6]~combout\ & ((\uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\ & 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ & VCC)) # (!\uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\)))) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][6]~combout\ & ((\uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\)) # (!\uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\ 
-- & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\ = CARRY((\uart_control_c|Mult0|mult_core|romout[0][6]~combout\ & (!\uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\)) # (!\uart_control_c|Mult0|mult_core|romout[0][6]~combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[0][6]~combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[1][2]~20_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\);

-- Location: LCCOMB_X20_Y5_N14
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ = ((\uart_control_c|Mult0|mult_core|romout[1][3]~18_combout\ $ (\uart_control_c|Mult0|mult_core|romout[0][10]~19_combout\ $ 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][3]~18_combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][10]~19_combout\))) # (!\uart_control_c|Mult0|mult_core|romout[1][3]~18_combout\ & (!\uart_control_c|Mult0|mult_core|romout[0][10]~19_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][3]~18_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[0][10]~19_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\);

-- Location: LCCOMB_X20_Y5_N16
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ = (\uart_control_c|Mult0|mult_core|romout[1][4]~17_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][11]~combout\ & 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ & VCC)) # (!\uart_control_c|Mult0|mult_core|romout[0][11]~combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)))) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][4]~17_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][11]~combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # (!\uart_control_c|Mult0|mult_core|romout[0][11]~combout\ & 
-- ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][4]~17_combout\ & (!\uart_control_c|Mult0|mult_core|romout[0][11]~combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # (!\uart_control_c|Mult0|mult_core|romout[1][4]~17_combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][11]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][4]~17_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[0][11]~combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\);

-- Location: LCCOMB_X20_Y5_N18
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ = ((\uart_control_c|Mult0|mult_core|romout[0][9]~combout\ $ (\uart_control_c|Mult0|mult_core|romout[1][5]~combout\ $ 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ = CARRY((\uart_control_c|Mult0|mult_core|romout[0][9]~combout\ & ((\uart_control_c|Mult0|mult_core|romout[1][5]~combout\) # 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\))) # (!\uart_control_c|Mult0|mult_core|romout[0][9]~combout\ & (\uart_control_c|Mult0|mult_core|romout[1][5]~combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[0][9]~combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[1][5]~combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\);

-- Location: LCCOMB_X20_Y5_N20
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ = (\uart_control_c|Mult0|mult_core|romout[1][6]~16_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][10]~combout\ & 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ & VCC)) # (!\uart_control_c|Mult0|mult_core|romout[0][10]~combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)))) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][6]~16_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][10]~combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # (!\uart_control_c|Mult0|mult_core|romout[0][10]~combout\ & 
-- ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][6]~16_combout\ & (!\uart_control_c|Mult0|mult_core|romout[0][10]~combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # (!\uart_control_c|Mult0|mult_core|romout[1][6]~16_combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][10]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][6]~16_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[0][10]~combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\);

-- Location: LCCOMB_X20_Y5_N22
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ = ((\uart_control_c|Mult0|mult_core|romout[1][10]~15_combout\ $ (\uart_control_c|Mult0|mult_core|romout[0][11]~combout\ $ 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][10]~15_combout\ & (\uart_control_c|Mult0|mult_core|romout[0][11]~combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\)) # (!\uart_control_c|Mult0|mult_core|romout[1][10]~15_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][11]~combout\) # 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][10]~15_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[0][11]~combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\);

-- Location: LCCOMB_X20_Y5_N24
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ = (\uart_control_c|Mult0|mult_core|romout[0][12]~14_combout\ & ((\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ & 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ & VCC)) # (!\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\)))) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][12]~14_combout\ & ((\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\)) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ = CARRY((\uart_control_c|Mult0|mult_core|romout[0][12]~14_combout\ & (!\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\)) # (!\uart_control_c|Mult0|mult_core|romout[0][12]~14_combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[0][12]~14_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\);

-- Location: LCCOMB_X20_Y5_N26
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ = ((\uart_control_c|Mult0|mult_core|romout[1][9]~13_combout\ $ (\uart_control_c|Mult0|mult_core|_~1_combout\ $ 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][9]~13_combout\ & ((\uart_control_c|Mult0|mult_core|_~1_combout\) # 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\))) # (!\uart_control_c|Mult0|mult_core|romout[1][9]~13_combout\ & (\uart_control_c|Mult0|mult_core|_~1_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][9]~13_combout\,
	datab => \uart_control_c|Mult0|mult_core|_~1_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\);

-- Location: LCCOMB_X20_Y5_N28
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\ = (\uart_control_c|Mult0|mult_core|romout[1][10]~combout\ & ((\uart_control_c|new_tx_max_count\(0) & (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\ & 
-- VCC)) # (!\uart_control_c|new_tx_max_count\(0) & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\)))) # (!\uart_control_c|Mult0|mult_core|romout[1][10]~combout\ & ((\uart_control_c|new_tx_max_count\(0) & 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\)) # (!\uart_control_c|new_tx_max_count\(0) & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][10]~combout\ & (!\uart_control_c|new_tx_max_count\(0) & !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\)) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][10]~combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\) # (!\uart_control_c|new_tx_max_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][10]~combout\,
	datab => \uart_control_c|new_tx_max_count\(0),
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~17\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\);

-- Location: LCCOMB_X20_Y5_N30
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\ = ((\uart_control_c|new_tx_max_count\(1) $ (\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ $ 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\ = CARRY((\uart_control_c|new_tx_max_count\(1) & ((\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\) # 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\))) # (!\uart_control_c|new_tx_max_count\(1) & (\uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(1),
	datab => \uart_control_c|Mult0|mult_core|romout[1][11]~12_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~19\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\);

-- Location: LCCOMB_X20_Y4_N0
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22_combout\ = (\uart_control_c|Mult0|mult_core|romout[1][12]~10_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\ & 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\ & VCC)) # (!\uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\)))) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][12]~10_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\)) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\ & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~23\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][12]~10_combout\ & (!\uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\)) # (!\uart_control_c|Mult0|mult_core|romout[1][12]~10_combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][12]~10_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[0][16]~11_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~21\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~23\);

-- Location: LCCOMB_X20_Y4_N2
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~24_combout\ = ((\uart_control_c|Mult0|mult_core|romout[0][17]~combout\ $ (\uart_control_c|Mult0|mult_core|_~0_combout\ $ 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~23\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\ = CARRY((\uart_control_c|Mult0|mult_core|romout[0][17]~combout\ & ((\uart_control_c|Mult0|mult_core|_~0_combout\) # 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~23\))) # (!\uart_control_c|Mult0|mult_core|romout[0][17]~combout\ & (\uart_control_c|Mult0|mult_core|_~0_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[0][17]~combout\,
	datab => \uart_control_c|Mult0|mult_core|_~0_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~23\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~24_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\);

-- Location: LCCOMB_X20_Y4_N4
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26_combout\ = (\uart_control_c|new_tx_max_count\(4) & ((\uart_control_c|Mult0|mult_core|romout[0][18]~combout\ & (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\ & 
-- VCC)) # (!\uart_control_c|Mult0|mult_core|romout[0][18]~combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\)))) # (!\uart_control_c|new_tx_max_count\(4) & ((\uart_control_c|Mult0|mult_core|romout[0][18]~combout\ & 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\)) # (!\uart_control_c|Mult0|mult_core|romout[0][18]~combout\ & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~27\ = CARRY((\uart_control_c|new_tx_max_count\(4) & (!\uart_control_c|Mult0|mult_core|romout[0][18]~combout\ & !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\)) # 
-- (!\uart_control_c|new_tx_max_count\(4) & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\) # (!\uart_control_c|Mult0|mult_core|romout[0][18]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(4),
	datab => \uart_control_c|Mult0|mult_core|romout[0][18]~combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~25\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~27\);

-- Location: LCCOMB_X20_Y4_N6
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~28_combout\ = ((\uart_control_c|new_tx_max_count\(5) $ (\uart_control_c|Mult0|mult_core|romout[0][19]~combout\ $ 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~27\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\ = CARRY((\uart_control_c|new_tx_max_count\(5) & ((\uart_control_c|Mult0|mult_core|romout[0][19]~combout\) # 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~27\))) # (!\uart_control_c|new_tx_max_count\(5) & (\uart_control_c|Mult0|mult_core|romout[0][19]~combout\ & !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(5),
	datab => \uart_control_c|Mult0|mult_core|romout[0][19]~combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~27\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~28_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\);

-- Location: LCCOMB_X20_Y4_N8
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30_combout\ = (\uart_control_c|Mult0|mult_core|romout[0][20]~9_combout\ & ((\uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\ & 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\ & VCC)) # (!\uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\)))) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][20]~9_combout\ & ((\uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\)) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\ & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~31\ = CARRY((\uart_control_c|Mult0|mult_core|romout[0][20]~9_combout\ & (!\uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\)) # (!\uart_control_c|Mult0|mult_core|romout[0][20]~9_combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[0][20]~9_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[1][16]~8_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~29\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~31\);

-- Location: LCCOMB_X20_Y4_N10
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~32_combout\ = ((\uart_control_c|Mult0|mult_core|romout[0][21]~combout\ $ (\uart_control_c|Mult0|mult_core|romout[1][17]~7_combout\ $ 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~31\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\ = CARRY((\uart_control_c|Mult0|mult_core|romout[0][21]~combout\ & ((\uart_control_c|Mult0|mult_core|romout[1][17]~7_combout\) # 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~31\))) # (!\uart_control_c|Mult0|mult_core|romout[0][21]~combout\ & (\uart_control_c|Mult0|mult_core|romout[1][17]~7_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[0][21]~combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[1][17]~7_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~31\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~32_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\);

-- Location: LCCOMB_X20_Y4_N12
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34_combout\ = (\uart_control_c|Mult0|mult_core|romout[1][18]~6_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][22]~combout\ & 
-- (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\ & VCC)) # (!\uart_control_c|Mult0|mult_core|romout[0][22]~combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\)))) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][18]~6_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][22]~combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\)) # (!\uart_control_c|Mult0|mult_core|romout[0][22]~combout\ 
-- & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\) # (GND)))))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~35\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][18]~6_combout\ & (!\uart_control_c|Mult0|mult_core|romout[0][22]~combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\)) # (!\uart_control_c|Mult0|mult_core|romout[1][18]~6_combout\ & ((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\) # 
-- (!\uart_control_c|Mult0|mult_core|romout[0][22]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][18]~6_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[0][22]~combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~33\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~35\);

-- Location: LCCOMB_X20_Y4_N14
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~36_combout\ = ((\uart_control_c|Mult0|mult_core|romout[1][19]~4_combout\ $ (\uart_control_c|Mult0|mult_core|romout[0][23]~5_combout\ $ 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~35\)))) # (GND)
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][19]~4_combout\ & ((\uart_control_c|Mult0|mult_core|romout[0][23]~5_combout\) # 
-- (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~35\))) # (!\uart_control_c|Mult0|mult_core|romout[1][19]~4_combout\ & (\uart_control_c|Mult0|mult_core|romout[0][23]~5_combout\ & 
-- !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Mult0|mult_core|romout[1][19]~4_combout\,
	datab => \uart_control_c|Mult0|mult_core|romout[0][23]~5_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~35\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~36_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\);

-- Location: LCCOMB_X20_Y4_N16
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38_combout\ = (\uart_control_c|Mult0|mult_core|romout[1][20]~3_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\)) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][20]~3_combout\ & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\) # (GND)))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~39\ = CARRY((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\) # (!\uart_control_c|Mult0|mult_core|romout[1][20]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Mult0|mult_core|romout[1][20]~3_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~37\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~39\);

-- Location: LCCOMB_X20_Y4_N18
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~40_combout\ = (\uart_control_c|Mult0|mult_core|romout[1][21]~2_combout\ & (\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~39\ $ (GND))) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][21]~2_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~39\ & VCC))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41\ = CARRY((\uart_control_c|Mult0|mult_core|romout[1][21]~2_combout\ & !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Mult0|mult_core|romout[1][21]~2_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~39\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~40_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41\);

-- Location: LCCOMB_X20_Y4_N20
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~42_combout\ = (\uart_control_c|Mult0|mult_core|romout[1][22]~1_combout\ & (!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41\)) # 
-- (!\uart_control_c|Mult0|mult_core|romout[1][22]~1_combout\ & ((\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41\) # (GND)))
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~43\ = CARRY((!\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41\) # (!\uart_control_c|Mult0|mult_core|romout[1][22]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Mult0|mult_core|romout[1][22]~1_combout\,
	datad => VCC,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~41\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~42_combout\,
	cout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~43\);

-- Location: LCCOMB_X20_Y4_N22
\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~44_combout\ = \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~43\ $ (!\uart_control_c|Mult0|mult_core|romout[1][23]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|Mult0|mult_core|romout[1][23]~0_combout\,
	cin => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~43\,
	combout => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~44_combout\);

-- Location: LCCOMB_X24_Y8_N30
\uart_control_c|Selector3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector3~1_combout\ = (\uart_control_c|always0~1_combout\ & (\uart_control_c|state.CH_MAX_TX_COUNT2~q\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & 
-- \uart_control_c|always0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|always0~1_combout\,
	datab => \uart_control_c|state.CH_MAX_TX_COUNT2~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datad => \uart_control_c|always0~0_combout\,
	combout => \uart_control_c|Selector3~1_combout\);

-- Location: FF_X24_Y8_N31
\uart_control_c|state.CH_MAX_TX_COUNT3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|state.CH_MAX_TX_COUNT3~q\);

-- Location: FF_X20_Y4_N23
\uart_control_c|max_tx_count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~44_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(27));

-- Location: FF_X20_Y4_N21
\uart_control_c|max_tx_count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~42_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(26));

-- Location: FF_X20_Y4_N19
\uart_control_c|max_tx_count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~40_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(25));

-- Location: FF_X20_Y4_N17
\uart_control_c|max_tx_count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~38_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(24));

-- Location: FF_X20_Y4_N15
\uart_control_c|max_tx_count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~36_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(23));

-- Location: FF_X20_Y4_N13
\uart_control_c|max_tx_count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~34_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(22));

-- Location: FF_X20_Y4_N11
\uart_control_c|max_tx_count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~32_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(21));

-- Location: FF_X20_Y4_N9
\uart_control_c|max_tx_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~30_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(20));

-- Location: LCCOMB_X19_Y3_N24
\uart_control_c|max_tx_count[19]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|max_tx_count[19]~0_combout\ = !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~28_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~28_combout\,
	combout => \uart_control_c|max_tx_count[19]~0_combout\);

-- Location: FF_X19_Y4_N11
\uart_control_c|max_tx_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|max_tx_count[19]~0_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(19));

-- Location: LCCOMB_X19_Y4_N30
\uart_control_c|max_tx_count[18]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|max_tx_count[18]~1_combout\ = !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~26_combout\,
	combout => \uart_control_c|max_tx_count[18]~1_combout\);

-- Location: FF_X19_Y4_N31
\uart_control_c|max_tx_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|max_tx_count[18]~1_combout\,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(18));

-- Location: LCCOMB_X20_Y4_N30
\uart_control_c|max_tx_count[17]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|max_tx_count[17]~2_combout\ = !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~24_combout\,
	combout => \uart_control_c|max_tx_count[17]~2_combout\);

-- Location: FF_X19_Y4_N7
\uart_control_c|max_tx_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|max_tx_count[17]~2_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(17));

-- Location: LCCOMB_X22_Y4_N26
\uart_control_c|max_tx_count[16]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|max_tx_count[16]~3_combout\ = !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~22_combout\,
	combout => \uart_control_c|max_tx_count[16]~3_combout\);

-- Location: FF_X19_Y4_N5
\uart_control_c|max_tx_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|max_tx_count[16]~3_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(16));

-- Location: FF_X19_Y4_N3
\uart_control_c|max_tx_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~20_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(15));

-- Location: LCCOMB_X19_Y5_N2
\uart_control_c|max_tx_count[14]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|max_tx_count[14]~4_combout\ = !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~18_combout\,
	combout => \uart_control_c|max_tx_count[14]~4_combout\);

-- Location: FF_X19_Y4_N1
\uart_control_c|max_tx_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|max_tx_count[14]~4_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(14));

-- Location: FF_X19_Y5_N31
\uart_control_c|max_tx_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(13));

-- Location: FF_X19_Y5_N29
\uart_control_c|max_tx_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(12));

-- Location: FF_X19_Y5_N27
\uart_control_c|max_tx_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(11));

-- Location: FF_X19_Y5_N25
\uart_control_c|max_tx_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(10));

-- Location: LCCOMB_X20_Y5_N2
\uart_control_c|max_tx_count[9]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|max_tx_count[9]~5_combout\ = !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	combout => \uart_control_c|max_tx_count[9]~5_combout\);

-- Location: FF_X19_Y5_N23
\uart_control_c|max_tx_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|max_tx_count[9]~5_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(9));

-- Location: FF_X19_Y5_N21
\uart_control_c|max_tx_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(8));

-- Location: FF_X19_Y5_N19
\uart_control_c|max_tx_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(7));

-- Location: LCCOMB_X19_Y5_N0
\uart_control_c|max_tx_count[6]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|max_tx_count[6]~6_combout\ = !\uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\,
	combout => \uart_control_c|max_tx_count[6]~6_combout\);

-- Location: FF_X19_Y5_N17
\uart_control_c|max_tx_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|max_tx_count[6]~6_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(6));

-- Location: FF_X19_Y5_N15
\uart_control_c|max_tx_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(5));

-- Location: LCCOMB_X20_Y6_N22
\uart_control_c|Mult0|mult_core|romout[0][4]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][4]~combout\ = \uart_control_c|new_tx_max_count\(3) $ (((\uart_control_c|new_tx_max_count\(1) & (!\uart_control_c|new_tx_max_count\(2) & \uart_control_c|new_tx_max_count\(0))) # 
-- (!\uart_control_c|new_tx_max_count\(1) & (\uart_control_c|new_tx_max_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_tx_max_count\(3),
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][4]~combout\);

-- Location: FF_X19_Y5_N13
\uart_control_c|max_tx_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|romout[0][4]~combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(4));

-- Location: LCCOMB_X20_Y6_N0
\uart_control_c|Mult0|mult_core|romout[0][3]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][3]~21_combout\ = \uart_control_c|new_tx_max_count\(2) $ (((\uart_control_c|new_tx_max_count\(1) & !\uart_control_c|new_tx_max_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|new_tx_max_count\(1),
	datac => \uart_control_c|new_tx_max_count\(2),
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|Mult0|mult_core|romout[0][3]~21_combout\);

-- Location: FF_X19_Y5_N11
\uart_control_c|max_tx_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|romout[0][3]~21_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(3));

-- Location: LCCOMB_X19_Y5_N4
\uart_control_c|Mult0|mult_core|romout[0][2]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Mult0|mult_core|romout[0][2]~22_combout\ = \uart_control_c|new_tx_max_count\(0) $ (!\uart_control_c|new_tx_max_count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|new_tx_max_count\(0),
	datac => \uart_control_c|new_tx_max_count\(1),
	combout => \uart_control_c|Mult0|mult_core|romout[0][2]~22_combout\);

-- Location: FF_X19_Y5_N9
\uart_control_c|max_tx_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|Mult0|mult_core|romout[0][2]~22_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(2));

-- Location: LCCOMB_X20_Y5_N8
\uart_control_c|max_tx_count[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|max_tx_count[1]~8_combout\ = !\uart_control_c|new_tx_max_count\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|new_tx_max_count\(0),
	combout => \uart_control_c|max_tx_count[1]~8_combout\);

-- Location: FF_X19_Y5_N7
\uart_control_c|max_tx_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|max_tx_count[1]~8_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_MAX_TX_COUNT3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|max_tx_count\(1));

-- Location: LCCOMB_X19_Y5_N6
\tx_c|LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~1_cout\ = CARRY((!\uart_control_c|max_tx_count\(1) & !\tx_c|tx_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(1),
	datab => \tx_c|tx_count\(1),
	datad => VCC,
	cout => \tx_c|LessThan0~1_cout\);

-- Location: LCCOMB_X19_Y5_N8
\tx_c|LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~3_cout\ = CARRY((\tx_c|tx_count\(2) & ((\uart_control_c|max_tx_count\(2)) # (!\tx_c|LessThan0~1_cout\))) # (!\tx_c|tx_count\(2) & (\uart_control_c|max_tx_count\(2) & !\tx_c|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(2),
	datab => \uart_control_c|max_tx_count\(2),
	datad => VCC,
	cin => \tx_c|LessThan0~1_cout\,
	cout => \tx_c|LessThan0~3_cout\);

-- Location: LCCOMB_X19_Y5_N10
\tx_c|LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~5_cout\ = CARRY((\uart_control_c|max_tx_count\(3) & ((!\tx_c|LessThan0~3_cout\) # (!\tx_c|tx_count\(3)))) # (!\uart_control_c|max_tx_count\(3) & (!\tx_c|tx_count\(3) & !\tx_c|LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(3),
	datab => \tx_c|tx_count\(3),
	datad => VCC,
	cin => \tx_c|LessThan0~3_cout\,
	cout => \tx_c|LessThan0~5_cout\);

-- Location: LCCOMB_X19_Y5_N12
\tx_c|LessThan0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~7_cout\ = CARRY((\uart_control_c|max_tx_count\(4) & (\tx_c|tx_count\(4) & !\tx_c|LessThan0~5_cout\)) # (!\uart_control_c|max_tx_count\(4) & ((\tx_c|tx_count\(4)) # (!\tx_c|LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(4),
	datab => \tx_c|tx_count\(4),
	datad => VCC,
	cin => \tx_c|LessThan0~5_cout\,
	cout => \tx_c|LessThan0~7_cout\);

-- Location: LCCOMB_X19_Y5_N14
\tx_c|LessThan0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~9_cout\ = CARRY((\tx_c|tx_count\(5) & (\uart_control_c|max_tx_count\(5) & !\tx_c|LessThan0~7_cout\)) # (!\tx_c|tx_count\(5) & ((\uart_control_c|max_tx_count\(5)) # (!\tx_c|LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(5),
	datab => \uart_control_c|max_tx_count\(5),
	datad => VCC,
	cin => \tx_c|LessThan0~7_cout\,
	cout => \tx_c|LessThan0~9_cout\);

-- Location: LCCOMB_X19_Y5_N16
\tx_c|LessThan0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~11_cout\ = CARRY((\tx_c|tx_count\(6) & ((\uart_control_c|max_tx_count\(6)) # (!\tx_c|LessThan0~9_cout\))) # (!\tx_c|tx_count\(6) & (\uart_control_c|max_tx_count\(6) & !\tx_c|LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(6),
	datab => \uart_control_c|max_tx_count\(6),
	datad => VCC,
	cin => \tx_c|LessThan0~9_cout\,
	cout => \tx_c|LessThan0~11_cout\);

-- Location: LCCOMB_X19_Y5_N18
\tx_c|LessThan0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~13_cout\ = CARRY((\tx_c|tx_count\(7) & (\uart_control_c|max_tx_count\(7) & !\tx_c|LessThan0~11_cout\)) # (!\tx_c|tx_count\(7) & ((\uart_control_c|max_tx_count\(7)) # (!\tx_c|LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(7),
	datab => \uart_control_c|max_tx_count\(7),
	datad => VCC,
	cin => \tx_c|LessThan0~11_cout\,
	cout => \tx_c|LessThan0~13_cout\);

-- Location: LCCOMB_X19_Y5_N20
\tx_c|LessThan0~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~15_cout\ = CARRY((\tx_c|tx_count\(8) & ((!\tx_c|LessThan0~13_cout\) # (!\uart_control_c|max_tx_count\(8)))) # (!\tx_c|tx_count\(8) & (!\uart_control_c|max_tx_count\(8) & !\tx_c|LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(8),
	datab => \uart_control_c|max_tx_count\(8),
	datad => VCC,
	cin => \tx_c|LessThan0~13_cout\,
	cout => \tx_c|LessThan0~15_cout\);

-- Location: LCCOMB_X19_Y5_N22
\tx_c|LessThan0~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~17_cout\ = CARRY((\uart_control_c|max_tx_count\(9) & (!\tx_c|tx_count\(9) & !\tx_c|LessThan0~15_cout\)) # (!\uart_control_c|max_tx_count\(9) & ((!\tx_c|LessThan0~15_cout\) # (!\tx_c|tx_count\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(9),
	datab => \tx_c|tx_count\(9),
	datad => VCC,
	cin => \tx_c|LessThan0~15_cout\,
	cout => \tx_c|LessThan0~17_cout\);

-- Location: LCCOMB_X19_Y5_N24
\tx_c|LessThan0~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~19_cout\ = CARRY((\tx_c|tx_count\(10) & ((!\tx_c|LessThan0~17_cout\) # (!\uart_control_c|max_tx_count\(10)))) # (!\tx_c|tx_count\(10) & (!\uart_control_c|max_tx_count\(10) & !\tx_c|LessThan0~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(10),
	datab => \uart_control_c|max_tx_count\(10),
	datad => VCC,
	cin => \tx_c|LessThan0~17_cout\,
	cout => \tx_c|LessThan0~19_cout\);

-- Location: LCCOMB_X19_Y5_N26
\tx_c|LessThan0~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~21_cout\ = CARRY((\uart_control_c|max_tx_count\(11) & ((!\tx_c|LessThan0~19_cout\) # (!\tx_c|tx_count\(11)))) # (!\uart_control_c|max_tx_count\(11) & (!\tx_c|tx_count\(11) & !\tx_c|LessThan0~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(11),
	datab => \tx_c|tx_count\(11),
	datad => VCC,
	cin => \tx_c|LessThan0~19_cout\,
	cout => \tx_c|LessThan0~21_cout\);

-- Location: LCCOMB_X19_Y5_N28
\tx_c|LessThan0~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~23_cout\ = CARRY((\tx_c|tx_count\(12) & ((!\tx_c|LessThan0~21_cout\) # (!\uart_control_c|max_tx_count\(12)))) # (!\tx_c|tx_count\(12) & (!\uart_control_c|max_tx_count\(12) & !\tx_c|LessThan0~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(12),
	datab => \uart_control_c|max_tx_count\(12),
	datad => VCC,
	cin => \tx_c|LessThan0~21_cout\,
	cout => \tx_c|LessThan0~23_cout\);

-- Location: LCCOMB_X19_Y5_N30
\tx_c|LessThan0~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~25_cout\ = CARRY((\uart_control_c|max_tx_count\(13) & ((!\tx_c|LessThan0~23_cout\) # (!\tx_c|tx_count\(13)))) # (!\uart_control_c|max_tx_count\(13) & (!\tx_c|tx_count\(13) & !\tx_c|LessThan0~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(13),
	datab => \tx_c|tx_count\(13),
	datad => VCC,
	cin => \tx_c|LessThan0~23_cout\,
	cout => \tx_c|LessThan0~25_cout\);

-- Location: LCCOMB_X19_Y4_N0
\tx_c|LessThan0~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~27_cout\ = CARRY((\tx_c|tx_count\(14) & ((\uart_control_c|max_tx_count\(14)) # (!\tx_c|LessThan0~25_cout\))) # (!\tx_c|tx_count\(14) & (\uart_control_c|max_tx_count\(14) & !\tx_c|LessThan0~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(14),
	datab => \uart_control_c|max_tx_count\(14),
	datad => VCC,
	cin => \tx_c|LessThan0~25_cout\,
	cout => \tx_c|LessThan0~27_cout\);

-- Location: LCCOMB_X19_Y4_N2
\tx_c|LessThan0~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~29_cout\ = CARRY((\tx_c|tx_count\(15) & (\uart_control_c|max_tx_count\(15) & !\tx_c|LessThan0~27_cout\)) # (!\tx_c|tx_count\(15) & ((\uart_control_c|max_tx_count\(15)) # (!\tx_c|LessThan0~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(15),
	datab => \uart_control_c|max_tx_count\(15),
	datad => VCC,
	cin => \tx_c|LessThan0~27_cout\,
	cout => \tx_c|LessThan0~29_cout\);

-- Location: LCCOMB_X19_Y4_N4
\tx_c|LessThan0~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~31_cout\ = CARRY((\tx_c|tx_count\(16) & ((\uart_control_c|max_tx_count\(16)) # (!\tx_c|LessThan0~29_cout\))) # (!\tx_c|tx_count\(16) & (\uart_control_c|max_tx_count\(16) & !\tx_c|LessThan0~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(16),
	datab => \uart_control_c|max_tx_count\(16),
	datad => VCC,
	cin => \tx_c|LessThan0~29_cout\,
	cout => \tx_c|LessThan0~31_cout\);

-- Location: LCCOMB_X19_Y4_N6
\tx_c|LessThan0~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~33_cout\ = CARRY((\uart_control_c|max_tx_count\(17) & (!\tx_c|tx_count\(17) & !\tx_c|LessThan0~31_cout\)) # (!\uart_control_c|max_tx_count\(17) & ((!\tx_c|LessThan0~31_cout\) # (!\tx_c|tx_count\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(17),
	datab => \tx_c|tx_count\(17),
	datad => VCC,
	cin => \tx_c|LessThan0~31_cout\,
	cout => \tx_c|LessThan0~33_cout\);

-- Location: LCCOMB_X19_Y4_N8
\tx_c|LessThan0~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~35_cout\ = CARRY((\uart_control_c|max_tx_count\(18) & ((\tx_c|tx_count\(18)) # (!\tx_c|LessThan0~33_cout\))) # (!\uart_control_c|max_tx_count\(18) & (\tx_c|tx_count\(18) & !\tx_c|LessThan0~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(18),
	datab => \tx_c|tx_count\(18),
	datad => VCC,
	cin => \tx_c|LessThan0~33_cout\,
	cout => \tx_c|LessThan0~35_cout\);

-- Location: LCCOMB_X19_Y4_N10
\tx_c|LessThan0~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~37_cout\ = CARRY((\uart_control_c|max_tx_count\(19) & (!\tx_c|tx_count\(19) & !\tx_c|LessThan0~35_cout\)) # (!\uart_control_c|max_tx_count\(19) & ((!\tx_c|LessThan0~35_cout\) # (!\tx_c|tx_count\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(19),
	datab => \tx_c|tx_count\(19),
	datad => VCC,
	cin => \tx_c|LessThan0~35_cout\,
	cout => \tx_c|LessThan0~37_cout\);

-- Location: LCCOMB_X19_Y4_N12
\tx_c|LessThan0~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~39_cout\ = CARRY((\tx_c|tx_count\(20) & ((!\tx_c|LessThan0~37_cout\) # (!\uart_control_c|max_tx_count\(20)))) # (!\tx_c|tx_count\(20) & (!\uart_control_c|max_tx_count\(20) & !\tx_c|LessThan0~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(20),
	datab => \uart_control_c|max_tx_count\(20),
	datad => VCC,
	cin => \tx_c|LessThan0~37_cout\,
	cout => \tx_c|LessThan0~39_cout\);

-- Location: LCCOMB_X19_Y4_N14
\tx_c|LessThan0~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~41_cout\ = CARRY((\tx_c|tx_count\(21) & (\uart_control_c|max_tx_count\(21) & !\tx_c|LessThan0~39_cout\)) # (!\tx_c|tx_count\(21) & ((\uart_control_c|max_tx_count\(21)) # (!\tx_c|LessThan0~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(21),
	datab => \uart_control_c|max_tx_count\(21),
	datad => VCC,
	cin => \tx_c|LessThan0~39_cout\,
	cout => \tx_c|LessThan0~41_cout\);

-- Location: LCCOMB_X19_Y4_N16
\tx_c|LessThan0~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~43_cout\ = CARRY((\tx_c|tx_count\(22) & ((!\tx_c|LessThan0~41_cout\) # (!\uart_control_c|max_tx_count\(22)))) # (!\tx_c|tx_count\(22) & (!\uart_control_c|max_tx_count\(22) & !\tx_c|LessThan0~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(22),
	datab => \uart_control_c|max_tx_count\(22),
	datad => VCC,
	cin => \tx_c|LessThan0~41_cout\,
	cout => \tx_c|LessThan0~43_cout\);

-- Location: LCCOMB_X19_Y4_N18
\tx_c|LessThan0~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~45_cout\ = CARRY((\tx_c|tx_count\(23) & (\uart_control_c|max_tx_count\(23) & !\tx_c|LessThan0~43_cout\)) # (!\tx_c|tx_count\(23) & ((\uart_control_c|max_tx_count\(23)) # (!\tx_c|LessThan0~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(23),
	datab => \uart_control_c|max_tx_count\(23),
	datad => VCC,
	cin => \tx_c|LessThan0~43_cout\,
	cout => \tx_c|LessThan0~45_cout\);

-- Location: LCCOMB_X19_Y4_N20
\tx_c|LessThan0~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~47_cout\ = CARRY((\tx_c|tx_count\(24) & ((!\tx_c|LessThan0~45_cout\) # (!\uart_control_c|max_tx_count\(24)))) # (!\tx_c|tx_count\(24) & (!\uart_control_c|max_tx_count\(24) & !\tx_c|LessThan0~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(24),
	datab => \uart_control_c|max_tx_count\(24),
	datad => VCC,
	cin => \tx_c|LessThan0~45_cout\,
	cout => \tx_c|LessThan0~47_cout\);

-- Location: LCCOMB_X19_Y4_N22
\tx_c|LessThan0~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~49_cout\ = CARRY((\tx_c|tx_count\(25) & (\uart_control_c|max_tx_count\(25) & !\tx_c|LessThan0~47_cout\)) # (!\tx_c|tx_count\(25) & ((\uart_control_c|max_tx_count\(25)) # (!\tx_c|LessThan0~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|tx_count\(25),
	datab => \uart_control_c|max_tx_count\(25),
	datad => VCC,
	cin => \tx_c|LessThan0~47_cout\,
	cout => \tx_c|LessThan0~49_cout\);

-- Location: LCCOMB_X19_Y4_N24
\tx_c|LessThan0~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~51_cout\ = CARRY((\uart_control_c|max_tx_count\(26) & (\tx_c|tx_count\(26) & !\tx_c|LessThan0~49_cout\)) # (!\uart_control_c|max_tx_count\(26) & ((\tx_c|tx_count\(26)) # (!\tx_c|LessThan0~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|max_tx_count\(26),
	datab => \tx_c|tx_count\(26),
	datad => VCC,
	cin => \tx_c|LessThan0~49_cout\,
	cout => \tx_c|LessThan0~51_cout\);

-- Location: LCCOMB_X19_Y4_N26
\tx_c|LessThan0~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~52_combout\ = (\tx_c|tx_count\(27) & (!\tx_c|LessThan0~51_cout\ & \uart_control_c|max_tx_count\(27))) # (!\tx_c|tx_count\(27) & ((\uart_control_c|max_tx_count\(27)) # (!\tx_c|LessThan0~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tx_c|tx_count\(27),
	datad => \uart_control_c|max_tx_count\(27),
	cin => \tx_c|LessThan0~51_cout\,
	combout => \tx_c|LessThan0~52_combout\);

-- Location: LCCOMB_X19_Y4_N28
\tx_c|LessThan0~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|LessThan0~55_combout\ = ((\tx_c|tx_count\(31)) # ((\tx_c|tx_count\(28)) # (!\tx_c|LessThan0~52_combout\))) # (!\tx_c|LessThan0~54_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|LessThan0~54_combout\,
	datab => \tx_c|tx_count\(31),
	datac => \tx_c|LessThan0~52_combout\,
	datad => \tx_c|tx_count\(28),
	combout => \tx_c|LessThan0~55_combout\);

-- Location: FF_X19_Y4_N29
\tx_c|max_tx_flag\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|LessThan0~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|max_tx_flag~q\);

-- Location: LCCOMB_X25_Y9_N8
\uart_control_c|Add3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~0_combout\ = (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & (\uart_control_c|new_reg_data\(0) $ (VCC))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & (\uart_control_c|new_reg_data\(0) & VCC))
-- \uart_control_c|Add3~1\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0) & \uart_control_c|new_reg_data\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	datab => \uart_control_c|new_reg_data\(0),
	datad => VCC,
	combout => \uart_control_c|Add3~0_combout\,
	cout => \uart_control_c|Add3~1\);

-- Location: LCCOMB_X27_Y9_N28
\uart_control_c|new_reg_data[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|new_reg_data[0]~1_combout\ = (\uart_control_c|new_reg_data\(0) & (((!\uart_control_c|state.CH_REG_DATA2~q\ & !\uart_control_c|state.CH_REG_DATA1~q\)) # (!\uart_control_c|Selector3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|state.CH_REG_DATA2~q\,
	datab => \uart_control_c|Selector3~0_combout\,
	datac => \uart_control_c|state.CH_REG_DATA1~q\,
	datad => \uart_control_c|new_reg_data\(0),
	combout => \uart_control_c|new_reg_data[0]~1_combout\);

-- Location: LCCOMB_X27_Y9_N0
\uart_control_c|new_reg_data[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|new_reg_data[0]~2_combout\ = (\uart_control_c|new_reg_data[0]~1_combout\) # ((\uart_control_c|Add3~0_combout\ & (\uart_control_c|Selector3~0_combout\ & \uart_control_c|state.CH_REG_DATA2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Add3~0_combout\,
	datab => \uart_control_c|Selector3~0_combout\,
	datac => \uart_control_c|state.CH_REG_DATA2~q\,
	datad => \uart_control_c|new_reg_data[0]~1_combout\,
	combout => \uart_control_c|new_reg_data[0]~2_combout\);

-- Location: FF_X27_Y9_N1
\uart_control_c|new_reg_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|new_reg_data[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_reg_data\(0));

-- Location: LCCOMB_X25_Y9_N10
\uart_control_c|Add3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~2_combout\ = (\uart_control_c|new_reg_data\(1) & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & (\uart_control_c|Add3~1\ & VCC)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & (!\uart_control_c|Add3~1\)))) # (!\uart_control_c|new_reg_data\(1) & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & (!\uart_control_c|Add3~1\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & 
-- ((\uart_control_c|Add3~1\) # (GND)))))
-- \uart_control_c|Add3~3\ = CARRY((\uart_control_c|new_reg_data\(1) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1) & !\uart_control_c|Add3~1\)) # (!\uart_control_c|new_reg_data\(1) & 
-- ((!\uart_control_c|Add3~1\) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_reg_data\(1),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	datad => VCC,
	cin => \uart_control_c|Add3~1\,
	combout => \uart_control_c|Add3~2_combout\,
	cout => \uart_control_c|Add3~3\);

-- Location: LCCOMB_X25_Y9_N26
\uart_control_c|Add3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~7_combout\ = (\uart_control_c|state.CH_REG_DATA2~q\ & ((\uart_control_c|Add3~2_combout\))) # (!\uart_control_c|state.CH_REG_DATA2~q\ & 
-- (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|state.CH_REG_DATA2~q\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(0),
	datad => \uart_control_c|Add3~2_combout\,
	combout => \uart_control_c|Add3~7_combout\);

-- Location: LCCOMB_X27_Y9_N2
\uart_control_c|new_reg_data[7]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|new_reg_data[7]~0_combout\ = (\uart_control_c|Selector3~0_combout\ & ((\uart_control_c|state.CH_REG_DATA1~q\) # (\uart_control_c|state.CH_REG_DATA2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|state.CH_REG_DATA1~q\,
	datac => \uart_control_c|state.CH_REG_DATA2~q\,
	datad => \uart_control_c|Selector3~0_combout\,
	combout => \uart_control_c|new_reg_data[7]~0_combout\);

-- Location: FF_X25_Y9_N27
\uart_control_c|new_reg_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add3~7_combout\,
	ena => \uart_control_c|new_reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_reg_data\(1));

-- Location: LCCOMB_X25_Y9_N12
\uart_control_c|Add3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~4_combout\ = ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) $ (\uart_control_c|new_reg_data\(2) $ (!\uart_control_c|Add3~3\)))) # (GND)
-- \uart_control_c|Add3~5\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & ((\uart_control_c|new_reg_data\(2)) # (!\uart_control_c|Add3~3\))) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2) & (\uart_control_c|new_reg_data\(2) & !\uart_control_c|Add3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(2),
	datab => \uart_control_c|new_reg_data\(2),
	datad => VCC,
	cin => \uart_control_c|Add3~3\,
	combout => \uart_control_c|Add3~4_combout\,
	cout => \uart_control_c|Add3~5\);

-- Location: LCCOMB_X25_Y9_N0
\uart_control_c|Add3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~6_combout\ = (\uart_control_c|state.CH_REG_DATA2~q\ & (\uart_control_c|Add3~4_combout\)) # (!\uart_control_c|state.CH_REG_DATA2~q\ & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Add3~4_combout\,
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(1),
	datac => \uart_control_c|state.CH_REG_DATA2~q\,
	combout => \uart_control_c|Add3~6_combout\);

-- Location: FF_X25_Y9_N1
\uart_control_c|new_reg_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add3~6_combout\,
	ena => \uart_control_c|new_reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_reg_data\(2));

-- Location: LCCOMB_X25_Y9_N14
\uart_control_c|Add3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~8_combout\ = (\uart_control_c|new_reg_data\(3) & ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & (\uart_control_c|Add3~5\ & VCC)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & (!\uart_control_c|Add3~5\)))) # (!\uart_control_c|new_reg_data\(3) & 
-- ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & (!\uart_control_c|Add3~5\)) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & 
-- ((\uart_control_c|Add3~5\) # (GND)))))
-- \uart_control_c|Add3~9\ = CARRY((\uart_control_c|new_reg_data\(3) & (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3) & !\uart_control_c|Add3~5\)) # (!\uart_control_c|new_reg_data\(3) & 
-- ((!\uart_control_c|Add3~5\) # (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_reg_data\(3),
	datab => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(3),
	datad => VCC,
	cin => \uart_control_c|Add3~5\,
	combout => \uart_control_c|Add3~8_combout\,
	cout => \uart_control_c|Add3~9\);

-- Location: LCCOMB_X25_Y9_N24
\uart_control_c|Add3~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~10_combout\ = (\uart_control_c|state.CH_REG_DATA2~q\ & (\uart_control_c|Add3~8_combout\)) # (!\uart_control_c|state.CH_REG_DATA2~q\ & ((\uart_control_c|Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|state.CH_REG_DATA2~q\,
	datab => \uart_control_c|Add3~8_combout\,
	datad => \uart_control_c|Add1~0_combout\,
	combout => \uart_control_c|Add3~10_combout\);

-- Location: FF_X25_Y9_N25
\uart_control_c|new_reg_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add3~10_combout\,
	ena => \uart_control_c|new_reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_reg_data\(3));

-- Location: LCCOMB_X25_Y9_N16
\uart_control_c|Add3~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~11_combout\ = ((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) $ (\uart_control_c|new_reg_data\(4) $ (\uart_control_c|Add3~9\)))) # (GND)
-- \uart_control_c|Add3~12\ = CARRY((\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) & (\uart_control_c|new_reg_data\(4) & !\uart_control_c|Add3~9\)) # 
-- (!\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4) & ((\uart_control_c|new_reg_data\(4)) # (!\uart_control_c|Add3~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|FIFOram|q_b\(4),
	datab => \uart_control_c|new_reg_data\(4),
	datad => VCC,
	cin => \uart_control_c|Add3~9\,
	combout => \uart_control_c|Add3~11_combout\,
	cout => \uart_control_c|Add3~12\);

-- Location: LCCOMB_X25_Y9_N6
\uart_control_c|Add3~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~19_combout\ = (\uart_control_c|state.CH_REG_DATA2~q\ & ((\uart_control_c|Add3~11_combout\))) # (!\uart_control_c|state.CH_REG_DATA2~q\ & (\uart_control_c|Add1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Add1~2_combout\,
	datac => \uart_control_c|state.CH_REG_DATA2~q\,
	datad => \uart_control_c|Add3~11_combout\,
	combout => \uart_control_c|Add3~19_combout\);

-- Location: FF_X25_Y9_N7
\uart_control_c|new_reg_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add3~19_combout\,
	ena => \uart_control_c|new_reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_reg_data\(4));

-- Location: LCCOMB_X25_Y9_N18
\uart_control_c|Add3~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~13_combout\ = (\uart_control_c|Add0~2_combout\ & ((\uart_control_c|new_reg_data\(5) & (\uart_control_c|Add3~12\ & VCC)) # (!\uart_control_c|new_reg_data\(5) & (!\uart_control_c|Add3~12\)))) # (!\uart_control_c|Add0~2_combout\ & 
-- ((\uart_control_c|new_reg_data\(5) & (!\uart_control_c|Add3~12\)) # (!\uart_control_c|new_reg_data\(5) & ((\uart_control_c|Add3~12\) # (GND)))))
-- \uart_control_c|Add3~14\ = CARRY((\uart_control_c|Add0~2_combout\ & (!\uart_control_c|new_reg_data\(5) & !\uart_control_c|Add3~12\)) # (!\uart_control_c|Add0~2_combout\ & ((!\uart_control_c|Add3~12\) # (!\uart_control_c|new_reg_data\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Add0~2_combout\,
	datab => \uart_control_c|new_reg_data\(5),
	datad => VCC,
	cin => \uart_control_c|Add3~12\,
	combout => \uart_control_c|Add3~13_combout\,
	cout => \uart_control_c|Add3~14\);

-- Location: LCCOMB_X25_Y9_N4
\uart_control_c|Add3~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~18_combout\ = (\uart_control_c|state.CH_REG_DATA2~q\ & ((\uart_control_c|Add3~13_combout\))) # (!\uart_control_c|state.CH_REG_DATA2~q\ & (\uart_control_c|Add1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|Add1~4_combout\,
	datac => \uart_control_c|state.CH_REG_DATA2~q\,
	datad => \uart_control_c|Add3~13_combout\,
	combout => \uart_control_c|Add3~18_combout\);

-- Location: FF_X25_Y9_N5
\uart_control_c|new_reg_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add3~18_combout\,
	ena => \uart_control_c|new_reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_reg_data\(5));

-- Location: LCCOMB_X25_Y9_N20
\uart_control_c|Add3~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~15_combout\ = ((\uart_control_c|new_reg_data\(6) $ (\uart_control_c|Add0~1_combout\ $ (\uart_control_c|Add3~14\)))) # (GND)
-- \uart_control_c|Add3~16\ = CARRY((\uart_control_c|new_reg_data\(6) & ((!\uart_control_c|Add3~14\) # (!\uart_control_c|Add0~1_combout\))) # (!\uart_control_c|new_reg_data\(6) & (!\uart_control_c|Add0~1_combout\ & !\uart_control_c|Add3~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|new_reg_data\(6),
	datab => \uart_control_c|Add0~1_combout\,
	datad => VCC,
	cin => \uart_control_c|Add3~14\,
	combout => \uart_control_c|Add3~15_combout\,
	cout => \uart_control_c|Add3~16\);

-- Location: LCCOMB_X25_Y9_N30
\uart_control_c|Add3~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~17_combout\ = (\uart_control_c|state.CH_REG_DATA2~q\ & ((\uart_control_c|Add3~15_combout\))) # (!\uart_control_c|state.CH_REG_DATA2~q\ & (\uart_control_c|Add1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Add1~6_combout\,
	datac => \uart_control_c|state.CH_REG_DATA2~q\,
	datad => \uart_control_c|Add3~15_combout\,
	combout => \uart_control_c|Add3~17_combout\);

-- Location: FF_X25_Y9_N31
\uart_control_c|new_reg_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add3~17_combout\,
	ena => \uart_control_c|new_reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_reg_data\(6));

-- Location: LCCOMB_X23_Y8_N30
\uart_control_c|reg_data[6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|reg_data[6]~feeder_combout\ = \uart_control_c|new_reg_data\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|new_reg_data\(6),
	combout => \uart_control_c|reg_data[6]~feeder_combout\);

-- Location: LCCOMB_X24_Y8_N8
\uart_control_c|Selector6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Selector6~0_combout\ = (\uart_control_c|state.CH_REG_DATA2~q\ & (\uart_control_c|always0~1_combout\ & (\uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\ & 
-- \uart_control_c|always0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|state.CH_REG_DATA2~q\,
	datab => \uart_control_c|always0~1_combout\,
	datac => \uart_mcu_c|rs232_0|RS232_In_Deserializer|RS232_In_FIFO|Sync_FIFO|auto_generated|dpfifo|empty_dff~q\,
	datad => \uart_control_c|always0~0_combout\,
	combout => \uart_control_c|Selector6~0_combout\);

-- Location: FF_X24_Y8_N9
\uart_control_c|state.CH_REG_DATA3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Selector6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|state.CH_REG_DATA3~q\);

-- Location: FF_X23_Y8_N31
\uart_control_c|reg_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|reg_data[6]~feeder_combout\,
	ena => \uart_control_c|state.CH_REG_DATA3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|reg_data\(6));

-- Location: LCCOMB_X25_Y9_N22
\uart_control_c|Add3~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~20_combout\ = \uart_control_c|Add0~0_combout\ $ (\uart_control_c|Add3~16\ $ (!\uart_control_c|new_reg_data\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_control_c|Add0~0_combout\,
	datad => \uart_control_c|new_reg_data\(7),
	cin => \uart_control_c|Add3~16\,
	combout => \uart_control_c|Add3~20_combout\);

-- Location: LCCOMB_X25_Y9_N28
\uart_control_c|Add3~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|Add3~22_combout\ = (\uart_control_c|state.CH_REG_DATA2~q\ & (\uart_control_c|Add3~20_combout\)) # (!\uart_control_c|state.CH_REG_DATA2~q\ & ((\uart_control_c|Add1~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|state.CH_REG_DATA2~q\,
	datac => \uart_control_c|Add3~20_combout\,
	datad => \uart_control_c|Add1~8_combout\,
	combout => \uart_control_c|Add3~22_combout\);

-- Location: FF_X25_Y9_N29
\uart_control_c|new_reg_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|Add3~22_combout\,
	ena => \uart_control_c|new_reg_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|new_reg_data\(7));

-- Location: LCCOMB_X24_Y9_N12
\uart_control_c|reg_data[7]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|reg_data[7]~3_combout\ = !\uart_control_c|new_reg_data\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|new_reg_data\(7),
	combout => \uart_control_c|reg_data[7]~3_combout\);

-- Location: FF_X23_Y8_N25
\uart_control_c|reg_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|reg_data[7]~3_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_REG_DATA3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|reg_data\(7));

-- Location: LCCOMB_X24_Y9_N30
\uart_control_c|reg_data[4]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|reg_data[4]~2_combout\ = !\uart_control_c|new_reg_data\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|new_reg_data\(4),
	combout => \uart_control_c|reg_data[4]~2_combout\);

-- Location: FF_X23_Y8_N11
\uart_control_c|reg_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|reg_data[4]~2_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_REG_DATA3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|reg_data\(4));

-- Location: LCCOMB_X23_Y8_N28
\uart_control_c|reg_data[5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|reg_data[5]~feeder_combout\ = \uart_control_c|new_reg_data\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|new_reg_data\(5),
	combout => \uart_control_c|reg_data[5]~feeder_combout\);

-- Location: FF_X23_Y8_N29
\uart_control_c|reg_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|reg_data[5]~feeder_combout\,
	ena => \uart_control_c|state.CH_REG_DATA3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|reg_data\(5));

-- Location: LCCOMB_X23_Y8_N10
\tx_c|Mux0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|Mux0~2_combout\ = (\tx_c|index\(1) & ((\tx_c|index\(0) & (!\uart_control_c|reg_data\(4))) # (!\tx_c|index\(0) & ((\uart_control_c|reg_data\(5)))))) # (!\tx_c|index\(1) & (!\tx_c|index\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|index\(1),
	datab => \tx_c|index\(0),
	datac => \uart_control_c|reg_data\(4),
	datad => \uart_control_c|reg_data\(5),
	combout => \tx_c|Mux0~2_combout\);

-- Location: LCCOMB_X23_Y8_N24
\tx_c|Mux0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|Mux0~3_combout\ = (\tx_c|index\(1) & (((\tx_c|Mux0~2_combout\)))) # (!\tx_c|index\(1) & ((\tx_c|Mux0~2_combout\ & ((!\uart_control_c|reg_data\(7)))) # (!\tx_c|Mux0~2_combout\ & (\uart_control_c|reg_data\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|reg_data\(6),
	datab => \tx_c|index\(1),
	datac => \uart_control_c|reg_data\(7),
	datad => \tx_c|Mux0~2_combout\,
	combout => \tx_c|Mux0~3_combout\);

-- Location: FF_X23_Y8_N27
\uart_control_c|reg_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|new_reg_data\(2),
	sload => VCC,
	ena => \uart_control_c|state.CH_REG_DATA3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|reg_data\(2));

-- Location: LCCOMB_X24_Y8_N14
\uart_control_c|reg_data[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|reg_data[3]~1_combout\ = !\uart_control_c|new_reg_data\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|new_reg_data\(3),
	combout => \uart_control_c|reg_data[3]~1_combout\);

-- Location: FF_X23_Y8_N13
\uart_control_c|reg_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|reg_data[3]~1_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_REG_DATA3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|reg_data\(3));

-- Location: LCCOMB_X24_Y9_N16
\uart_control_c|reg_data[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|reg_data[1]~0_combout\ = !\uart_control_c|new_reg_data\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|new_reg_data\(1),
	combout => \uart_control_c|reg_data[1]~0_combout\);

-- Location: FF_X23_Y8_N7
\uart_control_c|reg_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \uart_control_c|reg_data[1]~0_combout\,
	sload => VCC,
	ena => \uart_control_c|state.CH_REG_DATA3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|reg_data\(1));

-- Location: LCCOMB_X23_Y8_N2
\uart_control_c|reg_data[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \uart_control_c|reg_data[0]~feeder_combout\ = \uart_control_c|new_reg_data\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_control_c|new_reg_data\(0),
	combout => \uart_control_c|reg_data[0]~feeder_combout\);

-- Location: FF_X23_Y8_N3
\uart_control_c|reg_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \uart_control_c|reg_data[0]~feeder_combout\,
	ena => \uart_control_c|state.CH_REG_DATA3~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uart_control_c|reg_data\(0));

-- Location: LCCOMB_X23_Y8_N6
\tx_c|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|Mux0~0_combout\ = (\tx_c|index\(1) & ((\tx_c|index\(0) & ((\uart_control_c|reg_data\(0)))) # (!\tx_c|index\(0) & (!\uart_control_c|reg_data\(1))))) # (!\tx_c|index\(1) & (!\tx_c|index\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|index\(1),
	datab => \tx_c|index\(0),
	datac => \uart_control_c|reg_data\(1),
	datad => \uart_control_c|reg_data\(0),
	combout => \tx_c|Mux0~0_combout\);

-- Location: LCCOMB_X23_Y8_N12
\tx_c|Mux0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|Mux0~1_combout\ = (\tx_c|index\(1) & (((\tx_c|Mux0~0_combout\)))) # (!\tx_c|index\(1) & ((\tx_c|Mux0~0_combout\ & ((!\uart_control_c|reg_data\(3)))) # (!\tx_c|Mux0~0_combout\ & (\uart_control_c|reg_data\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_control_c|reg_data\(2),
	datab => \tx_c|index\(1),
	datac => \uart_control_c|reg_data\(3),
	datad => \tx_c|Mux0~0_combout\,
	combout => \tx_c|Mux0~1_combout\);

-- Location: LCCOMB_X23_Y8_N0
\tx_c|tx_bit_data~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_c|tx_bit_data~0_combout\ = (!\tx_c|max_tx_flag~q\ & ((\tx_c|index\(2) & ((\tx_c|Mux0~1_combout\))) # (!\tx_c|index\(2) & (\tx_c|Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_c|index\(2),
	datab => \tx_c|Mux0~3_combout\,
	datac => \tx_c|Mux0~1_combout\,
	datad => \tx_c|max_tx_flag~q\,
	combout => \tx_c|tx_bit_data~0_combout\);

-- Location: FF_X23_Y8_N1
\tx_c|tx_bit_data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \tx_pll_c|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \tx_c|tx_bit_data~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_c|tx_bit_data~q\);

-- Location: UNVM_X0_Y11_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~GND~combout\,
	xe_ye => \~GND~combout\,
	se => \~GND~combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X10_Y24_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~GND~combout\,
	usr_pwd => VCC,
	tsen => \~GND~combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);
END structure;


