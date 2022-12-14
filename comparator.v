module third(eq,lt,gt,a,b);
input [3:0] a,b;
output reg eq,lt,gt;
always @(a,b)
begin
if (a==b)
begin
eq = 1'b1;
lt = 1'b0;
gt = 1'b0;
end
else if (a>b)
begin
eq = 1'b0;
lt = 1'b0;
gt = 1'b1;
end
else
begin
eq = 1'b0;
lt = 1'b1;
gt = 1'b0;
end
end
endmodule
TEST BENCH:
`timescale 1ns/1ns
`include "third.v"
module third_tb;
reg [3:0] a;
reg [3:0] b;
wire eq;
wire lt;
wire gt;
third uut (eq,lt,gt,a,b);
initial
begin
$dumpfile("third_tb.vcd");
$dumpvars(0, third_tb);
a = 4'b1000;
b = 4'b1100;
#3;
a = 4'b0000;
b = 4'b1111;
#3;
a = 4'b0000;
b = 4'b000;
#3;
a = 4'b1111;
b = 4'b1111;
#3;
a = 4'b0000;
b = 4'b0100;
#3;
a = 4'b1010;
b = 4'b1100;
#3;
a = 4'b0000;
b = 4'b1011;
#3;
a = 4'b1111;
b = 4'b1011;
#3;
a = 4'b0000;
b = 4'b0010;
#3;
end
initial # 40 $stop;
endmodule
