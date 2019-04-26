module opcode_decoder(reg_WE,data_WE,opcode1,opcode,opcode2,clk);
input clk;
output reg reg_WE,data_WE;

input [5:0] opcode1;
output reg[5:0] opcode;
output reg [5:0]opcode2;

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



always@(posedge clk)
begin
opcode<=opcode1;
end

/*initial
begin
if( opcode == STORE || opcode == LOAD || opcode == MOVEI ||opcode == SLI || opcode == SRI || opcode == ADDI || opcode == SUBI || opcode == BRA )   
opc_sel = 1;

else
opc_sel=0;
end*/



always@(opcode)
begin

if(opcode ==  ADD || opcode == SUB || opcode == SGE || opcode == SLE || opcode == SGT ||opcode == SLT || opcode == SEQ || opcode == SNE || opcode == AND || opcode == OR
 || opcode == XOR || opcode == SLI || opcode == SRI ||  opcode == ADDI || opcode == SUBI || opcode == MOVE || opcode == NOT || opcode == MOVEI )

reg_WE = 1;

else if (opcode == STORE)  data_WE=1;
else if (opcode == LOAD)   data_WE=0;

end

always@(posedge clk)
begin
opcode2<=opcode;
end

endmodule

