module test
(
    input validity_reg,
    output reg reset,
    output reg clk,
    output reg[2:0] input0, 
    output reg[2:0 ]input1
); 


initial begin
    $dumpfile("validity_reg.vcd");
	$dumpvars;

    @(posedge clk);
	@(posedge clk);
    @(posedge clk);
        input0 <= 1; 
        input1 <= 1;
    repeat(2) @(posedge clk);
        input0 <= 5; 
        input1 <= 1;
    repeat(2) @(posedge clk);
        input0 <= 0; 
        input1 <= 8;
    repeat(2) @(posedge clk);
        input0 <= 67; 
        input1 <= 67;
    repeat(27) @(posedge clk);
        input0 <= 1; 
        input1 <= 1;
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