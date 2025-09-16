`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 13:38:26
// Design Name: 
// Module Name: ff_s34
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
 //ff_s34 s34(clk_out,pc_nxt_s3,alu_out_s3,rd2_extended_s3,pc_sel_s3,rb_wr_s3,dm_wr_s3,dm_sel_s3,dm_pc_sel_s3,instr_s3,pc_nxt_s4,alu_out_s4,rd2_extended_s4,pc_sel_s4,rb_wr_s4,dm_wr_s4,dm_sel_s4,dm_pc_sel_s4,instr_s4);


module ff_s34(input clk,input[31:0] pc_nxt_in,input[31:0] alu_out_in,input[31:0] extend_in,input pc_sel_in,input rb_wr_in,input dm_wr_in,input dm_sel_in,input dm_pc_sel_in,input[31:0] instr_in,
                output reg[31:0] pc_nxt_out,output reg[31:0] alu_out_out,output reg[31:0] extend_out,output reg pc_sel_out=0,output reg rb_wr_out,output reg dm_wr_out,output reg dm_sel_out,output reg dm_pc_sel_out,output reg[31:0] instr_out

    );
    always@(posedge clk)
    begin
    pc_nxt_out=pc_nxt_in;
    alu_out_out=alu_out_in;
    extend_out=extend_in;
    pc_sel_out=pc_sel_in;
    rb_wr_out=rb_wr_in;
    dm_wr_out=dm_wr_in;
    dm_sel_out=dm_sel_in;
    dm_pc_sel_out=dm_pc_sel_in;
    instr_out=instr_in;
    end
endmodule
