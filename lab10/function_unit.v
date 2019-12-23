module function_unit( A, B, FS, V, C, N, Z, F );

	input [7:0]A ;
	input [7:0]B ;
	input [3:0]FS ;
	output V ;
	output C ;
	output N ;
	output Z ;
	output [7:0]F ;

	
	reg V,C,N,Z;
	reg [7:0] a,b,f;
	reg [1:0] U;
assign F=f;

always @(*) begin
	a<=8'b00000000;
	b<=8'b00000000;
	f<=8'b00000000;
	U[0]<=FS[0];
	U[1]<=FS[1];
	if(~FS[3])
		a<=A;
	if((~FS[2])&FS[1])
		b<=B;
	if(FS[2]&(~FS[1]))
		b<=~B;
	if(FS[2]&FS[1])
		b<=8'b11111111;
	if(FS[3])
	begin
		case (U)
			2'b00:f <= A&B;
			2'b01:f <= A|B;
			2'b10:f <= ((~A)&B)|(A&(~B));
			2'b11:f <= ~A;
		endcase
	end
		else
		f<=a+b+FS[0];

	if(A[7]==1&B[7]==1)
		C<=1;
	else
		C<=0;
	if(f[7]==1)
		N<=1;
	else
		N<=0;
	if((~f[7]&C)|(f[7]&~C))
		V<=1;
	else
		V<=0;
	Z<=1;
end

endmodule	
