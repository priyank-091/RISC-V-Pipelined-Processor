`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:30 04/17/2022 
// Design Name: 
// Module Name:    Address_Gen 
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
module Address_Gen(
	input wire [7:0] instr,
	output wire [7:0] jmp_addr
    );
	wire [1:0] opcode = instr[7:6];
	reg [7:0] adr_fin;
	always@(*)
		begin
		if(opcode == 2'b11)
			begin
			adr_fin = {{2{instr[5]}},instr[5:0]};//sign extending the partial address.
			end
		else
			begin
			adr_fin = 8'bx;
			end
		end
	assign jmp_addr = adr_fin; 


endmodule
