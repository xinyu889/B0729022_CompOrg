module lab08_2(X,Y,A,B,clk);
	input X;
	input clk;
	output Y;
	output A;
	output B;
	reg A,B,Y;
	always@(posedge clk)begin
		case({A,B,X})
			3'b000: 
				begin 
					A<=1'b0;
					B<=1'b0;
				end
			3'b001: 
				begin 
					A<=1'b0;
					B<=1'b1;
				end
			3'b010: 
				begin 
					A<=1'b0;
					B<=1'b0;
				end
			3'b011: 
				begin 
					A<=1'b1;
					B<=1'b1;
				end
			3'b100: 
				begin 
					A<=1'b0;
					B<=1'b0;
				end
			3'b101: 
				begin 
					A<=1'b1;
					B<=1'b0;
				end
			3'b110: 
				begin 
					A<=1'b0;
					B<=1'b0;
				end
			3'b111: 
				begin 
					A<=1'b1;
					B<=1'b0;
				end
		endcase
	end
	
always @(*)begin
	case({A,B,X})
		3'b000: Y=1'b0;
		3'b001: Y=1'b0;
		3'b010: Y=1'b1;
		3'b011: Y=1'b0;
		3'b100: Y=1'b1;
		3'b101: Y=1'b0;
		3'b110: Y=1'b1;
		3'b111: Y=1'b0;	
	endcase
end

endmodule

