`timescale 1ns / 1ps


module tb_SD;

       logic clk;    
       logic reset;   
       logic in_bit;  
       logic detected;


    SequenceDetector dut (   
        .clk(clk),    
        .reset(reset),   
        .in_bit(in_bit),  
        .detected(detected)                
        );
        
        
            initial clk = 0;
           always #5 clk = ~clk;
           
           
            initial begin
        // Initialize inputs
        reset = 1;
        in_bit = 0;

        #10 reset = 0;

        #10 in_bit = 1; // 10ns
        #10 in_bit = 1; // 20ns
        #10 in_bit = 0; // 30ns
        #10 in_bit = 1; // 40ns
        #10 in_bit = 1; // 10ns
        #10 in_bit = 0; // 20ns
        #10 in_bit = 0; // 30ns
        #10 in_bit = 1; // 40ns
        #10 in_bit = 1; // 10ns
        #10 in_bit = 1; // 20ns
        #10 in_bit = 0; // 30ns
        #10 in_bit = 1; 


        #50 $stop;
    end
           
           
           
endmodule