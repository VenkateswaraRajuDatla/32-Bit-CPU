module finaltestprj2;
reg clock;
//reg [15:0]ImmValue;
reg reset;
wire [31:0]Dout;

Integrated intg(Dout,clock,reset);
initial
begin
clock=1;
forever #5 clock=~clock;
end

initial
begin
//ImmValue = 16'b1;
reset=1;
#5
reset=0;

end

endmodule

