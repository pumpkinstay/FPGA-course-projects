module control_button(in,clk,reset,timer_done,timer_clr,out);
	parameter LOW=0,WAIT_HIGH=1,HIGH=2,WAIT_LOW=3;
	input in,clk,reset,timer_done;
	output reg timer_clr,out;
	reg[1:0] state,nextstate;
	
	always @(posedge clk)
		if(reset) state=LOW;else state=nextstate;
		
	always @(*)
	  begin 
		timer_clr=1;out=0;  // default value
		case(state)
			LOW: 	begin
						if(in) nextstate=WAIT_HIGH;
						else nextstate=LOW;
					end
			WAIT_HIGH: begin 
						 timer_clr=0;out=1;
						 if(timer_done)  nextstate=HIGH;
						 else nextstate=WAIT_HIGH;
					   end
			HIGH:   begin 
					  timer_clr=1;out=1;
				    	if(!in) nextstate=WAIT_LOW;
				      else nextstate=HIGH;
				    end
			WAIT_LOW:  begin 
					     timer_clr=0;out=1;
					     if(timer_done) nextstate=LOW;
				         else nextstate=WAIT_LOW;
					   end
		endcase 
	  end

endmodule 