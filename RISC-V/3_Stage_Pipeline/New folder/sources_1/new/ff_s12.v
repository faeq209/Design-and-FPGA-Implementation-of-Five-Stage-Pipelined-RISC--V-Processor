`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 13:37:40
// Design Name: 
// Module Name: ff_s12
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


module ff_s12(input clk,input stall,input [31:0]pc_nxt_in,input[31:0] pc_in,input[31:0] instr_in,
                output reg[31:0] pc_nxt_out,output reg[31:0] pc_out,output reg[31:0] instr_out

    );
    always@(posedge clk or posedge stall)
    begin
    if(stall==0)
    begin
    pc_nxt_out=pc_nxt_in;
    pc_out=pc_in;
    instr_out=instr_in;
    end
    else
    begin
    pc_nxt_out=0;
    pc_out=0;
    instr_out=32'h00000013;

    end
    end
endmodule
