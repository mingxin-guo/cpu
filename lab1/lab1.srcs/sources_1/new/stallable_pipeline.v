`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/07/19 15:54:28
// Design Name:
// Module Name: stallable_pipeline
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Depend encies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module stallable_pipeline #(parameterWIDTH = 100)
                           (input clk,
                            input rst,
                            input validin,
                            input [WIDTH -1:0] datain,
                            input out_allow,
                            outputvalidout,
                            output[WIDTH -1:0] dataout);
    reg pipe1_valid;
    reg [WIDTH -1:0]  pipe1_data;
    reg pipe2_valid;
    reg [WIDTH -1:0]  pipe2_data;
    reg pipe3_valid;
    reg [WIDTH -1:0] pipe3_data;
    //pipelinestage1
    wire   pipe1_allowin;
    wire   pipe1_ready_go;
    wire   pipe1_to_pipe2_valid;
    assign   pipe1_ready_go = ⋯⋯
    assign   pipe1_allowin        = !pipe1_valid  ||  pipe1_ready_go  &&  pipe2_allowin;
    assign   pipe1_to_pipe2_valid = pipe1_valid  &&  pipe1_ready_go;
    always@(posedgeclk)begin
        if (rst)begin
            pipe1_valid <= 1’b0;
        end
        else if (pipe1_allowin)begin
            pipe1_valid <= validin;
        end
            if (validin  &&  pipe1_allowin)begin
                pipe1_data <= datain;
                end  e
                nd //pipelinestage2
                wire  pipe2_allowin;
                wire  pipe2_ready_go;
                wire  pipe2_to_pipe3_valid;
                //assign   pipe2_ready_go = ⋯⋯
                assign   pipe2_allowin        = !pipe2_valid  ||  pipe2_ready_go  &&  pipe3_allowin;
                assign   pipe2_to_pipe3_valid = pipe2_valid  &&  pipe2_ready_go;
                always@(posedgeclk)begin
                    if (rst)begin   pipe2_valid  < = 1’b0;
                end
                else if (pipe2_allowin)begin
                pipe2_valid  < = pipe1_to_pipe2_valid;
                end  if (pipe1_to_pipe2_valid  &&  pipe2_allowin)begin
                pipe2_data  < = pipe1_data;
            end
            end
            //pipelinestage3
            wire  pipe3_allowin;
            
            wire pipe3_ready_go;
            //assign  pipe3_ready_go = ⋯⋯
            assign  pipe3_allowin = !pipe3_valid  ||  pipe3_ready_go  &&  out_allow;
            always@(posedgeclk)begin
                if (rst)begin
                    pipe3_valid <= 1’b0;
                end
                else if (pipe3_allowin)begin
                    pipe3_valid <= pipe2_to_pipe3_valid;
                end
                    if (pipe2_to_pipe3_valid  &&  pipe3_allowin)begin
                        pipe3_data <= pipe2_data;
                    end
                    end
                    assign  validout = pipe3_valid  &&  pipe3_ready_go;
                    assign  dataout  = pipe3_data;
                    endmodule
