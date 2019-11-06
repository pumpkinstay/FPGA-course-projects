实验要求：
设计一个数字秒表电路  
1. 计时范围0’0.0’’~9’59.9’’，分辨率0.1s，用数码管显示计时值；   
2. 秒表设有一个功能按键开关ButtonIn.  
  电路起始是处于“初始”状态时，通过第一次按键，开始自动地计时；  
  再次按键，停止计时；  
  第三次按键，计数器自动复位为0’0.0’’，回到“初始”状态。  

running on Basys3 development board.  
src: verilog source file, including testbench file(xxx_tb.v) (simulation with modelsim)  
vivado: integration with vivado  
___

Experimental Task:  
Design a digital stopwatch circuit:
1. The timing range: 0'0.0''~9'59.9'', resolution is 0.1s, and the timing value is displayed by the digital tube;
2. The stopwatch has a function button —— ButtonIn.  
The circuit starts in the "initial" state;    
press the button for the first time, timing begins; press the button again to stop the timing;   
the third time, the counter is reset to 0'0.0'', and returns to the "initial" state.
