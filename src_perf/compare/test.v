module test
(
    output reg reset,
    output reg clk,
    output reg[15:0] number0,
    output reg[15:0] number1,

    input[2:0] compare_var
); 

initial begin
    $dumpfile("compare.vcd");
	$dumpvars;

    @(posedge clk);
	@(posedge clk);
    @(posedge clk);
        number0 <= 120;
        number1 <= 2;
    repeat(2) @(posedge clk);
        number0 <= 19;
        number1 <= 19;
    repeat(2) @(posedge clk);
        number0 <= 2;
        number1 <= 120;
    repeat(2) @(posedge clk);
        number0 <= 4535;
        number1 <= 1212;
    repeat(27) @(posedge clk);
        number0 <= 39916800;

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