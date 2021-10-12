module test
(
    output reg clk,
    output reg reset,

    output reg[7:0] block0,
    output reg[7:0] block1,
    output reg[7:0] block2,
    output reg[7:0] block3,
    output reg[7:0] block4,
    output reg[7:0] block5,
    output reg[7:0] block6,
    output reg[7:0] block7,
    output reg[7:0] block8,
    output reg[7:0] block9,
    output reg[7:0] block10,
    output reg[7:0] block11,

    output reg start,
    output reg[15:0] target,

    input finish,

    input[7:0] nonce0,
    input[7:0] nonce1,
    input[7:0] nonce2,
    input[7:0] nonce3
); 


initial begin
    $dumpfile("perf_sys.vcd");
	$dumpvars;

    @(posedge clk);
        start <= 0;
	@(posedge clk);
    @(posedge clk);
        start <= 1;
    repeat(2) @(posedge clk);
        target <= 50;

        block0  <= 8'h39;
        block1 <= 8'h7D;
        block2 <= 8'h9F;
        block3 <= 8'h2F;
        block4 <= 8'h40;
        block5 <= 8'hCA;
        block6 <= 8'h9E;
        block7 <= 8'h6C;
        block8 <= 8'h6B;
        block9 <= 8'h1F;
        block10 <= 8'h33;
        block11 <= 8'h24;
    repeat(150) @(posedge clk);
        start <= 0;
    repeat(150) @(posedge clk);
        start <= 1;
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