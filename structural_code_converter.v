module dbc_struc
(input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9
,output B3,B2,B1,B0);
wire a,b,c,d,e,f,g,h;
nor(a,D8,D9);
not(B3,a);
nor(b,D7,D6);
nor(c,D5,D4);
nand(B2,b,c);
nor(d,D3,D2);
nand(B1,b,d);
nor(e,D9,D7);
nor(f,D5,D3);
nand(g,e,f);
nor(h,g,D1);
not(B0,h);
endmodule
TESTBENCH
`timescale 1ns/1ns
`include "dbc_struc.v"
module dbc_struc_tb;
reg D0,D1,D2,D3,D4,D5,D6,D7,D8,D9;
wire B3,B2,B1,B0 ;
dbc_struc uut
(.B3(B3),.B2(B2),.B1(B1),.B0(B0),.D0(D0),.D1(D1),.D2(D2),.D3(D3),.D4(D4),.D5(D5),.D6(D6)
,.D7(D7),.D8(D8),.D9(D9));
initial
begin
$dumpfile("dbc_struc_tb.vcd"); /*to generate */
$dumpvars(0,dbc_struc_tb); /* vcd file */
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
