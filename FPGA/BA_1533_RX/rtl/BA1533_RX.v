//BA_1533_RX is a reciver project, it based on PIC18F45K22 microcontroller and ALTERA/INTEL MAX 10 FPGA
//the porpuse of this FPGA projet is to recieve constant data in 9Mbit rate. the constant data may be changed 
//via UART communication protocol, the UART communication is with the PIC microcontroller
//the data recieved is bit after bit on reg_data register and recieved via rx_bit_data.
//there are few input pin that are not used here such as adc_sample, and f1_tp pins
//input clock is 25MHz
//as long as the FPGA is runing LED1 will be  high and the others will be low
//to avoid warnings all the GPIO unused pins will be in comments
//when data reciving is finished (max_rx_count) percentage is calculated and transmited to PIC microcontroller via UART communication protocol
//YEHUDA OTZRI B.A.Microwaves 30/5/2018
module BA1533_RX (
clk, 
UART_RXD, 
UART_TXD, 
rx_bit_data,
led1,
led2,
led3,
led4
//f1_tp1,
//f1_tp2,
//f1_tp3,
//f1_tp4,
//vfpga2_dig,
//adc_sample1,
);


input clk;
input UART_RXD;          	
output UART_TXD;				
input rx_bit_data;

//input f1_tp1;
//input f1_tp2;
//input f1_tp3;
//input f1_tp4;
//input vfpga2_dig;
//input adc_sample1;
output led1;
output led2;
output led3;
output led4;

reg rx_bit_data_s1;
reg rx_bit_data_s2;
reg rx_bit_data_s3;
reg rx_bit_data_s4;
reg rx_bit_data_deru;
reg rx_bit_data_derl;
reg clk_der;

wire [7:0]from_uart_data;
wire from_uart_valid;
wire to_uart_valid;
wire [7:0] to_uart_data;
wire to_uart_ready;
wire to_uart_txd;

wire rx_started_flag;

reg rst = 1'b0;
wire clk25MHz;
wire clk9MHz;
wire clk90MHz;

assign UART_TXD = to_uart_txd;
assign led1 = rx_started_flag;		//LED active high
assign led2 = rx_started_flag;    
assign led3 = rx_started_flag;
assign led4 = 1'b1;

rx_pll rx_pll_c(
		.inclk0				(clk),
		.c0					(clk25MHz),
		.c1					(clk9MHz),
		.c2					(clk90MHz)
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
		.to_uart_data    (to_uart_data_s),    //  avalon_data_transmit_sink.data
		.to_uart_error   (),   					//                           .error
		.to_uart_valid   (to_uart_valid_s),   //                           .valid
		.to_uart_ready   (to_uart_ready)    //                           .ready
	);


uart_control uart_control_c(
		.clk             	(clk25MHz), //(clk25MHz),             
		.rst           	(1'b0), 
		.from_uart_valid	(from_uart_valid),
		.from_uart_data	(from_uart_data)
);
	

rx rx_c (
		.clk9MHz       (clk9MHz),    //(clk9MHz),             //                        clk.clk
		.rst           (1'b0), 
		.rx_bit_data	(rx_bit_data_s2),
		.to_uart_valid	(to_uart_valid),
		.to_uart_data	(to_uart_data),
		.rx_started_flag (rx_started_flag),
		.rx_bit_data_deru(rx_bit_data_deru),
		.rx_bit_data_derl(rx_bit_data_derl),
		.clk_der(clk_der),
		.fail()
);



//synchronize to_uart_valid signal
reg to_uart_valid_s1;
reg to_uart_valid_s;
always@(posedge clk25MHz or posedge rst) begin     
	if(rst) begin
		to_uart_valid_s1 <= 1'b0;
	end
	else begin
		to_uart_valid_s1 <= to_uart_valid;
	end
end

always@(posedge clk25MHz or posedge rst) begin     
	if(rst) begin
		to_uart_valid_s <= 1'b0;
	end
	else begin
		to_uart_valid_s <= to_uart_valid_s1;
	end
end


//synchronize to_uart_data signal
reg [7:0]to_uart_data_s1;
reg [7:0]to_uart_data_s;
always@(posedge clk25MHz or posedge rst) begin     
	if(rst) begin
		to_uart_data_s1 <= 8'h0;
	end
	else begin
		to_uart_data_s1 <= to_uart_data;
	end
end

always@(posedge clk25MHz or posedge rst) begin     
	if(rst) begin
		to_uart_data_s <= 8'h0;
	end
	else begin
		to_uart_data_s <= to_uart_data_s1;
	end
end



always@(posedge clk90MHz or posedge rst) begin
	if(rst) begin
		rx_bit_data_s1 <= 1'b0;
	end
	else begin
		rx_bit_data_s1 <= rx_bit_data;
	end
end

always@(posedge clk90MHz or posedge rst) begin
	if(rst) begin
		rx_bit_data_s2 <= 1'b0;
	end
	else begin
		rx_bit_data_s2 <= rx_bit_data_s1;
	end
end

always@(posedge clk90MHz or posedge rst) begin
	if(rst) begin
		rx_bit_data_s3 <= 1'b0;
	end
	else begin
		rx_bit_data_s3 <= rx_bit_data_s2;
	end
end

always@(posedge clk90MHz or posedge rst) begin
	if(rst) begin
		rx_bit_data_s4 <= 1'b0;
	end
	else begin
		rx_bit_data_s4 <= rx_bit_data_s3;
	end
end


always@(posedge clk90MHz or posedge rst) begin
	if(rst) begin
		rx_bit_data_deru <= 1'b0;
	end
	else begin
		rx_bit_data_deru <= rx_bit_data_s1 && ~rx_bit_data_s2;
		rx_bit_data_derl <= ~rx_bit_data_s1 && rx_bit_data_s2;
		clk_der <= ((rx_bit_data_s3 && ~rx_bit_data_s4) || (~rx_bit_data_s3 && rx_bit_data_s4));
	end
end


endmodule
