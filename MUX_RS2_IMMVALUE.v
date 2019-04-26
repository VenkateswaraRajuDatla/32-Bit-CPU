module imux(OPC,RS2_IN,IMM_IN,RESULT);
input [5:0]OPC;
input [31:0]RS2_IN;
input [31:0]IMM_IN;
output [31:0]RESULT;
reg [31:0]RESULT;



parameter NOP = 6'b0;
parameter ADD = 6'b000001;
parameter SUB = 6'b000010;
parameter STORE = 6'b000011; 
parameter LOAD = 6'b000100;
parameter MOVE = 6'b000101;
parameter SGE = 6'b000110;
parameter SLE = 6'b000111;
parameter SGT = 6'b001000;
parameter SLT = 6'b001001;
parameter SEQ = 6'b001010;
parameter SNE = 6'b001011;
parameter AND = 6'b001100;
parameter OR = 6'b001101;
parameter XOR = 6'b001110;
parameter NOT = 6'b001111;
parameter MOVEI = 6'b010000; 
parameter SLI = 6'b010001;
parameter SRI = 6'b010010;
parameter ADDI = 6'b010011;
parameter SUBI = 6'b010100;
parameter JUMP = 6'b010101;
parameter BRA = 6'b010110;

always@(OPC)
begin
if(OPC == ADD || OPC == SUB || OPC == SGE ||OPC == SLE || OPC == SGT ||OPC == SLT ||OPC == SEQ ||OPC == SNE ||OPC == AND ||OPC ==OR || OPC == XOR)
begin
RESULT<=RS2_IN;
end
else if(OPC==STORE || OPC == LOAD || OPC == SLI ||OPC == SRI || OPC==ADDI || OPC ==SUBI || OPC ==MOVEI)
begin
RESULT<=IMM_IN;
end
end
endmodule
