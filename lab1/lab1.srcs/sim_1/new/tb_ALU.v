`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/19 20:53:15
// Design Name: 
// Module Name: tb_ALU
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


//~ `New testbench
`timescale  1ns / 1ps

module tb_ALU;

// ALU Parameters
parameter PERIOD  = 10;


// ALU Inputs
reg   [7 :0]  num1                         = 0 ;
reg   [31:0]  num2                         = 0 ;
reg   [2 :0]  op                           = 0 ;

// ALU Outputs
wire  [31:0]  result                       ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

ALU  u_ALU (
    .num1                    ( num1    [7 :0] ),
    .num2                    ( num2    [31:0] ),
    .op                      ( op      [2 :0] ),
    .result                  ( result  [31:0] )
);

initial
begin

    $finish;
end

endmodule