## Generated SDC file "BA1533_TX.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

## DATE    "Wed May 30 11:34:10 2018"

##
## DEVICE  "10M08SAU169I7G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 40.000 -waveform { 0.000 20.000 } [get_ports {clk}]

#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {tx_pll_c|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -master_clock {clk} [get_pins {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {tx_pll_c|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 20 -divide_by 53 -master_clock {clk} [get_pins {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {tx_pll_c|altpll_component|auto_generated|pll1|clk[1]}]  0.070  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock { tx_pll_c|altpll_component|auto_generated|pll1|clk[1] } 0 [get_ports {rx_bit_data}]

#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

