`timescale 1ns/100ps

`include "compare.v"
`include "test.v"

module test_bench;

wire clk, reset;
wire[15:0] number0, number1;
wire[2:0] compare_var; 

compare COND(
    /*AUTOINST*/
	     // Outputs
	     .compare_var		(compare_var[2:0]),
	     // Inputs
	     .clk			(clk),
	     .reset			(reset),
	     .number0			(number0[15:0]),
	     .number1			(number1[15:0]));

test TEST(
    /*AUTOINST*/
	  // Outputs
	  .reset			(reset),
	  .clk				(clk),
	  .number0			(number0[15:0]),
	  .number1			(number1[15:0]),
	  // Inputs
	  .compare_var			(compare_var[2:0]));
endmodule
