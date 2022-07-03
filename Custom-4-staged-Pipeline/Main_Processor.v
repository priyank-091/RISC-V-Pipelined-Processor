`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:34 04/23/2022 
// Design Name: 
// Module Name:    Main_Processor 
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
module Main_Processor(
	input reset,
	input clk
    );
	 //various wires required for connection between different blocks.
	 wire [2:0] rs_ifid,rs_idex;
	 wire [2:0] rd_ifid, rd_idex, rd_exwb;
	 wire [7:0] instruction_ifid,instruction_inst;
	 wire [7:0] data1_reg, data2_ctrl, data1_idex, data2_idex;
	 wire [7:0] alu_result_alu;
	 wire [7:0] write_data;
	 wire [7:0] ex_result,ex_result_exwb;//result stored in ex/wb register.
	 wire reg_write_ctrl, reg_write_idex, reg_write_exwb, zero;
	 wire [1:0] alu_ctrl_ctrl, alu_ctrl_idex;
	 wire output_sel_ctrl,output_sel_idex,data2_sel;//for selecting the correct data in and output incase of li and sll instructions.
	 wire forward_rs;//forwarding control line.
	 wire adr_sel, imm_sel;
	 wire [1:0] opcode_ifid;//for seperating the opcode from if/id reg output and giving to control unit as input.. 
	 wire [7:0] imm_out,shamt_out,jmp_addr;
	 wire [7:0] alu_in1;//input to the alu for selecting b/w forwarded value and id/ex reg.
	 assign opcode_ifid = instruction_ifid[7:6];
	 assign rs_ifid = instruction_ifid[5:3];
	 assign rd_ifid = instruction_ifid[5:3];
	 assign data2_ctrl = (data2_sel)?shamt_out : imm_out;//for storing in data2 field in id/ex reg.
	 assign alu_in1 = (forward_rs)?ex_result_exwb : data1_idex;//performing the forwarding multiplexing.
	 assign ex_result = (output_sel_idex)?alu_result_alu : data2_idex;//selecting the correct output to write into register in case of li and sll.
	 assign write_data = ex_result_exwb;
	 Instruction_Fetch instr_fetch(clk,reset,adr_sel,jmp_addr,instruction_inst);//instantiating the instruction fetch block.
	 IFIDreg if_id_reg(instruction_inst,clk,reset,adr_sel,instruction_ifid);//instantiating the ifidreg block.
	 Address_Gen addr_gen(instruction_ifid,jmp_addr);
	 Register_File reg_file(rs_ifid,rd_exwb,write_data,data1_reg,reg_write_exwb,reset,clk);//instantiating the register file
	 Control_Unit main_control_unit(opcode_ifid,reg_write_ctrl,alu_ctrl_ctrl,output_sel_ctrl,adr_sel,imm_sel,data2_sel);//the main control unit.
	 imm_gen immi_gene(instruction_ifid,imm_sel,imm_out);//instantiate the immediate generator module
	 shamt_gen sh_gen(instruction_ifid,shamt_out);//instantiate the shamt generator module.
	 //instantiating the ID/EX reg module.
	 IDEXreg id_ex_reg(reg_write_ctrl,alu_ctrl_ctrl,data1_reg,data2_ctrl,rd_ifid,output_sel_ctrl,rs_ifid,clk,reset,reg_write_idex,
							 alu_ctrl_idex,data1_idex,data2_idex,rd_idex,output_sel_idex,rs_idex);
	 ALU alu_main(alu_ctrl_idex,alu_in1, data2_idex,alu_result_alu,zero);//instantiating the alu module.
	 Forwarding_Unit forward_unit(reg_write_exwb,rd_exwb,rs_idex,forward_rs);//instantiate the forwarding module.
	 EXWBreg ex_wb_reg(reg_write_idex,ex_result,rd_idex,clk,reset,reg_write_exwb,ex_result_exwb,rd_exwb);//instantiate the ex/wb reg module.

endmodule
