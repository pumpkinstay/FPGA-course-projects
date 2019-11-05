module ModeComparator(a,b,m,y);
  output[7:0] y;
  input[7:0] a,b;
  input m;
  
  	// compare a and b 
	wire agb;
	comp #(.n(8)) comp_inst(
		.a(a), 
		.b(b), 
		.agb(agb), 
		.aeb(),
		.alb());
	// Xnor gate to get addr 
	wire addr;
	assign addr=~(m^agb);
	
	// the instance of data selector
	
	mux_2to1 #(.n(8)) mux(
		.out(y),
		.in0(a),
		.in1(b),
		.addr(addr));
endmodule 