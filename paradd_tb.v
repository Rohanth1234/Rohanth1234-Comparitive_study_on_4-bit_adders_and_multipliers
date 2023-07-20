module paradd_tb;
wire [3:0]oc;
wire [3:0]out;
reg [3:0]in1;
reg [3:0]in2;
reg c;
main m(.oc(oc), .in1(in1), .in2(in2), .out(out), .c(c) );
initial
begin
$monitor(" ",in1," ",in2," ",out," ",oc[3]);
in1=4'b1010;
in2=4'b1001;
c=0;
end
endmodule