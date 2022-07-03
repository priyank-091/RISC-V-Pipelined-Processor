`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:55 04/17/2022 
// Design Name: 
// Module Name:    imm_gen 
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
module imm_gen(
	input wire [7:0] instr,
	input wire imm_sel,
	output wire [7:0] imm_out
    );
	reg [2:0] imm_int;
	always@(*)
		begin
		if(imm_sel)
			begin
			imm_int = instr[2:0];
			end
		else
			begin
			imm_int = 3'bx;
			end
		end
	assign imm_out = {{5{imm_int[2]}}, imm_int[2:0]};//sign extending.
			

endmodule