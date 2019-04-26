module test_alupath;
reg [4:0]RS1_d1;
reg [4:0]RS2_d1;
reg [4:0]RD_d2;
wire alu_cmp1;
wire alu_cmp2;

initial
begin
RS1_d1 <= 5'b01;
RS2_d1 <= 5'b11;
RD_d2 <= 5'b01;
end

//alu_compare ac(RS1_d1,RS2_d1,RD_d2,alu_cmp1,alu_cmp2);
mem_compare m(.RS1_d2(RS1_d1),.RS2_d2(RS2_d1),.RD_d3(RD_d2),.mem_cmp1(alu_cmp1),.mem_cmp2(alu_cmp2));

endmodule
