module Kogge_Stone(input [16:1] A, input [16:1] B, input Cin,output reg [17:1] Cout,output reg [17:1] Sum);
reg P[9:1][17:1];
reg G[9:1][17:1];
integer i;
integer k;
integer j;
initial
begin
    Sum=0;
    Cout=0;
end
always@(*)
begin

    for( i=1;i<=16;i=i+1)
    begin 
        P[1][i+1]=A[i]^B[i]; 
        G[1][i+1]=A[i]&B[i]; 
    end       
    k=1;
    P[9][2] = P[1][2];
    G[9][2] = G[1][2];
    
    for(j=2;j<=5;j=j+1)
    begin
        for(i=2+k;i<=17;i=i+1)
        begin
            P[j][i]=P[j-1][i]&P[j-1][i-k];
            G[j][i]=(P[j-1][i]&G[j-1][i-k])|(G[j-1][i]);   
            P[9][i]=P[j][i];
            G[9][i]=G[j][i];         
        end
        k=2**(j-1);
    end
    Cout[1]=Cin;
    
    for(i=2;i<=17;i=i+1)
    begin
         Cout[i]=(Cin&P[9][i])|G[9][i];
         Sum[i-1]=Cout[i-1]^P[1][i];
    end    
    Sum[17] = Cout[17];
end
endmodule


    
    
    
    

