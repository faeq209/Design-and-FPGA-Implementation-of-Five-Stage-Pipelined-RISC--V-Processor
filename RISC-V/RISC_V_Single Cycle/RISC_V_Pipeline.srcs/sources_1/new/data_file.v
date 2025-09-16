`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2023 02:07:28
// Design Name: 
// Module Name: data_file
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


module data_file(
    input clk,
    input rst,
    input [8:0] addr,
    input we,
    input [31:0] din,
    input [7:0] in_d0,
    output [31:0]dout,
    output [9:0]out
    );
    reg[31:0] data_mem[0:511];
  
    assign dout=data_mem[addr];
    assign out=data_mem[1];
    always@(posedge clk)
    begin
    data_mem[0]={24'h000000,in_d0};

    if(we)
    data_mem[addr]=din;
    end
    
//    initial
//    begin
//   #7;
//    data_mem[0]=32'h00000016;
    
//    //data_mem[5]=32'hf0119843;
//    end
    
endmodule
