module logic_gate (a,b,s,op);
input [7:0] a,b;
input [1:0] s;
output [7:0] op;
reg [7:0] op;
always@(*)begin
	case(s)
		2'b00:op=a&b;
		2'b01:op=a|b;
		2'b10:op=a^b;
		2'b11:op=~a;
	endcase
end
endmodule 
