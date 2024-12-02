`timescale 1ns / 1ps

module DigLock_T4(
    input logic clk,
    input logic reset_n,
    input logic [3:0] in, 
    output logic [2:0] fail_count,
    output logic z
);

    typedef enum logic [1:0] {
        C,         
        O,         
        Failed     
    } state_t;

    state_t p_state, n_state;
    logic [2:0] counter;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            p_state <= C; 
        else
            p_state <= n_state; 
    end

    always_comb begin
        case (p_state)
            C: begin
                if (in == 4'b1101) 
                    n_state = O; 
                else if (fail_count == 2)
                    n_state = Failed; 
                else
                    n_state = C; 
            end

            O: begin
                n_state = C; 
            end

            Failed: begin
                if (counter == 4)
                    n_state = C; 
                else
                    n_state = Failed; 
            end

            default: n_state = C; 
        endcase
    end

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            fail_count <= 3'b0; 
            counter <= 3'b0;    
        end else begin
            case (p_state)
                C: begin
                    if (in != 4'b1101 && fail_count < 3)
                        fail_count <= fail_count + 1; 
                    if (fail_count == 3)
                        fail_count <= 0; 
                end

                  Failed: begin
                    if (counter == 4)
                        counter <= 3'b0; 
                    else
                        counter <= counter + 1;
                end
                

                default: ; 
            endcase
        end
    end

    
    assign z = (p_state == O); 

endmodule
