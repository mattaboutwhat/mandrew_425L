`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:12 04/29/2015 
// Design Name: 
// Module Name:    Dff 
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
module d_ff(clk, D, Q, nQ);
input clk;
input D;
output reg Q;
output reg nQ;

always @(posedge clk)
begin
if (D==1)begin
	Q<=1;
	nQ<=0;
end
else if (D==0) begin
	Q<=0;
	nQ<=1;
end
end

endmodule
