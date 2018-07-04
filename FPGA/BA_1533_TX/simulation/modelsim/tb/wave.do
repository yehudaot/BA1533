view wave 
wave clipboard store
wave create -pattern none -portmode input -language vlog /BA1533_TX/clk 
wave create -pattern none -portmode input -language vlog /BA1533_TX/UART_RXD 
wave create -pattern none -portmode output -language vlog /BA1533_TX/UART_TXD 
wave create -pattern none -portmode output -language vlog /BA1533_TX/led1 
wave create -pattern none -portmode output -language vlog /BA1533_TX/led2 
wave create -pattern none -portmode output -language vlog /BA1533_TX/led3 
wave create -pattern none -portmode output -language vlog /BA1533_TX/led4 
wave create -pattern none -portmode output -language vlog /BA1533_TX/tx_bit_data 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns NewSig:/BA1533_TX/clk 
wave modify -driver expectedOutput -pattern random -initialvalue 0 -period 50ns -random_type Uniform -seed 5 -starttime 0ns -endtime 1000ns NewSig:/BA1533_TX/led1 
wave modify -driver expectedOutput -pattern random -initialvalue 0 -period 50ns -random_type Uniform -seed 5 -starttime 0ns -endtime 1000ns NewSig:/BA1533_TX/led2 
wave modify -driver expectedOutput -pattern random -initialvalue 0 -period 50ns -random_type Uniform -seed 5 -starttime 0ns -endtime 1000ns NewSig:/BA1533_TX/led3 
wave modify -driver expectedOutput -pattern random -initialvalue 0 -period 50ns -random_type Uniform -seed 5 -starttime 0ns -endtime 1000ns NewSig:/BA1533_TX/led4 
wave modify -driver expectedOutput -pattern random -initialvalue 0 -period 50ns -random_type Uniform -seed 5 -starttime 0ns -endtime 1000ns NewSig:/BA1533_TX/tx_bit_data 
{wave export -file C:/BA/Software_projects/FPGA/1533_FPGA/BA_1533_TX/simulation/modelsim/tb/tb -starttime 0 -endtime 1000 -format vlog -designunit BA1533_TX} 
WaveCollapseAll -1
wave clipboard restore
