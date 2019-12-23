module data_path ( Data_in, Clk, V, C, N, Z, R0, R1, R2, R3, R4, R5, R6, R7, state, start );
     input  [7:0] Data_in ;
     input        Clk, start ;
     output [3:0] state ;
     output       V, C, N, Z ;
     output [7:0] R0, R1, R2, R3, R4, R5, R6, R7 ;
     reg    [15:0]Y ;
     reg    [7:0] DI ;
     reg    [3:0] state ;
     wire   [7:0] MB_out, MD_out, A, B, F ;
register Reg(
     .DA   ( Y[15:13] ),
     .AA   ( Y[12:10] ),
     .BA   ( Y[9:7] ),
     .RW   ( Y[0] ),
     .D    ( MD_out ),
     .Clk  ( Clk ),
     .A    ( A ),
     .B    ( B ),
     .r0   ( R0 ),
     .r1   ( R1 ),
     .r2   ( R2 ),
     .r3   ( R3 ),
     .r4   ( R4 ),
     .r5   ( R5 ),
     .r6   ( R6 ),
     .r7   ( R7 )
) ;
Mux mux_B(
     .mux0   ( B ), 
     .mux1   ( 0 ),
     .MBD    ( Y[6] ),
     .muxout ( MB_out )
) ;
function_unit function_out(
     .A   ( A ),
     .B   ( MB_out ),
     .FS  ( Y[5:2] ),
     .V   ( V ),
     .C   ( C ),
     .N   ( N ),
     .Z   ( Z ),
     .F   ( F )
) ;
Mux mux_D(
     .mux0   ( F ), 
     .mux1   ( DI ),
     .MBD    ( Y[1] ),
     .muxout ( MD_out )
) ;

always @( posedge Clk ) begin
   Y<=16'b0000000000000000;
   case(state)
      4'b0000:
	     begin
		 if( start == 1 ) begin
		    Y <= 16'b0010000000000011 ;
			DI <= Data_in ;
			state <= 4'b0001 ;
		 end
	  end
	  4'b0001:
         begin
			Y <= 16'b0100000000000011 ;
			DI <= Data_in ;
			state <= 4'b0010 ;
			end
	  4'b0010:
			begin
			Y <= 16'b0110000000000011 ;
			DI <= Data_in;
			state <= 4'b0011;
			end		 
      4'b0011:
			begin
			Y <= 16'b1000010100010101 ;
			state <= 4'b0100 ;
			end
	  4'b0100:
			begin
			Y <= 16'b1001000110001001 ;
			state <= 4'b0101 ;
			end
	  4'b0101:
			state <= 4'b0110 ;		 
	  4'b0110:
			begin
			if(R4[0]==1)begin
				Y<=16'b1001000000011001 ;
				state <= 4'b0111 ;
			end
			else
				state <= 4'b0000 ;
			end
	  4'b0111:
			state <= 4'b0000 ;
		 
   endcase
end
endmodule 
