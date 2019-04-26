module ALU(RS1,RS2,OPC,ALU_OUT,ALU,Jump,clock);
input [31:0]RS1;
input [31:0]RS2;
input [5:0]OPC;
input clock;
output [31:0]ALU_OUT;
output [31:0]ALU;
output Jump;
reg [31:0]ALU_OUT;
reg [31:0]ALU;
reg Jump;
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

always @(*)
begin
case(OPC)

NOP : ALU_OUT <= ALU_OUT;
ADD : ALU_OUT <= RS1 + RS2;
SUB : ALU_OUT <=  RS1 - RS2;
STORE : ALU_OUT <= RS1 + RS2; //ALU_OUT=rd+IMMVAL - mux wilchoose accoridngly - SEND THIS AS A DDRESS TO DATA MEMORY
LOAD : ALU_OUT <= RS1 + RS2; //rs1 + IMMVALUE (mux to select)
MOVE : ALU_OUT <= RS1;
SGE : ALU_OUT <= RS1>=RS2;
SLE : ALU_OUT <= RS1<=RS2;
SGT : ALU_OUT <= RS1>RS2;
SLT : ALU_OUT <= RS1<RS2;
SEQ : ALU_OUT <= RS1==RS2;
SNE : ALU_OUT <= RS1!=RS2;
AND : ALU_OUT <= RS1 & RS2;
OR : ALU_OUT <=RS1||RS2;
XOR : ALU_OUT <= RS1 ^ RS2;
NOT : ALU_OUT <= ~RS1;
MOVEI : ALU_OUT <= RS1;
SLI : ALU_OUT <= RS1 <<RS2;//MUXTO SELECT BETWEEN IMMVALUE AND RS2.
SRI : ALU_OUT <= RS1>>RS2;//MUXTO SELECT BETWEEN IMMVALUE AND RS2.
ADDI: ALU_OUT <= RS1+RS2;//MUXTO SELECT BETWEEN IMMVALUE AND RS2.
SUBI : ALU_OUT <= RS1-RS2; //MUXTO SELECT BETWEEN IMMVALUE AND RS2.

endcase

if(OPC==JUMP)
begin
Jump<=1;
end
end



always @(posedge clock)
begin
ALU<=ALU_OUT;
end
endmodule
