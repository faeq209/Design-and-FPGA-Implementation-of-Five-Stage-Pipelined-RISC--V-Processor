`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 11:50:00
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] func,
    output [7:0] flag,
    output reg [31:0]out=0
    );
    reg cy=0;
    assign flag[7]=cy;
    assign flag[6]=out[31];
    assign flag[5]=^out;
    assign flag[4]=~|out;
  //  assign flag[3]=((func==4'b0000)|(func==4'b0001)|(func==4'b0010)|(func==4'b0011))?((a[63]&b[63]&(~out[63]))|((~a[63])&(~b[63])&out[63])):0;
    assign flag[3]=1'b0;
    assign flag[2]=0;
    assign flag[1]=0;
    assign flag[0]=0;
    
    always@(*)
    begin
    case(func)
    4'b0000: {cy,out}=a+b;
    4'b0001: out=a-b;
    4'b0010: out=a<<(b&32'd31);
    4'b0011: out=a>>(b&32'd31);
    4'b0100: out=a<b;
    4'b0101: out=a&b;
    4'b0110: out=a|b;
    4'b0111: out=a^b;
    4'b1000: out=a>>>(b&32'd31);
    4'b1001: out=($signed(a)<$signed(b));
    4'b1010: out=a;
    4'b1011: out=b;
    4'b1100: out=b>>1;
    4'b1101: out=b<<1;
    4'b1110: out=~(a^b);
    4'b1111: out=(a%b);
    default: out=a&b;
    
    
    
    
    endcase
    end
endmodule
