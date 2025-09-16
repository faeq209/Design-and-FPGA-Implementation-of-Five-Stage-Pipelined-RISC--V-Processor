`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2023 00:49:40
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
    input [31:0] in1,
    output [31:0] out1
    );
    wire[31:0]pc,pc_nxt,final_pc,instr,alu_out,rd1,rd2,extend_out,alu_in1,alu_in2,wd,wd_f,dout,final_dout,rd2_extended;
    wire rb1_sel,rb2_sel,pc_sel,dm_sel,dm_pc_sel,rb_wr,dm_wr,br_sel,br_eq,br_gt,clk_out;
    wire[3:0] alu_ctl;
    wire[7:0]flag;
    wire[2:0] sign_sel;
    //wire[4:0]a1,a2,a3;
    clk_dvd ck1(clk,rst,clk_out);
    pc p1(.clk(clk_out),.rst(rst),.pc_nxt(final_pc),.pc(pc));
    pc_adder pc_adder(pc,32'd1,pc_nxt);
    mux pc_mux(pc_nxt,alu_out,pc_sel,final_pc);
    instr_file instr_file(rst,pc,instr);
    instr_decoder instr_decoder(instr,br_eq,br_gt,br_sel,rb1_sel,rb2_sel,pc_sel,dm_sel,dm_pc_sel,sign_sel,rb_wr, dm_wr,alu_ctl);
    reg_file reg_file(clk_out,rst,instr[19:15],instr[24:20],instr[11:7],wd_f,rb_wr,rd1,rd2);
    branch_comp br(rd1,rd2,br_sel,br_eq,br_gt);
    sign_extend sign_extend(instr,sign_sel,extend_out);
    mux rb1_mux(rd1,pc,rb1_sel,alu_in1);
    mux rb2_mux(rd2,extend_out,rb2_sel,alu_in2);
    alu alu(alu_in1,alu_in2,alu_ctl,flag,alu_out);
    extension rb_dm(rd2,instr[14:12],rd2_extended);
    data_file data_mem(clk_out,rst,alu_out,dm_wr,rd2_extended,in1,dout,out1);
    extension e1(dout,instr[14:12],final_dout);
    mux dm_mux(alu_out,final_dout,dm_sel,wd);
    mux dm_pc_mux(wd,pc_nxt,dm_pc_sel,wd_f);
   
    
endmodule
