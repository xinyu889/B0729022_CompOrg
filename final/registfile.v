module registfile (ip,L,s,sa,sb,opa,opb,clk,r0,r1,r2,r3,r4,r5,r6,r7);
input L,clk;
input [2:0] s,sa,sb;
input [7:0] ip;
output [7:0] opa,opb;
output reg [7:0] r0,r1,r2,r3,r4,r5,r6,r7;
reg [7:0] opa,opb;
always@(posedge clk)begin
	case(s)
		3'b000:r0<=(L)?ip:r0;
		3'b001:r1<=(L)?ip:r1;
		3'b010:r2<=(L)?ip:r2;
		3'b011:r3<=(L)?ip:r3;
		3'b100:r4<=(L)?ip:r4;
		3'b101:r5<=(L)?ip:r5;
		3'b110:r6<=(L)?ip:r6;
		3'b111:r7<=(L)?ip:r7;
	endcase
end
always@(*)begin
	case(sa)
		3'b000:opa=r0;
		3'b001:opa=r1;
		3'b010:opa=r2;
		3'b011:opa=r3;
		3'b100:opa=r4;
		3'b101:opa=r5;
		3'b110:opa=r6;
		3'b111:opa=r7;
	endcase
	case(sb)
		3'b000:opb=r0;
		3'b001:opb=r1;
		3'b010:opb=r2;
		3'b011:opb=r3;
		3'b100:opb=r4;
		3'b101:opb=r5;
		3'b110:opb=r6;
		3'b111:opb=r7;
	endcase
end
endmodule
