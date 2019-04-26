
module testbench_instmem;
wire [31:0]dataout;
reg [31:0]address;
reg clock;
//reg [15:0]IMMVALUE;
//reg [25:0]JUMPIMM;
initial
begin
//IMMVALUE = 16'b111;
address = 32'b1101;
#10 address = 32'b10; 
#10 address = 32'b10011;
end

initial
begin
clock=1;
forever #5 clock=~clock;
end

inst_memory m(dataout,address,clock);
endmodule

