`timescale 1ns / 1ps
        
        
module SequenceDetector(
            
        input logic clk,
        input logic reset,
        input logic in_bit,
        output logic detected,
        output logic [3:0]counter 

        );
       
        
        parameter IDLE = 3'b000,
             S1 = 3'b001,
             S2 = 3'b010,
             S3 = 3'b011,
             S4 = 3'b100;
             
        reg [0:2] current_state, next_state;
        
         always_ff @(posedge clk or negedge reset) begin
             if (!reset)begin
         current_state <= IDLE;
         counter<=0;
        end   else
        current_state <= next_state;
        counter<= counter+1;
         end
        
        always_comb begin
        case (current_state)
      //                          1     0
      IDLE: next_state = in_bit ? S1 : IDLE;
        S1: next_state = in_bit ? S2 : IDLE;
        S2: next_state = in_bit ? S2 : S3;
        S3: next_state = in_bit ? S4 : IDLE;
       
       
        S4: next_state = IDLE;
        
            default: next_state = IDLE;
         endcase
        end
        
             always_comb begin
              detected = (current_state == S4);
           end
           
           
           
           
        endmodule

    
       

