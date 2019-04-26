`include "Instreg.v"
module testbench_instreg();
reg[31:0]dataout;
wire [4:0]RS1;
wire[4:0]RS2;
wire [4:0]RD;
wire [5:0]OPC;
wire [15:0]IMMVALUE;
wire [25:0]JUMPI;
reg clock;
initial
begin
clock = 0;
forever #5 clock=~clock;
end

instreg i(RS1,RS2,RD,OPC,IMMVALUE,JUMPI,dataout,clock);

initial
begin
dataout = 32'b00001011111000001010100000000000;
end

endmodule
