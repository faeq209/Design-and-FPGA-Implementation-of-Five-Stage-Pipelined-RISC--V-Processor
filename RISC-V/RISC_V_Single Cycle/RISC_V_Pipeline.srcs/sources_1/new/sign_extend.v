`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2023 01:15:51
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(input [31:0] in,
input [2:0]sign_func,
output [31:0] out

    );
    assign out=(sign_func==3'b111)?{{20{in[31]}},in[31:25],in[11:7]}:(sign_func==3'b001)?{in[31:12],{12{1'b0}}}:(sign_func==3'b010)?{{12{in[31]}},in[31],in[19:12],in[20],in[30:21]}:(sign_func==3'b011)?{{20{in[31]}},in[31],in[7],in[30:25],in[11:8]}:(sign_func==3'b100)?{{27{1'b0}},in[24:20]}:{{20{in[31]}},in[31:20]};
endmodule
