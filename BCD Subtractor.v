module fifth (x,y,cout,diff);
input [4:0] x,y;
output [7:0] cout,diff;
reg [7:0] diff=8'b00000000,cout=8'b00000000,y1;
reg cin;
integer i,j;
always@(x,y)
begin
assign cin=1;
for (i=0; i<=3; i=i+1)
begin
y1[i]= ~(y[i]);
end
begin
for (j=0; j<=3; j=j+1)
begin
if (j==0)
begin
diff[j]=y1[j]^x[j]^cin;
cout[j]=(x[j] & y1[j]) | (y1[j] & cin) | (x[j] & cin);
end
else
begin
diff[j]=y1[j]^x[j]^cout[j-1];
cout[j]=(x[j] & y1[j]) | (y1[j] & cout[j-1]) | (x[j] & cout[j-1]);
end
//$display("sum=%d",s[j]);
end
end
end
endmodule
%TEST BENCH
`timescale 1ns/1ns
`include "fifnew.v"
module fifnew_tb;
reg [4:0] x,y;
wire [7:0] cout;
wire [7:0] diff;
fifth uut (x,y,cout,diff);
initial begin
$dumpfile("fifnew_tb.vcd");
$dumpvars(0, fifnew_tb);
x=5'b01000; y=5'b00001; #50;
x=5'b01001; y=5'b00101; #50;
x=5'b00010; y=5'b00001; #50;
x=5'b00111; y=5'b00100; #50;
end
endmodule
