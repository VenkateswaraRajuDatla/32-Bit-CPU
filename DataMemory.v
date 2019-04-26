module DataMemory(dataout,datain,addressin,OPC,WEA,clock);
output [31:0]dataout;
input [31:0]datain;
input [31:0]addressin;
input  [5:0]OPC;
input WEA,clock;
reg [31:0]SRAM[7:0];
reg [31:0]dataout;
parameter LOAD= 6'b100;

integer i;
initial
begin
for (i =0 ; i<7 ;i=i+1) 
SRAM[i] <= i+32'b001; //values in the reg file
end

always@(posedge clock)
begin
if(WEA==1)
begin
SRAM[addressin]<=datain; //RS from RF for STORE inst-  datain, addressin from ALU-out
end
if (OPC == LOAD && WEA==0)
begin
dataout<=SRAM[addressin]; //for LOAD inst, this dataout goes to reg file as RD
end
end

endmodule
