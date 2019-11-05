// Charles Tung Fang
// 2019/10/15
// EE 371 Lab2 Memory Blocks
// memArray stores 32 words with 4 bits per word

module memArray #(parameter data_width = 4, addr_width = 5)
	(clk, wr_en, addr, w_data, r_data);
	
	input logic clk, wr_en;
	input logic [addr_width - 1 :0] addr;
	input logic [data_width - 1 :0] w_data;
	output logic [data_width - 1 :0] r_data;
	
	logic [data_width - 1 :0] memory_array [0:2**addr_width - 1];
	
	always_ff @(posedge clk)
		if(wr_en)
			memory_array[addr] <= w_data;
	
	assign r_data = memory_array[addr];
endmodule

module memArray_testbench #(parameter data_width = 4, addr_width = 5)();
	logic clk, wr_en;
	logic [addr_width - 1:0] addr;
	logic [data_width-1:0] w_data, r_data;
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	memArray #(4,5) dut(clk, wr_en, addr, w_data, r_data);
	
	initial begin
		wr_en <= 0; addr <= 5'b00000; w_data <= 5'b00000; @(posedge clk);
		wr_en <= 1; addr <= 5'b00001; w_data <= 5'b01010; @(posedge clk);
		wr_en <= 0; addr <= 5'b00000; w_data <= 5'b00000; @(posedge clk);
		wr_en <= 1; addr <= 5'b11111; w_data <= 5'b11111; @(posedge clk);
																		  @(posedge clk);
		
	$stop;
	end
	
endmodule
