// Charles Tung Fang
// 10/05/19
// EE 371 Lab 1 Parking Lot Occupancy Counter
// keyPress counts the cycle of a key is being pressed
//	It's only counted as 1 press from press till release the button

module keyPress(clk, Reset, key, out);
	input logic clk, Reset, key;
	output logic out;
	
	enum {unpressed, pressed} ps, ns;

	// Key Press Logic
	always_comb begin
		case (ps)
			unpressed: if (key) ns = pressed;
				else ns = unpressed;
			pressed: if (key) ns = pressed;
				else ns = unpressed;
		endcase
	end
	
	assign out = (ps == pressed) & ~key;
	
	always_ff @(posedge clk) begin
		if (Reset)
			ps <= unpressed;
		else
			ps <= ns;
		end
endmodule

module keyPress_testbench();
	logic clk, Reset, key;
	logic out;
	
	keyPress dut (clk, Reset, key, out);
	
	// Set up clock
	parameter CLOCK_PERIOD = 100;
	initial begin clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin 
											@(posedge clk); 
		Reset <= 1;						@(posedge clk); 
		Reset <= 0; key <= 0;		@(posedge clk); // off
											@(posedge clk); // off
											@(posedge clk); 
						key <= 1;		@(posedge clk); //  
						key <= 0;		@(posedge clk); // off
											@(posedge clk); // on
											@(posedge clk); // off
		Reset <= 0; key <= 1;  		@(posedge clk);  
											@(posedge clk); // off
						key <= 0;		@(posedge clk); // off
											@(posedge clk); // on
		$stop;
	end

endmodule
