module test_ALU;

reg [31:0]RS1;
reg [31:0]RS2;
reg [5:0]OPC;
wire [31:0]ALU;
wire [31:0]ALU_OUT;
//reg [31:0]RD;
reg clk;

ALU A(RS1,RS2,OPC,ALU_OUT,ALU,clk);

initial
begin
clk=1;
forever #5 clk=~clk;
end
initial
begin
RS1 <= 32'b011;
RS2 <= 32'b001;
OPC <=6'b1; //add
#10
OPC <= 6'b10; //sub
#10
OPC <= 6'b1100; //and
#10
OPC <= 6'b10001; //sli
end
endmodule
