module inst_memory(dataout,address,clock);
output [31:0]dataout;
input [31:0]address;
input clock;
reg [31:0]SRAM[24:0];
reg [31:0]dataout;

//inputs to be given for execution
parameter RS1 = 5'b11;
parameter RS2 = 5'b1;
parameter RD = 5'b10;
parameter IMMVALUE = 16'b1;
parameter JUMPIMM = 26'b01;
parameter RSVALUE = 5'b11111;

//parameters for OPCODE
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

initial
begin
 SRAM[32'b0]<= 32'b0;
 SRAM[32'b1]= {ADD,RS1,RS2,RD,NOTUSED};
 SRAM[32'b10]= {SUB,RS1,RS2,RD,NOTUSED};
 SRAM[32'b11]= {STORE,RS1,RD,IMMVALUE};
 SRAM[32'b100]= {LOAD,RS1,RD,IMMVALUE};
 SRAM[32'b101]= {MOVE,RS1,RD,NOTUSED};
 SRAM[32'b110]= {SGE,RS1,RS2,RD,NOTUSED};//{NOTUSED,RD,RS2,RS1,SGE};
 SRAM[32'b111]= {SLE,RS1,RS2,RD,NOTUSED};
SRAM[32'b1000]= {SGT,RS1,RS2,RD,NOTUSED};
SRAM[32'b1001]= {SLT,RS1,RS2,RD,NOTUSED};
SRAM[32'b1010]= {SEQ,RS1,RS2,RD,NOTUSED};
SRAM[32'b1011]= {SNE,RS1,RS2,RD,NOTUSED};
SRAM[32'b1100]= {AND,RS1,RS2,RD,NOTUSED};
SRAM[32'b1101]= {OR,RS1,RS2,RD,NOTUSED};
SRAM[32'b1110]= {XOR,RS1,RS2,RD,NOTUSED};
SRAM[32'b1111]= {NOT,RS1,RD,16'b0}; //{16'b0,RD,RS1,NOT};
SRAM[32'b10000]={MOVEI,5'b0,RD,IMMVALUE}; //{IMMVALUE,RD,5'b0,MOVEI};
SRAM[32'b10001]={SLI,RS1,RD,IMMVALUE};//{IMMVALUE,RD,RS1,SLI};
SRAM[32'b10010]= {SRI,RS1,RD,IMMVALUE};//{IMMVALUE,RD,RS1,SRI};
SRAM[32'b10011] = {ADDI,RS1,RD,IMMVALUE};//{IMMVALUE,RD,RS1,ADDI};
SRAM[32'b10100]= {SUBI,RS1,RD,IMMVALUE};//{IMMVALUE,RD,RS1,SUBI};
SRAM[32'b10101]=  {JUMP,JUMPIMM};//{JUMPIMM,JUMP};
SRAM[32'b10110]= {BRA,RS1,RSVALUE,IMMVALUE};//{IMMVALUE,5'b111,RS1,BRA};
end

always@(address)
begin
 dataout = SRAM[address];
end



endmodule
