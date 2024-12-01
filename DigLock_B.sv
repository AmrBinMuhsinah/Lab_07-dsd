`timescale 1ns / 1ps



module DigLock_A(
input logic clk,
input logic reset_n,
input logic [3:0]in,
output logic z

    );
    
 typedef enum logic [1:0]{
 A,B
 }state_t;   
 
 state_t p_state,n_state;
 
 always_ff@(posedge clk, negedge reset_n)
 begin
  
  if (!reset_n)
      p_state<=A;
  else 
  p_state<=n_state;    
  
  end 
  
  always @(in,p_state)
begin 

if (in==4'b1101) n_state=B;
else
n_state=A;

end 


assign z=(p_state==B);

   
 
endmodule