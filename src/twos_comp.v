`timescale 1ns / 1ps

module twos_comp(x, y, subc, s, carry, overflow);

input [15:0] x;
input [15:0] y;
input subc;
output [15:0] s;
output carry;
output overflow;
wire [14:0] c;

xor xor1(r1, subc, y[0]);
xor xor2(r2, subc, y[1]);
xor xor3(r3, subc, y[2]);
xor xor4(r4, subc, y[3]);
xor xor5(r5, subc, y[4]);
xor xor6(r6, subc, y[5]);
xor xor7(r7, subc, y[6]);
xor xor8(r8, subc, y[7]);
xor xor9(r9, subc, y[8]);
xor xor10(r10, subc, y[9]);
xor xor11(r11, subc, y[10]);
xor xor12(r12, subc, y[11]);
xor xor13(r13, subc, y[12]);
xor xor14(r14, subc, y[13]);
xor xor15(r15, subc, y[14]);
xor xor16(r16, subc, y[15]);

full_adder add1(x[0], r1, subc, c[0], s[0]);
full_adder add2(x[1], r2, c[0], c[1], s[1]);
full_adder add3(x[2], r3, c[1], c[2], s[2]);
full_adder add4(x[3], r4, c[2], c[3], s[3]);
full_adder add5(x[4], r5, c[3], c[4], s[4]);
full_adder add6(x[5], r6, c[4], c[5], s[5]);
full_adder add7(x[6], r7, c[5], c[6], s[6]);
full_adder add8(x[7], r8, c[6], c[7], s[7]);
full_adder add9(x[8], r9, c[7], c[8], s[8]);
full_adder add10(x[9], r10, c[8], c[9], s[9]);
full_adder add11(x[10], r11, c[9], c[10], s[10]);
full_adder add12(x[11], r12, c[10], c[11], s[11]);
full_adder add13(x[12], r13, c[11], c[12], s[12]);
full_adder add14(x[13], r14, c[12], c[13], s[13]);
full_adder add15(x[14], r15, c[13], c[14], s[14]);
full_adder add16(x[15], r16, c[14], carry, s[15]);

//detect overflow
xor xor17(overflow,carry,c[14]);

endmodule
