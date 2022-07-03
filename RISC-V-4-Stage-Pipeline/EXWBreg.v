`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:55 03/24/2022 
// Design Name: 
// Module Name:    EXWBreg 
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
module EXWBreg(
	input reg_write_idex,
	input [31:0] alu_result_alu,
	input [4:0] rd_idex,
	input clk,
	input reset,
	output reg reg_write_exwb,
	output reg [31:0] alu_result_exwb,
	output reg [4:0] rd_exwb
);

	always@(posedge clk,negedge reset)
		begin
		if(reset == 0)
			begin
			reg_write_exwb = 0;
			alu_result_exwb = 32'b0;
			rd_exwb = 32'b0;
			end
		else begin
			reg_write_exwb = reg_write_idex;
			alu_result_exwb = alu_result_alu;
			rd_exwb = rd_idex;
		end
		end

endmodule

