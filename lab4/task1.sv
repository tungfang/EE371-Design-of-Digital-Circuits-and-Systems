// Bobin Shih & Charles Tung Fang
// 11/6/2019
// Task 1 is the main module for the bit-counting circuit
// It counts the number of bits set to 1 in an n-bit input A

module task1(CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input logic CLOCK_50; // 50MHz clock.
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY; // True when not pressed, False when pressed
	input logic [9:0] SW;
	
	logic [3:0] B;
	
	assign HEX5 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	
	logic [7:0] data;
	assign data = SW[7:0];
	
	logic [31:0] clk;
	parameter whichClock = 18;
	clock_divider cdiv (.clock(CLOCK_50), .reset(reset), .divided_clocks(clk));
	
	assign LEDR[8:0] = 9'b0;
	bit_counting count(.clk(clk[whichClock]), .reset(~KEY[0]), .start(SW[9]), .data(data), .B(B), .done(LEDR[9]));
	display dp(.count(B), .decimal(HEX0));
	
endmodule


module task1_testbench();
	logic clk; // 50MHz clock.
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0] LEDR;
	logic [3:0] KEY; // True when not pressed, False when pressed
	logic [9:0] SW;


    task1 dut(clk, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);

    // Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end

	initial begin 
																	@(posedge clk); 
		KEY[0] <= 0; SW[9] <= 0; SW[7:0] <= 8'b11111111; 			@(posedge clk); 
		                     				                        @(posedge clk);
		KEY[0] <= 1; SW[9] <= 1;                       				@(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk); 

																	
		KEY[0] <= 0; SW[9] <= 0; SW[7:0] <= 8'b10101010; 			@(posedge clk); 
		                     				                        @(posedge clk);
		KEY[0] <= 1; SW[9] <= 1;                       				@(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                SW[7:0] <= 8'b00111000;             @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);															                                             
        $stop;
	end
endmodule



// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, reset, divided_clocks);
	input logic reset, clock;
	output logic [31:0] divided_clocks = 0;

	always_ff @(posedge clock) begin
		divided_clocks <= divided_clocks + 1;
	end 

endmodule
