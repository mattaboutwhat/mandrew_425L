`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:04:42 04/22/2015 
// Design Name: 
// Module Name:    mux4_1bit 
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
module mux4_1bit(A, B, C, D, sel, OUT);

input A, B, C, D;
input [1:0] sel;
output OUT;
wire [1:0] e;

mux2_1bit  M1	(A, C, sel[1], e[1]);
mux2_1bit  M2	(B, D, sel[1], e[0]);
mux2_1bit  M3	(e[1], e[0], sel[0], OUT);

endmodule
