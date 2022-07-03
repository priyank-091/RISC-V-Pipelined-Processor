`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:56 04/23/2022 
// Design Name: 
// Module Name:    Register_File 
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
module Register_File(
	input [2:0] read_reg_1,
	input [2:0] write_reg,
	input [7:0] write_data,
	output [7:0] read_data_1,
	input wire regwrite,
	input wire rst,
	input wire clk
    );
	reg[7:0] reg_mem [7:0];
	assign read_data_1 = reg_mem[read_reg_1];
	//since we are not clock dependent.
	always@(*)
	begin
		if(rst == 0)
			begin
			reg_mem[0] = 8'h0;
			reg_mem[1] = 8'h1;
			reg_mem[2] = 8'h2;
			reg_mem[3] = 8'h3;
			reg_mem[4] = 8'h4;
			reg_mem[5] = 8'h5;
			reg_mem[6] = 8'h6;
			reg_mem[7] = 8'h7;
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
