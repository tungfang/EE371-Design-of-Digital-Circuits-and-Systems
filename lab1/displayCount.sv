/* Charles Tung Fang
	10/05/19
	EE 471 Lab 1 Parking Lot Occupancy Counter
	displayCount module shows how many cars are there in the parking lot
*/

module displayCount(state, count);
	input logic [3:0] state;
	output logic [6:0] count;
	
	always_comb begin
		case(state) 
			4'b0000: count = 7'b1000000; // 0
			4'b0001: count = 7'b1111001; // 1
			4'b0010: count = 7'b0100100; // 2
			4'b0011: count = 7'b0110000; // 3
			4'b0100: count = 7'b0011001; // 4
			4'b0101: count = 7'b0010010; // 5
			4'b0110: count = 7'b0000010; // 6
			4'b0111: count = 7'b1111000; // 7
			4'b1000: count = 7'b0000000; // 8
			4'b1001: count = 7'b0010000; // 9			
			default count = 7'b1000000; // 0
		endcase
	end
endmodule 