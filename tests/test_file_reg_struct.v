`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:34:18 05/04/2015
// Design Name:   reg_file_struct
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_file_reg_struct.v
// Project Name:  lab_3_reg_file
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_file_struct
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_file_reg_struct;

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
	reg_file_struct uut (
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

	always
		#1 clk=~clk;
		
	initial begin
		// Initialize Inputs
		Aaddr = 0;
		Baddr = 0;
		Caddr = 0;
		C = 0;
		load = 0;
		nClear = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//fill all of our registers
		load=1; nClear=1;
		
//		ORIGINAL TESTING			//
//		================			//		
		#4; Caddr = 1; C = 2;
		#4; Caddr = 2; C = 3;
		#4; Caddr = 3; C = 4;
		#4; Caddr = 4; C = 5;
		#4; Caddr = 5; C = 6;
		#4; Caddr = 6; C = 7;
		#4; Caddr = 7; C = 8;
		#4; Caddr = 8; C = 9;
		#4; Caddr = 9; C = 10;
		#4; Caddr = 10; C = 11;
		#4; Caddr = 11; C = 12;
		#4; Caddr = 12; C = 13;
		#4; Caddr = 13; C = 14;
		#4; Caddr = 14; C = 15;
		#4; Caddr = 15; C = 16;
		//test the load switch
		#4; load = 0;
		#4; C = 8; Caddr = 8;
		//test the asynchronous clear
		#4; nClear = 0;
		//testing outputs
		#4; Aaddr = 4; Baddr = 5;
		#4; nClear = 1; load = 1;
		#4; C=11; Caddr=4;
		#4; C=15; Caddr=5;	
		
		
	end
      
endmodule

