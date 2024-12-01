`timescale 1ns / 1ps


module Odd_Even(
input logic clk,
input logic reset_n,
input logic in,
output logic [1:0]z

    );
    
   typedef enum logic [2:0]{
   A,B,C,D
   }state_t;
   
   state_t p_state, n_state;
   
   always_ff@(posedge clk, negedge reset_n)
   begin
   
         if (~reset_n)
             p_state<=A;
         else 
         
         p_state<=n_state;    
          
   end
    
    
always @(in,p_state)
begin 

case(p_state)

A:
if (in==1) n_state=B;
else n_state=D;
B:
if (in==0) n_state=C;
else n_state=A;
C:
if (in==1) n_state=D;
else n_state=B;
D:
if (in==0) n_state=A;
else n_state=C;

endcase

end 

always @(p_state)
begin 
z=(p_state==A);

end    
    
endmodule
