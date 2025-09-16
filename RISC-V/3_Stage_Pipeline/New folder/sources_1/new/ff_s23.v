`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 13:38:03
// Design Name: 
// Module Name: ff_s23
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

// ff_s23 s23(clk_out,pc_nxt_s2,pc_s2,rd1_s2,rd2_s2,extend_out_s2,pc_sel,rb_wr,rb1_sel,rb2_sel,br_sel,alu_ctl,dm_wr,dm_sel,dm_pc_sel,instr_s2,pc_nxt_s3,pc_s3,rd1_s3,rd2_s3,extend_out_s3,pc_sel_s3,rb_wr_s3,rb1_sel_s3,rb2_sel_s3,br_sel_s3,alu_ctl_s3,dm_wr_s3,dm_sel_s3,dm_pc_sel_s3,instr_s3);

module ff_s23(input clk,input stall,input [31:0]pc_nxt_in,input[31:0] pc_in,input[31:0] rd1_in,input[31:0] rd2_in,input [31:0]extended_in,input pc_sel_in,input rb_wr_in,input rb1_sel_in,input rb2_sel_in,input br_sel_in,input[3:0] alu_ctl_in,input dm_wr_in,input dm_sel_in,input dm_pc_sel_in,input [31:0]instr_in,
                output reg[31:0] pc_nxt_out=0,output reg[31:0] pc_out,output reg[31:0] rd1_out,output reg[31:0] rd2_out,output reg[31:0] extended_out,output reg pc_sel_out=0 ,output reg rb_wr_out ,output reg rb1_sel_out,output reg rb2_sel_out ,output reg br_sel_out ,output reg[3:0] alu_ctl_out,output reg dm_wr_out,output reg dm_sel_out,output reg dm_pc_sel_out,output reg[31:0] instr_out

    );
    always@(posedge clk)
    begin
//    if(stall==0)
//    begin
    pc_nxt_out=pc_nxt_in;
    pc_out=pc_in;
    rd1_out=rd1_in;
    rd2_out=rd2_in;
    extended_out=extended_in;
    pc_sel_out=pc_sel_in;
    rb_wr_out=rb_wr_in;
    rb1_sel_out=rb1_sel_in;
    rb2_sel_out=rb2_sel_in;
    br_sel_out=br_sel_in;
    alu_ctl_out=alu_ctl_in;
    dm_wr_out=dm_wr_in;
    dm_sel_out=dm_sel_in;
    dm_pc_sel_out=dm_pc_sel_in;
    instr_out=instr_in;
//    end
//    else
//    begin
//    pc_nxt_out=0;
//    pc_out=0;
//    rd1_out=0;
//    rd2_out=0;
//    extended_out=0;
//    pc_sel_out=0;
//    rb_wr_out=0;
//    rb1_sel_out=0;
//    rb2_sel_out=0;
//    br_sel_out=0;
//    alu_ctl_out=0;
//    dm_wr_out=0;
//    dm_sel_out=0;
//    dm_pc_sel_out=0;
//    instr_out=32'h00000013;
//    end
    end
endmodule
