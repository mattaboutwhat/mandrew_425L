`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group: 13
// Engineer: Andrew Bakhit 
// 
// Create Date:    15:47:20 03/30/2015 
// Design Name: 
// Module Name:    mux2to1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux2_1bit(d0, d1, s1, o1);
input d0,d1;
input s1;
output o1;

//This module is a simple 2 to 1 mux
//it will take in two inputs and a select
//it has one output and also an enable that must be high to have an output
//it is called upon 16 times in the top module to create a 16 bit 2 to 1 mux
	 
not (s2,s1);
and (x1, d0, s2);
and (x2, d1, s1);
or  (o1, x1, x2); 

endmodule
