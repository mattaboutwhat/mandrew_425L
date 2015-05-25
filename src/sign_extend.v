`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:30 05/11/2015 
// Design Name: 
// Module Name:    SignExtender 
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
module sign_extend(IN,OUT);
input [15:0] IN;
output [31:0] OUT;
and  and1 [15:0] (OUT[31:16], IN[15], IN[15]);
buf buf1 [15:0](OUT[15:0],IN[15:0]);


endmodule
