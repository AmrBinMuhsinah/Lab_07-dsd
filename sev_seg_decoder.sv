module seven_seg_decoder(input  wire [3:0] bin,output reg  [6:0] seg);
logic w,x,y,z;

assign w = bin[3];
assign x = bin[2];
assign y = bin[1];
assign z = bin[0];

assign seg[0] = (~w&x&~y&~z) | (~w&~x&~y&z) | (w&x&~y&z) | (w&~x&y&z);
assign seg[1] = (w&x&~z) | (w&y&z) | (~w&x&~y&z) | (x&y&~z);
assign seg[2] = (~w&~x&y&~z) | (w&x&~y&~z) | (w&x&y);
assign seg[3] =(~w&~x&~y&z) | (~w&x&~y&~z) | (w&~x&y&~z) | (x&y&z);
assign seg[4] = (~w&z) | (~w&x&~y&~z) | (w&~x&~y&z);
assign seg[5] = (~w&~x&y) | (~w&~x&~y&z) | (~w&x&y&z) | (w&x&~y&z);
assign seg[6] = (~w&~x&~y) | (w&x&~y&~z) | (~w&x&y&z);

endmodule
