view wave 
wave clipboard store
wave create -pattern none -portmode input -language vlog /tx/clk 
wave create -pattern none -portmode input -language vlog -range 7 0 /tx/reg_data 
wave create -pattern none -portmode output -language vlog /tx/tx_bit_data 
wave create -pattern none -portmode input -language vlog /tx/rst 
wave create -pattern none -portmode input -language vlog -range 31 0 /tx/max_tx_count 
wave create -pattern none -portmode output -language vlog /tx/max_tx_flag 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns NewSig:/tx/clk 
wave modify -driver freeze -pattern constant -value 10011010 -range 7 0 -starttime 0ns -endtime 1000ns NewSig:/tx/reg_data 
wave modify -driver freeze -pattern constant -value 10011010 -range 7 0 -starttime 0ns -endtime 1000ns NewSig:/tx/reg_data 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns NewSig:/tx/rst 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 1000ns NewSig:/tx/rst 
wave modify -driver freeze -pattern constant -value 10011010 -range 7 0 -starttime 0ns -endtime 1000ns NewSig:/tx/reg_data 
{wave export -file C:/BA/Software_projects/FPGA/1533_FPGA/BA_1533_TX/simulation/modelsim/tb.v -starttime 0 -endtime 1000 -format vlog -designunit tx -f} 
WaveCollapseAll -1
wave clipboard restore
