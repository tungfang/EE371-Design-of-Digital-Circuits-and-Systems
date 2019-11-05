// Charles Tung Fang
// 10/05/19
// EE 371 Lab 1 Parking Lot Occupancy Counter
// UserInput takes care of user's input such as the metastability issue
// and combinational logics

module enterExit(clk, Reset, A, B, outA, outB);
	input logic clk, Reset, A, B;
	output logic outA, outB;
	
	logic tempA, tempB;
	
	metastability m1(.clk(clk), .Reset(Reset), .in(A), .out(tempA));
	metastability m2(.clk(clk), .Reset(Reset), .in(B), .out(tempB));
	keyPress k1(.clk(clk), .Reset(Reset), .key(tempA), .out(outA));
	keyPress k2(.clk(clk), .Reset(Reset), .key(tempB), .out(outB));	
	
endmodule


module enterExit_testbench();
	logic clk, Reset, A, B;
	
	
endmodule
