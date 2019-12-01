// Bobin Shih & Charles Tung Fang
// Lab 5 Digital Signal processing
// 2019 11/15
// Noise generator introducing some noise into the sound 
// by adding the output of the circuit to the sample produced by the Audio CODEC

module noise_generator (clk, enable, Q);
	input wire clk, enable;
	output wire [23:0] Q;
	wire [2:0] counter;
	
	always_ff @(posedge clk)
		if (enable)
			counter <= counter + 1'b1;
	
	assign Q = {{10{counter[2]}}, counter, 11'd0};
endmodule