module Integrated(Dout,clock,reset);
input clock;
input reset;
//input [15:0]ImmValue;
output [31:0]Dout;
reg [31:0]Dout;

//defining wires for connection
wire [31:0]Ain;
wire [31:0]DATAOUT;
wire [5:0]OPCODE;
wire [31:0]Reg_rs1;
wire [31:0]Reg_rs2;
wire [31:0] RS_ALUIN; //mux rs1/rd out to alu as rs
wire [31:0] RS2_ALUIN;
wire [31:0] result; //FINAL Output
wire Regfile_WE;
wire Datamem_WE;
wire rs2_imm_sel;
wire [31:0]outputofALU;
wire [31:0]alu_mux;
wire [31:0]rs1_mux;
wire [15:0]ImmValue;
wire [4:0] RS1_addr;
wire [4:0] RS2_addr;
wire [4:0]RD_addr;
wire [31:0]IMM_IN2;
wire [5:0]OPCODE_d;
wire [31:0]Data;
wire [31:0]DIN_data;
wire [5:0]opcode_d2;
wire [5:0]opcode_d3;
wire[4:0] RSVAL_5b;
wire [31:0]RSVAL_32b;
wire branchop;
wire branchnop;
wire jmp_bit;
wire [25:0]jmp_imm26;
wire [31:0]jmp_imm32;
wire [4:0]RD_dly_addr;

//integration
programcounter prgcounter(.clock(clock), .reset(reset), .addrA(Ain),.branch(branchop),.branchN(branchnop),.IMMVAL(IMM_IN2),.jmp(jmp_bit),.JUMPIM(jmp_imm32));

inst_memory instmem1(.dataout(DATAOUT),.address(Ain),.clock(clock));

instreg instreg1(.RS1(RS1_addr),.RS2(RS2_addr),.RD(RD_addr),.OPC(OPCODE),.IMMVALUE(ImmValue),.JUMPI(jmp_imm26),.RSVALUE(RSVAL_5b),.dataout(DATAOUT),.clock(clock));

RegisterFile Regfile1(.address1(RS1_addr),.address2(RS2_addr),.address3(RD_dly_addr),.datain(DIN_data),.dataout1_out(Reg_rs1),.dataout2_out(Reg_rs2),.WEA(Regfile_WE),.clock(clock));

RD_delay rd1(.RD(RD_addr),.RD_d3(RD_dly_addr),.clock(clock));

opcode_decoder op_decod(.reg_WE(Regfile_WE),.data_WE(Datamem_WE),.opcode1(OPCODE),.opcode(OPCODE_d),.opcode2(opcode_d2),.clk(clock));

inputmux mux1(.OPC(OPCODE_d),.RS1(Reg_rs1),.RD_in(Reg_rs2),.Result(RS_ALUIN),.clock(clock));

extension sext(.immval_out(IMM_IN2),.immval_in(ImmValue),.RSVAL_in(RSVAL_5b),.RSVAL_out(RSVAL_32b),.Jump_in(jmp_imm26),.Jump_out(jmp_imm32),.clock(clock));

imux mux2(.OPC(OPCODE_d),.RS2_IN(Reg_rs2),.IMM_IN(IMM_IN2),.RESULT(RS2_ALUIN));

ALU a1u(.RS1(RS_ALUIN),.RS2(RS2_ALUIN),.OPC(OPCODE_d),.ALU(outputofALU),.Jump(jmp_bit),.clock(clock));

branch brnch(.OPC(OPCODE_d),.BRA_EQ(branchop),.BRA_NEQ(branchnop),.RS1(RS_ALUIN),.RSVAL(RSVAL_32b));

DataMemory Datamem1(.dataout(Data),.datain(Reg_rs1),.addressin(outputofALU),.OPC(OPCODE_d),.WEA(Datamem_WE),.clock(clock));

//DFlipflop dflip1(DOUT_data,Data,clock);

DFlipflop dflip2(alu_mux,outputofALU,clock);

DFlipflop dflip3(rs1_mux,Reg_rs1,clock);

DFlipflop dflip4(opcode_d3,opcode_d2,clock);

finalmux Finalmux(.MUX_OUT(DIN_data),. RS1(rs1_mux),.IMMVAL(IMM_IN2),.DOUT_DM(Data),.ALUOUT(alu_mux),.OPC(opcode_d3),.clock(clock));

/*initial
begin
Dout<= MUX_OUT;
end*/
endmodule
