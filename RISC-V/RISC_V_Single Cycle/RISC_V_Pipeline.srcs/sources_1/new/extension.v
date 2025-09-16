`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2023 19:29:54
// Design Name: 
// Module Name: extension
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


module extension(
    input [31:0] in,
    input [2:0] sel,
    output reg[31:0] out
    );
    always@(*)
    begin
    case (sel)
    3'b000:out={{24{in[31]}},in[7:0]};
    3'b001:out={{16{in[31]}},in[15:0]};
    3'b010:out=in;
    3'b100:out={{24{1'b0}},in[7:0]};
    3'b101:out={{16{1'b0}},in[15:0]};
    default:out=in;
    
    
    endcase
    end
endmodule
