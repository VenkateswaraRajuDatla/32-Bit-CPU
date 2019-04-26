module alu_compare(RS1_d1,RS2_d1,RD_d2,alu_cmp1,alu_cmp2);
input [4:0]RS1_d1;
input [4:0]RS2_d1;
input [4:0]RD_d2;
output alu_cmp1;
output alu_cmp2;

reg cmp1,cmp2;

always@(*)
begin
if(RS1_d1==RD_d2)
cmp1=1;
else
cmp1=0;


if(RS2_d1==RD_d2)
cmp2=1;
else
cmp2=0;

end

assign alu_cmp1 = cmp1;
assign alu_cmp2 = cmp2;

endmodule
