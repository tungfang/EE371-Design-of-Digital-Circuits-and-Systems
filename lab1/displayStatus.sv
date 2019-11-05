/* Charles Tung Fang
	10/05/19
	EE 471 Lab 1 Parking Lot Occupancy Counter
	displayStatus module shows "full" and "clear" if the parking lot is
	full (25 cars) or empty (0 car)
*/

module displayStatus(count, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input logic [4:0] count;
	output logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

	always_comb begin
		case(count)
			5'b00000: begin 
				HEX0 = 7'b1000000;
				HEX1 = 7'b0001000;
				HEX2 = 7'b0001000;
				HEX3 = 7'b0000110;
				HEX4 = 7'b1000111;
				HEX5 = 7'b1000110;
			end //CLEAR0
			5'b00001: begin 
				HEX0 = 7'b1111001;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00010: begin 
				HEX0 = 7'b0100100;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00011: begin
				HEX0 = 7'b0110000;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00100: begin 
				HEX0 = 7'b0011001;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00101: begin 
				HEX0 = 7'b0010010;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00110: begin 
				HEX0 = 7'b0000010;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111;
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b00111: begin 
				HEX0 = 7'b1111000;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b01000: begin 
				HEX0 = 7'b0000000;
				HEX1 = 7'b1111111;
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b01001: begin 
				HEX0 = 7'b0010000; 
				HEX1 = 7'b1111111; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111;
				HEX5 = 7'b1111111;
			end
			5'b01010: begin
				HEX0 = 7'b1000000; 
				HEX1 = 7'b1111001; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b01011: begin 
				HEX0 = 7'b1111001; 
				HEX1 = 7'b1111001; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b01100: begin 
				HEX0 = 7'b0100100; 
				HEX1 = 7'b1111001; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b01101: begin 
				HEX0 = 7'b0110000;
				HEX1 = 7'b1111001;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b01110: begin 
				HEX0 = 7'b0011001; 
				HEX1 = 7'b1111001; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b01111: begin 
				HEX0 = 7'b0010010; 
				HEX1 = 7'b1111001; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b10000: begin 
				HEX0 = 7'b0000010;
				HEX1 = 7'b1111001; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b10001: begin 
				HEX0 = 7'b1111000; 
				HEX1 = 7'b1111001;
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b10010: begin
				HEX0 = 7'b0000000;
				HEX1 = 7'b1111001; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b10011: begin 
				HEX0 = 7'b0010000; 
				HEX1 = 7'b1111001; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b10100: begin 
				HEX0 = 7'b1000000; 
				HEX1 = 7'b0100100; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b10101: begin 
				HEX0 = 7'b1111001; 
				HEX1 = 7'b0100100; 
				HEX2 = 7'b1111111;
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b10110: begin 
				HEX0 = 7'b0100100;
				HEX1 = 7'b0100100;
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b10111: begin 
				HEX0 = 7'b0110000; 
				HEX1 = 7'b0100100; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b11000: begin 
				HEX0 = 7'b0011001;
				HEX1 = 7'b0100100; 
				HEX2 = 7'b1111111; 
				HEX3 = 7'b1111111; 
				HEX4 = 7'b1111111; 
				HEX5 = 7'b1111111;
			end
			5'b11001: begin 
				HEX0 = 7'b0010010; 
				HEX1 = 7'b0100100; 
				HEX2 = 7'b1000111; 
				HEX3 = 7'b1000111; 
				HEX4 = 7'b1000001; 
				HEX5 = 7'b0001110;
			end //FULL25



			default: begin 
				HEX0 = 7'b1000000;
				HEX1 = 7'b0001000;
				HEX2 = 7'b0001000; 
				HEX3 = 7'b0110000; 
				HEX4 = 7'b1110001; 
				HEX5 = 7'b0110001; 
			end

		endcase
	end
endmodule 



module displayStatus_testbench();
	logic state;
	logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1;
	
		
endmodule
