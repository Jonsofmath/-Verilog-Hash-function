`timescale 1ns/100ps

`include "validity_reg.v"
`include "test.v"

module test_bench;

wire clk, reset, validity_reg;
wire[2:0] input0, input1;

validity_reg COND(
    /*AUTOINST*/
		  // Outputs
		  .validity_reg		(validity_reg),
		  // Inputs
		  .clk			(clk),
		  .reset		(reset),
		  .input0		(input0[2:0]),
		  .input1		(input1[2:0]));

test TEST(
    /*AUTOINST*/
	  // Outputs
	  .reset			(reset),
	  .clk				(clk),
	  .input0			(input0[2:0]),
	  .input1			(input1[2:0]),
	  // Inputs
	  .validity_reg			(validity_reg));
endmodule
