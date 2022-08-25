module dbc
(
input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9
,output B3,B2,B1,B0);
assign B3 = D8 || D9;
assign B2 = D7 || D6|| D5|| D4;
assign B1 = D7|| D6 || D3 || D2;
assign B0 = D9 || D7 || D5|| D3|| D1;
end
endmodule
Testbench :
`timescale 1ns/1ns
`include "dbc.v"
module dbc_tb;
reg D0,D1,D2,D3,D4,D5,D6,D7,D8,D9;
wire B3,B2,B1,B0 ;
dbc uut
(.B3(B3),.B2(B2),.B1(B1),.B0(B0),.D0(D0),.D1(D1),.D2(D2),.D3(D3),.D4(D4),.D5(D5),.D6(D6),.D7(D7
),.D8(D8),.D9(D9));
initial
begin
$dumpfile("dbc_tb.vcd"); /*to generate */
$dumpvars(0,dbc_tb); /* vcd file */
D0=0; D1=0 ; D2=0 ;D3=0; D4=0; D5=0; D6=0; D7=0; D8=0; D9=0;
#2 D0=1;
#2 D0=0; D1=1;
#2 D0=0; D1=0;D2=1;
#2 D0=0; D1=0 ; D2=0 ;D3=1;
#2 D0=0; D1=0 ; D2=0 ;D3=0; D4=1;
#2 D0=0; D1=0 ; D2=0 ;D3=0; D4=0; D5=1;
#2 D0=0; D1=0 ; D2=0 ;D3=0; D4=0; D5=0; D6=1;
#2 D0=0; D1=0 ; D2=0 ;D3=0; D4=0; D5=0; D6=0; D7=1;
#2 D0=0; D1=0 ; D2=0 ;D3=0; D4=0; D5=0; D6=0; D7=0; D8=1;
#2 D0=0; D1=0 ; D2=0 ;D3=0; D4=0; D5=0; D6=0; D7=0; D8=0; D9=1;
end
initial #25 $stop;
endmodule
