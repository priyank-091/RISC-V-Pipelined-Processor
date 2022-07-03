`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:29 03/22/2022 
// Design Name: 
// Module Name:    shamt_gen 
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
module shamt_gen(
	input wire [31:0] instr,
	output wire [31:0] shamt_out
    );
	 wire [4:0] shamt = instr[10:6];
	 assign shamt_out = {{27{1'b0}}, shamt[4:0]};


endmodule
