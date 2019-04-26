module RD_delay(RD,RD_d1,RD_d2,RD_d3,clock);
input [4:0]RD;
output [4:0]RD_d1;
output [4:0]RD_d2;
output [4:0]RD_d3;
input clock;
reg [4:0]RD_d1;
reg [4:0]RD_d2;
reg [4:0]RD_d3;

always@(posedge clock)
begin
RD_d1<=RD;
end

always@(posedge clock)
begin
RD_d2<=RD_d1;
end

always@(posedge clock)
begin
RD_d3<=RD_d2;
end

endmodule
