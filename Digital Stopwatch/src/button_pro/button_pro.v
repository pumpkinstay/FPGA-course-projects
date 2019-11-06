module button_pro(clk,reset,ButtonIn,ButtonOut);
	parameter sim=1'b0;
	input clk,reset,ButtonIn;
	output ButtonOut;
	
/** ͬ����ʵ�� **/
	wire synch_out;

	synchronizer synch_inst(
		.clk(clk),
		.asynch_in(ButtonIn),
		.synch_out(synch_out));
		
/** ������· **/
	wire key_out;
	debouncer #(.sim(sim))  debounc_inst(
		.reset(reset),
		.in(synch_out),
		.clk(clk),
		.out(key_out));
		
/** ����任 **/
	pulse_trans trans_inst(
		.in(key_out),
		.clk(clk),
		.out(ButtonOut));
	
		
endmodule