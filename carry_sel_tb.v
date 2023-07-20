

// Testbench Module
module carry_sel_tb;
  reg [3:0] a, b;
  reg cin;
  wire [4:0] sum;

  // Instantiate the Carry Select Adder
  carry_select_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum)
  );

  // Stimulus
  initial begin
    $monitor("a = %b, b = %b, cin = %b, sum = %b", a, b, cin, sum);

    // Test Case 1
    #10 a = 4'b0101;
    #10 b = 4'b0011;
    #10 cin = 1'b0;

    // Test Case 2
    #10 a = 4'b1111;
    #10 b = 4'b0001;
    #10 cin = 1'b1;

    // Test Case 3
    #10 a = 4'b1010;
    #10 b = 4'b0110;
    #10 cin = 1'b0;

    // Test Case 4
    #10 a = 4'b0000;
    #10 b = 4'b0000;
    #10 cin = 1'b1;

    // Test Case 5
    #10 a = 4'b1010;
    #10 b = 4'b1010;
    #10 cin = 1'b0;

    // Test Case 6
    #10 a = 4'b1100;
    #10 b = 4'b0011;
    #10 cin = 1'b1;

    $finish;
  end

endmodule
