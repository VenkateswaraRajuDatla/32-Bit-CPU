`timescale 10ps/1ps;
module DataMemorytest;
wire [31:0]dout;
reg [31:0]din;
reg [31:0]addr;
reg We,clk;
reg [5:0]OPC;

DataMemory m(dout,din,addr,OPC,We,clk);

initial
begin
clk=1;
forever #5 clk=~clk;
end
initial
begin
OPC = 6'b100;
We=1;
addr=32'b1;
din=32'b10;
#10
We=0;
addr=32'b1;
end
endmodule
