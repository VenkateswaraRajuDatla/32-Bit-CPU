module muxh_rs1(alu_cmp1,mem_cmp1,RS1,Dmout,prevALUout,MUX_ALU_IN1);
input [31:0]Dmout;
input [31:0] prevALUout;
input [31:0]RS1;
input alu_cmp1,mem_cmp1;
output [31:0] MUX_ALU_IN1;
reg [31:0]MUX_ALU_IN1;

always@(*)
begin
if(alu_cmp1==1)
MUX_ALU_IN1=prevALUout;
else if(mem_cmp1==1)
MUX_ALU_IN1=Dmout;
else
MUX_ALU_IN1=RS1;
end
endmodule
