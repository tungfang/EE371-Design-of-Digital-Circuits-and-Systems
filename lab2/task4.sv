// Charles Tung Fang
// 2019/10/15
// EE 371 Lab2 Memory Blocks
// Task4 implements one port for supplying the address for a read operation, 
// and a separate port that gives the address for a write operation.

module task4(CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input logic CLOCK_50; // 50MHz clock.
	input logic [3:0] KEY; 
	input logic [9:0] SW;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	
	logic [3:0] r_data;
	logic [4:0] cOut;
	
	// Generate clk off of CLOCK_50, whichClock picks rate.
	logic [31:0] clk;
	parameter whichClock = 25;
	clock_divider cdiv (CLOCK_50, clk);
	
	
	counter count(.clk(clk[whichClock]), .reset(~KEY[0]), .cOut);
	ram32x4_2 memArray(.clock(clk), .data(SW[3:0]), .rdaddress(cOut), .wraddress(SW[8:4]), .wren(SW[9]), .q(r_data));
	
	// display count
	HEX_display countDisplay2(.dataIn(cOut[3:0]), .display(HEX2));
	HEX_display countDisplay3(.dataIn({1'b0, 1'b0, 1'b0, cOut[4]}), .display(HEX3));
	
	// display write address
	HEX_display addr4(.dataIn(SW[7:4]), .display(HEX4));
	HEX_display addr5(.dataIn({1'b0, 1'b0, 1'b0, SW[8]}), .display(HEX5));
	
	// display write data
	HEX_display writeData(.dataIn(SW[3:0]), .display(HEX1));
	
	// display read data
	HEX_display readData(.dataIn(r_data), .display(HEX0));
	
	assign LEDR = 10'b0000000000;
	
endmodule


`timescale 1 ps / 1 ps
module task4_testbench();
	logic clk;
	logic [9:0] SW;
	logic [3:0] KEY;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0] LEDR;
	
	task4 dut(clk, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin 
	
		KEY[0] <= 1; SW <= 10'b0000000000;									@(posedge clk); // begin 
		KEY[0] <= 0;																@(posedge clk);
																						@(posedge clk);
																						@(posedge clk);
																						@(posedge clk);
																						@(posedge clk);
																						@(posedge clk);
																						@(posedge clk);																				
//		KEY[0] <= 0; SW <= 10'b0000000000;	 								@(posedge clk); // 00 
//						 SW <= 10'b0000000000;									@(posedge clk); // begin 
//																						@(posedge clk); 
//						 SW <= 10'b0001110001;	 								@(posedge clk); // try writing 4'b0001 to address 5'b00111 without enable 
//																						@(posedge clk);
						 SW <= 10'b1001110001;									@(posedge clk); // Write 4'b0001 to address 5'b00111 with enable
																						@(posedge clk);
						 SW <= 10'b0000000000; 									@(posedge clk); // Switch to different address
																						@(posedge clk);	
						 SW <= 10'b0001110000;									@(posedge clk); // check 4'b0001 is saved in 5'b00111 address
																						@(posedge clk);
//						 SW <= 10'b1000111111;									@(posedge clk); // Write 4'b1111 to address 5'b00011 with enable
//																						@(posedge clk);
//						 SW <= 10'b0000000000; 									@(posedge clk); // Switch to different address
//																						@(posedge clk);	
//						 SW <= 10'b0000110000;									@(posedge clk); // check 4'b1111 is saved in 5'b00011 address
//																						@(posedge clk);
//						 SW <= 10'b1000010011;									@(posedge clk); // write 4'b0011 to address 5'b00001
//		KEY[0] <= 1; 																@(posedge clk); // reset to read 5'b00000
//		KEY[0] <= 0;																@(posedge clk); // data shoud show modified 3 now
																	
	$stop;
	end

endmodule

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ...
// [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
	input logic clock;
	output logic [31:0] divided_clocks;
	initial begin
		divided_clocks <= 0;
	end
	
	always_ff @(posedge clock) begin
		divided_clocks <= divided_clocks + 1;
	end
endmodule

