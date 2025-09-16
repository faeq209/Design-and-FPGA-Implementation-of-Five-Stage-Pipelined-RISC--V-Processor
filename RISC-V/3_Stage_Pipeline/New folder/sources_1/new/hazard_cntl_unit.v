`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2023 12:57:10
// Design Name: 
// Module Name: hazard_cntl_unit
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


module hazard_cntl_unit(input clk,input [4:0]rs1,input[4:0] rs2,input[4:0] rd,input rb_wr,input dm_wr,input pc_sel,output stall,output reg fwd_A_D,output reg fwd_B_D

    );
//    always@(*)
//    begin
//    fwd_A_D=0;
//    fwd_B_D=0;
//    if(rb_wr)
//    begin
//    if(rd1==rs1)
//    fwd_A_D=1'b1;
//    else if(rd2==rs1)
//    fwd_A_E=1'b1;
//    if(rd1==rs2) 
//    fwd_B_D=1'b1;
//    else if(rd2==rs2)
//    fwd_B_E=1'b1;
//    end
//    else
//    begin
//    fwd_A_D=1'b0;
//    fwd_B_D=1'b0;
//    end

    stall_cntl stl(clk,pc_sel,stall);
    
        always@(*)
        begin
        fwd_A_D=0;
        fwd_B_D=0;

        
        
        if(rb_wr)
        begin
        if(rd==rs1)
        fwd_A_D=1;
        if(rd==rs2)
        fwd_B_D=1;
        end
        
        
      
        
        
        

        ////////////////STALL//////////////////////
//        if(pc_sel)
//        stall=1;
//        else
//        stall=0;

        
        end
    
    

endmodule

