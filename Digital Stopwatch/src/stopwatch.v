module stopwatch(ButtonIn,clk,reset,pos,a_g,dp);
	parameter sim=1'b0;        //便于仿真用的参数
	input reset,clk,ButtonIn;  //输入按键信号和复位信号
	output [6:0] a_g;          //控制七段译码管
	output dp;                 //控制小数点亮暗
	output [3:0] pos;          //控制四个数码管
	
	
	
/** 分频模块 产生400Hz和10Hz脉冲**/
	wire pulse400Hz,pulse10Hz;
	counter_n #(.n(sim?2:12_5000),.counter_bits(sim?1:17)) Div1(
		  .clk(clk),
		  .r(1'b0),
		  .en(1'b1),
		  .co(pulse400Hz),
		  .q());
		  
	counter_n #(.n(sim?10:40),.counter_bits(sim?4:6)) Div2(
		  .clk(clk),
		  .r(1'b0),
		  .en(pulse400Hz),
		  .co(pulse10Hz),
		  .q());
		  
/** 按键处理模块 **/
	wire ButtonOut;
	button_pro #(.sim(sim))  button_pro_inst(
		.clk(clk),
		.reset(reset),
		.ButtonIn(ButtonIn),
		.ButtonOut(ButtonOut));
		
/** 控制模块 **/ 
	wire count,clr;
	control control_inst(
		.clk(clk),
		.in(ButtonOut),
		.reset(reset),
		.count(count),
		.clr(clr));
			  
/** 计时模块 **/
	wire[3:0] q0,qm;
	wire[7:0] qs;
	timing	timer_inst(
		.en(count&&pulse10Hz),
		.clk(clk),
		.clr(clr),
		.q0(q0),
		.qs(qs),
		.qm(qm));


/** 动态显示模块 **/

	seg7_display disp(
		.clk(clk),
		.d0(q0),
		.d1(qs[3:0]),
		.d2(qs[7:4]),
		.d3(qm),
		.scan(pulse400Hz),
		.pos(pos),
		.a_g(a_g),
		.dp(dp));

endmodule