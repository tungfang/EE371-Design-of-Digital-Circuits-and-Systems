// Charles Tung Fang
// EE 371
// Lab 3 Display Interface, task 1
// For loop takes care of the incrementing vertically or horizontally

module for_loop(
	input logic clk, reset, animate, animate2, animate3,
	input logic [10:0] startX, startY, destination, //the end points of the line
	input logic [10:0] dx, dy,
    input logic direction,
    output logic [10:0]	x, y //outputs corresponding to the pair (x, y)
	);

    logic [10:0] position_x;
    logic [10:0] position_y;
    logic signed [11:0] error, tempErrorX, tempErrorY;

    assign tempErrorX = error - dx;
    assign tempErrorY = error + dy;

    always_ff @(posedge clk) begin
        if (reset || animate || animate2 || animate3) begin
            position_x <= startX;
            position_y <= startY;
            error <= 0;
        end else begin
            if (position_x < destination) begin
                error <= tempErrorY; 
                if (error >= dx) begin
                    error <= tempErrorX;
                    if (direction) begin
                        position_y <= position_y + direction;
                    end else begin
                        position_y <= position_y - 1;
                    end
                end
                position_x <=  position_x + 11'b0000000001;
            end
        end
	end
    assign x = position_x;
    assign y = position_y;
endmodule


module for_loop_testbench();
	logic clk, reset;
	logic [10:0] startX, startY, destination, dx, dy;
    logic direction;
	logic [10:0] x, y;

	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end

	for_loop dut(.clk, .reset, .startX, .startY, .destination, .dx, .dy, .direction, .x, .y);

	integer i;

	initial begin
        reset <= 0;  startX <= 11'b0; startY <= 11'b0; destination <= 240; dx <= 240; dy <= 50; direction <= 1; @(posedge clk);
        @(posedge clk);
        @(posedge clk);
		reset <= 1;  @(posedge clk);
		reset <= 0;  @(posedge clk);
		
		for (i = 0; i < 240; i++)
			@(posedge clk);

	$stop;
	end

endmodule