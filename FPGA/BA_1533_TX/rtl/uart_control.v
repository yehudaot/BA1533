//UART communication module to communicate with the PIC18F45k22 microcontroller
//baudrate 115200 
//this module enable to change the max_tx_count and the reg_data to transmit
//the max_tx_count is initialized to 1 million times to transmit reg_data (8 bit length), 
//to change the max_tx_count use the $xx command, the new value will be multipaled by 1 million
//the reg_data initialized to 0x9A, to change the reg_data use the #xx command
//the UART module will be operated with 25MHz clock
//////***REG_DATA AND max_tx_count ARE NOT USED, IT WILL IF NEEDED!!!!!
module uart_control (
rst, 
clk, 
from_uart_valid, 
from_uart_data
);

input clk;
input rst;
input from_uart_valid;
input [7:0] from_uart_data;

reg [3:0] state;
reg [7:0] new_tx_max_count;
reg [7:0] new_reg_data;
reg [31:0] max_tx_count = 32'h4C4B400;
reg [7:0] reg_data = 8'hAA;

parameter IDLE = 4'h0, CH_MAX_TX_COUNT1 = 4'h1, CH_MAX_TX_COUNT2 = 4'h2, CH_MAX_TX_COUNT3 = 4'h3,
			CH_REG_DATA1 = 4'H4, CH_REG_DATA2 = 4'H5, CH_REG_DATA3 = 4'H6;


//UART control state machine
always@(posedge clk or posedge rst)begin    
	if(rst)begin
		state <= 4'h0;
		new_tx_max_count <= 8'h0;
	end
	else begin
		case(state)
			IDLE: begin
				if(from_uart_valid)begin
					if(from_uart_data == 8'h24) state <= CH_MAX_TX_COUNT1;				//read $ change max_tx_count
					else if(from_uart_data == 8'h23) state <= CH_REG_DATA1;				//read # change reg data
				end
				else																						//this else is for if not from_uart_valid
				state <= IDLE;
			end
			
			
			CH_MAX_TX_COUNT1: begin
				if(from_uart_valid)begin
					if(from_uart_data == 8'h20) state <= CH_MAX_TX_COUNT1;					//read space, stay in the same state
					else if((from_uart_data >= 8'h30) && (from_uart_data <= 8'h39))begin	//read digit number
						new_tx_max_count <= ((from_uart_data - 8'h30) * 8'd10);
						state <= CH_MAX_TX_COUNT2;
					end
					else begin
						state <= IDLE;											//exit to IDLE if unknown command recieved
						//need to send fail 
					end
				end
				else begin 														//stay in the state if from_uartvalid did not arrived
					state <= CH_MAX_TX_COUNT1;
				end
			end
			
			
			CH_MAX_TX_COUNT2: begin
				if(from_uart_valid)begin
					if(from_uart_data == 8'h20) 
						state <= CH_MAX_TX_COUNT2;		//read space, stay in the same state
					else if((from_uart_data >= 8'h30) && (from_uart_data <= 8'h39))begin	//read digit number
						new_tx_max_count <= (new_tx_max_count + (from_uart_data - 8'h30));
						state <= CH_MAX_TX_COUNT3;
					end
					else
						state <= IDLE;
				end
				else
					state <= CH_MAX_TX_COUNT2;
			end
			
			
			CH_MAX_TX_COUNT3:begin
				max_tx_count <= (new_tx_max_count * 32'hF4246);
				state <= IDLE;
			end
			
			CH_REG_DATA1: begin
				if(from_uart_valid)begin
					if(from_uart_data == 8'h20) 
						state <= CH_REG_DATA1;		//read space, stay in the same state
					else if((from_uart_data >= 8'h30) && (from_uart_data <= 8'h39)) begin	//read digit number
						new_reg_data <= ((from_uart_data - 8'h30) * 8'd10);
						state <= CH_REG_DATA2;
					end
					else
						state <= IDLE;
				end
				else
					state <= CH_REG_DATA1;
			end
			
			CH_REG_DATA2: begin
				if(from_uart_valid)begin
					if(from_uart_data == 8'h20) state <= CH_REG_DATA2;									//read space, stay in the same state
					else if((from_uart_data >= 8'h30) && (from_uart_data <= 8'h39)) begin			//read digit number
						new_reg_data <= (new_reg_data + (from_uart_data - 8'h30));
						state <= CH_REG_DATA3;																	//got new valid reg_data (new data to send),					
					end
					else
						state <= IDLE;																				//go back to IDLw
				end
				else
					state <= CH_REG_DATA2;
			end
			
			
			CH_REG_DATA3: begin
				reg_data <= new_reg_data;
				state <= IDLE;
			end
		endcase			
	end
end






endmodule
