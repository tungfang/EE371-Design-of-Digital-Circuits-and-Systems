// Charles Tung Fang
// 2019/10/15
// EE 371 Lab2 Memory Blocks
// HEX_display displays the contents of the RAM on the 7-segment displays.

module HEX_display(dataIn,display);
	input logic [3:0] dataIn;
	output logic [6:0] display;
	
	always_comb begin 
		case(dataIn)
			4'h0: display = 7'b1000000;
			4'h1: display = 7'b1111001;
			4'h2: display = 7'b0100100;
			4'h3: display = 7'b0110000;
			4'h4: display = 7'b0011001;
			5'h5: display = 7'b0010010;
			4'h6: display = 7'b0000010;
			4'h7: display = 7'b1111000;
			4'h8: display = 7'b0000000;
			4'h9: display = 7'b0011000;
			4'hA: display = 7'b0001000;
			4'hB: display = 7'b0000011;
			4'hC: display = 7'b1000110;
			4'hD: display = 7'b0100001; 
			4'hE: display = 7'b0000110;
			4'hF: display = 7'b0001110;
			default: display = 7'bx;
		endcase
	end
endmodule
	
module HEX_display_testbench();
	logic clk;
	logic [3:0] in;
	logic [6:0] out;
	
	
	// set up clock
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	HEX_display dut(.dataIn(in), .display(out));
	
	initial begin
		in <= 4'h0; @(posedge clk);
		in <= 4'h2; @(posedge clk);
		in <= 4'h4; @(posedge clk);
		in <= 4'h6; @(posedge clk);
		in <= 4'h8; @(posedge clk);
		in <= 4'hA; @(posedge clk);
		in <= 4'hC; @(posedge clk);
		in <= 4'hE; @(posedge clk);
	end
endmodule

