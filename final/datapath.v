module datapath (RW,DA,AA,BA,MB,FS,MD,const_in,ad_out,data_out,data_in,V,C,N,Z,clk,op,r0,r1,r2,r3,r4,r5,r6,r7);
input RW,MB,MD,clk;
input [2:0] DA,AA,BA;
input [3:0] FS;
input [7:0] const_in,data_in;
output V,C,N,Z;
output [7:0] ad_out,data_out,op,r0,r1,r2,r3,r4,r5,r6,r7;
wire [7:0] y,z,w;
registfile u_registfile(
	.ip(x),
	.L(RW),
	.s(DA),
	.sa(AA),
	.sb(BA),
	.opa(y),
	.opb(z),
	.clk(clk),
	.r0(r0),
	.r1(r1),
	.r2(r2),
	.r3(r3),
	.r4(r4),
	.r5(r5),
	.r6(r6),
	.r7(r7),
);
function_unit u_function_unit(
	.a(y),
	.b(q),
	.FS(FS),
	.V(V),
	.C(C),
	.N(N),
	.Z(Z),
	.op(w),
);
reg [7:0] q,x,ad_out,data_out,op;
always@(*)begin
		q=(MB)?const_in:z;
		x=(MD)?data_in:w;
		ad_out=y;
		data_out=q;
		op=x;
end
endmodule

