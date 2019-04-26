module programcounter( clock, reset, addrA, branch,branchN,IMMVAL,jmp,JUMPIM);
input clock;
input reset;
input [31:0]IMMVAL;
output [31:0] addrA;
input branch;
input branchN;
input jmp;
input [31:0]JUMPIM;

reg [31:0]tempadd;
/*initial
begin
addrA <= 32'b0;
end*/

always@(posedge clock)
begin
if(reset)
tempadd<=32'b0;
else if(branch==1)
tempadd<=tempadd + IMMVAL;
else if (branchN ==1)
tempadd<=tempadd + 32'b10;
else if (jmp==1)
tempadd<=JUMPIM;
else
tempadd <= tempadd + 32'b1;
end

assign addrA = tempadd;

endmodule
/*if(reset == 1'b1)
begin
addrA <= 32'b00000000000000000000000000000000;
end

/*else if ( branch==1)//rs=rs1 match correct
begin
addrA <= addrA + IMMVALUE;
end

else if( branch==0)
begin
addrA <=addrA + 2'b0;
end

else if (jump==1)
begin
addrA<= IMMVALUE;
end*/
 //if(reset ==1'b0)


/*always @ (posedge clk)
begin
  if (rst)
    pc <= 'h0;
  else if (branch_inst) // Extra input port "branch_inst"
    pc <= pc + immediate; // immediate in 2's complement, signed form
  else 
    pc <= pc + 1'b1;
end*/



