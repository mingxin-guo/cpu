`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/07/19 15:35:21
// Design Name:
// Module Name: non_stall_pipeline
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



module simplePipeline
    #(    
    parameter WIDTH = 100  
    )  
    (  
        input clk,  
        input [WIDTH - 1 : 0] datain,  
        output [WIDTH - 1: 0] dataout  
    );
    reg [WIDTH - 1 : 0] piprData1; 
    reg [WIDTH - 1 : 0] piprData2;   
    reg [WIDTH - 1 : 0] piprData3;
    always @(posedge clk) begin 
        piprData1 <= datain;
            
    end
    always @(posedge clk) begin  
        piprData2 <= piprData1;  
    end
    always @(posedge clk) begin    
        piprData3 <= piprData2;      
    end
    assign dataout = piprData3; 
endmodule
