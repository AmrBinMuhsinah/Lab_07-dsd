`timescale 1ns / 1ps

module DigLock_A_tb;

 
  logic clk;
  logic reset_n;
  logic [3:0]in;
  logic lock;

  
  DigLock_A uut (
    .clk(clk),
    .reset_n(reset_n),
    .in(in),
    .z(lock)
  );

 
  always begin
    #5 clk = ~clk;  
  end

  
  initial begin
    
    clk = 0;
    reset_n = 0;
    in = 0;
    
    
    
    #10
      reset_n = 1;
    in = 4'b0100;
    #10
    in=4'b1001;
   #10
    in=4'b0101;
     #10
    in=4'b1101;
    
 
 
 
 
 
  end



endmodule
