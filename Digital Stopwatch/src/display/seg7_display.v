module seg7_display(
  input[3:0] d0,d1,d2,d3,
  input scan,
  input clk,
  output reg[6:0] a_g,
  output dp,
  output reg[3:0] pos);
  
  wire[1:0] sel;
  reg[3:0] din;
  
  
  assign dp=pos[1];  // 不显示小数点
/** 计数器 **/

counter_n #(.n(4),.counter_bits(2)) count4(
	  .clk(clk),
	  .r(1'b0),
	  .en(scan),
	  .co(),
	  .q(sel));


/** 选出当前显示的BCD码 **/

  always @(*)
    begin
	  case(sel)
	   0: din=d3;
	   1: din=d2;
	   2: din=d1;
	   3: din=d0;
	  endcase
	end
	
/** 2-4译码 数码管选择 **/
  always @(*) 
    begin
	  case(sel)
	   0: pos=4'b0111;
	   1: pos=4'b1011;
	   2: pos=4'b1101;
	   3: pos=4'b1110;
      endcase
    end
	
/** BCD码对应数码管 **/
  always @(*)
    begin
      case(din)
	   0:   a_g=7'b0000001;
	   1:   a_g=7'b1001111;
	   2:   a_g=7'b0010010;
	   3:   a_g=7'b0000110;
	   4:   a_g=7'b1001100;
  	   5:   a_g=7'b0100100;
	   6:   a_g=7'b0100000;
	   7:   a_g=7'b0001111;
	   8:   a_g=7'b0000000;
	   9:   a_g=7'b0000100;
	   default: a_g=7'b1111111;
     endcase
    end
	
	

endmodule