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
    reg clk,rst,pc_rst;
    reg[7:0] in1;
    wire[9:0] out1;
    top t1(clk,rst,pc_rst,in1,out1);
    initial
    begin
    clk=0;
    pc_rst=1;
    rst=1;
    //#13 rst=1;
    //in1=32'h00000008;
   #25 pc_rst=0;
    in1=8'h08;
    #8000 pc_rst=1;
    #50 pc_rst=0;//in1=32'h0000000a;
    in1=8'd15;
    end
    always
    #5 clk=~clk;
endmodule
