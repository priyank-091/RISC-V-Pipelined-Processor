`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:02 03/22/2022 
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
    input wire [3:0] alu_ctrl,
	input wire [31:0] inp1, inp2,
	output reg [31:0] alu_result,
	output wire zero
    );
	 
	 /*localparam [5:0] AND = 6'b100100;
	 localparam [5:0] OR = 6'b100101;
	 localparam [5:0] ADD = 6'b100000;
	 localparam [5:0] SUB = 6'b100010;
	 localparam [5:0] SLL = 6'b000000;
	 localparam [5:0] SRL = 6'b000010;*/
	 localparam [3:0] AND = 4'b0000;
	 localparam [3:0] OR = 4'b0001;
	 localparam [3:0] ADD = 4'b0010;
	 localparam [3:0] SUB = 4'b0110;
	 localparam [3:0] SLL = 4'b1000;
	 localparam [3:0] SRL = 4'b1001;
	 always@(*)
		begin
		case(alu_ctrl)
			AND: alu_result = inp1 & inp2;
			OR: alu_result = inp1 | inp2;
			ADD: alu_result = inp1 + inp2;
			SUB: alu_result = inp1 - inp2;
			SLL: alu_result = (inp1<<inp2);
			SRL: alu_result = (inp1>>inp2);
			default: alu_result = 32'bx;
		endcase
	end
	assign zero = (alu_result == 32'b0);	

endmodule
