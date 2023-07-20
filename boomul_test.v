module boomul_test;


    // Inputs
    reg [3:0] X;
    reg [3:0] Y;

    // Outputs
    wire [7:0] Z;

    // Instantiate the Unit Under Test (UUT)
    boomul uut (
        .X(X), 
        .Y(Y), 
        .Z(Z)
    );

    initial begin
        // Initialize Inputs
        X = 0;
        Y = 0;

        // Wait 100 ns for global reset to finish
        #100;
        X=-5;
          Y=7;
        // Add stimulus here

    end
      
endmodule