module Mux ( mux0, mux1, MBD, muxout ) ;
     input  [7:0] mux0, mux1 ;
     input        MBD ;
     output [7:0] muxout ;
assign muxout = ( MBD == 1 )? mux1 : mux0 ;

endmodule 
