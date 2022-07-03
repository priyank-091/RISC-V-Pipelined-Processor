`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:11 04/23/2022 
// Design Name: 
// Module Name:    IFID_reg 
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
module IFIDreg(
	input [7:0] instruction_inst,
	input clk,
	input reset,
	input adr_sel,
	output reg [7:0] instruction_ifid
);

always@(posedge clk, negedge reset)
	begin
	if(reset == 0)
	begin
		instruction_ifid = 8'b0;
	end
	else if (adr_sel)
	begin
		instruction_ifid = 8'bx;//since when the previous instruction was jump, so the pc value was incorrect for the next instruction.
	end
	else begin
		instruction_ifid = instruction_inst;
	end
	end
endmodule
