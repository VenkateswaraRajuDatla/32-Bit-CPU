module counter( clock, incA, reset, addrA);
input clock;
input reset;
input incA;
output [2:0] addrA;
reg [2:0] addrA;
//wire incA;
//wire reset;

//wire clock;

always@(posedge clock)
begin
//addrA <= 3'b000;
if(reset == 1'b1)
begin
addrA <= 3'b000;
end
else if(incA == 1'b1 && reset ==0)
begin
addrA <= addrA + 3'b001;
end

end
endmodule
