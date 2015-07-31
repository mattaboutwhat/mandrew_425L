`timescale 1ns / 1ps

module full_adder(a,b,cin,cout,s);
input a;
input b;
input cin;
output cout;
output s;

xor xor1(x1, a, b);
xor xor2(s, x1, cin);
and and1(a1, x1, cin);
and and2(a2, a, b);
or or1(cout, a1, a2);

endmodule
