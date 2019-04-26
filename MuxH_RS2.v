module muxh_rs2(alu_cmp2,mem_cmp2,RS2,Dmout,prevALUout,MUX_ALU_IN2);
input [31:0]Dmout;
input [31:0] prevALUout;
input [31:0]RS2;
input alu_cmp2,mem_cmp2;
output [31:0] MUX_ALU_IN2;
reg [31:0]MUX_ALU_IN2;

always@(*)
begin
if(alu_cmp2==1)
MUX_ALU_IN2=prevALUout;
else if(mem_cmp2==1)
MUX_ALU_IN2=Dmout;
else
MUX_ALU_IN2=RS2;
end
endmodule
