// Bobin Shih & Charles Tung Fang
// 11/6/2019
// display module shows the number of 1 in the input data
module display(count, decimal);
	input logic [3:0] count;
	output logic [6:0] decimal;
	
	always_comb begin
		case(count) 
			4'b0000: decimal = 7'b1000000; // 0
			4'b0001: decimal = 7'b1111001; // 1
			4'b0010: decimal = 7'b0100100; // 2
			4'b0011: decimal = 7'b0110000; // 3
			4'b0100: decimal = 7'b0011001; // 4
			4'b0101: decimal = 7'b0010010; // 5
			4'b0110: decimal = 7'b0000010; // 6
			4'b0111: decimal = 7'b1111000; // 7
			4'b1000: decimal = 7'b0000000; // 8
			4'b1001: decimal = 7'b0010000; // 9			
			default decimal = 7'b1000000; // 0
		endcase
	end
endmodule 
	