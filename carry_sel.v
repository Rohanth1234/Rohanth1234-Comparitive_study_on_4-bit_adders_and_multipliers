module carry_sel(
  input [3:0] a,
  input [3:0] b,
  input cin,
  output [4:0] sum
);

  wire [4:0] sum0, sum1;
  wire c0, c1;

  ripple_carry_adder rca0(a, b, cin, sum0, c0);
  ripple_carry_adder rca1(a, b, cin, sum1, c1);

  assign sum = (c0 == 1'b0) ? sum0 : sum1;

endmodule


module ripple_carry_adder (
  input [3:0] a,
  input [3:0] b,
  input cin,
  output [4:0] sum,
  output cout
);

  wire [4:0] carry;

  gen_sum_carry gsc0(a[0], b[0], cin, sum[0], carry[0]);
  gen_sum_carry gsc1(a[1], b[1], carry[0], sum[1], carry[1]);
  gen_sum_carry gsc2(a[2], b[2], carry[1], sum[2], carry[2]);
  gen_sum_carry gsc3(a[3], b[3], carry[2], sum[3], carry[3]);

  assign cout = carry[3];

endmodule

module gen_sum_carry (
  input a,
  input b,
  input cin,
  output sum,
  output carry
);
  assign sum = a ^ b ^ cin;
  assign carry = (a & b) | (a & cin) | (b & cin);

endmodule