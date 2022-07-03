`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:50:05 04/23/2022 
// Design Name: 
// Module Name:    EXWB_reg 
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
	input [7:0] ex_result,
	input [2:0] rd_idex,
	input clk,
	input reset,
	output reg reg_write_exwb,
	output reg [7:0] ex_result_exwb,
	output reg [2:0] rd_exwb
);

	always@(posedge clk,negedge reset)
		begin
		if(reset == 0)
			begin
			reg_write_exwb = 0;
			ex_result_exwb = 8'b0;
			rd_exwb = 3'b0;
			end
		else begin
			reg_write_exwb = reg_write_idex;
			ex_result_exwb = ex_result;
			rd_exwb = rd_idex;
		end
		end

endmodule
