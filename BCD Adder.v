module fourth(sum,carry,a,b,carry_in);
input [3:0] a,b;
input carry_in;
output [3:0] sum;
output carry;
reg [4:0] sum_temp;
reg [3:0] sum;
reg carry;
always @(a,b,carry_in)
begin
sum_temp = a+b+carry_in;
if(sum_temp > 9)
begin
sum_temp = sum_temp+6;
carry = 1;
sum = sum_temp[3:0];
end
else
begin
carry = 0;
sum = sum_temp[3:0];
end
end
endmodule
%TEST BENCH:
`timescale 1ns/1ns
`include "fourth.v"
module fourth_tb;
reg [3:0] a;
reg [3:0] b;
reg carry_in;
wire [3:0] sum;
wire carry;
fourth uut (.sum(sum),.carry(carry), .a(a),.b(b),.carry_in(carry_in));
initial begin
$dumpfile("fourth_tb.vcd");
$dumpvars(0, fourth_tb);
a = 0; b = 0; carry_in = 0; #100;
a = 6; b = 9; carry_in = 0; #100;
a = 3; b = 3; carry_in = 1; #100;
a = 4; b = 5; carry_in = 0; #100;
a = 8; b = 2; carry_in = 0; #100;
a = 9; b = 9; carry_in = 1; #100;
end
initial # 800 $stop;
endmodule
