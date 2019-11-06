module dffre(d,en,r,clk,q);
  parameter n=1;
  input en,r,clk;
  input[n-1:0] d;
  output reg[n-1:0] q; 
	always @(posedge clk)
	  if(r) q={n{1'b0}};   // Synchronous zero
	  else if(en) q=d;     // when en=1,r=0
	    else q=q; 		   // state maintence
endmodule 