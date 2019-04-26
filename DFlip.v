
module DFlipflop(Q,D,clock);
output [31:0]Q;
input [31:0]D;
input clock;
reg [31:0]Q;
always@(posedge clock)
begin
Q<=D;
end
endmodule
