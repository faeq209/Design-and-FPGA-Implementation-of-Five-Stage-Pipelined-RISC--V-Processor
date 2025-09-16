`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 11:50:00
// Design Name: 
// Module Name: branch_comp
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


module branch_comp(
    input [31:0] in1,
    input [31:0] in2,
    input [2:0] comp_ctl,
    output reg br_ctl
    );
    always@(*)
    begin
    case(comp_ctl)
    3'b000: br_ctl=($signed(in1)==$signed(in2));
    3'b001:br_ctl= ($signed(in1)!=$signed(in2));
    3'b100:br_ctl= ($signed(in1)< $signed(in2));
    3'b101:br_ctl=($signed(in1)>=$signed(in2));
    3'b110:br_ctl=(in1<in2);
    3'b111:br_ctl=(in1>=in2);
    default: br_ctl=0;
    endcase
    end
   
endmodule
