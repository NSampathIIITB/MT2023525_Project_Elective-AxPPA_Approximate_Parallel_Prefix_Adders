module Brent_kung_Exact_tb;

  parameter WIDTH = 16;
  reg [WIDTH-1:0] A, B;
  reg Cin;
  wire [WIDTH:0] Cout;
  wire [WIDTH+1:1] Sum;

  Brent_kung_Exact #(WIDTH) dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
  );

  reg clk = 0;
  always #5 clk = ~clk;

  initial begin
    
    A = 2;
    B = 1;
    Cin = 0;
    #10;
    
    A = 10;
    B = 20;
    Cin = 1;
    #10;
    
     A = 5;
    B = 5;
    Cin = 0;
    #10;
    
     A = 1;
    B = 10;
    Cin = 0;
    #10;
    
  end

endmodule


