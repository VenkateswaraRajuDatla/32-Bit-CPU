module instruction_memory_haz(dataout,address,clock);

input[31:0] address;
output reg[31:0] dataout;
reg[31:0] SRAM[24:0];
input clock;

parameter R0 = 5'b0;
parameter R1 = 5'b01;
parameter R2 = 5'b10;
parameter R3 = 5'b11;
parameter R4 = 5'b100;
parameter R5 = 5'b101;
parameter R6 = 5'b110;


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
	
        
        SRAM[32'b00]  = {LOAD,R0,R1,16'b1100100};
	SRAM[32'b01]  = {NOP,26'b0};
        SRAM[32'b10]  = {SLI,R1,R2,16'b1};
        SRAM[32'b11]  = {ADD,R1,R2,R3,11'b0};
        SRAM[32'b100]  = {SRI,R1,R4,16'b101};
	SRAM[32'b101] = {BRA,R1,5'b1,16'b110};
        SRAM[32'b110] = {STORE,R2,R0,16'b11001000};
        SRAM[32'b111] = {ADDI,R3,R5,16'b1};
	SRAM[32'b1000] = {SUBI,R4,R6,16'b1};
        SRAM[32'b1001] = {JUMP,26'b1101};
	SRAM[32'b1010] = {NOP,26'b0};
	SRAM[32'b1011] = {SUBI,R3,R5,16'b1};
	SRAM[32'b1100] = {ADDI,R4,R6,16'b1};
	SRAM[32'b1101] = {STORE,R5,R0,16'b11001001};
	SRAM[32'b1110] = {STORE,R6,R0,16'b11001010};
				
end

always@(address)
begin
 dataout = SRAM[address];
end



endmodule
