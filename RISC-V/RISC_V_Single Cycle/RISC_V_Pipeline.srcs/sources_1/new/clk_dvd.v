`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2023 13:40:39
// Design Name: 
// Module Name: clk_dvd
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

module clk_dvd(
    input clk_in,
    input rst,
    output clk_out
    );
    reg[1:0]cnt=0;
    assign clk_out=cnt[1];
    always@(posedge clk_in)
    begin
    if(~rst)
        begin
        cnt=0;
        end
    else
    begin
    cnt=cnt+1;
    end
    end
    
endmodule
