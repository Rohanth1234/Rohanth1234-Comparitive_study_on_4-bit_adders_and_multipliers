module fulladder(a,b,ic,o,oc);
input a,b,ic;
output o,oc;
assign o = (~ic & ((a & ~b) | (~a & b)) ) | (ic & ~((a & ~b) | (~a & b)) );
assign oc = (a & b) | (b & ic) | (ic & a);
endmodule

module paradd(in1,in2,c,out,oc);
input [3:0]in1;
input [3:0]in2;
input c;
output [3:0]out;
output [3:0]oc;
fulladder fa1(in1[0],in2[0],c,out[0],oc[0]);
fulladder fa2(in1[1],in2[1],oc[0],out[1],oc[1]);
fulladder fa3(in1[2],in2[2],oc[1],out[2],oc[2]);
fulladder fa4(in1[3],in2[3],oc[2],out[3],oc[3]);
endmodule
