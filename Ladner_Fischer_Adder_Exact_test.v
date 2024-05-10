module Ladner_Fischer_Exact_tb;

  reg [16:1] A, B;
  reg Cin;
  
  wire [16:0] Cout;
  wire [17:1] Sum;
  
  Ladner_Fischer_Exact dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
  );
  
  reg clk;
  always #5 clk = ~clk;
  

  initial begin
    
    A = 17'b1010101010101010;
    B = 17'b0101010101010101;
    Cin = 0;
    #10
    
    
    A = 17'b1111000011110000;
    B = 17'b0000111100001111;
    Cin = 1;
    #10
    
    
    A = 17'b0000000000000000;
    B = 17'b1111111111111111;
    Cin = 0;
    #10
    
  
    A = 17'b1111111111111111;
    B = 17'b1111111111111111;
    Cin = 1;
    #10
    
  
    $finish;
  end
  
endmodule

