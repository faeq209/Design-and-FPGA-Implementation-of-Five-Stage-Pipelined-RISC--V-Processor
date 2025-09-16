`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 11:50:00
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input clk,
    input rst,
    input [4:0] a1,
    input [4:0] a2,
    input [4:0] a3,
    input [31:0] wd,
    input we,
    output [31:0] rd1,
    output [31:0] rd2

    );
    reg[31:0] reg_mem[0:31];
    integer i;
    assign rd1=~rst?32'h00000000:reg_mem[a1];
    assign rd2=~rst?32'h00000000:reg_mem[a2];
    always@(posedge clk)
    begin
    reg_mem[0]=32'h00000000;
     if(we)
     reg_mem[a3]=wd;
     
    end
    initial
    begin
    for (i=0;i<32;i=i+1)
    reg_mem[i]=32'd0;
    end
    //ila_0 debugger(clk,reg_mem[3],reg_mem[6]);
//    initial
 //   begin
//    #7;
//    reg_mem[1]=32'h00000020;
//    reg_mem[2]=32'h00000008;
//    reg_mem[4]=32'h00000001;
//    reg_mem[5]=32'h00000007;
//    reg_mem[7]=32'h00000007;
//   // reg_mem[8]=32'h00000000;
//    reg_mem[9]=32'h00000000;//index to add 5 and load from mem
//    reg_mem[11]=32'h00000000;//index for adding 4 and string in mem
//    reg_mem[12]=32'h00010117;//storing this at mem[4]
//    reg_mem[16]=32'h00000006;
//    reg_mem[18]=32'h00000032;
//    reg_mem[19]=32'h00000032;
//    reg_mem[20]=32'h0000000f;
    
//    end
    
endmodule
