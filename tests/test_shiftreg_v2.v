`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:34:54 04/06/2015
// Design Name:   ShiftRegister
// Module Name:   E:/ECE 425 Lab 1/ShiftRegister/test_shiftreg_v2.v
// Project Name:  ShiftRegister
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_shiftreg_v2;

	// Inputs
	reg [2:0] mode;
	reg clk;
	reg enable;
	reg inbit;
	reg [3:0] loadval;

	// Outputs
	wire [3:0] regval;

	// Instantiate the Unit Under Test (UUT)
	ShiftRegister uut (
		.mode(mode), 
		.clk(clk), 
		.enable(enable), 
		.inbit(inbit), 
		.loadval(loadval), 
		.regval(regval)
	);

	initial begin
		// Initialize Inputs
		#50
		//Load
		mode = 3'b000;
		clk = 0;
		enable = 1;
		inbit = 0;
		loadval = 4'b1010;

		//Hold
		#100;
		mode = 3'b001;
		clk = 0;
		enable = 1;
		inbit = 0;
		loadval = 4'b1010;
		
		/*//Right Shift
		#100
		mode = 3'b010;
		clk = 0;
		enable = 1;
		inbit = 0;
		loadval = 4'b1010;*/
		
		//Left Shift
		#100
		mode = 3'b011;
		clk = 0;
		enable = 1;
		inbit = 0;
		loadval = 4'b1010;
		
		/*//Right shift input
		#100
		mode = 3'b100;
		clk = 0;
		enable = 1;
		inbit = 1;
		loadval = 4'b1010;*/
		
		//Left shift input
		#100
		mode = 3'b101;
		clk = 0;
		enable = 1;
		inbit = 1;
		loadval = 4'b1010;
        
		// Add stimulus here

	end
	always
	#5 clk =!clk;
      
endmodule

