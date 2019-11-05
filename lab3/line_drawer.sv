// Charles Tung Fang
// EE 371
// Lab 3 Display Interface, task 1
// Line_drawer implements Bresenham’s Line Generation Algorithm to draw a line
// for given x0, y0, x1, y1

module line_drawer(
	input logic clk, reset, animate, animate2, animate3,
	input logic [10:0]	x0, y0, x1, y1, //the end points of the line
	output logic [10:0]	x, y //outputs corresponding to the pair (x, y)
	);
	
	/*
	 * You'll need to create some registers to keep track of things
	 * such as error and direction
	 * Example: */
	logic [10:0] dx, dy; // dx is width and dy is height
	logic [10:0] left, top, right, bot;
	logic x_sign, y_sign;

	assign dx = x1 > x0 ? x1 - x0 : x0 - x1;
	assign dy = y1 > y0 ? y1 - y0 : y0 - y1;
	
	always_comb begin
		if (((dx >= dy) && (x0 > x1)) || ((dy > dx) && (y0 > y1))) begin // reversed case
			left = x1; // x start from left -> right
			right = x0; // destination
			top = y1; // top -> bottom
			bot = y0; // destination
		end else begin // regular case
			left = x0; // x start from left -> right
			right = x1; // destination
			top = y0; // y start from top -> bot
			bot = y1; // destination
		end
	end
	
	assign y_sign = bot < top ? 1'b0 : 1'b1; // which way to move the vertical arrow (0 is up, 1 is down)
	assign x_sign = right < left ? 1'b0 : 1'b1; // which way to move the horizontal arrow (0 is left, 1 is right)

	logic [10:0] tempx0, tempy0, tempx1, tempy1;

	// if dx >= dy
	for_loop greater_width(.clk, .reset, .animate, .animate2, .animate3, .startX(left), .startY(top), .destination(right), .dx(dx), .dy(dy), .direction(y_sign), .x(tempx0), .y(tempy0));

	// else 
	for_loop greater_height(.clk, .reset, .animate, .animate2, .animate3, .startX(top), .startY(left), .destination(bot), .dx(dy), .dy(dx), .direction(x_sign), .x(tempx1), .y(tempy1));

	assign x = dx >= dy? tempx0 : tempy1;
	assign y = dx >= dy? tempy0 : tempx1;
	
endmodule


module line_drawer_testbench();
	logic clk, reset;
	logic [10:0] x0, y0, x1, y1;
	logic [10:0] x, y;
	



	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end

	line_drawer dut(.clk, .reset, .x0, .y0, .x1, .y1, .x, .y);

	integer i;

	initial begin
		reset <= 0; x0 <= 11'b0; y0 <= 11'b0; x1 <= 50; y1 <= 240; @(posedge clk);
		reset <= 1;  @(posedge clk);


		for (i = 0; i < 5; i++)
			@(posedge clk);
	
	$stop;
	end

endmodule