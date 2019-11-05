// Charles Tung Fang
// 10/05/19
// EE 371 Lab 1 Parking Lot Occupancy Counter
// counter uses the enter and exit status to count how many
// cars are still in the parking lot

module counter(clk, Reset, enter, exit, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input logic clk, Reset;
	input logic enter, exit;
	output logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
	logic [4:0] count;
	
	always_ff @(posedge clk) begin
		if (Reset) count = 5'b00000;
		else if (enter && count < 5'b11001) count = count + 5'b00001;
		else if (exit && count > 5'b00000) count = count - 5'b00001;
		else count = count;
	end

	displayStatus stats(.count(count), .HEX5(HEX5), .HEX4(HEX4), .HEX3(HEX3), .HEX2(HEX2), .HEX1(HEX1), .HEX0(HEX0));
	
endmodule

module counter_testbench();
	logic clk, Reset;
	logic [1:0] status;
	logic [6:0] counterL, counterR, HEX5, HEX4, HEX3, HEX2;
	
	parameter non = 2'b00, enter = 2'b01, exit = 2'b10;
	
	counter dut (clk, Reset, status, counterL, counterR, HEX5, HEX4, HEX3, HEX2);
	
	// Set up clock
	parameter CLOCK_PERIOD = 100;
	initial begin clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin 
															@(posedge clk); 
		Reset <= 1;										@(posedge clk); 
		Reset <= 0; status <= enter;				@(posedge clk); // 1	
															@(posedge clk); // 2
															@(posedge clk); // 3
															@(posedge clk); // 4
															@(posedge clk); // 5
															@(posedge clk); // 6
															@(posedge clk); // 7
															@(posedge clk); // 8
															@(posedge clk); // 9
															@(posedge clk); // 10
															@(posedge clk); // 11
															@(posedge clk); // 12
															@(posedge clk); // 13
															@(posedge clk); // 14
															@(posedge clk); // 15
															@(posedge clk); // 16
						status <= exit; 				@(posedge clk); // 15
						status <= exit; 				@(posedge clk); // 14
						status <= exit; 				@(posedge clk); // 13
 						status <= exit; 				@(posedge clk); // 12
						status <= exit; 				@(posedge clk); // 11
						status <= exit; 				@(posedge clk); // 10
						status <= exit; 				@(posedge clk); // 9
						status <= exit; 				@(posedge clk); // 8
						status <= exit; 				@(posedge clk); // 7



						
						
						
		$stop;
	end						  
endmodule
