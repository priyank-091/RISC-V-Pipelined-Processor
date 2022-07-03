`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:06:48 04/23/2022
// Design Name:   Main_Processor
// Module Name:   D:/COURSES/CS F342/projects/Assignment_2/main_processor_tb.v
// Project Name:  Assignment_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_processor_tb;

	// Inputs
	reg reset;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Main_Processor uut (
		.reset(reset), 
		.clk(clk)
	);

	initial begin
	reset = 1;
	#1;
	reset = 0;
	#2
	reset = 1;
	end
	initial begin
	clk = 0;
	repeat (18)
	#20 clk = ~clk; #20 $finish;
	end
      
endmodule

