`timescale 10ps/1ps;
module RegFiletest;
wire [31:0]dout1;
wire [31:0]dout2;
wire [31:0]dout3;
wire [31:0]dout1_out;
wire [31:0]dout2_out;
reg [31:0]din;
reg [4:0]addr1;
reg [4:0]addr2;
reg [4:0]addr3;
reg We,clk;
RegisterFile m(dout1,dout2,dout3,addr1,addr2,addr3,din,dout1_out,dout2_out,We,clk);
initial
begin
clk=1;
forever #5 clk=~clk;
end
initial
begin
#10
We=1;
addr3=5'b00011;
din=32'b10101010010101011111111111110000;
#10
We=0;
addr1=5'b00001;
#10
addr2=5'b00010;
#10
addr3=5'b00011;
end
endmodule
