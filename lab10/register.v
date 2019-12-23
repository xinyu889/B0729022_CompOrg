module register ( DA, AA, BA, RW, D, Clk, A, B, r0, r1, r2, r3, r4, r5, r6, r7 );
     input  [2:0] DA, AA, BA ;
     input        RW, Clk ;
     input  [7:0] D ;
     output [7:0] A, B, r0, r1, r2, r3, r4, r5, r6, r7 ;
     reg    [7:0] A, B, r0, r1, r2, r3, r4, r5, r6, r7 ;
always @( posedge Clk ) begin
   if( RW == 1 ) begin
      case(DA)
         3'b000: r0 <= D ;
         3'b001: r1 <= D ;
         3'b010: r2 <= D ;
         3'b011: r3 <= D ;
         3'b100: r4 <= D ;
         3'b101: r5 <= D ;
         3'b110: r6 <= D ;
         3'b111: r7 <= D ;
      endcase
   end
end

always @(*) begin
   case(AA)
      3'b000: A <= r0 ;
      3'b001: A <= r1 ;
      3'b010: A <= r2 ;
      3'b011: A <= r3 ;
      3'b100: A <= r4 ;
      3'b101: A <= r5 ;
      3'b110: A <= r6 ;
      3'b111: A <= r7 ;
   endcase

   case(BA)
      3'b000: B <= r0 ;
      3'b001: B <= r1 ;
      3'b010: B <= r2 ;
      3'b011: B <= r3 ;
      3'b100: B <= r4 ;
      3'b101: B <= r5 ;
      3'b110: B <= r6 ;
      3'b111: B <= r7 ;
   endcase
end

endmodule 
