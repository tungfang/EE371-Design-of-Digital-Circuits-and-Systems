// Bobin Shih & Charles Tung Fang
// 11/6/2019
// Bit_counting counts the number of bits set to 1 in an n-bit input A

module bit_counting(clk, reset, start, data, B, done);
    input logic clk;
    input logic reset, start;
    input logic [7:0] data;
    output logic [3:0] B;
    output logic done;

    logic [7:0] A;
    logic LA, LB, EB, EA;
    logic a0;
    
    enum bit[1:0] {s1, s2, s3} ps, ns;

    assign a0 = A[0];

    // change of states base on start and load A
    always_comb
        case(ps)
            s1: if (start) ns = s2;
                else ns = s1;
            s2: if (A == 0) ns = s3;
                else ns = s2;
            s3: if (start) ns = s3;
                else ns = s1;
        endcase
            
    always_ff @(posedge clk)
        if (reset)
            ps <= s1;
        else
            ps <= ns;
    
    // outputs
    assign LA = ~start;
    assign LB = (ps == s1);
    assign EB = (ps == s2) && (a0);
    assign EA = (ps == s2);
    assign done = (ps == s3);

    // datapath
    always_ff @(posedge clk)
        begin
            if(reset) B <= 4'b0;
            else if (LB) B <= 4'b0;
            else if (EB) B <= B + 1;
        end

    shift sh1(clk, reset, data, LA, EA, A);
   

endmodule

module bit_counting_testbench();
    logic clk;
    logic reset, start;
    logic [7:0] data;
	 logic [3:0] B;
    logic done;

    bit_counting dut(clk, reset, start, data, B, done);

    // Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end

	initial begin 
																	@(posedge clk); 
		reset <= 1; start <= 0; data <= 8'b11111111; 		@(posedge clk); 
		                     				                        @(posedge clk);
		reset <= 0; start <= 1;                       		@(posedge clk);
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
      start <= 0;  data <= 8'b01000000; 					@(posedge clk); 
		start <= 1;													@(posedge clk);
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
        $stop;
	end
	
endmodule