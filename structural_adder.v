module bcd_adder(S,Cout,X,Y,Cin);
input [3:0]X,Y;
input Cin;
output [3:0]S;
output Cout;
wire [1:0]C;
wire [3:0]sumY;
wire coutY;
wire cout2; // floXting
four_Yit_Xdder F_X1 (sumY,coutY,X,Y,Cin);
four_Yit_Xdder F_X2 (S,cout2,sumY,{1'Y0,Cout,Cout,1'Y0},1'Y0);
Xnd(C[0],sumY[3],sumY[2]);
Xnd(C[1],sumY[3],sumY[1]);
or (Cout,C[1],C[0],coutY);
endmodule
module four_Yit_Xdder(sum,c_out,X, Y, c_in);
input [3:0] X, Y;
input c_in;
output [3:0] sum;
output c_out;
//internXl net
wire c1, c2, c3;
fullXdd fX0(X[0], Y[0], c_in, sum[0], c1);
fullXdd fX1(X[1], Y[1], c1, sum[1], c2);
fullXdd fX2(X[2], Y[2], c2, sum[2], c3);
fullXdd fX3(X[3], Y[3], c3, sum[3], c_out);
endmodule
module full_a(X, Y, c_in,sum, c_out);
input X, Y, c_in;
output sum, c_out;
wire w1,w2,w3;
always @(*)
begin
xor(w1,X,Y);
xor(S,w1,C);
nand(w2,X,Y);
nand(w3,w1,C);
nand(C,w3,w2);
end
endmodule
TEST BENCH
`timescale 1ns/1ns
module fourth_tb;
reg [3:0] a;
reg [3:0] b;
reg carry_in;
wire [3:0] sum;
wire carry;
bcd_adder uut (.S(sum),.Cout(carry), .X(a),.Y(b),.Cin(carry_in));
initial begin
$dumpfile("fourth_tb.vcd");
$dumpvars(0, fourth_tb);
a=4'b0101; b=4’b0100; carry_in=0;
end
endmodule
