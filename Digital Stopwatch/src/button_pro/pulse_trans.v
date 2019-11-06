module pulse_trans(in,clk,out);

	input in,clk;
	output out;
	
	wire q;
	
	dffre #(.n(1)) tran_ff(
		  .d(in),
		  .en(1'b1),
		  .r(1'b0),
		  .clk(clk),
		  .q(q));
		  
	assign out=in&&(!q);
	
endmodule