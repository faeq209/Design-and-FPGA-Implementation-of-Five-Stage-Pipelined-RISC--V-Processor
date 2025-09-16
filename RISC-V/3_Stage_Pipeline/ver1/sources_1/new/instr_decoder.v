`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Faeq Hussain
// 
// Create Date: 26.10.2023 11:50:00
// Design Name: 
// Module Name: instr_decoder
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


module instr_decoder(
    input [31:0] instr,
    input br_eq,
    input br_gt,
    output br_sel,
    output rb1_sel,
    output rb2_sel,
    output pc_sel,
    output dm_sel,
    output dm_pc_sel,
    output [2:0]sign_sel,
    output rb_wr,
    output dm_wr,
    output[3:0] alu_ctl
    );
    wire[6:0]op;
    wire[2:0]func3;
    wire[6:0]func7;
    assign op=instr[6:0];
    assign func3=instr[14:12];
    assign func7=instr[31:25];
  control_unit c1(instr,br_eq,br_gt,br_sel,rb1_sel, rb2_sel,pc_sel,dm_sel,dm_pc_sel,sign_sel,rb_wr,dm_wr);
    
  alu_decoder ad1(op,func3,func7,alu_ctl);
  
  
endmodule
