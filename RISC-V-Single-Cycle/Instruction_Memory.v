`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:54:10 03/21/2022 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Memory(
	input [31:0] PC,
	input reset,
	output[31:0] Instruction_Code
    );
reg [7:0] Mem [35:0];
assign Instruction_Code = {Mem[PC+3],Mem[PC+2],Mem[PC+1],Mem[PC]};

always@(reset)
begin
if(reset == 0)
	begin
	Mem[3] = 8'h00; Mem[2] = 8'h01; Mem[1] = 8'h10; Mem[0] = 8'h20;//add
	Mem[7] = 8'h00; Mem[6] = 8'h85; Mem[5] = 8'h30; Mem[4] = 8'h22;//sub
	Mem[11] = 8'h01; Mem[10] = 8'h09; Mem[9] = 8'h50; Mem[8] = 8'h24;//and
	Mem[15] = 8'h01; Mem[14] = 8'h28; Mem[13] = 8'h50; Mem[12] = 8'h25;//or
	Mem[19] = 8'h01; Mem[18] = 8'h66; Mem[17] = 8'h01; Mem[16] = 8'h80;//sll
	Mem[23] = 8'h01; Mem[22] = 8'ha9; Mem[21] = 8'h02; Mem[20] = 8'h82;//srl
	Mem[27] = 8'hfd; Mem[26] = 8'he0; Mem[25] = 8'h00; Mem[24] = 8'h1a;//li r15, 26
	Mem[31] = 8'hfe; Mem[30] = 8'h00; Mem[29] = 8'h00; Mem[28] = 8'h20;//l1 r16,32
	Mem[35] = 8'h02; Mem[34] = 8'h2f; Mem[33] = 8'h80; Mem[32] = 8'h20;//add r17,r15,r16
	end
end
endmodule