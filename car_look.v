// Carry Lookahead Adder Module
module car_look(
  input [3:0] a,
  input [3:0] b,
  input cin,
  output [4:0] sum
);

  wire [3:0] c;

  // Generate carry lookahead signals
  generate_carry_lookahead4 cla(a, b, c);

  // Generate the sum bits
  generate_sum4 sgen1(a[0], b[0], cin, c[0], sum[0]);
  generate_sum4 sgen2(a[1], b[1], c[0], c[1], sum[1]);
  generate_sum4 sgen3(a[2], b[2], c[1], c[2], sum[2]);
  generate_sum4 sgen4(a[3], b[3], c[2], c[3], sum[3]);

  // Assign final carry-out
  assign sum[4] = c[3];

endmodule


// Generate Carry Lookahead Module
module generate_carry_lookahead4(
  input [3:0] a,
  input [3:0] b,
  output [3:0] c
);
  wire [3:0] g, p;

  // Generate and propagate signals
  genpropagate4 ppg1(a[0], b[0], p[0], g[0]);
  genpropagate4 ppg2(a[1], b[1], p[1], g[1]);
  genpropagate4 ppg3(a[2], b[2], p[2], g[2]);
  genpropagate4 ppg4(a[3], b[3], p[3], g[3]);

  // Carry generation equations
  assign c[0] = p[0] | (g[0] & c[0]);
  assign c[1] = p[1] | (g[1] & p[0]) | (g[1] & g[0] & c[0]);
  assign c[2] = p[2] | (g[2] & p[1]) | (g[2] & g[1] & p[0]) | (g[2] & g[1] & g[0] & c[0]);
  assign c[3] = p[3] | (g[3] & p[2]) | (g[3] & g[2] & p[1]) | (g[3] & g[2] & g[1] & p[0]) | (g[3] & g[2] & g[1] & g[0] & c[0]);

endmodule


// Generate and Propagate Module
module genpropagate4(
  input a,
  input b,
  output p,
  output g
);
  assign p = a | b;
  assign g = a & b;
endmodule


// Generate Sum Module
module generate_sum4(
  input a,
  input b,
  input c,
  input p1,
  output s
);
  assign s = a ^ b ^ c ^ (p1 & c);
endmodule

