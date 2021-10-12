module test
(
    output reg clk,
    output reg reset,

    output reg[7:0] array_numbers0,
    output reg[7:0] array_numbers1,
    output reg[7:0] array_numbers2,
    output reg[7:0] array_numbers3,
    output reg[7:0] array_numbers4,
    output reg[7:0] array_numbers5,
    output reg[7:0] array_numbers6,
    output reg[7:0] array_numbers7,
    output reg[7:0] array_numbers8,
    output reg[7:0] array_numbers9,
    output reg[7:0] array_numbers10,
    output reg[7:0] array_numbers11,
    output reg[7:0] array_numbers12,
    output reg[7:0] array_numbers13,
    output reg[7:0] array_numbers14,
    output reg[7:0] array_numbers15,

    input[7:0] hash_array0,
    input[7:0] hash_array1,
    input[7:0] hash_array2
); 


integer i;
initial begin
    $dumpfile("micro_ucr_hash.vcd");
	$dumpvars;

    @(posedge clk);
	@(posedge clk);
    repeat(5) @(posedge clk);

        array_numbers0 <= 8'h39;
        array_numbers1 <= 8'h7D;
        array_numbers2 <= 8'h9F;
        array_numbers3 <= 8'h2F;
        array_numbers4 <= 8'h40;
        array_numbers5 <= 8'hCA;
        array_numbers6 <= 8'h9E;
        array_numbers7 <= 8'h6C;
        array_numbers8 <= 8'h6B;
        array_numbers9 <= 8'h1F;
        array_numbers10 <= 8'h33;
        array_numbers11 <= 8'h24;
        array_numbers12 <= 8'hFD;
        array_numbers13 <= 8'hED;
        array_numbers14 <= 8'h87;
        array_numbers15 <= 8'h3C;
    repeat(27) @(posedge clk);
        array_numbers0 <= 8'h61;
        array_numbers1 <= 8'h61;
        array_numbers2 <= 8'h61;
        array_numbers3 <= 8'h61;
        array_numbers4 <= 8'h61;
        array_numbers5 <= 8'h61;
        array_numbers6 <= 8'h61;
        array_numbers7 <= 8'h61;
        array_numbers8 <= 8'h61;
        array_numbers9 <= 8'h61;
        array_numbers10 <= 8'h61;
        array_numbers11 <= 8'h61;
        array_numbers12 <= 8'h61;
        array_numbers13 <= 8'h61;
        array_numbers14 <= 8'h61;
        array_numbers15 <= 8'h61;
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