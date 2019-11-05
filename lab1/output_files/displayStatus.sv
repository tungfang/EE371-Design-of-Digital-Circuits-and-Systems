/* Charles Tung Fang
	10/05/19
	EE 471 Lab 1 Parking Lot Occupancy Counter
	displayStatus module shows "full" and "clear" if the parking lot is
	full (25 cars) or empty (0 car)
*/

module displayStatus(state, HEX5, HEX4, HEX3, HEX2, HEX1);
	input logic state;
	output logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1;

	parameter clear = 2'b00, full = 2'b01, middle = 2'b10;
	
	always_comb begin
		HEX5 = 7'b0000000;
		HEX4 = 7'b0000000;
		HEX3 = 7'b0000000;
		HEX2 = 7'b0000000;
		// HEX1 = 7'b0000000;
		case(state)
			full: begin
				HEX5 = 7'b1110001; // F
				HEX4 = 7'b0111110; // U
				HEX3 = 7'b0111000; // L
				HEX2 = 7'b0111000; // L
				HEX1 = 7'b0100100; // 2	
			end
			clear: begin
				HEX5 = 7'b0111001; // C
				HEX4 = 7'b0111000; // L
				HEX3 = 7'b1111001; // E
				HEX2 = 7'b1110111; // A
				HEX1 = 7'b1110111; // R
			end	
		endcase
	end	
endmodule


module displayStatus_testbench();
	logic state;
	logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1;
	
		
endmodule
