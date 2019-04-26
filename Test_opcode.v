module testopcode;
wire reg_WE,data_WE;
reg [5:0]opcode1;
wire [5:0]opcode;
wire [5:0]opcode2;
reg clk;

opcode_decoder op1(reg_WE,data_WE,opcode1,opcode,opcode2,clk);
initial
begin
clk=1;
forever #5 clk=~clk;
end
initial
begin
opcode1 <=6'b1;
#10
opcode1 <=6'b110;
#10
opcode1<= 6'b11;
#10
opcode1 <=6'b100;
end
endmodule
