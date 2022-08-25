module comparator_struc
(
input X3,X2,X1,X0,Y3,Y2,Y1,Y0,
output G,E,L
); // G→ X>Y , E→ X=Y , L→ X<Y
wire a,an,b,c,d,e,en,f,g,gn,h,i,j,k,l,ln,m,n,o,p,q,y3n,y2n,y1n,y0n;
not(y3n,Y3);
not(y2n,Y2);
not(y1n,Y1);
not(y0n,Y0);
//X>Y and X<Y
nand(a,X3,y3n);
not(an,a);
xor(b,X3,Y3);
nand(c,X2,y2n);
nor(d,b,c);
nor(e,d,an);
xnor(f,X3,Y3);
xnor(g,X2,Y2);
nand(h,f,g);
nand(i,X1,y1n);
nor(j,h,i);
xnor(k,X1,Y1);
nand(l,X0,y0n);
not(ln,l);
nand(m,ln,k);
nor(n,h,m);
nor(o,n,j);
nand(G,e,o);
not(gn,G);
//X=Y
xnor(p,X0,Y0);
nand(q,k,p);
nor(E,q,h);
not(en,E);
and(L,en,gn);
endmodule
TESTBENCH
`timescale 1ns/1ns
`include "comparator_struc.v"
module comparator_struc_tb;
reg X3,X2,X1,X0,Y3,Y2,Y1,Y0;
wire G,E,L;
comparator_struc
uut(.G(G),.E(E),.L(L),.X3(X3),.X2(X2),.X1(X1),.X0(X0),.Y3(Y3),.Y2(Y2),.Y1(Y1),.Y0(Y0));
initial
begin
$dumpfile("comparator_struc_tb.vcd"); /*to generate */
$dumpvars(0,comparator_struc_tb); /* vcd file */
X3=0; X2=0; X1=0; X0=0; Y3=0; Y2=0; Y1=0; Y0=0;
#2 X3=0; X2=0; X1=0; X0=1;Y3=1; Y2=0; Y1=0; Y0=0;
#2 X3=0; X2=0; X1=1; X0=0;Y3=0; Y2=1; Y1=0; Y0=1;
#2 X3=0; X2=0; X1=1; X0=1;Y3=0; Y2=0; Y1=1; Y0=1;
#2 X3=0; X2=1; X1=0; X0=0;Y3=0; Y2=1; Y1=0; Y0=1;
#2 X3=0; X2=1; X1=0; X0=1;Y3=0; Y2=0; Y1=0; Y0=1;
#2 X3=0; X2=1; X1=1; X0=0;Y3=0; Y2=1; Y1=0; Y0=1;
#2 X3=0; X2=1; X1=1; X0=1;Y3=0; Y2=0; Y1=0; Y0=1;
#2 X3=1; X2=0; X1=0; X0=0;Y3=1; Y2=0; Y1=0; Y0=0;
#2 X3=1; X2=0; X1=0; X0=1;Y3=0; Y2=0; Y1=0; Y0=1;
end
initial #25 $stop;
endmodule
