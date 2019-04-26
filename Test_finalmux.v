module finaltestmux;

reg [31:0]RS1;
reg [31:0]IMMVAL;
reg [31:0]DOUT_DM;
reg [31:0]ALUOUT;
reg [5:0]OPC;
wire [31:0]MUX_OUT;
reg clock;

finalmux f(MUX_OUT, RS1,IMMVAL,DOUT_DM,ALUOUT,OPC,clock);

initial
begin
clock=1;
forever #5 clock=~clock;
end

initial
begin

RS1 = 32'b01;
IMMVAL = 32'b10;
DOUT_DM = 32'b11;
ALUOUT = 32'b101;

OPC = 6'b101;

#20

OPC = 6'b10000;

#20

OPC = 6'b100;

#20

OPC = 6'b1100;

end
endmodule
