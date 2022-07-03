`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:31:27 03/22/2022 
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
	input wire [31:0] instr,
	input wire imm_sel,
	output wire [31:0] imm_out
    );
	reg [20:0] imm_int;
	always@(*)
		begin
		if(imm_sel)
			begin
			imm_int = instr[20:0];
			end
		else
			begin
			imm_int = 21'bx;
			end
		end
	assign imm_out = {{11{imm_int[20]}}, imm_int[20:0]};
			

endmodule
