`timescale 1ns / 1ps
module wallatree_test;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [7:0] prod;
    //integer i,j,error;

    // Instantiate the Unit Under Test (UUT)
    wallatree uut (
        .A(A), 
        .B(B), 
        .prod(prod)
    );

    //initial begin
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
      //  error = 0;
      //  for(i=0;i <=15;i = i+1)
           // for(j=0;j <=15;j = j+1) 
       //     begin
           //     A <= i; 
           //     B <= j;
           //     #1;
            //    if(prod != A*B) //if the result isnt correct increment "error".
            //        error = error + 1;  
           // end     
   // end
      
endmodule