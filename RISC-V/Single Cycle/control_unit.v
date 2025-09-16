`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2023 13:35:53
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [31:0] inst,
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
    output dm_wr
    
    );
    wire[6:0] opcode;
    wire[2:0] func3;
    reg br;
    wire[1:0] br_out;
    assign opcode=inst[6:0];
    assign func3=inst[14:12];
    assign br_out={br_eq,br_gt};
   // assign br=0;
    //assign br=((opcode==7'b1100011)&(((func3==3'b000)&(br_out==2'b10)))|((func3==3'b001)&(br_eq==1'b0))|(((func3==3'b110)|(func3==3'b100))&(br_out==2'b00))|(((func3==3'b111)|(func3==3'b101))&(br_eq^br_gt==1'b1)))?1:0;    
   // assign br=((opcode==7'b1100011)&(((func3==3'b000)&(br_out==2'b10))|((func3==3'b001)&(br_eq==1'b0))|(((func3==3'b100)|(func3==3'b110))&(br_out==2'b00)))||(((func3==3'b101)|(func3==3'b111))&((br_eq^br_gt)==1'b1)))?1:0;
    assign br_sel=(opcode==7'b1100011)&(func3[2:1]==2'b10)?0:1;
    assign rb1_sel=(opcode==7'b0110011)|(opcode==7'b0010011)|(opcode==7'b0000011)|(opcode==7'b0100011)|(opcode==7'b1100111)?1'b1:1'b0;
    assign rb2_sel=(opcode==7'b0110011)?1'b1:1'b0;
    assign pc_sel=(opcode==7'b1101111)|(opcode==7'b1100111)|br?0:1;
    assign dm_sel=(opcode==7'b0000011)?0:1;
    assign dm_pc_sel=(opcode==7'b1101111)|(opcode==7'b1100111)?0:1;
    assign sign_sel=(opcode==7'b0100011)?3'b111:((opcode==7'b0110111)|(opcode==7'b0010111))?3'b001:(opcode==7'b1101111)?3'b010:(opcode==7'b1100011)?3'b011:((opcode==7'b0010011)&(func3[1:0]==2'b01))?3'b100:3'b000;
    assign rb_wr=(opcode==7'b0110011)|(opcode==7'b0010011)|(opcode==7'b0000011)|(opcode==7'b0110111)|(opcode==7'b0010111)|(opcode==7'b1101111)|(opcode==7'b1100111)?1'b1:1'b0;
    assign dm_wr=(opcode==7'b0100011)?1:0;
    always@(*)
    begin
    if(opcode==7'b1100011)
    begin
    case (func3)
    3'b000:
            begin
            if(br_out==2'b10)
                br=1;
            else
                br=0;
            end
    3'b001:
                    begin
                    if(br_eq==1'b0)
                        br=1;
                    else
                        br=0;
                    end
    3'b100:
                    begin
                   if(br_out==2'b00)
                         br=1;
                   else
                         br=0;
                   end
                   
    3'b101:
                 begin
                 if((br_out==2'b01)|(br_out==2'b10))
                       br=1;
                 else
                       br=0;
                 end
    3'b110:
                         begin
                         if(br_out==2'b00)
                             br=1;
                         else
                             br=0;
                         end                
    3'b111:
                                 begin
                                 if((br_out==2'b01)|(br_out==2'b10))
                                     br=1;
                                 else
                                     br=0;
                                 end
                                 
    default: br=0;
    endcase
    end
    else
    br=0;
    end
    
endmodule
