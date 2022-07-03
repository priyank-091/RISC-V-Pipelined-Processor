`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:29 04/23/2022 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
	input wire [1:0] opcode,
	output reg reg_write_ctrl,
	output reg [1:0] alu_ctrl_ctrl,
	output reg output_sel_ctrl,
	output reg adr_sel,
	output reg imm_sel,
	output reg data2_sel
    );
	 
	localparam [1:0] LI = 2'b00;
	localparam [1:0] SLL = 2'b01;	
	localparam [1:0] J = 2'b11;

	always@(*)
	begin
		case(opcode)
		LI:
			begin
			reg_write_ctrl = 1'b1;
			alu_ctrl_ctrl = 2'bx;
			output_sel_ctrl = 1'b0;
			adr_sel = 1'b0;
			imm_sel = 1'b1;
			data2_sel = 1'b0;
			end
		SLL:
			begin
			reg_write_ctrl = 1'b1;
			alu_ctrl_ctrl = 2'b01;
			output_sel_ctrl = 1'b1;
			adr_sel = 1'b0;
			imm_sel = 1'b0;
			data2_sel = 1'b1;
			end
		J:
			begin
			reg_write_ctrl = 1'b0;
			alu_ctrl_ctrl = 2'bx;
			output_sel_ctrl = 1'bx;
			adr_sel = 1'b1;
			imm_sel = 1'b0;
			data2_sel = 1'bx;
			end
		default:
			begin
			reg_write_ctrl = 1'b0;
			alu_ctrl_ctrl = 2'bx;
			output_sel_ctrl = 1'bx;
			adr_sel = 1'b0;
			imm_sel = 1'b0;
			data2_sel = 1'bx;
			end
		endcase
	end
			
			


endmodule
