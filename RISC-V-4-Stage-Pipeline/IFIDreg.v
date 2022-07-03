`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:20 03/24/2022 
// Design Name: 
// Module Name:    IFIDreg 
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
	input [31:0] instruction_inst,
	input clk,
	input reset,
	output reg [31:0] instruction_ifid
);

always@(posedge clk, negedge reset)
	begin
	if(reset == 0)
	begin
		instruction_ifid = 32'b0;
	end
	else begin
		instruction_ifid = instruction_inst;
	end
	end
endmodule

