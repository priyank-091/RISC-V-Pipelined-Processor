`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:32 04/23/2022 
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
	input [7:0] PC,
	input reset,
	output[7:0] Instruction_Code
    );
reg [7:0] Mem [35:0];//we can store total of 36 instructions.
assign Instruction_Code = {Mem[PC]};

always@(reset)
begin
if(reset == 0)
	begin
	Mem[0] = 8'h23;//li r4,3 
	Mem[1] = 8'h61;//sll r4,1 
	Mem[2] = 8'h02;//li r0,2
	Mem[3] = 8'hc1;//j l1 
	Mem[4] = 8'h43;//sll r0,3 
	Mem[5] = 8'h14;//li r2,4 
	end
end
endmodule
