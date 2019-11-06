module timer(clk,r,en,done);
  parameter n=10;      // time 
  parameter counter_bits=4;
  input clk,r,en;
  output done;
  reg[counter_bits-1:0] q=0;
    assign done=en&&(q==(n-1)); // the end of time
	always @(posedge clk)
	  begin 
	    if(r) q=0;    			// Synchronous zero
		else if(en)  q=q+1;     // counting when en=1
		else q=q;  	  		    // state maintence when en=0
	  end
endmodule 