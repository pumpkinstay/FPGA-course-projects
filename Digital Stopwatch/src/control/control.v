module control(in,clk,reset,clr,count);
	parameter RESET=0,TIMING=1,STOP=2;
	input in,clk,reset;
	output reg clr,count;
	reg[1:0] state,nextstate;
	
	always @(posedge clk)
		if(reset) state=RESET;else state=nextstate;
		
	always @(*)
		begin
			clr=1;count=0;		// default value
			case(state)
			
				RESET: 	begin 
							if(in) nextstate=TIMING;
							else nextstate=RESET;
						end
						
				TIMING: begin 
							 clr=0;count=1;
							 if(in)  nextstate=STOP;
							 else nextstate=TIMING;
						end
						
				STOP:   begin 
							clr=0;count=0;
							if(in) nextstate=RESET;
							else nextstate=STOP;
						end
			endcase 
		end
endmodule 