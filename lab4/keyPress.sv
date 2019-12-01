// Bobin Shih & Charles Tung Fang
// 11/6/2019
// keyPress makes takes care of metastability

module keyPress(clk, reset, key, out);
	input logic clk, reset, key;
	output logic out;
	
	enum {unpressed, pressed} ps, ns;
	
	// Key Press Logic
	always_comb begin
		case (ps)
			unpressed: if (key) ns = pressed;
				else ns = unpressed;
			pressed: if (key) ns = pressed;
				else ns = unpressed;
		endcase
	end
	
	assign out = (ps == pressed) & ~key;
	
	always_ff @(posedge clk) begin
		if (reset)
			ps <= unpressed;
		else
			ps <= ns;
		end
	
endmodule