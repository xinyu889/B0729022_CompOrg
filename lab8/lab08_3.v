module lab08_3(X,T,clk,S);
	input X,T,clk;
	output [1:0] S;
	reg [1:0] S;
	
	always @(posedge clk)begin
		case(S)
			2'b00:
				begin
					if(X==1)
						S<=2'b00;
					else
						S<=2'b01;
				end
			2'b01: S<=(T)?	2'b10:2'b01;
			2'b10: S<=2'b11;
			2'b11: S<=2'b00;
		endcase
	end
	
endmodule
