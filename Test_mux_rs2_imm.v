 module testmux_immval;
wire [31:0]RESULT;

reg [5:0]OPC;
reg [31:0]RS2_IN;
reg [31:0]IMM_IN;

imux i(OPC,RS2_IN,IMM_IN,RESULT);

initial
begin

OPC = 6'b000001;
RS2_IN = 32'b001;
IMM_IN = 32'b011;

#10

OPC = 6'b010001;
end
endmodule
