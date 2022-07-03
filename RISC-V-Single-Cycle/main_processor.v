`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:02 03/22/2022 
// Design Name: 
// Module Name:    main_processor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main_processor(
	input reset,
	input clk
    );


	 wire [4:0] rs1, rs2, rd;
	 wire [31:0] instruction;
	 wire [31:0] data1, data2;
	 wire [31:0] result;
	 wire [31:0] imm_out;
	 wire [31:0] shamt_out;
	 wire [31:0] in2;
	 wire [31:0] write_data;
	 //wire [31:0] PC_next;
	 reg [31:0] PC_reg;
	 wire reg_write, zero, alu_src, immtoreg,imm_sel;
	 wire [5:0] opcode;
	 wire [5:0] funct;
	 wire [3:0] alu_ctrl;
	 assign rs1 = instruction[20:16];
	 assign rs2 = instruction[15:11];
	 assign rd = instruction[25:21];
	 assign opcode = instruction[31:26];
	 assign funct = instruction[5:0];
	 assign write_data = (immtoreg)?imm_out : result;
	 assign in2 = (alu_src)?shamt_out : data2;
	 Instruction_Memory inst_mem(PC_reg,reset,instruction);
	 Register_file reg_file(rs1,rs2,rd,write_data,data1,data2,reg_write,reset,clk);
	 imm_gen imme_gen(instruction,imm_sel,imm_out);
	 shamt_gen sh_gen(instruction,shamt_out);
	 control_unit cu(opcode,funct,imm_sel,alu_src,immtoreg,reg_write,alu_ctrl);
	 ALU alu_main(alu_ctrl,data1, in2,result,zero);
	 always@(posedge clk, negedge reset)
	 begin
		if(reset == 0)
			PC_reg <= 0;
		else
			PC_reg <= PC_reg + 4;
	 end

endmodule
