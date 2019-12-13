module lab09 (A, B, S, Cin, G);

input  [7:0] A;
input  [7:0] B;

input Cin;
input [1:0] S;

output  [7:0] G;

reg [7:0] Y;

always @(*) begin
    
    case (S)
        2'b00:    Y = 0;
        2'b01:    Y = B;
        2'b10:    Y = ~B;
        2'b11:    Y = 8'b11111111;
    endcase
end
assign G=A+Y+Cin;
endmodule
