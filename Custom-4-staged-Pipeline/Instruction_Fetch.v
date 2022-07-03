`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:48 04/23/2022 
// Design Name: 
// Module Name:    Instruction_Fetch 
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
module Instruction_Fetch(
	input clk,
	input reset,
	input adr_sel,
	input [7:0] jmp_addr,
	output wire [7:0] Instruction_Code
    ); 
	reg [7:0] PC;
	Instruction_Memory istr_mem (.PC(PC),.reset(reset),.Instruction_Code(Instruction_Code));
	always @ (posedge clk,negedge reset)
	begin
	if(reset == 0)
		PC <= 0;
	else if (adr_sel == 1)
		PC <= PC + jmp_addr;//pc+1 have already happended till now.
	else
		PC <= PC + 1;
	end

endmodule
