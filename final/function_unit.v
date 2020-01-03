module function_unit (a,b,FS,V,C,N,Z,op);
input [7:0] a,b;
input [3:0] FS;
output V,C,N,Z;
output [7:0] op;
wire [7:0] x,y,z;
alu u_alu(
	.a(a),
	.b(b),
	.s2(FS[3]),
	.s1(FS[2]),
	.s0(FS[1]),
	.cin(FS[0]),
	.C(C),
	.V(V),
	.N(N),
	.Z(Z),
	.op(x),
);
shifter u_shifter(
	.b(b),
	.s(FS[1:0]),
	.op(y),
);
reg [7:0] op;
always@(*)begin
	op=(FS[3]&FS[2])?y:x;
end
endmodule 
