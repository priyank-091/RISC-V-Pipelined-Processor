`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:48 02/23/2022 
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
	//Mem[3] = 8'h01; Mem[2] = 8'h49; Mem[1] = 8'h83; Mem[0] = 8'h33;//add t1,s2,s4
	Mem[3] = 8'h00; Mem[2] = 8'h10; Mem[1] = 8'h01; Mem[0] = 8'h33;//add
	//Mem[7] = 8'h00; Mem[6] = 8'h73; Mem[5] = 8'h0E; Mem[4] = 8'h33;//add t3,t1,t2
	Mem[7] = 8'h40; Mem[6] = 8'h41; Mem[5] = 8'h82; Mem[4] = 8'hb3;//sub
	//Mem[11] = 8'h00; Mem[10] = 8'hC9; Mem[9] = 8'hA2; Mem[8] = 8'h83;//lw t0, 12(s3)
	Mem[11] = 8'h00; Mem[10] = 8'h73; Mem[9] = 8'h74; Mem[8] = 8'h33;//and
	//Mem[15] = 8'h00; Mem[14] = 8'h59; Mem[13] = 8'hA6; Mem[12] = 8'h23;//sw t0, 12(s3)
	Mem[15] = 8'h00; Mem[14] = 8'ha4; Mem[13] = 8'he5; Mem[12] = 8'hb3;//or
	Mem[19] = 8'h00; Mem[18] = 8'hd6; Mem[17] = 8'h17; Mem[16] = 8'h33;//sll
	Mem[23] = 8'h01; Mem[22] = 8'h07; Mem[21] = 8'hd8; Mem[20] = 8'hb3;//srl
	end
end
endmodule
