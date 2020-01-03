module alu (s2,s1,s0,a,b,cin,op,C,N,V,Z);
input s2,s1,s0,cin;
input [7:0] a,b;
output [7:0] op;
output C,N,V,Z;
wire [7:0] y;
reg [7:0] x,z,op;
reg N,V,Z;
always@(*)begin
	case({s1,s0})
		2'b00:x=8'b00000000;
		2'b01:x=b;
		2'b10:x=~b;
		2'b11:x=8'b11111111;
	endcase
	case({s0,cin})
		2'b00:z=a&b;
		2'b01:z=a|b;
		2'b10:z=a^b;
		2'b11:z=~a;
	endcase
	op=(s2)?z:y;
	N=op[7];
	if(op==8'b00000000)begin
		Z=1'b1;
		end
	else begin
		Z=1'b0;
		end
	V=C^op[6];
end 
adder u_adder(
	.in1(a),
	.in0(x),
	.cin(cin),
	.out(y),
	.cout(C),
);

endmodule 
