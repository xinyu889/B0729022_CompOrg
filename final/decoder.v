module decoder(opcode,dr,sa,sb,DA,BA,AA,MB,FS,MD,RW,MW,PL,JB,BC);
input [6:0]opcode;
input[2:0]dr,sa,sb;
output [2:0]DA,BA,AA;
output MB,MD,RW,MW,PL,JB,BC;
output [3:0]FS;
assign DA=dr;
assign BA=sb;
assign AA=sa;
assign MB=opcode[6];
assign FS={opcode[3],opcode[2],opcode[1],(opcode[0]&~(opcode[5]&opcode[6]))};
assign MD=opcode[4];
assign RW=~opcode[5];
assign MW=opcode[5]&~opcode[6];
assign PL=opcode[5]&opcode[6];
assign JB=opcode[4];
assign BC=opcode[0];
endmodule
