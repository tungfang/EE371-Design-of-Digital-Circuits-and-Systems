// Charles Tung Fang
// 10/05/19
// EE 371 Lab 1 Parking Lot Occupancy Counter
// Module takes care of metastability

module metastability(clk, Reset, in, out);
	input logic clk, Reset, in;
	output logic out;
	
	logic temp;
	
	always_ff @(posedge clk) begin
		if(Reset) begin
			temp <= 0;
			out <= 0;
		end
		else begin 
			temp <= in;
			out <= temp;
		end
	end
	
endmodule

module metastability_testbench();
	logic clk, Reset, in;
	logic out;
	
	metastability dut(clk, Reset, in, out);
	
	// set up clk
	parameter CLOCK_PERIOD = 100;
	initial begin clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin 
										@(posedge clk);
		Reset <= 1;					@(posedge clk);
		Reset <= 0; in <= 0;		@(posedge clk);
										@(posedge clk);
						in <= 1;		@(posedge clk);
										@(posedge clk);
		Reset <= 1; in <= 0;		@(posedge clk);
										@(posedge clk);
						in <= 0;		@(posedge clk);
										
		$stop;										
	end
	
endmodule
