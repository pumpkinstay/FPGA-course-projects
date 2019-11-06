`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: zju
// Engineer:qmj
//
// Create Date:   15:54:51 07/31/2012
// Design Name:   timer
// Module Name:   E:/solution/lab30/DESIGN1/ise/timer_tb.v
// Project Name:  TimerTop
//
// Verilog Test Fixture created by ISE for module: timer
////////////////////////////////////////////////////////////////////////////////

module timer_tb_v;

	// Inputs
	reg clk;
	reg clr;
	reg ci;

	// Outputs
	wire co;

	// Instantiate the Unit Under Test (UUT)
	timer  #(.n(12),.counter_bits(4)) uut(
		.clk(clk), 
		.r(clr), 
		.en(ci), 
		.done(co));
   //clk
   always #5 clk=~clk;
	
	//  clr
	initial begin
	   clk = 0;
		clr = 0;
		#16  clr = 1;
		#10  clr = 0; 	end
  	//  ci
	initial begin
	   ci = 0;
	   #5;
     repeat (16)  begin 
	     #(10*3)  ci=1;
	     # 10  ci=0; end
    
     #10 $stop;
 end
  
endmodule

