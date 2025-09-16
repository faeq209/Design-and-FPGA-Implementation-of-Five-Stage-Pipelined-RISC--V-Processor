`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2023 09:37:40
// Design Name: 
// Module Name: branch_comp
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


module branch_comp(
    input [31:0] in1,
    input [31:0] in2,
    input br_sel,
    output br_eq,
    output br_gt
    );
    assign br_eq=br_sel?(in1==in2):($signed(in1)==$signed(in2));
    assign br_gt=br_sel?(in1>in2):($signed(in1)>$signed(in2));
endmodule
