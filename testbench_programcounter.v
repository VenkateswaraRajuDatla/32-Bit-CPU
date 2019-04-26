
module test_programcounter;
reg clock;
reg reset;

wire [31:0] addrA;

initial
begin
clock=1;
forever #5 clock=~clock;
end

initial
begin
reset=1;
#20
reset=0;
end


programcounter c1 (.clock(clock), .reset(reset), .addrA(addrA));
endmodule
