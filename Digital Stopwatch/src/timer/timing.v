module timing(en,clk,clr,q0,qs,qm);
	input en,clk,clr;
	output[3:0] q0,qm;
	output[7:0] qs;
	
	wire co1,co2;
	
/** 十进制 精度0.1s  **/
	
	counter_n #(.n(10),.counter_bits(4)) time_d0(
		  .clk(clk),
		  .r(clr),
		  .en(en),
		  .co(co1),
		  .q(q0));
		  
/** 60进制BCD  精度1s   **/

	BCD_60 BCD_60_inst(
		  .clk(clk),
		  .r(clr),
		  .en(co1),
		  .co(co2),
		  .q(qs));
		  
/** 十进制 精度1min **/	  
	counter_n #(.n(10),.counter_bits(4)) time_d3(
		  .clk(clk),
		  .r(clr),
		  .en(co2),
		  .co(),
		  .q(qm));
		  
endmodule