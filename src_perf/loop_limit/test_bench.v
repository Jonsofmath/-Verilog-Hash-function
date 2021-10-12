`timescale 1ns/100ps

`include "loop_limit.v"
`include "test.v"

module test_bench;

wire clk, reset, fail, stop;
wire[15:0] current_loop, current_loop_actualize;

loop_limit #(5000) COND(
    /*AUTOINST*/
			// Outputs
			.current_loop_actualize(current_loop_actualize[15:0]),
			.fail		(fail),
			// Inputs
			.clk		(clk),
			.reset		(reset),
			.stop		(stop),
			.current_loop	(current_loop[15:0]));

test TEST(
    /*AUTOINST*/
	  // Outputs
	  .reset			(reset),
	  .clk				(clk),
	  .stop				(stop),
	  .current_loop			(current_loop[15:0]),
	  // Inputs
	  .fail				(fail),
	  .current_loop_actualize	(current_loop_actualize[15:0]));
endmodule
