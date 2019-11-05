module comp(a,b,agb,aeb,alb);
  parameter n=1;		 
  input[n-1:0] a,b;    
  output agb,aeb,alb;
	assign agb=(a>b);   //  When a>b  Œagb=1
	assign aeb=(a==b);	//  When a=b  aeb=1
	assign alb=(a<b);	//  When a<b  alb=1
endmodule 