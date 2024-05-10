module Kogge_Stone_tb();

  parameter WIDTH = 16;
  reg [WIDTH:1] A;
  reg [WIDTH:1] B;
  reg Cin;
  wire [WIDTH:0] Cout;
  wire [WIDTH+1:1] Sum;
  
  Kogge_Stone_Approx dut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
  );
  
  reg clk = 0;
  always #5 clk = ~clk;
  
  initial begin
   
    A = 16'b1010101010101010;
    B = 16'b1100110011001100;
    Cin = 1'b0;
    #10;
    
    
    A = 16'b1111000011110000;
    B = 16'b0000110000001100;
    Cin = 1'b1;
    #10;
    
    
    A = 16'b1111111111111111;
    B = 16'b0000000000000000;
    Cin = 1'b0;
    #10;
    
    
    A = 16'b0000000000000000;
    B = 16'b1111111111111111;
    Cin = 1'b1;
    #10;
    
    
    $finish;
  end
  
endmodule

