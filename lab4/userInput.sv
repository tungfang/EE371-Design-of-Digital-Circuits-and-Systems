// Bobin Shih & Charles Tung Fang
// 11/6/2019
// userInput module makes sure key press to be true only for one clock cycle period

module userInput(clk, reset, key, out);
	input logic clk, reset;
	input logic key;
	output logic out;
	
	logic temp;
	
	metastability m(.clk, .reset, .in(~key), .out(temp));
	keyPress k(.clk, .reset, .key(temp), .out);
	
endmodule
