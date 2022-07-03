`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:43 04/23/2022 
// Design Name: 
// Module Name:    IDEX_reg 
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
module IDEXreg(
	input reg_write_ctrl,
	input [1:0] alu_ctrl_ctrl,
	input [7:0] data1_reg,
	input [7:0] data2_ctrl,
	input [2:0] rd_ifid,
	input output_sel_ctrl,
	input [2:0] rs_ifid,
	input clk,
	input reset,
	output reg reg_write_idex,
	output reg [1:0] alu_ctrl_idex,
	output reg [7:0] data1_idex,
	output reg [7:0] data2_idex,
	output reg [2:0] rd_idex,
	output reg output_sel_idex,
	output reg [2:0] rs_idex
    );
	 
	always@(posedge clk,negedge reset)
		begin
		if(reset == 0)
			begin
			reg_write_idex = 1'b0;
			alu_ctrl_idex = 2'b0;
			data1_idex = 8'b0;
			data2_idex = 8'b0; 
			rd_idex = 3'b0;
			output_sel_idex = 1'b0;
			rs_idex = 3'b0;
			end
		else begin
			reg_write_idex = reg_write_ctrl;
			alu_ctrl_idex = alu_ctrl_ctrl;
			data1_idex = data1_reg;
			data2_idex = data2_ctrl;
			rd_idex = rd_ifid;
			output_sel_idex = output_sel_ctrl;
			rs_idex = rs_ifid;
		end
		end
endmodule
			