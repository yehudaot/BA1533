//BA_1533_TX is a transmitter project, it based on PIC18F45K22 microcontroller and ALTERA/INTEL MAX 10 FPGA
//the porpuse of this FPGA projet is to transmit constant data in 9Mbit rate. the constant data may be changed 
//via UART communication protocol, the UART communication is with the PIC microcontroller
//the data transmitted is bit after bit on reg_data register and output via tx_bit_data.
//there are few input pin that are not used here such as adc_sample, and f1_tp pins
//input clock is 25MHz
//as long as the FPGA is runing LED1 will be  high and the others will be low
//to avoid warnings all the GPIO unused pins will be in comments
//YEHUDA OTZRI B.A.Microwaves 30/5/2018

module BA1533_TX (
clk, 
UART_RXD, 
UART_TXD, 
led1,
led2,
led3,
led4,
tx_bit_data
//f1_tp1,
//f1_tp2,
//f1_tp3
//f1_tp4,
//vfpga2_dig,
//adc_sample1,			
);

input clk;
input UART_RXD;          	
output UART_TXD;				
output tx_bit_data;
output led1;
output led2;
output led3;
output led4;
//output f1_tp1;
//output f1_tp2;
//output f1_tp3;
//input f1_tp4;
//input vfpga2_dig;
//input adc_sample1;

wire [7:0] from_uart_data;
wire from_uart_valid;
/////////////wire to_uart_valid;
/////////wire [7:0] to_uart_data;
////////////wire to_uart_ready;
wire to_uart_txd;
wire [7:0] reg_data;		

wire clk25MHz;
wire clk9MHz;
wire [31:0] max_tx_count;
wire max_tx_flag;


assign UART_TXD = ~to_uart_txd;
assign led1 = 1'b1;
assign led2 = 1'b0;						//indicate when FPGA transmitting data
assign led3 = ~max_tx_flag;
assign led4 = ~max_tx_flag;



tx_pll tx_pll_c(
		.inclk0				(clk),					//input clock 100MHz
		.c0					(clk25MHz),				//generated clock 25MHz
		.c1					(clk9MHz)				//generated clock 9.07MHz
);


tx tx_c (
		.clk            	(clk9MHz),             //clk 9.07MHz 
		.rst           	(1'b0),
		.tx_bit_data		(tx_bit_data),
		//.max_tx_count		(max_tx_count)
		//.reg_data			(reg_data),
		.max_tx_flag		(max_tx_flag)
);


uart_control uart_control_c(
		.clk             	(clk25MHz),             
		.rst           	(1'b0), 
		.from_uart_valid	(from_uart_valid),
		.from_uart_data	(from_uart_data),
		.max_tx_count		(),					//max_tx_count
		.reg_data			()						//reg_data
);

		uart_mcu uart_mcu_c (
		.clk             (clk25MHz),             //                        clk.clk
		.reset           (1'b0),            //                      reset.reset
		.UART_RXD        (~UART_RXD),       //         external_interface.RXD
		.UART_TXD        (to_uart_txd),     //                           .TXD
		.from_uart_ready (~UART_RXD), 		// avalon_data_receive_source.ready
		.from_uart_data  (from_uart_data),  //                           .data
		.from_uart_error (), 					//                           .error
		.from_uart_valid (from_uart_valid), //                           .valid
		.to_uart_data    (),    //  avalon_data_transmit_sink.data
		.to_uart_error   (),   					//                           .error
		.to_uart_valid   (),   //                           .valid
		.to_uart_ready   ()    //                           .ready
	);


	

endmodule

