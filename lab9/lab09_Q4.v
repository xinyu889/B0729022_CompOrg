module lab09_Q4(A,B,C,D,Q);
	input [7:0] A ;
	input [7:0] B ;
	input [7:0] C ;
	input [7:0] D ;
	output [7:0] Q ;
	reg [7:0] tmp1 ;
	reg [7:0] tmp2 ;
	
	always @(*) begin
		if(A > B)
			tmp1 = A - B ;
		else
			tmp1 = B - A ;
		if(C > D)
			tmp2 = C - D ;
		else
			tmp2 = D - C ;
		tmp1 = tmp1 + tmp2 ;
	end
		assign Q = tmp1 ;

endmodule 
