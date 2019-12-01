// Bobin Shih & Charles Tung Fang
// 11/6/2019
// shift module operates the right shift action for A

module shift(clk, reset, data, LA, EA, out);
    input logic clk;
    input logic reset, LA, EA;
    input logic [7:0] data;
    output logic [7:0] out;

    logic [7:0] A;
    integer i;

    always_ff @(posedge clk) begin
		  if (LA)
            A <= data;
        else if (EA)
            A <= A >> 1;
    end

    assign out = A;

endmodule

module shift_testbench();
    logic clk;
    logic LA, EA;
    logic [7:0] data, A, out;
    integer i;

    shift dut (clk, data, LA, EA, out);

	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin 
																	@(posedge clk); 
		data <= 8'b11111111; LA <= 1; EA <= 0;						@(posedge clk); 
		                     LA <= 0; EA <= 1;				        @(posedge clk);
																	@(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
                                                                    @(posedge clk);
		
        $stop;
	end
endmodule
