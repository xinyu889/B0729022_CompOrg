module final (clk,opcode,dr,sa,sb,constant_in,data_in,ad_out,data_out,op,r0,r1,r2,r3,r4,r5,r6,r7);
input [7:0] data_in,constant_in;
input clk ;
input [2:0] dr,sa,sb;
input [6:0] opcode;
output [7:0] ad_out,data_out,op,r0,r1,r2,r3,r4,r5,r6,r7;
wire [2:0] DA,AA,BA;
wire MB,MD,RW,MW,PL,JB,BC;
wire [3:0] FS;
datapath u_datapath(
	.RW(RW),
	.clk(clk),
	.MB(MB),
	.MD(MD),
	.DA(DA),
	.AA(AA),
	.BA(BA),
	.FS(FS),
	.data_in(data_in),
	.const_in(constant_in),
	.ad_out(ad_out),
	.data_out(data_out),
	.op(op),
	.r0(r0),
	.r1(r1),
	.r2(r2),
	.r3(r3),
	.r4(r4),
	.r5(r5),
	.r6(r6),
	.r7(r7),
);
decoder u_decoder(
	.opcode(opcode),
	.dr(dr),
	.sa(sa),
	.sb(sb),
	.DA(DA),
	.AA(AA),
	.BA(BA),
	.MB(MB),
	.MD(MD),
	.MW(MW),
	.FS(FS),
	.PL(PL),
	.JB(JB),
	.BC(BC),
	.RW(RW),
);
endmodule
	
