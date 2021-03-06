
`timescale 1ns/1ns

module uart1(			clk,
						reset_n,
						RxD, 
						RxD_data_ready, 
						RxD_data, 
						RxD_endofpacket, 
						RxD_idle, 
						TxD_start, 
						TxD_data, 
						TxD, 
						TxD_busy,
						BaudTick,
						RxD_data_error
						);
input clk, RxD, reset_n;
input TxD_start;
input [7:0] TxD_data;
output RxD_data_ready;  // onc clock pulse when RxD_data is valid
output [7:0] RxD_data;
output RxD_endofpacket;  // one clock pulse, when no more data is received (RxD_idle is going high)
output RxD_idle;  // no data is being received
output TxD, TxD_busy;
output reg BaudTick;
output wire RxD_data_error;
// 15 bits for the accumulator ([14:0]), and one extra bit for the accumulator carry-out ([15])
reg [15:0] acc;   // 16 bits total!
//reg BaudTick;
reg Baud8Tick;
reg BaudTick_d;
reg Baud8Tick_d;
reg TxD_start_hs;
//assign BaudTick = acc[15]; // so that the 16th bit is the carry-out 
//assign Baud8Tick = acc[12];

// 26MHz/115200 = 225.69444, 2^15/145 = 225.986
//26MHz/230400 = 112.847222, 2^15/290 = 112.993
// 24MHz/115200 = 208.33333, 2^15/157 = 208.713
always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n) 
		acc <= 16'h00;
	else 
		acc <= acc[15:0] + 8'd157;
		//acc <= acc[15:0] + 8'd145; // use only 15 bits from the previous result, but save the full 16 bits
		//acc <= acc[15:0] + 9'd290;
end

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n) begin
		BaudTick <= 1'b0;
		Baud8Tick <= 1'b0;
		BaudTick_d <= 1'b0;
		Baud8Tick_d <= 1'b0;
	end			 
	else begin	
		BaudTick_d <= acc[14];
		Baud8Tick_d <= acc[11];
		BaudTick <= acc[14] && ~BaudTick_d;
		Baud8Tick <= acc[11] && ~Baud8Tick_d;
	end	
end

always @ (posedge clk or negedge reset_n)
begin
	if(!reset_n) 
		TxD_start_hs <= 1'b0;
	else if(TxD_start)
		TxD_start_hs <= 1'b1; 
	else if (BaudTick)
		TxD_start_hs <= 1'b0;
end
		
async_transmitter async_transmitter_c(	.clk(clk),
										.reset_n(reset_n), 
										.TxD_start(TxD_start_hs), 
										.TxD_data(TxD_data), 
										.TxD(TxD), 
										.TxD_busy(TxD_busy),
										.BaudTick(BaudTick)
										);

async_receiver async_receiver_c(.clk(clk), 
								.reset_n(reset_n),
								.RxD(RxD), 
								.RxD_data_ready(RxD_data_ready), 
								.RxD_data(RxD_data), 
								.RxD_endofpacket(RxD_endofpacket), 
								.RxD_idle(RxD_idle),
								.Baud8Tick(Baud8Tick),
								.RxD_data_error(RxD_data_error)
								);

endmodule
