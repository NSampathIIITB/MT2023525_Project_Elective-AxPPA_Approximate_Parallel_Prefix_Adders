module Kogge_Stone_tb;

  parameter WIDTH = 16;
  reg [WIDTH-1:0] A, B;
  reg Cin;
  wire [WIDTH+1:1] Cout;
  wire [WIDTH+1:1] Sum;

    Kogge_Stone #(WIDTH) dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
  );
  
  reg clk = 0;
  always #5 clk = ~clk;

  initial begin
    
    A = 5;
    B = 7;
    Cin = 1;
    #10;
    
    A = 15;
    B = 21;
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
    
    $finish;
  end

endmodule


