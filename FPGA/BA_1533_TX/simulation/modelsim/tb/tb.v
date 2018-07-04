
`timescale 1ns / 1ns
module tb  ; 
 
  wire    led3   ; 
  wire    led4   ; 
  reg    UART_RXD   ; 
  wire    led1   ; 
  reg    clk   ; 
  wire    tx_bit_data   ; 
  wire    led2   ; 
  wire    UART_TXD   ; 
  BA1533_TX  
   DUT  ( 
       .led3 (led3 ) ,
      .led4 (led4 ) ,
      .UART_RXD (UART_RXD ) ,
      .led1 (led1 ) ,
      .clk (clk ) ,
      .tx_bit_data (tx_bit_data ) ,
      .led2 (led2 ) ,
      .UART_TXD (UART_TXD ) ); 

   integer \SEED_led1  = 5 ;
   integer \IV_led1 [0:33];
   real \RNDVAL_led1 ;
   real \MAX_RND_led1  = 1 ;
   integer \SEED_led2  = 5 ;
   integer \IV_led2 [0:33];
   real \RNDVAL_led2 ;
   real \MAX_RND_led2  = 1 ;
   integer \SEED_led3  = 5 ;
   integer \IV_led3 [0:33];
   real \RNDVAL_led3 ;
   real \MAX_RND_led3  = 1 ;
   integer \SEED_led4  = 5 ;
   integer \IV_led4 [0:33];
   real \RNDVAL_led4 ;
   real \MAX_RND_led4  = 1 ;
   integer \SEED_tx_bit_data  = 5 ;
   integer \IV_tx_bit_data [0:33];
   real \RNDVAL_tx_bit_data ;
   real \MAX_RND_tx_bit_data  = 1 ;
 integer global_iv[0:33];
 real global_iy[0:3];
 integer random_index;
 reg [63:0] receiver_64bit_val;
 `include "C:/altera_lite/15.1/modelsim_ase/win32aloem/../verilog_src/vlog_waveform_edit_package/vlog_random_package.v"



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


// "Random Pattern"(Uniform) : seed = 5
// Start Time = 0 ns, End Time = 1 us, Period = 50 ns
  initial
  begin
		\IV_led1 [32] = 0;
	 \IV_led1 [33] = 0;
   repeat(20)
   begin
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			global_iv[random_index] = \IV_led1 [random_index];
	   random (\SEED_led1 , \RNDVAL_led1 );
	   receiver_64bit_val = ceil(\MAX_RND_led1 * \RNDVAL_led1 );
	    if (led1  != (receiver_64bit_val[0:0]  )) $display($time, " test case failed");
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			\IV_led1 [random_index] = global_iv[random_index];
	   #50 ;
// 1 us, repeat pattern in loop.
   end
  end


// "Random Pattern"(Uniform) : seed = 5
// Start Time = 0 ns, End Time = 1 us, Period = 50 ns
  initial
  begin
		\IV_led2 [32] = 0;
	 \IV_led2 [33] = 0;
   repeat(20)
   begin
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			global_iv[random_index] = \IV_led2 [random_index];
	   random (\SEED_led2 , \RNDVAL_led2 );
	   receiver_64bit_val = ceil(\MAX_RND_led2 * \RNDVAL_led2 );
	    if (led2  != (receiver_64bit_val[0:0]  )) $display($time, " test case failed");
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			\IV_led2 [random_index] = global_iv[random_index];
	   #50 ;
// 1 us, repeat pattern in loop.
   end
  end


// "Random Pattern"(Uniform) : seed = 5
// Start Time = 0 ns, End Time = 1 us, Period = 50 ns
  initial
  begin
		\IV_led3 [32] = 0;
	 \IV_led3 [33] = 0;
   repeat(20)
   begin
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			global_iv[random_index] = \IV_led3 [random_index];
	   random (\SEED_led3 , \RNDVAL_led3 );
	   receiver_64bit_val = ceil(\MAX_RND_led3 * \RNDVAL_led3 );
	    if (led3  != (receiver_64bit_val[0:0]  )) $display($time, " test case failed");
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			\IV_led3 [random_index] = global_iv[random_index];
	   #50 ;
// 1 us, repeat pattern in loop.
   end
  end


// "Random Pattern"(Uniform) : seed = 5
// Start Time = 0 ns, End Time = 1 us, Period = 50 ns
  initial
  begin
		\IV_led4 [32] = 0;
	 \IV_led4 [33] = 0;
   repeat(20)
   begin
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			global_iv[random_index] = \IV_led4 [random_index];
	   random (\SEED_led4 , \RNDVAL_led4 );
	   receiver_64bit_val = ceil(\MAX_RND_led4 * \RNDVAL_led4 );
	    if (led4  != (receiver_64bit_val[0:0]  )) $display($time, " test case failed");
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			\IV_led4 [random_index] = global_iv[random_index];
	   #50 ;
// 1 us, repeat pattern in loop.
   end
  end


// "Random Pattern"(Uniform) : seed = 5
// Start Time = 0 ns, End Time = 1 us, Period = 50 ns
  initial
  begin
		\IV_tx_bit_data [32] = 0;
	 \IV_tx_bit_data [33] = 0;
   repeat(20)
   begin
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			global_iv[random_index] = \IV_tx_bit_data [random_index];
	   random (\SEED_tx_bit_data , \RNDVAL_tx_bit_data );
	   receiver_64bit_val = ceil(\MAX_RND_tx_bit_data * \RNDVAL_tx_bit_data );
	    if (tx_bit_data  != (receiver_64bit_val[0:0]  )) $display($time, " test case failed");
		for (random_index = 0; random_index < 34; random_index = random_index + 1)
			\IV_tx_bit_data [random_index] = global_iv[random_index];
	   #50 ;
// 1 us, repeat pattern in loop.
   end
  end

  initial
	#2000 $stop;
endmodule
