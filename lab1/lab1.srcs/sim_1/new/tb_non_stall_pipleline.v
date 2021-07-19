`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/19 20:58:58
// Design Name: 
// Module Name: tb_non_stall_pipleline
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
module simSimplePipeline();
    reg clk;
    reg [7 : 0]datain;
    wire [7 : 0]dataout;
    simplePipeline #(8)test1(
        .clk(clk),
        .datain(datain),
        .dataout(dataout)
    );
    initial begin
        clk = 1'b0;
        datain = 7'd0;
    end
    always #5 begin
        clk = ~clk;
    end
    always @(posedge clk)begin
        datain = datain + 1'b1;
    end
endmodule
