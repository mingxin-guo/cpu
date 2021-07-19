`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/07/19 14:46:04
// Design Name:
// Module Name: ALU
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


module ALU(input [7 :0] num1,
           input [31:0] num2,
           input [2 :0] op,
           output [31:0] result);
    
    assign sign_extend = {{24{1'b0}}, num1[7:0]};
    assign result = (op == 3'b000) ? sign_extend + num2 :
    (op == 3'b001) ? sign_extend - num2 :
    (op == 3'b010) ? sign_extend & num2 :
    (op == 3'b011) ? sign_extend | num2 :
    (op == 3'b100) ? ~sign_extend : 32'b0;
endmodule
