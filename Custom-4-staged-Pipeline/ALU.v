`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:43 04/17/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input wire [1:0] alu_ctrl,
	input wire [7:0] inp1, inp2,
	output reg [7:0] alu_result,
	output wire zero
    );
	localparam [1:0] ADD = 2'b11;
	localparam [1:0] SLL = 2'b01;
	always@(*)
		begin
		case(alu_ctrl)
			ADD: alu_result = inp1 + inp2;
			SLL: alu_result = (inp1<<inp2);
			default: alu_result = 8'bx;
		endcase
	end
	assign zero = (alu_result == 8'b0);


endmodule
