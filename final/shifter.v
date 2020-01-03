module shifter (b,s,op);
input [1:0] s;
input [7:0] b;
output [7:0] op;
reg [7:0]op;
always@(*)begin
	case(s)
		2'b00:op=b;
		2'b01:op={1'b0,b[7:1]};
		2'b10:op={b[6:0],1'b0};
		2'b11:op=8'hx;
	endcase
end
endmodule 
