// Charles Tung Fang
// 2019/10/15
// EE 371 Lab2 Memory Blocks
// Task2 realize the memory circuit in the FPGA on the DE1-Soc board
// and use slide switch to load some data into the created memory

module task2(CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input logic CLOCK_50; // 50MHz clock.
	input logic [9:0] SW;
	input logic [3:0] KEY;
	output logic [9:0] LEDR;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	
	logic [3:0] r_data;
	
	ram32x4 t2 (.address(SW[8:4]), .clock(CLOCK_50), .data(SW[3:0]), .wren(SW[9]), .q(r_data));
	HEX_display outputData(.dataIn(r_data), .display(HEX0));
	HEX_display inputData(.dataIn(SW[3:0]), .display(HEX2));
	HEX_display addr4(.dataIn(SW[7:4]), .display(HEX4));
	HEX_display addr5(.dataIn({1'b0, 1'b0, 1'b0, SW[8]}), .display(HEX5));
	
	assign HEX1 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign LEDR = 10'b0000000000;
	// assign KEY = 4'b0000;
endmodule


module task2_testbench();
	logic clk;
	logic [9:0] SW;
	logic [3:0] KEY;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0] LEDR;
	
	task2 dut(clk, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin 
	
		SW <= 10'b0000000000;									@(posedge clk); // begin 
																		@(posedge clk); 
		SW <= 10'b0001110001;	 								@(posedge clk); // try writing 4'b0001 to address 5'b00111 without enable 
																		@(posedge clk);
		SW <= 10'b1001110001;									@(posedge clk); // Write 4'b0001 to address 5'b00111 with enable
																		@(posedge clk);
		SW <= 10'b0000000000; 									@(posedge clk); // Switch to different address
																		@(posedge clk);	
		SW <= 10'b0001110000;									@(posedge clk); // check 4'b0001 is saved in 5'b00111 address
																		@(posedge clk);
		SW <= 10'b1111111111;									@(posedge clk);  
																		@(posedge clk); 
		SW <= 10'b0111110000;	 								@(posedge clk); // try writing 4'b0001 to address 5'b00111 without enable 
																		@(posedge clk);
		SW <= 10'b0000001111;									@(posedge clk); // Write 4'b0001 to address 5'b00111 with enable
																		@(posedge clk);
		SW <= 10'b1011000110; 									@(posedge clk); // Switch to different address
																		@(posedge clk);	
		SW <= 10'b1010110100;									@(posedge clk); // check 4'b0001 is saved in 5'b00111 address
																		@(posedge clk);	
																		
	$stop;
	end
	
endmodule
