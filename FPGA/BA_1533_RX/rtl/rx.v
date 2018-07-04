module rx (
clk9MHz, 
rx_bit_data, 
rst, 
to_uart_valid,
to_uart_data,
rx_started_flag,
clk9MHz_offset10,
clk9MHz_offset20,
clk9MHz_offset30,
clk9MHz_offset60,
fail,							//for debug remove later
pass_percentage,			//for debug remove later
shift_temp,
rx_bit_data_shift_reg,
rx_bit_data_shift_reg_d,
rx_bit_data_deru,
rx_bit_data_derl,
clk90MHz,
clk_der
);

input clk9MHz;
input rst;
input rx_bit_data;
input clk9MHz_offset10;
input clk9MHz_offset20;
input clk9MHz_offset30;
input clk9MHz_offset60;
input clk90MHz;
input rx_bit_data_deru;
input rx_bit_data_derl;
input clk_der;


output reg to_uart_valid;
output reg [7:0] to_uart_data;
output reg rx_started_flag = 1'b0;
output reg [31:0] fail;					//for debug remove later
output reg [35:0] pass_percentage;	//for debug remove later
output reg [15:0]shift_temp;
output reg [7:0] rx_bit_data_shift_reg = 8'hAA;
output reg [7:0] rx_bit_data_shift_reg_d = 8'hAA;


reg [31:0] pass = 32'h1C;
//reg [23:0] fail;
reg [31:0] total_rx_counter = 32'h1C;
//reg [23:0] pass_percentage;
//reg [7:0] rx_bit_data_shift_reg = 8'hAA;
//reg [7:0] rx_bit_data_shift_reg_d = 8'hAA;
reg [3:0] rx_bit_data_cnt;


reg [7:0] start_num = 8'h59;
reg [7:0] reg_data = 8'hAA;
reg [31:0] max_rx_count = 32'h4C4B400;
reg [19:0] rx_1000_counter;
reg rx_1000_counter_flag;

//always@(posedge clk9MHz_offset60 or posedge rst) begin 
always@(posedge clk_der or posedge rst) begin  
	if(rst) begin
		rx_started_flag <= 1'b0;
	end
	else begin
		if((shift_temp == 16'hAAAA) || (shift_temp == 16'h5555))
			rx_started_flag <= 1'b1;
		else
			rx_started_flag <= rx_started_flag;
	end
end


reg current_val;
//always@(posedge clk9MHz_offset60 or posedge rst) begin
always@(posedge (clk_der) or posedge rst) begin   
	if(rst) begin
		rx_bit_data_shift_reg <= 8'hAA;
		
		rx_bit_data_cnt <= 4'h0;
		pass <= 32'h1C;
		fail <= 32'h0;
		total_rx_counter <= 32'h1C;
	end
	else begin
		rx_bit_data_shift_reg <= {rx_bit_data_shift_reg[6:0], rx_bit_data};
		if(rx_started_flag && (total_rx_counter <= max_rx_count)) begin
			if((rx_bit_data_shift_reg == 8'hAA) || (rx_bit_data_shift_reg == 8'h55))begin 
				pass <= pass + 32'h1;
				total_rx_counter <= total_rx_counter + 32'h1;
			end
			else begin
				fail <= fail + 32'h1;
				total_rx_counter <= total_rx_counter + 32'h1;
				rx_bit_data_shift_reg[0] <= ~rx_bit_data_shift_reg[0];
			end
		end
		else begin
				rx_bit_data_shift_reg <= rx_bit_data_shift_reg;
				total_rx_counter <= total_rx_counter;
				pass <= pass;
				fail <= fail;
		end
	end

end






