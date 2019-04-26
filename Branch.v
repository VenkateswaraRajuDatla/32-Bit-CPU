module branch(OPC,BRA_EQ,BRA_NEQ,RS1,RSVAL);
input [31:0]RS1;
input [31:0]RSVAL;
input [5:0]OPC;
output  BRA_EQ;
output BRA_NEQ;

parameter NOTUSED = 11'b0;
parameter NOP = 6'b0;
parameter ADD = 6'b1;
parameter SUB = 6'b10;
parameter STORE = 6'b11;
parameter LOAD= 6'b100;
parameter MOVE = 6'b101;
parameter SGE = 6'b110;
parameter SLE = 6'b111;
parameter SGT = 6'b1000;
parameter SLT = 6'b1001;
parameter SEQ = 6'b1010;
parameter SNE = 6'b1011;
parameter AND = 6'b1100;
parameter OR = 6'b1101;
parameter XOR= 6'b1110;
parameter NOT = 6'b1111;
parameter MOVEI = 6'b10000;
parameter SLI = 6'b10001;
parameter SRI = 6'b10010;
parameter ADDI = 6'b10011;
parameter SUBI = 6'b10100;
parameter JUMP = 6'b10101;
parameter BRA = 6'b10110;
parameter ADDF = 6'b10111;
parameter MULF = 6'b 11000;

reg BRA_EQ;
reg BRA_NEQ;

always @(*)
begin
if((RS1==RSVAL) && (OPC==BRA))
begin
BRA_EQ<=1'b1;
end
else if((RS1!=RSVAL) && (OPC==BRA))
begin
BRA_NEQ<=1'b1;
end
end

endmodule
