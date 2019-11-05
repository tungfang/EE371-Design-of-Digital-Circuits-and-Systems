// Charles Tung Fang
// 10/05/19
// EE 371 Lab 1 Parking Lot Occupancy Counter
// processStates takes care of enter and exit signal to make sure they only valid for one 
// clock cycle

module processState(clk, Reset, enter, exit, newEn, newEx);
	input logic clk, Reset, enter, exit;
	output newEn, newEx;
	
	logic tempEn, tempEx;
	
	metastability m1(.clk(clk), .Reset(Reset), .in(enter), .out(tempEn));
	metastability m2(.clk(clk), .Reset(Reset), .in(exit), .out(tempEx));
	keyPress k1(.clk(clk), .Reset(Reset), .key(tempEn), .out(newEn));
	keyPress k2(.clk(clk), .Reset(Reset), .key(tempEx), .out(newEx));
	

endmodule
