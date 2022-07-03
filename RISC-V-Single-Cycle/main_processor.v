`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:58:27 03/16/2022 
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
	 wire [31:0] write_data;
	 wire [31:0] PC_next;
	 reg [31:0] PC_reg;
	 wire reg_write, zero;
	 wire [3:0] alu_ctrl;
	 wire [6:0] opcode;
	 wire [6:0] funct7;
	 wire [2:0] funct3;
	 wire funct_7_5;
	 assign rs1 = instruction[19:15];
	 assign rs2 = instruction[24:20];
	 assign rd = instruction[11:7];
	 assign opcode = instruction[6:0];
	 assign funct3 = instruction[14:12];
	 assign funct7 = instruction[31:25];
	 assign write_data = result;
	 //assign PC_next = PC_reg +4;
	 assign funct_7_5 = funct7[5];
	 
	 Instruction_Memory inst_mem(PC_reg,reset,instruction);
	 Register_file reg_file(rs1,rs2,rd,write_data,data1,data2,reg_write,reset,clk);
	 ALU_main alu_m(alu_ctrl,data1, data2,result,zero);
	 main_control_unit mcu(opcode,funct3,funct_7_5,reg_write,alu_ctrl);
	 
	 always@(posedge clk, negedge reset)
		begin
		if(reset == 0)
			PC_reg <= 0;
		else
			PC_reg <= PC_reg + 4;
		end
	 
endmodule
