`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/19 22:20:44
// Design Name: 
// Module Name: tb_stallable_pipleline
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

module simStallablePipeline();
    reg clk;
    reg rst;
    reg validIn, outAllow;
    reg [7 : 0]dataIn;
    wire [7 : 0]dataOut;
    wire validOut;
    stallablePipeline #(8)test2(
        .clk(clk),
        .rst(rst),
        .validIn(validIn),
        .dataIn(dataIn),
        .outAllow(outAllow),
        .validOut(validOut),
        .dataOut(dataOut)
    );
    initial begin
        // 暂且不刷新
        rst = 1'b0;
        //　永远可进
        validIn = 1'b1;
        // 永远可出
        outAllow = 1'b1;
        clk = 1'b0;
        dataIn = 7'd0;
    end
    always #5 begin
        clk = ~clk;
    end
    always @(posedge clk)begin
        dataIn = dataIn + 1'b1;
    end
endmodule
