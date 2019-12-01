module filter(clk, enable, Din, Dout);
	input logic clk, enable;
	input logic signed [23:0] Din;
	output logic signed [23:0] Dout;
	
	logic signed [23:0] Q1, Q2, Q3, Q4, Q5, Q6, Q7;
	
	always_ff @(posedge clk) begin
		if(enable) begin
			Q1 <= Din;
			Q2 <= Q1;
			Q3 <= Q2;
			Q4 <= Q3;
			Q5 <= Q4;
			Q6 <= Q5;
			Q7 <= Q6;
		end 
	end
	
	assign Dout = (Din >>> 3) + (Q1 >>> 3) + (Q2 >>> 3) + (Q3 >>> 3) + (Q4 >>> 3) + (Q5 >>> 3) + (Q6 >>> 3) + 
					  (Q7 >>> 3);
		
endmodule

module filter_testbench();
	logic clk, enable;
	logic signed [23:0] Din;
	logic signed [23:0] Dout; 
	
	filter dut(.clk, .enable, .Din, .Dout);

	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end

	integer i;
	
	initial begin 
																				@(posedge clk); 
		 enable <= 1;             @(posedge clk);
		 
		 for (i = -20; i < 20; i++) begin
			Din  <= i;	@(posedge clk);
		 end
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
																				@(posedge clk);
		  enable <= 0;                                        @(posedge clk);                             
        $stop;
	end

endmodule
