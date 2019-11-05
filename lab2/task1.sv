// Charles Tung Fang
// 2019/10/15
// EE 371 Lab2 Memory Blocks
// Task1 implement the memory shown in Figure 1b in lab spec

module task1(address, clk, data, wren, q);
	input [4:0] address;
	input clk;
	input [3:0] data;
	input wren;
	output [3:0] q;
	
	ram32x4 t1(address, clk, data, wren, q);

endmodule

`timescale 1 ps / 1 ps
module task1_testbench();
	logic clk, wren;
	logic [4:0] addr;
	logic [3:0] data, q;
	
	task1 dut(addr, clk, data, wren, q);
	
	// set up clock
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin 
		wren <= 0; addr <= 5'b00000; data <= 4'b0000;			@(posedge clk); // Begin
																				@(posedge clk);
		wren <= 1; addr <= 5'b11111; data <= 4'b1111; 			@(posedge clk); // Write 4'b1111 to address 5'b11111 
																				@(posedge clk);
		wren <= 0; addr <= 5'b11111; data <= 4'b1010;			@(posedge clk); // Read Address 5'b11111
																				@(posedge clk);																		
		wren <= 1; addr <= 5'b10101; data <= 4'b0001;			@(posedge clk); // write 4'b0001 to 5'b10101
																				@(posedge clk);																		
		wren <= 0; addr <= 5'b10101; data <= 4'b0000;			@(posedge clk); // Read Address 5'b10101
																				@(posedge clk);
		
		$stop;
	end
	
endmodule

	