`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:42:39 04/25/2015
// Design Name:   reg_file_beh
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_file_reg.v
// Project Name:  lab_3_reg_file
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_file_beh
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_file_reg;

	// Inputs
	reg [3:0] Aaddr;
	reg [3:0] Baddr;
	reg [3:0] Caddr;
	reg [15:0] C;
	reg load;
	reg nClear;
	reg clk;

	// Outputs
	wire [15:0] A;
	wire [15:0] B;

	// Instantiate the Unit Under Test (UUT)
	reg_file_beh uut (
		.A(A), 
		.B(B), 
		.Aaddr(Aaddr), 
		.Baddr(Baddr), 
		.Caddr(Caddr), 
		.C(C), 
		.load(load), 
		.nClear(nClear), 
		.clk(clk)
	);

	always begin
		#1; clk=~clk;
	end
	
	initial begin
		// Initialize Inputs
		Aaddr = 0;
		Baddr = 0;
		Caddr = 0;
		C = 1;
		load = 1;
		nClear = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Caddr = 1;
		#1; C = 2;
		#1; Caddr = 2;
		#1; C = 3;
		#1; Caddr = 3;
		#1; C = 4;
		#1; Caddr = 4;
		#1; C = 5;
		#1; Caddr = 5;
		#1; C = 6;
		#1; Caddr = 6;
		#1; C = 7;
		#1; Caddr = 7;
		#1; load = 0;
		#1; C = 8;
		#1; Caddr = 8;
		#1; nClear = 0;
		#1; Aaddr = 4;
		#1; Baddr = 5;
	
	end
      
endmodule

