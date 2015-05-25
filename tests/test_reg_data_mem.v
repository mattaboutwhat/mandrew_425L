`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:26:38 05/11/2015
// Design Name:   reg_data_mem
// Module Name:   D:/My Documents/University/Year 5/Quarter 3/ECE 425/src/tests/test_reg_data_mem.v
// Project Name:  lab_4_path_and_control
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_data_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_reg_data_mem;

	// Inputs
	reg [3:0] addr;
	reg [15:0] data_in;
	reg MemWrite;
	reg MemRead;
	reg clk;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	reg_data_mem uut (
		.data_out(data_out), 
		.addr(addr), 
		.data_in(data_in), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.clk(clk)
	);
	
	always
		#1 clk=~clk;

	initial begin
		// Initialize Inputs
		addr = 0;
		data_in = 1;
		MemWrite = 0;
		MemRead = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
//populate all registers
		MemWrite=1;
		#2 addr=1; data_in=2;
		#2 addr=2; data_in=3;
		#2 addr=3; data_in=4;
		#2 addr=4; data_in=5;
		#2 addr=5; data_in=6;
		#2 addr=6; data_in=7;
		#2 addr=7; data_in=8;
		#2 addr=8; data_in=9;
		#2 addr=9; data_in=10;
		#2 addr=10; data_in=11;
		#2 addr=11; data_in=12;
		#2 addr=12; data_in=13;
		#2 addr=13; data_in=14;
		#2 addr=14; data_in=15;
		#2 addr=15; data_in=16; 
		#2 MemWrite=0;
	
//test data output with MemRead=1;
		#2 MemRead=1; addr=5;
		#2 addr=3;
		#2 addr=11;
		#2 MemRead=0;
		
	end
      
endmodule

