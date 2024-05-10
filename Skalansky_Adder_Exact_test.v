module Skalansky_Exact_tb();

  parameter WIDTH = 16;
  reg [WIDTH:1] A, B;
  reg Cin;
  wire [WIDTH:0] Cout;
  wire [WIDTH:1] Sum;
  
  Skalansky_Exact dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
  );
  reg clk = 0;
  always #5 clk = ~clk;
  
  initial begin
    A = 16'b1010101011101010;
    B = 16'b0100110101010101;
    Cin = 0;
    #10
    
    A = 16'b1111000011110000;
    B = 16'b0000111100001111;
    Cin = 1;
    #10
    
    A = 16'b1100110011001101;
    B = 16'b0011101100110011;
    Cin = 0;
    #10
    
    A = 16'b1111111111111111;
    B = 16'b0100010010010000;
    Cin = 1;
    #10
    
    $finish;
  end
  
endmodule

