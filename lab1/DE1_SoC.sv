// Charles Tung Fang
// 10/05/19
// EE 371 Lab 1 Parking Lot Occupancy Counter
// Parking Lot Occupany Counter uses two photo sensor to monitor 
// the acivity of cars in the parking lot. With this porgram we are able
// to determine if a car is entering or exiting as well as how many cars in the parking lot 


module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
	input logic CLOCK_50; // 50MHz clock.
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY; // True when not pressed, False when pressed
	input logic [9:0] SW;
	output logic [35:0] GPIO_0;
	

	logic enter, exit, newEn, newEx;
	
	parkingLot enterExit(.clk(CLOCK_50), .Reset(SW[9]), .A(~KEY[0]), .B(~KEY[1]), .enter(enter), .exit(exit));
	userInput pushButton(.clk(CLOCK_50), .Reset(SW[9]), .A(enter), .B(exit), .outA(newEn), .outB(newEx));	
	counter count(.clk(CLOCK_50), .Reset(SW[9]), .enter(newEn), .exit(newEx),  
		.HEX5(HEX5), .HEX4(HEX4), .HEX3(HEX3), .HEX2(HEX2), .HEX1(HEX1), .HEX0(HEX0));

		
	assign GPIO_0[16] = ~KEY[0];
	assign GPIO_0[17] = ~KEY[1];

endmodule


module DE1_SoC_testbench();
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0] LEDR;
	logic [3:0] KEY; // True when not pressed, False when pressed
	logic [9:0] SW;
	logic clk;
	logic [35:0] GPIO_0;
	
	DE1_SoC dut (.CLOCK_50(clk), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW, .GPIO_0);

		// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin 
																		@(posedge clk); 
		SW[9] <= 1;													@(posedge clk); 
		SW[9] <= 0; KEY[0] <= 0; KEY[1] <= 0;				@(posedge clk);
						KEY[0] <= 1; 								@(posedge clk);
																		@(posedge clk);
										 KEY[1] <= 1;				@(posedge clk);
																		@(posedge clk);
						KEY[0] <= 0; 								@(posedge clk);
																		@(posedge clk);	
										 KEY[1] <= 0;				@(posedge clk);
																		@(posedge clk); 
		SW[9] <= 1;													@(posedge clk); 
		SW[9] <= 0; KEY[0] <= 0; KEY[1] <= 0;				@(posedge clk);
										 KEY[1] <= 1;				@(posedge clk);
																		@(posedge clk);
						KEY[0] <= 1;								@(posedge clk);
																		@(posedge clk);
										 KEY[1] <= 0;				@(posedge clk);
																		@(posedge clk);	
						KEY[0] <= 0;								@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
		$stop;
	end						  
	
endmodule
