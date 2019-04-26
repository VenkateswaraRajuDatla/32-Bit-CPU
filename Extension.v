module extension(immval_out,immval_in,RSVAL_in,RSVAL_out,Jump_in,Jump_out,clock);
output [31:0] immval_out;
input [15:0] immval_in;
input[4:0] RSVAL_in;
input [25:0]Jump_in;
output [31:0]Jump_out;
output [31:0]RSVAL_out;

input clock;

reg [15:0] exten_val=16'b0;
reg [26:0] exten_val2=27'b0;
reg [5:0] exten_val3 =6'b0;
assign immval_out={exten_val,immval_in};
assign RSVAL_out={exten_val2,RSVAL_in};
assign Jump_out ={exten_val3,Jump_in};


endmodule
