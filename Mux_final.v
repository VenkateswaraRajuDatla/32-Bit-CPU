module finalmux(MUX_OUT, RS1,IMMVAL,DOUT_DM,ALUOUT,OPC,clock);
input [31:0]RS1;
input [31:0]IMMVAL;
input [31:0]DOUT_DM;
input [31:0]ALUOUT;
input [5:0]OPC;
input clock;
output [31:0]MUX_OUT;
reg [31:0]MUX_OUT;
reg [31:0]rs1;
reg [31:0]immval;
reg [31:0]dout_dm;
reg [31:0]aluout;


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

/*always @(posedge clock)
begin
rs1<=RS1;
end

always @(posedge clock)
begin
immval<=IMMVAL;
end

always @(posedge clock)
begin
dout_dm<=DOUT_DM;
end

always @(posedge clock)
begin
aluout<=ALUOUT;
end*/

always@(OPC)
begin
if(OPC == MOVE)
MUX_OUT<=RS1;

else if (OPC==MOVEI)
MUX_OUT<=IMMVAL;

else if(OPC==LOAD)
MUX_OUT<=DOUT_DM;

else
MUX_OUT<=ALUOUT;
end
endmodule
