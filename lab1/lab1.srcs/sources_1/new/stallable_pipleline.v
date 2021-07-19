`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/19 21:22:36
// Design Name: 
// Module Name: stallable_pipleline
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



module stallablePipeline#
(
    parameter WIDTH = 100
)
(
    input                   clk,
    input                   rst,
    input                   validIn,
    input [WIDTH - 1 : 0]   dataIn,
    input                   outAllow,
    output wire                 validOut,
    output wire [WIDTH - 1 : 0]   dataOut

);
    // pipe1Valid;　代表当前级是否存有有效数据
    reg                 pipe1Valid;
    reg [WIDTH - 1 : 0] pipe1Data;
    reg                 pipe2Valid;
    reg [WIDTH - 1 : 0] pipe2Data;
    reg                 pipe3Valid;
    reg [WIDTH - 1 : 0] pipe3Data;
    /*------------------------PIPE1 LOGIC------------------------*/
    // 表示pipe1能否被上一级刷新
    wire                pipe1AllowIn;
    // 表示pipe1是否可以用于刷新下一级
    wire                pipe1ReadyGo;
    // 表示pipe1能否进入pipe2
    wire                pipe1ToPipe2Valid;

    wire                pipe2AllowIn;
    wire                pipe2ReadyGo;
    wire                pipe2ToPipe3Valid;

    wire                pipe3AllowIn;
    wire                pipe3ReadyGo;
    // 一旦pipe1的值有效，就可以传给下一个1
    assign pipe1ReadyGo = 1'b1;
    // 如果pipe1中的值已经无效，或者这一轮一定会传给下一个，那么就可以进行接收
    assign pipe1AllowIn = ! pipe1Valid || pipe1ReadyGo && pipe2AllowIn;
    // 如果pipe1有效，并且pipe1可以进行传输，那么pipe1ToPipe2Valid可以进行。
    assign pipe1ToPipe2Valid = pipe1Valid && pipe1ReadyGo;
    always @(posedge clk)begin
        // 如果需要刷新，那么pipe1Valid　变为0,表示pipe1中的值不再有效
        if( rst ) begin
            pipe1Valid <= 1'b0;
        end
        // 不需要刷新，并且pipe1可以进行刷新
        // 如果输入端有输入，就代表下一个状态pipe1Valid的值有效
        // 如果无输入，就代表下一个状态无效
        else if(pipe1AllowIn)begin
            pipe1Valid <= validIn;
        end
        // 如果输入值有效，并且pipe1可以读入，那么就从输入端进行读入
        if(validIn && pipe1AllowIn)begin
            pipe1Data <= dataIn;
        end
    end
    /*------------------------PIPE2 LOGIC------------------------*/

    // 一样一样的
    assign pipe2ReadyGo = 1'b1;
    assign pipe2AllowIn = ! pipe2Valid || pipe2ReadyGo && pipe3AllowIn;
    assign pipe2ToPipe3Valid = pipe2Valid && pipe3ReadyGo;
    always @(posedge clk)begin
        if( rst ) begin
            pipe2Valid <= 1'b0;
        end
        else if(pipe2AllowIn)begin
            pipe2Valid <= pipe1ToPipe2Valid;
        end
        if(pipe1ToPipe2Valid && pipe2AllowIn)begin
            pipe2Data <= pipe1Data;
        end
    end
    /*------------------------PIPE3 LOGIC------------------------*/

    // 一样一样的
    assign pipe3ReadyGo = 1'b1;
    assign pipe3AllowIn = ! pipe3Valid || pipe3ReadyGo && outAllow;
    always @(posedge clk)begin
        if( rst ) begin
            pipe3Valid <= 1'b0;
        end
        else if(pipe3AllowIn)begin
            pipe3Valid <= pipe2ToPipe3Valid;
        end
        if(pipe2ToPipe3Valid && pipe3AllowIn)begin
            pipe3Data <= pipe2Data;
        end
    end
    assign validOut = pipe3Valid && pipe3ReadyGo;
    assign dataOut = pipe3Data;
endmodule


