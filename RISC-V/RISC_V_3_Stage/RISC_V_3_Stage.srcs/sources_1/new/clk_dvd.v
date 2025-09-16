`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 11:50:00
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
    assign clk_out=cnt[0];
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
