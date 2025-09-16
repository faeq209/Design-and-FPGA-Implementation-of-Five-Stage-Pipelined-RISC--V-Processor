`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2023 00:21:16
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(
    input [6:0] op,
    input [2:0] func3,
    input [6:0] func7,
    output reg [3:0] alu_ctl
    );
    
    wire op_check_1,op_check_2;
    assign op_check_1=(op==7'b0110011);
    assign op_check_2=(op==7'b0010011);
    assign op_check_3=(op==7'b0110111);
    always@(*)
    begin
    if(op_check_1)
    begin
    case (func3)
    3'b000:
    begin
    if(func7[5])
    alu_ctl=4'b0001;
    else
    alu_ctl=4'b0000;
    end
    3'b001:alu_ctl=4'b0010;
    3'b010:alu_ctl=4'b1001;
    3'b011:alu_ctl=4'b0100;
    3'b100:alu_ctl=4'b0111;
    3'b101:
        begin
        if(func7[5])
        alu_ctl=4'b1000;
        else
        alu_ctl=4'b0011;
        end
    3'b110:alu_ctl=4'b0110;
    3'b111:alu_ctl=4'b0101;
    default:alu_ctl=4'b0000;
    endcase
    end
    else if(op_check_2)
        begin
        case (func3)
        3'b000:alu_ctl=4'b0000;
        3'b001:alu_ctl=4'b0010;
        3'b010:alu_ctl=4'b1001;
        3'b011:alu_ctl=4'b0100;
        3'b100:alu_ctl=4'b0111;
        3'b101:
                begin
                if(func7[5])
                alu_ctl=4'b0011;
                else
                alu_ctl=4'b1000;
                end
        3'b110:alu_ctl=4'b0110;
        3'b111:alu_ctl=4'b0101;
        endcase
        end
     else if(op_check_3)
        begin
        alu_ctl=4'b1011;
        end
     else
     alu_ctl=4'b0000;
    end
//    assign alu_ctl=(op_check_1&(func3==3'b000)&func7[5])?4'b0001:
//                   (op_check_1&(func3==3'b000)&(~func7[5]))?4'b0000:
//                   (op_check_1&(func3==3'b001))?4'b0010:
//                   (op_check_1&(func3==3'b010))?4'b1001:
//                   (op_check_1&(func3==3'b011))?4'b0100:
//                   (op_check_1&(func3==3'b100))?4'b0111:
//                   (op_check_1&(func3==3'b101)&func7[5])?4'b1000:
//                   (op_check_1&(func3==3'b101)&(~func7[5]))?4'b0011:
//                   (op_check_1&(func3==3'b110))?4'b0110:
//                   (op_check_1&(func3==3'b111))?4'b0101:4'b0000;
                  
                   
endmodule
