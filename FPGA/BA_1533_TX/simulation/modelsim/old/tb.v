
`timescale 1ns / 1ns
module tb   ; 
 
  reg  [31:0]  max_tx_count   ; 
  reg    rst   ; 
  reg  max_tx_flag   ; 
  reg    clk   ; 
  reg  tx_bit_data   ; 
  reg  [7:0]  reg_data   ; 
  tx  
   DUT  ( 
       .max_tx_count (max_tx_count ) ,
      .rst (rst ) ,
      .max_tx_flag (max_tx_flag ) ,
      .clk (clk ) ,
      .tx_bit_data (tx_bit_data ) ,
      .reg_data (reg_data ) ); 



// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  initial
  begin
	  clk  = 1'b0  ;
	 # 50 ;
// 50 ns, single loop till start period.
   repeat(9)
   begin
	   clk  = 1'b1  ;
	  #50  clk  = 1'b0  ;
	  #50 ;
// 950 ns, repeat pattern in loop.
   end
	  clk  = 1'b1  ;
	 # 50 ;
// dumped values till 1 us
  end


// "Constant Pattern"
// Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  initial
  begin
	  reg_data  = 8'b10011010  ;
	  max_tx_flag = 1'b0;
	  tx_bit_data = 1'b0;
	 # 1000 ;
// dumped values till 1 us
  end


// "Constant Pattern"
// Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  initial
  begin
	  rst  = 1'b0  ;
	 # 1000 ;
// dumped values till 1 us
  end

  initial
	#2000 $stop;
endmodule
