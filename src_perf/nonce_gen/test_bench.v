`timescale 1ns/100ps

`include "nonce_gen.v"
`include "test.v"

module test_bench;

wire clk, reset, fail;
wire[1:0] type;
wire[7:0] source0, source1, nonce_array0, nonce_array1, nonce_array2, nonce_array3;



nonce_gen COND(
	       // Outputs
	       .nonce_array0		(nonce_array0[7:0]),
	       .nonce_array1		(nonce_array1[7:0]),
	       .nonce_array2		(nonce_array2[7:0]),
	       .nonce_array3		(nonce_array3[7:0]),
	       // Inputs
	       .clk			(clk),
	       .reset			(reset),
	       .fail			(fail),
		   .type			(type),
	       .source0			(source0[7:0]),
	       .source1			(source1[7:0]));

test TEST(
	  // Outputs
	  .clk				(clk),
	  .reset			(reset),
	  .fail				(fail),
	  .type			    (type),
	  .source0			(source0[7:0]),
	  .source1			(source1[7:0]),
	  // Inputs
	  .nonce_array0			(nonce_array0[7:0]),
	  .nonce_array1			(nonce_array1[7:0]),
	  .nonce_array2			(nonce_array2[7:0]),
	  .nonce_array3			(nonce_array3[7:0]));
endmodule
