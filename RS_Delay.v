module RS1_delay(RS1,RS1_d1,RS1_d2,RS1_d3,clock);
input [4:0]RS1;
output [4:0]RS1_d1;
output [4:0]RS1_d2;
output [4:0]RS1_d3;
input clock;
reg [4:0]RS1_d1;
reg [4:0]RS1_d2;
reg [4:0]RS1_d3;

always@(posedge clock)
begin
RS1_d1<=RS1;
end

always@(posedge clock)
begin
RS1_d2<=RS1_d1;
end

always@(posedge clock)
begin
RS1_d3<=RS1_d2;
end

endmodule
