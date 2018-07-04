//module to transmit data, operatend with clock 9.437MHz to acomplish 9Mbit data rate transmition
//the sent data is from reg_data, its length is 8 bit and index is decarmented every transmition.
//the FPGA will transmit data as long as it is runing, the PIC microcontroller operates a BIT_EN output,
//when BIT_EN output is high the FPGA's voltage is up the FPGA is runing and transmiting data.  

module tx (
clk, 
tx_bit_data, 
rst, 
max_tx_flag
);

input clk;
input rst;
output reg tx_bit_data;
output reg max_tx_flag = 1'b0;

reg [2:0] index = 3'h7;
reg [31:0] tx_count = 32'h0;
reg [7:0] reg_data = 8'hAA;
reg [31:0] max_tx_count = 32'h4C4B400;		//80 milion Bits


//////use this block in case of counting the transmitted data and blocking transmitting data after a counted of data transmitted//////

always@(posedge clk or posedge rst)begin     
	if(rst)begin
		index <= 3'h7;
	end
	else begin
		if(~max_tx_flag)begin
			//tx_bit_data <= reg_data[index];
			//index <= index - 3'h1;
			tx_bit_data <= ~tx_bit_data;
			tx_count <= tx_count + 32'h1;
		end
		else begin
			//index <= 3'h7;
			tx_bit_data <= 1'b0;
			tx_count <= tx_count;
		end
	end
end

//always@(posedge clk or posedge rst)begin     
//	if(rst)begin
//		tx_count <= 32'h0;
//	end
//	else begin
//		if(index == 3'h6)
//			tx_count <= tx_count + 32'h1;
//		else
//			tx_count <= tx_count;
//	end
//end

always@(posedge clk or posedge rst)begin     
	if(rst)begin
		max_tx_flag <= 1'b0;
	end
	else begin
		if(tx_count >= max_tx_count)
			max_tx_flag <= 1'b1;
		else
			max_tx_flag <= 1'b0;
		
	end
end	

endmodule
