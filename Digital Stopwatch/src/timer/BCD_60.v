module BCD_60(clk,r,en,co,q);

	parameter n=90;   // 60_BCD = 0110_0000=(90)10
	input clk,r,en;
	output reg[7:0] q;
	output co;
	
	assign co=(q==(n-1))&en;
	
	always @(posedge clk)
		begin 
			if(r) q=0;
			else if(en)
				begin 
				  if(q==(n-1)) q=0;
				  else if(q[3:0]==9)
					begin
					  q[3:0]=0;
					  q[7:4]=q[7:4]+1;
					end
				  else q[3:0]=q[3:0]+1;
				end
			else q=q;
		end
endmodule 
