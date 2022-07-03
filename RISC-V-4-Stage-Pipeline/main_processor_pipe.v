`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:03 03/24/2022 
// Design Name: 
// Module Name:    main_processor_pipe 
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
module main_processor_pipe(
	input reset,
	input clk
    );
	 wire [4:0] rs1_ifid, rs2_ifid;
	 wire [4:0] rd_ifid, rd_idex, rd_exwb;
	 wire [31:0] instruction;
	 wire [31:0] instruction_ifid;
	 wire [31:0] data1_reg, data2_reg, data1_idex, data2_idex;
	 wire [31:0] alu_result_alu, alu_result_exwb;
	 wire [31:0] write_data;
	 //wire [31:0] PC_next;
	 reg [31:0] PC_reg;
	 wire reg_write_ctrl, reg_write_idex, reg_write_exwb, zero;
	 wire [3:0] alu_ctrl_ctrl, alu_ctrl_idex;
	 wire [6:0] opcode_ifid;
	 wire [6:0] funct7_ifid;
	 wire [2:0] funct3_ifid;
	 wire funct_7_5_ifid;
	 assign rs1_ifid = instruction_ifid[19:15];
	 assign rs2_ifid = instruction_ifid[24:20];
	 assign rd_ifid = instruction_ifid[11:7];
	 assign opcode_ifid = instruction_ifid[6:0];
	 assign funct3_ifid = instruction_ifid[14:12];
	 assign funct7_ifid = instruction_ifid[31:25];
	 assign write_data = alu_result_exwb;
	 assign funct_7_5_ifid = funct7_ifid[5];
	 
	 Instruction_Memory inst_mem_p(PC_reg,reset,instruction);
	 IFIDreg if_id_reg(instruction,clk,reset,instruction_ifid);
	 Register_file_p reg_file_p(rs1_ifid,rs2_ifid,rd_exwb,write_data,data1_reg,data2_reg,reg_write_exwb,reset,clk);
	 main_control_unit mcu_p(opcode_ifid,funct3_ifid,funct_7_5_ifid,reg_write_ctrl,alu_ctrl_ctrl);
	 IDEXreg id_ex_reg(reg_write_ctrl,alu_ctrl_ctrl,data1_reg,data2_reg,rd_ifid,clk,reset,reg_write_idex,alu_ctrl_idex,data1_idex,data2_idex,rd_idex);
	 ALU_main alu_m(alu_ctrl_idex,data1_idex, data2_idex,alu_result_alu,zero);
	 EXWBreg ex_wb_reg(reg_write_idex,alu_result_alu,rd_idex,clk,reset,reg_write_exwb,alu_result_exwb,rd_exwb);
	 
	 always@(posedge clk, negedge reset)
		begin
		if(reset == 0)
			PC_reg <= 0;
		else
			PC_reg <= PC_reg + 4;
		end

endmodule
