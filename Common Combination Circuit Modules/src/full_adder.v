module  full_adder(a,b,s,ci,co);
   input a,b,ci;   // a plus b    ci is from last adder
   output s,co; // s is sum (1bit)   co is current carry-bit
    assign s=a^b^ci;
    assign co=(a&&b)||(b&&ci)||(ci&&a);

endmodule
