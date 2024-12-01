`timescale 1ns / 1ps

module tb_Odd_Even;

  
  logic clk;
  logic reset_n;
  logic in;
  logic [1:0] z;

  Odd_Even uut (
    .clk(clk),
    .reset_n(reset_n),
    .in(in),
    .z(z)
  );

  
  always begin
    #5 clk = ~clk;  
  end

  
  initial begin
    
    clk = 0;
    reset_n = 0;
    in = 0;
    
    #10 reset_n = 1; 
    
    in = 0; #10;  
    in = 1; #10;  
    in = 0; #10;  
    in = 1; #10;  
    
    in = 0; #10;  
    in = 0; #10;  
    in = 1; #10;  
    in = 0; #10;  
    
  
    
    
    $finish;
  end


endmodule
