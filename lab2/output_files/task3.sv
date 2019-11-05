// Charles Tung Fang
// 2019/10/15
// EE 371 Lab2 Memory Blocks
// Task3 load the RAM and read its contents as was done in task 2

module task3 #(parameter data_width = 4, addr_width = 5)
	(CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	
	input logic CLOCK_50; // 50MHz clock.
	input logic [3:0] KEY; 
	input logic [9:0] SW;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	
	
	
	
	assign LEDR = 10'b0000000000;
	assign HEX1 = 7'b1111111;
	assign HEX3 = 7'b1111111;
endmodule

module task3_testbench();

endmodule
