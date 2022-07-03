`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:14 03/24/2022 
// Design Name: 
// Module Name:    Register_file_p 
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
module Register_file_p(
	input [4:0] read_reg_1,
	input [4:0] read_reg_2,
	input [4:0] write_reg,
	input [31:0] write_data,
	output [31:0] read_data_1,
	output [31:0] read_data_2,
	input wire regwrite,
	input wire rst,
	input wire clk
    );
	reg[31:0] reg_mem [31:0];
	assign read_data_1 = reg_mem[read_reg_1];
	assign read_data_2 = reg_mem[read_reg_2];
	always@(*)
	begin
		if(rst == 0)
			begin
			reg_mem[0] = 32'h1;
			reg_mem[1] = 32'h1e;
			reg_mem[2] = 32'h00;
			reg_mem[3] = 32'h4;
			reg_mem[4] = 32'h3;
			reg_mem[5] = 32'h00;
			reg_mem[6] = 32'h5;
			reg_mem[7] = 32'h6;
			reg_mem[8] = 32'h00;
			reg_mem[9] = 32'h7;
			reg_mem[10] = 32'h8;
			reg_mem[11] = 32'h00;
			reg_mem[12] = 32'h9;
			reg_mem[13] = 32'ha;
			reg_mem[14] = 32'h00;
			reg_mem[15] = 32'hb;
			reg_mem[16] = 32'h2;
			reg_mem[17] = 32'h0;
			reg_mem[18] = 32'h0;
			reg_mem[19] = 32'h0;
			reg_mem[20] = 32'h0;
			reg_mem[21] = 32'h0;
			reg_mem[22] = 32'h0;
			reg_mem[23] = 32'h0;
			reg_mem[24] = 32'h0;
			reg_mem[25] = 32'h0;
			reg_mem[26] = 32'h0;
			reg_mem[27] = 32'h0;
			reg_mem[28] = 32'h0;
			reg_mem[29] = 32'h0;
			reg_mem[30] = 32'h0;
			reg_mem[31] = 32'h0;
			end
		else
			begin
			if(regwrite == 1)
				begin
				reg_mem[write_reg] = write_data;
				end
			end
		end
endmodule