always@(posedge clk9MHz or posedge rst) begin     
	if(rst) begin
		rx_1000_counter <= 20'h0;
		rx_1000_counter_flag <= 1'b0;
	end
	else begin
		if(rx_1000_counter == 20'd100000)begin
			rx_1000_counter <= 20'h0;
			rx_1000_counter_flag <= 1'b1;
		end
		else if(((rx_bit_data_shift_reg == reg_data)) && rx_started_flag)begin
			rx_1000_counter <= rx_1000_counter + 20'h1;
			rx_1000_counter_flag <= 1'b0;
		end
		//else begin
		//	rx_1000_counter <= 20'h0;
		//	rx_1000_counter_flag <= 1'b0;
		//end
	end
end

always@(posedge clk_der or posedge rst) begin     //calculate the percentage of good income data
	if(rst) begin
		pass_percentage <= 32'h0;
	end
	//else if (total_rx_counter == (max_rx_count - 32'h5))begin
	else begin
		pass_percentage <= ((pass * 32'h64) / 32'h4C4B400);
	end
//	else if (total_rx_counter == (max_rx_count - 32'h3))begin
//		pass_percentage <= pass_percentage / 32'h4C4B400;
//	end
end



always@(posedge clk9MHz or posedge rst) begin     //detect when to send to MCU pass_percentage
	if(rst) begin
		to_uart_valid <= 1'b0;
		to_uart_data <= 8'h0;
	end
	else if((total_rx_counter == max_rx_count) || detect_end_flag_deru)begin
		to_uart_data <= (pass_percentage[7:0]);
		to_uart_valid <= 1'b1;
	end
	else begin
		to_uart_valid <= 1'b0;
	end
end


always@(posedge clk9MHz or posedge rst) begin     //detect when to send to MCU pass_percentage
	if(rst) begin
		shift_temp <= 16'h0;
	end
	else begin
		shift_temp <= {shift_temp[14:0], rx_bit_data};
	end
end
	

reg detect_end_flag;
reg detect_end_flag_s1;
reg detect_end_flag_deru;
reg [7:0] no_change_cnt;
	
always@(posedge clk9MHz or posedge rst) begin     
	if(rst) begin
		detect_end_flag <= 1'b0;
		no_change_cnt <= 8'h0;
		rx_bit_data_shift_reg_d <= 8'hAA;
	end
	else begin
		rx_bit_data_shift_reg_d <= rx_bit_data_shift_reg;
		if((no_change_cnt == 8'hC8) && (total_rx_counter <= max_rx_count))begin
			detect_end_flag <= 1'b1;
			no_change_cnt <= no_change_cnt;
		end
		else if(rx_bit_data_shift_reg_d == rx_bit_data_shift_reg)begin
			no_change_cnt <= no_change_cnt + 8'h1;
			detect_end_flag <= 1'b0;
		end
		else begin
			no_change_cnt <= 8'h0;
			detect_end_flag <= 1'b0;
		end
	end
end	
	
	
always@(posedge clk9MHz or posedge rst) begin     
	if(rst) begin
		detect_end_flag_s1 <= 1'b0;
		detect_end_flag_deru <= 1'b0;
	end
	else begin
		detect_end_flag_s1 <= detect_end_flag;
		detect_end_flag_deru <= detect_end_flag && ~detect_end_flag_s1;
	end
end
	
	
	
	
	
	
	
	
////---------temp for debug only remove later///////////
//reg temp;
//
//
//always@(posedge clk or posedge rst) begin     //detect when to send to MCU pass_percentage
//	if(rst) begin
//		to_uart_valid <= 1'b0;
//		to_uart_data <= 8'h0;
//	end
//	else if(temp && to_uart_ready) begin
//		to_uart_data <= 8'h9A;
//		to_uart_valid <= 1'b1;
//		
//	end
//	else begin
//		to_uart_valid <= 1'b0;
//	end
//end
//
//
//reg [31:0]temp_cnt;
//
//always@(posedge clk or posedge rst) begin     
//	if(rst) begin
//		temp_cnt <= 32'h0;
//		temp <= 1'b0;
//	end
//	else begin
//		if(temp_cnt == 32'hFFFFFFF)begin
//			temp_cnt <= 32'h0;
//			temp <= 1'b1;
//		end
//		
//		else begin
//			temp_cnt <= temp_cnt + 32'h1;
//			temp <= 1'b0;
//		end
//	end
//end
//---------------------------------------------------------------------



//				8'h9A: rx_bit_data_shift_reg <= 8'h6A;
//				8'h35: rx_bit_data_shift_reg <= 8'hD4;
//				8'h6A: rx_bit_data_shift_reg <= 8'hA9;
//				8'hD4: rx_bit_data_shift_reg <= 8'h53;
//				8'hA9: rx_bit_data_shift_reg <= 8'hA6;
//				8'h53: rx_bit_data_shift_reg <= 8'hAD;
//				8'hA6: rx_bit_data_shift_reg <= 8'h9A;
//				8'hAd: rx_bit_data_shift_reg <= 8'h35;




//	else begin
//		if(rx_started_flag && (total_rx_counter <= max_rx_count)) begin
//			rx_bit_data_shift_reg <= {rx_bit_data_shift_reg[6:0], rx_bit_data_2d};
//			rx_bit_data_shift_reg_d <= rx_bit_data_shift_reg;
//			rx_bit_data_cnt <= rx_bit_data_cnt + 4'h1;
//			//if((rx_bit_data_shift_reg == 8'h9A)||(rx_bit_data_shift_reg == 8'h35)||(rx_bit_data_shift_reg == 8'h6A)||(rx_bit_data_shift_reg == 8'hD4)||
//			//(rx_bit_data_shift_reg == 8'hA9)||(rx_bit_data_shift_reg == 8'h53)||(rx_bit_data_shift_reg == 8'hA6)||(rx_bit_data_shift_reg == 8'hAd))begin
//			if(rx_bit_data_shift_reg == 8'h9A)begin
//				pass <= pass + 32'h1;
//				rx_bit_data_cnt <= 4'h0;
//				total_rx_counter <= total_rx_counter + 32'h1;
//			end
//			if((rx_bit_data_cnt == 4'hA) && (rx_bit_data_shift_reg != reg_data))begin  // && (rx_bit_data_shift_reg != 8'hFF) 
//				fail <= fail + 32'h1;
//				rx_bit_data_cnt <= 4'h0;
//				total_rx_counter <= total_rx_counter + 32'h1;
//			end
//		end
//	
//		else begin
//			rx_bit_data_shift_reg <= rx_bit_data_shift_reg;
//			rx_bit_data_cnt <= rx_bit_data_cnt;
//			total_rx_counter <= total_rx_counter;
//			pass <= pass;
//			fail <= fail;
//			//rx_128_counter <= 7'h0;
//		end
//	end





endmodule
