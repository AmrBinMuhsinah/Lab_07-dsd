`timescale 1ns / 1ps



module DigLock_A(
input logic clk,
input logic reset_n,
input logic [3:0]in,
output logic [2:0]counter,
output logic [2:0]counter1,
output logic z

    );
    
 typedef enum logic [2:0]{
 A,B,Filed
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

case(p_state)

A: begin
if (in==4'b1101) n_state=B;
else begin
 n_state=Filed;
counter <= counter+1; end 
end
Filed:
begin 
if (counter==2) counter1<=counter+1;
if(counter1==10000000)
n_state=A;
end



endcase
end 

assign z=(p_state==B);

   
 
endmodule
