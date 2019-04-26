module mem_compare(RS1_d1,RS2_d1,RD_d3,mem_cmp1,mem_cmp2);
input [4:0]RS1_d1;
input [4:0]RS2_d1;
input [4:0]RD_d3;
output mem_cmp1,mem_cmp2;

reg cmp1,cmp2;

always@(*)
begin
if(RS1_d1==RD_d3)
cmp1=1;
else
cmp1=0;

if(RS2_d1==RD_d3)
cmp2=1;
else
cmp2=0;

end

assign mem_cmp1 = cmp1;
assign mem_cmp2 = cmp2;

endmodule

