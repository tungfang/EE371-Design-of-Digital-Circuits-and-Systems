// Charles Tung Fang
// 2019/10/15
// EE 371 Lab2 Memory Blocks
// Counter behaves as a read address and scroll through the memory locations by displaying each word for about one second 

module counter(clk, reset, cOut); 
	input logic clk, reset;
	output logic [4:0] cOut;
	
	logic [4:0] temp;
	
	always_ff @(posedge clk)
		if (reset) begin
			temp <= 5'b00000;
		end else
			temp <= temp + 1;
			
	assign cOut = temp;
endmodule

module counter_testbench();
	logic clk, reset;
	logic [4:0] cOut;
	
	counter dut(clk, reset, cOut);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin 
	
		reset <= 1;						@(posedge clk); // begin 
											@(posedge clk); 
		reset <= 0;	 					@(posedge clk); 
											@(posedge clk);
											@(posedge clk); 
											@(posedge clk);
		 									@(posedge clk); 
											@(posedge clk);	
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk);
											@(posedge clk); 
											@(posedge clk); // 10
		 									@(posedge clk); 
											@(posedge clk);	
											@(posedge clk); 
											@(posedge clk);
											@(posedge clk);
											@(posedge clk); 
											@(posedge clk);	
											@(posedge clk); 
											@(posedge clk);
											@(posedge clk); // 20
											@(posedge clk); 
											@(posedge clk);	
											@(posedge clk); 
											@(posedge clk);
											@(posedge clk);
											@(posedge clk); 
											@(posedge clk);	
											@(posedge clk); 
											@(posedge clk);
											@(posedge clk); // 30	
											@(posedge clk); 
											@(posedge clk);// 32
											@(posedge clk); 
											@(posedge clk); //34	
	$stop;
	end
endmodule
