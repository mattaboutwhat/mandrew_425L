`timescale 1ns / 1ps
////////////////////////////
//
////////////////////////////
module test_mcu_single_cycle_lcd;

	// Inputs
	reg clk_in;
	reg nClear;
	reg clk_en;
	reg btn;
	reg rot_a;
	reg rot_b;

	// Outputs
	wire [3:0] lcd_dataout;
	wire [2:0] lcd_control;
	wire [7:0] display;

	// Instantiate the Unit Under Test (UUT)
	mcu_single_cycle_lcd uut (
		.clk_in(clk_in), 
		.nClear(nClear), 
		.clk_en(clk_en), 
		.lcd_dataout(lcd_dataout), 
		.lcd_control(lcd_control), 
		.display(display), 
		.btn(btn), 
		.rot_a(rot_a), 
		.rot_b(rot_b)
	);
	
	always
		#1 clk_in = ~clk_in;

	initial begin
		// Initialize Inputs
		clk_in = 0;
		nClear = 0;
		clk_en = 0;
		btn = 0;
		rot_a = 0;
		rot_b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100 btn = 1;
		#100 btn = 0;
		#200
		#100 rot_a = 1;
		#100 rot_b = 1;
		#100 rot_a = 0;
		#100 rot_b = 0;
		#200
		#100 rot_b = 1;
		#100 rot_a = 1;
		#100 rot_b = 0;
		#100 rot_a = 0;
		
	end
      
endmodule

