`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:56 03/22/2022 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(
	input wire [5:0] opcode,
	input wire [5:0] funct,
	output reg imm_sel,
	output reg alu_src,
	output reg immtoreg,
	output reg regwrite,
	output reg [3:0] alu_ctrl
    );
	localparam [5:0] AND = 6'b100100;
	localparam [5:0] OR = 6'b100101;
	localparam [5:0] ADD = 6'b100000;
	localparam [5:0] SUB = 6'b100010;
	localparam [5:0] SLL = 6'b000000;
	localparam [5:0] SRL = 6'b000010;
	localparam [3:0] AND_ctrl = 4'b0000, OR_ctrl = 4'b0001, ADD_ctrl = 4'b0010, SUB_ctrl = 4'b0110, SLL_ctrl = 4'b1000, SRL_ctrl = 4'b1001;
	always@(*)
		begin
		if(opcode == 6'b000000)
		begin
			case(funct)
				AND:
					 begin
					 imm_sel = 1'b0;
					 alu_src = 1'b0;
					 immtoreg = 1'b0;
					 regwrite = 1'b1;
					 alu_ctrl = AND_ctrl;
					 end
				OR:
					 begin
					 imm_sel = 1'b0;
					 alu_src = 1'b0;
					 immtoreg = 1'b0;
					 regwrite = 1'b1;
					 alu_ctrl = OR_ctrl;
					 end
				ADD:
					 begin
					 imm_sel = 1'b0;
					 alu_src = 1'b0;
					 immtoreg = 1'b0;
					 regwrite = 1'b1;
					 alu_ctrl = ADD_ctrl;
					 end
				SUB:
					 begin
					 imm_sel = 1'b0;
					 alu_src = 1'b0;
					 immtoreg = 1'b0;
					 regwrite = 1'b1;
					 alu_ctrl = SUB_ctrl;
					 end
				SLL:
					 begin
					 imm_sel = 1'b0;
					 alu_src = 1'b1;
					 immtoreg = 1'b0;
					 regwrite = 1'b1;
					 alu_ctrl = SLL_ctrl;					 
					 end
				SRL:
					 begin
					 imm_sel = 1'b0;
					 alu_src = 1'b1;
					 immtoreg = 1'b0;
					 regwrite = 1'b1;
					 alu_ctrl = SRL_ctrl;
					 end
				default:
					 begin
					 imm_sel = 1'bx;
					 alu_src = 1'b0;
					 immtoreg = 1'b0;
					 regwrite = 1'b0;
					 alu_ctrl = 4'bx;
					 end
			endcase
		end
		else if(opcode == 6'b111111)
		begin
			imm_sel = 1'b1;
			alu_src = 1'b0;
			immtoreg = 1'b1;
			regwrite = 1'b1;
			alu_ctrl = 4'bx;
		end
		else
		begin
			imm_sel = 1'bx;
			alu_src = 1'b0;
			immtoreg = 1'b0;
			regwrite = 1'b0;
			alu_ctrl = 4'bx;
		end
		end
endmodule
