`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:31 04/17/2022 
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
	input wire [7:0] instr,
	output wire [7:0] shamt_out
    );
	 wire [2:0] shamt = instr[2:0];
	 assign shamt_out = {{5{1'b0}}, shamt[2:0]};//since we don't need to sign extend.


endmodule
