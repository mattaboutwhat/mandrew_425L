`timescale 1ns/1ps
///////////////////////////////////////
// 
//////////////////////////////////////
module lcd_decode(lcd_code, hex_in);
	input [3:0] hex_in;
	output reg [7:0] lcd_code;

	always @(hex_in)
		case(hex_in)
			0:  lcd_code<=8'h30;
			1:  lcd_code<=8'h31;
			2:  lcd_code<=8'h32;
			3:  lcd_code<=8'h33;
			4:  lcd_code<=8'h34;
			5:  lcd_code<=8'h35;
			6:  lcd_code<=8'h36;
			7:  lcd_code<=8'h37;
			8:  lcd_code<=8'h38;
			9:  lcd_code<=8'h39;
			10: lcd_code<=8'h41;
			11: lcd_code<=8'h42;
			12: lcd_code<=8'h43;
			13: lcd_code<=8'h44;
			14: lcd_code<=8'h45;
			15: lcd_code<=8'h46;
		endcase
	
endmodule
