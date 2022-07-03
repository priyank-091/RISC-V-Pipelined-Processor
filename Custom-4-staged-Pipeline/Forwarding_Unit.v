`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:16 04/23/2022 
// Design Name: 
// Module Name:    Forwarding_Unit 
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
module Forwarding_Unit(
	input reg_write_exwb,
	input [2:0] rd_exwb,
	input [2:0] rs_idex,
	output reg forward_rs
    );
	
	wire ex_condition = (reg_write_exwb) && (rd_exwb == rs_idex);
	always@(*)
	begin
		if(ex_condition)
			forward_rs = 1'b1;
		else
			forward_rs = 1'b0;
	end


endmodule
