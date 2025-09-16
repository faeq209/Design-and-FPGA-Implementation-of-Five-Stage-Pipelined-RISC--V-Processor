`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Faeq Hussain
// 
// Create Date: 26.10.2023 11:50:00
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    input pc_rst,
    input [7:0] in1,
    output [9:0] out1
    );
    wire[31:0]pc,pc_nxt,final_pc,instr,alu_out,rd1,rd2,extend_out,alu_in1,alu_in2,wd,wd_f,dout,final_dout,rd2_extended;
    wire rb1_sel,rb2_sel,pc_sel,dm_sel,dm_pc_sel,rb_wr,dm_wr,br_sel,br_eq,br_gt,clk_out;
    wire[3:0] alu_ctl;
    wire[7:0]flag;
    wire[2:0] sign_sel;
    wire[31:0]pc_nxt_s1,pc_nxt_s2,pc_nxt_s3,pc_nxt_s4,pc_nxt_s5;
    //wire[31:0]pc_nxt_s2=32'h00000000;
    wire pc__rst;
    wire[31:0]pc_s1,pc_s2,pc_s3;
    wire[31:0]instr_s1,instr_s2,instr_s3,instr_s4,instr_s5;
    wire[31:0]rd1_s2,rd1_s3;
    wire[31:0]rd2_s2,rd2_s3;
    wire[31:0]extend_out_s2,extend_out_s3;
    wire[31:0]rd2_extended_s3,rd2_extended_s4;
    wire[31:0]alu_out_s3,alu_out_s4,alu_out_s5;
    wire[31:0]dout_s4,dout_s5;
    wire pc_sel_s2,pc_sel_s3,pc_sel_s4,pc_sel_s5;
    wire rb_wr_s3,rb_wr_s4,rb_wr_s5;
    wire rb1_sel_s3,rb1_sel_s4,rb1_sel_s5;
    wire rb2_sel_s3,rb2_sel_s4,rb2_sel_s5;
    wire br_sel_s3;
    wire[3:0] alu_ctl_s3;
    wire dm_wr_s3,dm_wr_s4;
    wire dm_sel_s3,dm_sel_s4,dm_sel_s5;
    wire dm_pc_sel_s3,dm_pc_sel_s4,dm_pc_sel_s5;
    wire [1:0]fwd_A_D,fwd_B_D;
    wire [1:0]fwd_A_E,fwd_B_E;
    wire[31:0]rd1_s2f,rd2_s2f;
    wire[31:0]rd1_s3f,rd2_s3f;
    wire[31:0]wd_f_s4,wd_f_s5;
    wire[31:0] wd_s5;
    wire pc_stall,stall;
    //wire[4:0]a1,a2,a3;
    assign wd_f_s4=dm_sel_s4?alu_out_s4:dout_s4;
    //assign clk_out=clk;
    clk_dvd ck1(clk,rst,clk_out);
    pc p1(.clk(clk_out),.rst(rst),.pc_rst(pc_rst),.pc_nxt(final_pc),.pc(pc_s1));
    pc_adder pc_adder(pc_s1,32'd1,pc_nxt_s1);
    mux pc_mux(pc_nxt_s1,alu_out_s5,pc_sel_s5,final_pc);
    instr_file instr_file(rst,pc_s1,instr_s1);
    ff_s12 s12(clk_out,stall,pc_nxt_s1,pc_s1,instr_s1,pc_nxt_s2,pc_s2,instr_s2);
    
    instr_decoder instr_decoder(instr_s2,br_eq,br_gt,br_sel,rb1_sel,rb2_sel,pc_sel,dm_sel,dm_pc_sel,sign_sel,rb_wr, dm_wr,alu_ctl);
    reg_file reg_file(clk_out,rst,instr_s2[19:15],instr_s2[24:20],instr_s5[11:7],wd_f,rb_wr_s5,rd1_s2,rd2_s2);
    mux4to1 f1_mux(rd1_s2,alu_out_s3,alu_out_s4,wd_f,fwd_A_D,rd1_s2f);
    mux4to1 f2_mux(rd2_s2,alu_out_s3,alu_out_s4,wd_f,fwd_B_D,rd2_s2f);
    sign_extend sign_extend(instr_s2,sign_sel,extend_out_s2);
    branch_comp br(rd1_s2f,rd2_s2f,br_sel,br_eq,br_gt);
    ff_s23 s23(clk_out,stall,pc_nxt_s2,pc_s2,rd1_s2f,rd2_s2f,extend_out_s2,pc_sel,rb_wr,rb1_sel,rb2_sel,br_sel,alu_ctl,dm_wr,dm_sel,dm_pc_sel,instr_s2,pc_nxt_s3,pc_s3,rd1_s3,rd2_s3,extend_out_s3,pc_sel_s3,rb_wr_s3,rb1_sel_s3,rb2_sel_s3,br_sel_s3,alu_ctl_s3,dm_wr_s3,dm_sel_s3,dm_pc_sel_s3,instr_s3);
    
    
    //mux f3_mux(wd_f,rd1_s3,fwd_A_E,rd1_s3f);
    mux4to1 f3_mux(rd1_s3,wd_f_s4,wd_f,rd1_s3,fwd_A_E,rd1_s3f);//*
    mux4to1 f4_mux(rd2_s3,wd_f_s4,wd_f,rd2_s3,fwd_B_E,rd2_s3f);//*
    mux rb1_mux(rd1_s3f,pc_s3,rb1_sel_s3,alu_in1);
    mux rb2_mux(rd2_s3f,extend_out_s3,rb2_sel_s3,alu_in2);
    alu alu(alu_in1,alu_in2,alu_ctl_s3,flag,alu_out_s3);
    extension rb_dm(rd2_s3f,instr_s3[14:12],rd2_extended_s3);
    ff_s34 s34(clk_out,pc_nxt_s3,alu_out_s3,rd2_extended_s3,pc_sel_s3,rb_wr_s3,dm_wr_s3,dm_sel_s3,dm_pc_sel_s3,instr_s3,pc_nxt_s4,alu_out_s4,rd2_extended_s4,pc_sel_s4,rb_wr_s4,dm_wr_s4,dm_sel_s4,dm_pc_sel_s4,instr_s4);
    
    data_file data_mem(clk_out,rst,alu_out_s4,dm_wr_s4,rd2_extended_s4,in1,dout_s4,out1);
    ff_s42 s42(clk_out,pc_nxt_s4,alu_out_s4,dout_s4,rb_wr_s4,dm_sel_s4,dm_pc_sel_s4,instr_s4,pc_sel_s4,pc_nxt_s5,alu_out_s5,dout_s5,rb_wr_s5,dm_sel_s5,dm_pc_sel_s5,instr_s5,pc_sel_s5);
    
    extension e1(dout_s5,instr_s5[14:12],final_dout);
    mux dm_mux(alu_out_s5,final_dout,dm_sel_s5,wd);
    mux dm_pc_mux(wd,pc_nxt_s5,dm_pc_sel_s5,wd_f);
   
   ///////////////////////HAZARD CONTROL UNIT///////////////////////////////////////
   hazard_cntl_unit h1(clk_out,instr_s2[19:15],instr_s2[24:20],instr_s3[19:15],instr_s3[24:20],instr_s3[11:7],instr_s4[11:7],instr_s5[11:7],rb_wr_s3,rb_wr_s4,rb_wr_s5,dm_wr_s3,dm_wr_s4,pc_sel,stall,fwd_A_D,fwd_B_D,fwd_A_E,fwd_B_E);
   
    
endmodule
