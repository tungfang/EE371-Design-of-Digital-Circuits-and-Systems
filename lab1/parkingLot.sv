// Charles Tung Fang
// 10/05/19
// EE 371 Lab 1 Parking Lot Occupancy Counter
// parkingLot determine whether a car is entering a parking lot
// or exiting a parking lot. It also keeps track of the total
// num  of cars in the parking lot

module parkingLot(clk, Reset, A, B, enter, exit);
	input logic clk, Reset, A, B;
	output logic enter, exit;
	
	enum{s0, s1, s2, s3} ps, ns;
	
	always_comb begin
		// Defaults
		ns = ps;
		
		case(ps)
		s0: if (~A&~B) ns = s0;
			else if (A&~B) ns = s1; 
			else if (B&~A) ns = s3;
		s1: if (A&~B) ns = s1;	
			else if (A&B) ns = s2;
			else if (~A&~B) ns = s0; 
		s2: if (A&B) ns = s2;
			else if (~A&B) ns = s3;
			else if (~B&A) ns = s1;
		s3: if (B&~A) ns = s3;
			else if (~A&~B) ns = s0;
			else if (A&B) ns = s2;		
		endcase
	end
	
	assign enter = (ps == s3 && (~A&~B));
	assign exit = (ps == s1 && (~A&~B));
	
	
	always_ff @(posedge clk) begin
		if (Reset) ps <= s0;
		else ps <= ns;
	end
endmodule


module parkingLot_testbench();
	logic clk, Reset, A, B;
	logic enter, exit;
	
	parkingLot dut (clk, Reset, A, B, enter, exit);
	
	// Set up clock
	parameter CLOCK_PERIOD = 100;
	initial begin clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin 
															@(posedge clk); 
		Reset <= 1;										@(posedge clk); 
		Reset <= 0; A <= 0; B <= 0;				@(posedge clk);
						A <= 1; 							@(posedge clk);
															@(posedge clk);
								  B <= 1;				@(posedge clk);
															@(posedge clk);
						A <= 0; 							@(posedge clk);
															@(posedge clk);	
								  B <= 0;				@(posedge clk);
															@(posedge clk); 
		Reset <= 1;										@(posedge clk); 
		Reset <= 0; A <= 0; B <= 0;				@(posedge clk);
								  B <= 1;				@(posedge clk);
															@(posedge clk);
						A <= 1;							@(posedge clk);
															@(posedge clk);
								  B <= 0;				@(posedge clk);
															@(posedge clk);	
						A <= 0;							@(posedge clk);
															@(posedge clk);
															@(posedge clk);
		$stop;
	end						  
								  
		
endmodule
