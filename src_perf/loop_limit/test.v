module test
(
    output reg reset,
    output reg clk,
    output reg stop,
    output reg[15:0] current_loop,

    input fail,
    input[15:0] current_loop_actualize
); 


initial begin
    $dumpfile("loop_limit.vcd");
	$dumpvars;

    @(posedge clk);
    stop <= 0;
	@(posedge clk);
    @(posedge clk);
        current_loop <= 120;
    repeat(2) @(posedge clk);
        current_loop <= 5010;
    repeat(2) @(posedge clk);
        current_loop <= 456;
    repeat(2) @(posedge clk);
        current_loop <= 8000;
    repeat(7) @(posedge clk);
        stop <= 1;
    repeat(27) @(posedge clk);
        current_loop <= 1000;
    $finish;
end

//clk.
initial clk <= 0;
always	#2 clk <= ~clk;

//resetn.
initial
begin
	#0
	reset = 1'b0;
	@(posedge clk);
	reset = 1'b0;
	@(posedge clk);
	reset = 1'b1;
end

endmodule