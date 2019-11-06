module debouncer(in,clk,reset,out);
	parameter sim=1'b0;
	input in,clk,reset;
	output out;
	
/** 控制器 **/
	wire timer_clr,timer_done;
	control_button control_button_inst(
		.clk(clk),
		.in(in),
		.reset(reset),
		.timer_clr(timer_clr),
		.timer_done(timer_done),
		.out(out));
		
		
/** 分频器 **/
	wire pulse1kHz;
	
	counter_n #(.n(sim?32:10**5),.counter_bits(sim?5:17)) Div(
		  .clk(clk),
		  .r(1'b0),
		  .en(1'b1),
		  .co(pulse1kHz),
		  .q());
		  
/** 定时器 **/	  
	timer #(.n(10),.counter_bits(4)) TimerInst(
		  .clk(clk),
		  .r(timer_clr),
		  .en(pulse1kHz),
		  .done(timer_done));
		  
endmodule
	