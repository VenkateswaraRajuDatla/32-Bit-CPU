module RS2_delay(RS2,RS2_d1,RS2_d2,RS2_d3,clock);
input [4:0]RS2;
output [4:0]RS2_d1;
output [4:0]RS2_d2;
output [4:0]RS2_d3;
input clock;
reg [4:0]RS2_d1;
reg [4:0]RS2_d2;
reg [4:0]RS2_d3;

always@(posedge clock)
begin
RS2_d1<=RS2;
end

always@(posedge clock)
begin
RS2_d2<=RS2_d1;
end

always@(posedge clock)
begin
RS2_d3<=RS2_d2;
end

endmodule
