`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/19 22:41:36
// Design Name: 
// Module Name: adder_8bits
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


`timescale 1ns / 1ps



module adder_8bits(
    a,
    b, 
    c
);
input [7:0] a;
input [7:0] b;
input [8:0] c;
assign c[8:0] = {1'd0, a} + {1'd0, b};
endmodule