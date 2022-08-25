module BCD_SUB(D,Bo,X,Y,Bin);
output [3:0] D;
output Bo;
input [3:0] X,Y;
input Bin;
wire [2:0] bi;
full_a S1(D[0],bi[0],X[0],~Y[0],1);
full_a S2(D[1],bi[1],X[1],~Y[1],bi[0]);
full_a S3(D[2],bi[2],X[2],~Y[2],bi[1]);
full_a S4(D[3],bi[3],X[3],~Y[3],bi[2]);
endmodule
module full_a(S,co,X,Y,C);
input X,Y,C;
output reg S,co;
Wire w1,w2,w3;
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
module fiftry_tb ();
reg [4:0] x,y;
wire [4:0] cout;
wire [4:0] su;
fifth uut (x,y,cout,su);
initial begin
$dumpfile("fiftry_tb.vcd");
$dumpvars(0, fiftry_tb);
x=4'b1001; y=4’b0110;
end
endmodule
