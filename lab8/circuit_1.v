module circuit_1(data_out,clock,data_in,sel,l_load);
	input [7:0] data_in;
	input sel;
	input l_load;
	input clock;
	output [7:0] data_out;
	
	wire [7:0] reg_out;
	wire [7:0] mux_out;
	wire [7:0] add_out;
	
	adder u_ADD(
		.a(data_in),
		.b(reg_out),
		.sum(add_out)
	);
	
	mux_2 u_MUX(
		.d_0(0),
		.d_1(add_out),
		.d(sel),
		.dout(mux_out)
	);
	
	register u_reg(
		.clk(clock),
		.load(l_load),
		.load_data(mux_out),
		.data(reg_out)
	);
	assign data_out=reg_out;
endmodule

