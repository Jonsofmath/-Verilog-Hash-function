
`ifndef micro_ucr_hash
`define micro_ucr_hash

module micro_ucr_hash(
    input clk,
    input reset,

    input[7:0] array_numbers0,
    input[7:0] array_numbers1,
    input[7:0] array_numbers2,
    input[7:0] array_numbers3,
    input[7:0] array_numbers4,
    input[7:0] array_numbers5,
    input[7:0] array_numbers6,
    input[7:0] array_numbers7,
    input[7:0] array_numbers8,
    input[7:0] array_numbers9,
    input[7:0] array_numbers10,
    input[7:0] array_numbers11,
    input[7:0] array_numbers12,
    input[7:0] array_numbers13,
    input[7:0] array_numbers14,
    input[7:0] array_numbers15,

    output reg[7:0] hash_array0,
    output reg[7:0] hash_array1,
    output reg[7:0] hash_array2
);

    reg[7:0] W_numbers [31:0];
    reg[5:0] counter;
    reg[7:0] a, b, c, k, x;
    reg[7:0] hash_array_int_0, hash_array_int_1, hash_array_int_2;
    reg first_flag, k_x_flag, a_b_c_flag;
    reg[8:0] last_flag;
    reg[7:0] w_debug;

    integer i,j;
    always @ (*) begin
        if(reset) begin
            /* W array assignment */
            for(i = 0; i < 32; i = i + 1) begin
                if(i <= 15) begin
                    W_numbers[0] = array_numbers0;
                    W_numbers[1] = array_numbers1;
                    W_numbers[2] = array_numbers2;
                    W_numbers[3] = array_numbers3;
                    W_numbers[4] = array_numbers4;
                    W_numbers[5] = array_numbers5;
                    W_numbers[6] = array_numbers6;
                    W_numbers[7] = array_numbers7;
                    W_numbers[8] = array_numbers8;
                    W_numbers[9] = array_numbers9;
                    W_numbers[10] = array_numbers10;
                    W_numbers[11] = array_numbers11;
                    W_numbers[12] = array_numbers12;
                    W_numbers[13] = array_numbers13;
                    W_numbers[14] = array_numbers14;
                    W_numbers[15] = array_numbers15;
                end else begin
                    W_numbers[i] = (W_numbers[i-3]|(W_numbers[i-9]^W_numbers[i-14]));
                end
            end

            /* micro_ucr_hash result variables assignment */
            hash_array_int_0 = 8'h01;
            hash_array_int_1 = 8'h89;
            hash_array_int_2 = 8'hFE;

            /* output result loop */
            for(j = 0; j < 32; j = j + 1) begin
                if(j == 0) begin
                    a = hash_array_int_0;
                    b = hash_array_int_1;
                    c = hash_array_int_2;             
                end else begin
                    a = a;
                    b = b;
                    c = c; 
                end

                if(j <= 16) begin
                    k = 8'h99;
                    x = a^b;
                end else begin
                    k = 8'hA1;
                    x = a|b;         
                end

                a = b^c;
                b = c << 4;
                c = x+k+W_numbers[j];   

                if(j == 31) begin
                    hash_array0 = hash_array_int_0 + a;
                    hash_array1 = hash_array_int_1 + b;
                    hash_array2 = hash_array_int_2 + c;  
                end else begin
                    hash_array0 = hash_array0;
                    hash_array1 = hash_array1;
                    hash_array2 = hash_array2;
                end
            end
        end else begin
            hash_array0 = 8'h00;
            hash_array1 = 8'h00;
            hash_array2 = 8'h00;
            a = 8'h00;
            b = 8'h00;
            c = 8'h00;
            counter = 0;
            first_flag = 0;
            k_x_flag = 0;
            a_b_c_flag = 0;
            last_flag = 0;
        end
    end
endmodule

`endif