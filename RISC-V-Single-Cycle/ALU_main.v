`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:00 03/16/2022 
// Design Name: 
// Module Name:    ALU_main 
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
module ALU_main(
	input wire [3:0] alu_ctrl,
	input wire [31:0] inp1, inp2,
	output reg [31:0] alu_result,
	output wire zero
    );
	 
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
			SLL: alu_result = (inp1<<inp2[4:0]);
			SRL: alu_result = (inp1>>inp2[4:0]);
			default: alu_result = 32'b0;
		endcase
	end
	assign zero = (alu_result == 32'b0);	

endmodule
