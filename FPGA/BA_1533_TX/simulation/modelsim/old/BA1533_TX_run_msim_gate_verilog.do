transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {BA1533_TX.vo}

vlog -vlog01compat -work work +incdir+C:/BA/Software_projects/FPGA/1533_FPGA/BA_1533_TX/simulation/modelsim {C:/BA/Software_projects/FPGA/1533_FPGA/BA_1533_TX/simulation/modelsim/tb.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  tb

source BA1533_TX_dump_all_vcd_nodes.tcl
add wave *
view structure
view signals
run -all
