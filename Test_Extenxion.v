module Test_Extension;
wire[31:0] immval_out;
reg[15:0] immval_in;
wire [31:0]IMM_VALUE;
reg clock;
extension e(immval_out,immval_in,IMM_VALUE,clock);
initial
begin
clock=1;
forever #5 clock=~clock;
end

initial
begin
immval_in=16'b11;
end
endmodule