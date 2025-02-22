module lab09_Q2 (A, B, C, D, S, Cin, G);

input  [7:0] A;
input  [7:0] B;
input  [7:0] C;
input  [7:0] D;

input Cin;
input [1:0] S;

output  [7:0] G;

reg [7:0] X;
reg [7:0] Y;
reg [7:0] Z;

always @(*) begin
    
    case (S)
        2'b00:    X = 0;
        2'b01:    X = B;
        2'b10:    X = ~B;
        2'b11:    X = 8'b11111111;
    endcase
end

always @(*) begin
    
    case (S)
        2'b00:    Y = 0;
        2'b01:    Y = C;
        2'b10:    Y = ~C;
        2'b11:    Y = 8'b11111111;
    endcase
end

always @(*) begin
    
    case (S)
        2'b00:    Z = 0;
        2'b01:    Z = D;
        2'b10:    Z = ~D;
        2'b11:    Z = 8'b11111111;
    endcase
end

assign G=A+X+Y+Z+Cin;

endmodule
