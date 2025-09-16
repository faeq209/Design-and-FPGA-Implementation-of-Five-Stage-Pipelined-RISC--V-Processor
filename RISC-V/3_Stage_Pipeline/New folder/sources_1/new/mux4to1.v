`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2023 12:06:56
// Design Name: 
// Module Name: mux4to1
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


module mux4to1(
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    input [1:0] sel,
    output reg[31:0] out
    );
    always@(*)
    begin
    case(sel)
    2'b00:out=a;
    2'b01:out=b;
    2'b10:out=c;
    2'b11:out=d;
    default:out=a;
    endcase
    end
    
endmodule
