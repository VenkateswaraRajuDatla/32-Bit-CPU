module RD_delay_test;
wire [4:0] RD_d1;
wire [4:0]RD_d2;
wire [4:0]RD_d3;
reg clock;
reg [4:0]RD;

initial
begin
RD<=5'b10011;
end

initial
begin
clock=1;
forever #5 clock=~clock;
end
RD_delay r1(RD,RD_d1,RD_d2,RD_d3,clock);
endmodule
