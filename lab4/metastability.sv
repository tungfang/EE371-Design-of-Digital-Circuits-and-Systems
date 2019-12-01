/* Bobin Shih & Charles Tung Fang
	11/6/2019
	metastability function handles the input so the metastability
	doesn't occur to effect the output
*/

module metastability(clk, reset, in, out);
	input logic clk, reset, in;
	output logic out;
	logic temp;

	
	always_ff @(posedge clk) begin
		if (reset) begin
			temp <= 0;
			out <= 0;
		end
		else begin
			temp <= in;
			out <= temp;
		end
	end
	
	
endmodule
