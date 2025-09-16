`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2023 01:10:48
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
    input [31:0] pc_nxt,
    output reg [31:0] pc=0
    );
    always@(posedge clk )
    begin
    if(~rst)
    pc<=32'd0;
    else
    pc<=pc_nxt;
    end
endmodule
