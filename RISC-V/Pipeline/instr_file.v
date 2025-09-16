`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2023 01:43:29
// Design Name: 
// Module Name: instr_file
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


module instr_file(
    input rst,
    input [9:0] addr,
    output [31:0] instr
    );
    reg[31:0]instr_mem[0:2047];
    assign instr=~rst?32'h00000013:instr_mem[addr];
    
    initial
    begin
    $readmemh("fib_prog.mem",instr_mem);
    end
    
    
//    initial
//    begin
//    instr_mem[0]=32'h001101b3;//add x3,x1,x2
//    instr_mem[1]=32'h00429333;//sll r6,r5,r4
//    instr_mem[2]=32'h0042d3b3;//srl r7,r5,r4
//    instr_mem[3]=32'h00508413;//addi r8,r1,5
//   // instr_mem[4]=32'h00000013;//NOP addi r0,r0,0
//    instr_mem[4]=32'h0054d503;//load lhu r10,r9,5
//   // instr_mem[4]=32'h0054a503;//lw r10,r9,5   
//    instr_mem[5]=32'h00c59223;//store shu r12,r11,4
//  //  instr_mem[5]=32'h00c5a223;//store sw r12,r11,4
//    instr_mem[6]=32'h0001f6b7;//lui r13,31 loads 1f in the reg 
//    instr_mem[7]=32'h0001f717;//auipc r14,31
// //   instr_mem[8]=32'h012007ef;//jal x15,9 goes to instr 17
//  //  instr_mem[8]=32'h00000000;
//  //  instr_mem[8]=32'h00c808e7;//jalr r17,r16,12 , the 12 is added to 6 to go to instr 18
//    instr_mem[8]=32'h01390a63; //beq r18,r19,10decimal 
// //    instr_mem[8]=32'h01395a63; //bge r18,r19,10(goes to instr 18)
////    instr_mem[8]=32'h003a1a93; 
////    instr_mem[8]=32'h403a5a93;
//    instr_mem[17]=32'h00508c13;// addi x24,x1,5
//    instr_mem[18]=32'h00208c93;// addi x25 x1,2
//    end
endmodule
