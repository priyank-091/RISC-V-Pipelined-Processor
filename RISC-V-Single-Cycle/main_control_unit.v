`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:11 03/16/2022 
// Design Name: 
// Module Name:    main_control_unit 
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
module main_control_unit(
	input [6:0] opcode,
	input [2:0] funct3,
	//input [6:0] funct7,
	input wire funct_7_5,
	output reg reg_write,
	output reg [3:0] alu_operation
    );
	 
	//wire [3:0] funct_op = {funct7[5], funct3};
	wire [3:0] funct_op = {funct_7_5, funct3};
	localparam [6:0] r_type = 7'b0110011;
	localparam [6:0] i_type = 7'b0000011;
	localparam [6:0] s_type = 7'b0100011;
	localparam [6:0] b_type = 7'b1100011;
	localparam [3:0] ADDfunct = 4'b0000;
	localparam [3:0] SUBfunct = 4'b1000;
	localparam [3:0] ANDfunct = 4'b0111;
	localparam [3:0] ORfunct = 4'b0110;
	localparam [3:0] SLLfunct = 4'b0001;
	localparam [3:0] SRLfunct = 4'b0101;
	localparam [3:0] AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010, SUB = 4'b0110, SLL = 4'b1000, SRL = 4'b1001;
	always@(*)
		begin
		if(opcode == r_type)
			begin
				case(funct_op)
					ADDfunct:
								begin
								reg_write = 1'b1;
								alu_operation = ADD;
								end
					SUBfunct:
								begin
								reg_write = 1'b1;
								alu_operation = SUB;
								end
					ANDfunct:
								begin
								reg_write = 1'b1;
								alu_operation = AND;
								end
					ORfunct:
								begin
								reg_write = 1'b1;
								alu_operation = OR;
								end
					SLLfunct:
								begin
								reg_write = 1'b1;
								alu_operation = SLL;
								end
					SRLfunct:
								begin
								reg_write = 1'b1;
								alu_operation = SRL;
								end
					default:
								begin
								reg_write = 1'b0;
								alu_operation = 4'bx;
								end
				endcase
			end
		end
							

endmodule
