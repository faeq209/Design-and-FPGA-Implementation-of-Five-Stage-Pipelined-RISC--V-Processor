`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 11:50:00
// Design Name: 
// Module Name: pc_adder
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


module pc_adder(
    input [31:0] pc,
    input [31:0] inc,
    output [31:0] pc_nxt
    );
    assign pc_nxt=pc+inc;
endmodule
