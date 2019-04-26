module testmultiplexer;
wire[31:0] qout;
reg[31:0] din1;
reg[31:0] din2;
reg sel;
mux m1(qout,sel,din1,din2);
initial
begin
#10
din1=32'b110;
din2=32'b101;
#10
sel=1;
#10
sel=0;
end
endmodule
