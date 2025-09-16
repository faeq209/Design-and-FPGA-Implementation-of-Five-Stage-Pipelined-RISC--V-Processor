`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2023 01:52:00
// Design Name: 
// Module Name: stall_cntl
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


module stall_cntl(
    input clk,
    input pc_sel,
    output reg stall=0
    );
    reg[1:0]cnt=0;
   always@(posedge clk)
   // always@(*)
    begin
    if(!pc_sel)
    begin
    stall<=1;
    end
    else
    stall<=0;
    end
    
endmodule
