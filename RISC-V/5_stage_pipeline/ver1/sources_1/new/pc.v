`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 11:50:00
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input rst,
    input pc_rst,
    input [31:0] pc_nxt,
    output reg [31:0] pc=0
    );
    always@(posedge clk)
    begin
    if(~rst)
    pc<=32'd0;
    else
    begin
    if(pc_rst==1)
    pc<=32'd0;
    else
    pc<=pc_nxt;
    end
    end
endmodule
