`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/20 08:58:45
// Design Name: 
// Module Name: adder_4bits_2steps
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_4bits_2steps(
    input [7:0]         cin_a,
    input [7:0]         cin_b,
    input               cin,
    input               clk,
    output reg          cout, 
    output reg [7:0]    sum
    );
    reg         cout_temp;
    reg [3:0]   sum_temp;

    always @(posedge clk) begin
        {cout_temp, sum_temp } <= cin_a[3:0] + cin_b[3:0] + cin;

    end
    always @(posedge clk) begin
        {cout, sum} <= {{1'b0, cin_a[7:4]} + {1'b0, cin_b[7:4]} + cout_temp, sum_temp};
    end
endmodule
