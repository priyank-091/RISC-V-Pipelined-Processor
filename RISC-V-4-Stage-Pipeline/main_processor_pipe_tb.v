`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:15:39 03/29/2022
// Design Name:   main_processor_pipe
// Module Name:   D:/COURSES/CS F342/projects/lab5/main_processor_pipe_tb.v
// Project Name:  lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_processor_pipe
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_processor_pipe_tb;

	// Inputs
	reg reset;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	main_processor_pipe uut (
		.reset(reset), 
		.clk(clk)
	);

	initial begin
	reset = 1;
	#1;
	reset = 0;
	#1
	reset = 1;
	end
	initial begin
	clk = 0;
	repeat (16)
	#20 clk = ~clk; #20 $finish;
	end
      
endmodule

