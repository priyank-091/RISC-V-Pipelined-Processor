`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:31 03/24/2022 
// Design Name: 
// Module Name:    IDEXreg 
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
	input [3:0] alu_ctrl_ctrl,
	input [31:0] data1_reg,
	input [31:0] data2_reg,
	input [4:0] rd_ifid,
	input clk,
	input reset,
	output reg reg_write_idex,
	output reg [3:0] alu_ctrl_idex,
	output reg [31:0] data1_idex,
	output reg [31:0] data2_idex,
	output reg [4:0] rd_idex
    );
	 
	always@(posedge clk,negedge reset)
		begin
		if(reset == 0)
			begin
			reg_write_idex = 1'b0;
			alu_ctrl_idex = 4'b0;
			data1_idex = 32'b0;
			data2_idex = 32'b0;
			rd_idex = 5'b0;
			end
		else begin
			reg_write_idex = reg_write_ctrl;
			alu_ctrl_idex = alu_ctrl_ctrl;
			data1_idex = data1_reg;
			data2_idex = data2_reg;
			rd_idex = rd_ifid;
		end
		end
endmodule
			
	 