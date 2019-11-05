module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, CLOCK_50, 
	VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;

	input CLOCK_50;
	output [7:0] VGA_R;
	output [7:0] VGA_G;
	output [7:0] VGA_B;
	output VGA_BLANK_N;
	output VGA_CLK;
	output VGA_HS;
	output VGA_SYNC_N;
	output VGA_VS;
	
	assign HEX0 = '1;
	assign HEX1 = '1;
	assign HEX2 = '1;
	assign HEX3 = '1;
	assign HEX4 = '1;
	assign HEX5 = '1;
	assign LEDR = SW;
	
	logic [10:0] x0, y0, x1, y1, x, y;
	logic [10:0] black_x, black_y, reg_x, reg_y;

	assign x = reset? black_x : reg_x;
	assign y = reset? black_y : reg_y;

	logic color;
	assign color = reset ? 0 : 1;

	logic reset;
	assign reset = SW[9];

	logic [31:0] clk;
	parameter whichClock = 18;
	clock_divider cdiv (.clock(CLOCK_50), .reset(reset), .divided_clocks(clk));
	
	VGA_framebuffer fb(.clk50(CLOCK_50), .reset(1'b0), .x, .y,
				.pixel_color(color), .pixel_write(1'b1),
				.VGA_R, .VGA_G, .VGA_B, .VGA_CLK, .VGA_HS, .VGA_VS,
				.VGA_BLANK_n(VGA_BLANK_N), .VGA_SYNC_n(VGA_SYNC_N));
				
	line_drawer lines (.clk(clk[whichClock]), .reset, .animate, .animate2, .animate3,
				.x0(a), .y0(b), .x1(c), .y1(d), .x(reg_x), .y(reg_y));				
	
	always_ff @(posedge CLOCK_50) begin
		if (reset) begin
			if (black_x <= 640) begin
				black_x <= black_x + 1;
				black_y <= black_y;
			end else 
				black_x <= 0;
				black_y <= black_y + 1;
		end else begin
			black_x <= 0;
			black_y <= 0;
		end
	end

	logic [10:0] a, b, c, d; 
	logic animate, animate2, animate3;
	assign animate = ~KEY[0];
	assign animate2 = ~KEY[1];
	assign animate3 = ~KEY[2];

	always_ff @(posedge CLOCK_50) begin
		if (reset) begin
			a <= 0;
			b <= 0;
			c <= 50;
			d <= 120;
		end else begin
			if (animate) begin
				a <= 0;
				b <= 0;
				c <= 120;
				d <= 45;
			end
			if (animate2) begin
				a <= 40;
				b <= 120;
				c <= 120;
				d <= 30;
			end
			if (animate3) begin
				a <= 35;
				b <= 120;
				c <= 80;
				d <= 120;
			end
		end
	end


	assign x0 = 25;
	assign y0 = 50;
	assign x1 = 10;
	assign y1 = 100;
	
endmodule

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, reset, divided_clocks);
	input logic reset, clock;
	output logic [31:0] divided_clocks = 0;

	always_ff @(posedge clock) begin
		divided_clocks <= divided_clocks + 1;
	end 

endmodule