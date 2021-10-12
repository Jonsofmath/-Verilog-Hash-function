module test
(
    output reg clk,
    output reg reset,
    output reg fail,

    output reg[7:0] source0,
    output reg[7:0] source1,
    output reg[1:0] type,

    input[7:0] nonce_array0,
    input[7:0] nonce_array1,
    input[7:0] nonce_array2,
    input[7:0] nonce_array3
); 



initial begin
    $dumpfile("nonce_gen.vcd");
	$dumpvars;

    @(posedge clk);
	@(posedge clk);
    @(posedge clk);
        fail <= 0;
        source0 <= 4;
        source1 <= 8;
        type <= 0;
    
    repeat(5) @(posedge clk);
        //source0 <= 10;
        //source1 <= 5;
        type <= 1;
    repeat(5) @(posedge clk);
        //source0 <= 250;
        //source1 <= 250;
        type <= 2;
    repeat(7) @(posedge clk);
        fail <= 1;
    
    repeat(27) @(posedge clk);
        source0 <= 30;
        source1 <= 35;
        type <= 0;
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