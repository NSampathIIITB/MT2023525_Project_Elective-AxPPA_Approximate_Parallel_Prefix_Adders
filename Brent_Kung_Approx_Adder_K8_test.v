module Brent_kung_tb;

  parameter WIDTH = 16;
  reg [WIDTH-1:0] A, B;
  reg Cin;
  wire [WIDTH:0] Cout;
  wire [WIDTH:1] Sum;

 /* Brent_kung_Exact #(WIDTH) dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
  );*/
  
  Brent_Kung_Approx #(WIDTH) dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
  );


  reg clk = 0;
  always #5 clk = ~clk;
  
  initial begin
    
    A = 252;
    B = 123;
    Cin = 0;
    #10;
    
    A = 120;
    B = 201;
    Cin = 1;
    #10;
    
     A = 53;
    B = 25;
    Cin = 0;
    #10;
    
     A = 1;
    B = 10;
    Cin = 0;
    #10;
    $finish;
  end

endmodule


