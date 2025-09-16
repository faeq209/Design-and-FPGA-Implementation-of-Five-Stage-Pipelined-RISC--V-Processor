`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2023 00:01:42
// Design Name: 
// Module Name: test
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


module test(

    );
    reg clk,rst;
    reg[7:0] in1;
    wire[9:0] out1;
    top t1(clk,rst,in1,out1);
    initial
    begin
    clk=0;
    rst=1;
    //#160 rst=1;
    //in1=32'h00000008;
    in1=8'h08;
    #8000 rst=0;
    #50 rst=1;//in1=32'h0000000a;
    in1=8'd22;
    end
    always
    #5 clk=~clk;
endmodule
