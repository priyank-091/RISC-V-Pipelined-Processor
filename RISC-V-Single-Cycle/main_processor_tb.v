`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:59:00 03/22/2022
// Design Name:   main_processor
// Module Name:   D:/COURSES/CS F342/projects/Assignment_1/main_processor_tb.v
// Project Name:  Assignment_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_processor
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
	main_processor uut (
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
	repeat (18)
	#20 clk = ~clk; #20 $finish;
	end
      
endmodule

