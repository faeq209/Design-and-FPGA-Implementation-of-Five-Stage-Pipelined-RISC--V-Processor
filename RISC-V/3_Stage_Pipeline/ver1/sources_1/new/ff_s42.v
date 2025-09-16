`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 13:39:42
// Design Name: 
// Module Name: ff_s42
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

//rb_wr_s4,dm_sel_s4,dm_pc_sel_s4,instr_s4
module ff_s42(input clk,input[31:0] pc_nxt_in,input[31:0] alu_out_in,input[31:0] dout_in,input rb_wr_in,input dm_sel_in,input dm_pc_sel_in,input[31:0]instr_in,input pc_sel_s4,
                output reg[31:0] pc_nxt_out,output reg[31:0] alu_out_out,output reg[31:0] dout_out, output reg rb_wr_out,output reg dm_sel_out,output reg dm_pc_sel_out,output reg[31:0] instr_out,output reg pc_sel_s5=0

    );
    always@(posedge clk)
    begin
    pc_nxt_out=pc_nxt_in;
    alu_out_out=alu_out_in;
    dout_out=dout_in;
    rb_wr_out=rb_wr_in;
    dm_sel_out=dm_sel_in;
    dm_pc_sel_out=dm_pc_sel_in;
    instr_out=instr_in;
    pc_sel_s5=pc_sel_s4;
    end
endmodule
