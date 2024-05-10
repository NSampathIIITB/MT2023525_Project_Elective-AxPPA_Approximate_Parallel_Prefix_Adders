module Generate(input A,B,C,D,output X,Y);
  assign X=A&B;
  assign Y=C|(A&D);
endmodule

module Skalansky_Approx(input [16:1] A, [16:1] B, input Cin, output [16:0] Cout, output [16:1] Sum);
  wire P[4:1][16:1];
  wire G[4:1][16:1];
  
  Generate g1 (P[1][10],P[1][9],G[1][10],G[1][9],P[2][10],G[2][10]);
  Generate g2 (P[1][12],P[1][11],G[1][12],G[1][11],P[2][12],G[2][12]);
  Generate g3 (P[1][14],P[1][13],G[1][14],G[1][13],P[2][14],G[2][14]);
  Generate g4 (P[1][16],P[1][15],G[1][16],G[1][15],P[2][16],G[2][16]);
  Generate g5 (P[1][11],P[2][10],G[1][11],G[2][10],P[2][11],G[2][11]);
  Generate g6 (P[2][12],P[2][10],G[2][12],G[2][10],P[3][12],G[3][12]);
  Generate g7 (P[1][15],P[2][14],G[1][15],G[2][14],P[2][15],G[2][15]);
  Generate g8 (P[2][16],P[2][14],G[2][16],G[2][14],P[3][16],G[3][16]);
  Generate g9 (P[1][13],P[3][12],G[1][13],G[3][12],P[2][13],G[2][13]);
  Generate g10 (P[2][14],P[3][12],G[2][14],G[3][12],P[3][14],G[3][14]);
  Generate g11 (P[2][15],P[3][12],G[2][15],G[3][12],P[3][15],G[3][15]);
  Generate g12 (P[3][16],P[3][12],G[3][16],G[3][12],P[4][16],G[4][16]);
  
  assign Cout[0]=Cin;  
  assign Cout[1]= G[1][1];
  assign Cout[2]= G[1][2];
  assign Cout[3]= G[1][3];
  assign Cout[4]= G[1][4];
  assign Cout[5]= G[1][5];
  assign Cout[6]= G[1][6];
  assign Cout[7]= G[1][7];
  assign Cout[8]= G[1][8];
  assign Cout[9]= (Cout[8]&P[1][9])|G[1][9];
  assign Cout[10]= (Cout[8]&P[2][10])|G[2][10];
  assign Cout[11]= (Cout[8]&P[2][11])|G[2][11];
  assign Cout[12]= (Cout[8]&P[3][12])|G[3][12];
  assign Cout[13]= (Cout[8]&P[2][13])|G[2][13];
  assign Cout[14]= (Cout[8]&P[3][14])|G[3][14];
  assign Cout[15]= (Cout[8]&P[3][15])|G[3][15];
  assign Cout[16]= (Cout[8]&P[4][16])|G[4][16];
  
  assign Sum[1]= P[1][1];
  assign Sum[2]= G[1][1]^P[1][2];
  assign Sum[3]= G[1][2]^P[1][3];
  assign Sum[4]= G[1][3]^P[1][4];
  assign Sum[5]= G[1][4]^P[1][5];
  assign Sum[6]= G[1][5]^P[1][6];
  assign Sum[7]= G[1][6]^P[1][7];
  assign Sum[8]= Cout[7]^P[1][8];
  assign Sum[9]= Cout[8]^P[1][9];
  assign Sum[10]= Cout[9]^P[1][10];
  assign Sum[11]= Cout[10]^P[1][11];
  assign Sum[12]= Cout[11]^P[1][12];
  assign Sum[13]= Cout[12]^P[1][13];
  assign Sum[14]= Cout[13]^P[1][14];
  assign Sum[15]= Cout[14]^P[1][15];
  assign Sum[16]= Cout[15]^P[1][16];
  
endmodule

