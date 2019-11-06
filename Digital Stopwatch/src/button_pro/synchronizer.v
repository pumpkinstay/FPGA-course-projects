module synchronizer(clk,asynch_in,synch_out);
	input clk,asynch_in;
	output synch_out;
	wire q1;

/** Í¬²½Æ÷ 2¼¶Ëø´æ **/

	dffre #(.n(1)) ff1(
		  .d(asynch_in),
		  .en(1'b1),
		  .r(1'b0),
		  .clk(clk),
		  .q(q1));

	dffre #(.n(1)) ff2(
		  .d(q1),
		  .en(1'b1),
		  .r(1'b0),
		  .clk(clk),
		  .q(synch_out));
endmodule