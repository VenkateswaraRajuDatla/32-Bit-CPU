module instreg (RS1,RS2,RD,OPC,IMMVALUE,JUMPI,RSVALUE,dataout,clock);
input [31:0]dataout;
input clock;
output reg [4:0]RS1;
output reg [4:0]RS2;
output reg [4:0]RD;
output reg [5:0]OPC;
output reg [15:0]IMMVALUE;
output reg [25:0]JUMPI;
output reg [4:0]RSVALUE;
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

//inst_memory i2(.dataout(dataout));

always@(posedge clock)
begin

OPC = dataout[31:26];

if(OPC == ADD || OPC==SUB || OPC==SGE ||OPC==SLE || OPC==SGT ||OPC==SLT ||OPC==SEQ ||OPC==SNE ||OPC==AND ||OPC ==OR || OPC==XOR)
begin
RS1 = dataout[25:21];
RS2 = dataout[20:16];
RD = dataout[15:11];
end

else if ( OPC ==LOAD || OPC==SLI ||OPC==SRI || OPC==ADDI || OPC ==SUBI || OPC ==MOVEI )
begin
IMMVALUE = dataout[15:0];
RD = dataout[20:16];
RS1 = dataout[25:21];
end

else if( OPC ==MOVE || OPC==NOT)
begin
RD = dataout[20:16];
RS1 = dataout[25:21];
end

else if (OPC==JUMP)
begin
JUMPI = dataout[25:0];
end

else if(OPC == STORE )
    begin
    RS2  = dataout[20:16];
    RS1 <= dataout[25:21];
    RD <=  5'b11111; 
    IMMVALUE = dataout[15:0];
    end
else if (OPC==BRA)
begin
RS1 = dataout[25:21];
RSVALUE = dataout [20:16];
end

end
endmodule
