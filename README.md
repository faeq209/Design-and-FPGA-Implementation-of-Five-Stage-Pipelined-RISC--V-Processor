This project implements a RISC-V (RV32I) 5-stage pipelined processor on the Basys-3 FPGA board, designed in Verilog HDL. The processor follows a Harvard architecture with separate instruction and data memories, and supports 37 out of 47 RV32I instructions.

🔑 Features

RV32I ISA support with 37 implemented instructions

5 pipeline stages: Instruction Fetch, Decode, Execute, Memory, Write Back

Hazard Control Unit (HCU) for stall management and data forwarding

Harvard architecture with 64KB instruction memory and 16KB data memory

FPGA verified with programs like:

Sum of N natural numbers

Nth Fibonacci number

Performance improvements over single-cycle core:

Max frequency increased from 31.6 MHz → 87.8 MHz (≈2.8×)

Power reduced from 244 mW → 96 mW

⚙️ Implementation

Language: Verilog HDL

FPGA Board: Basys-3 (Xilinx Artix-7)

Simulation/Tools: Xilinx Vivado

I/O:

Input via switches (8-bit)

Output via LEDs (10-bit)

📈 Results

Correct execution of arithmetic, branching, memory, and logic instructions

Efficient hazard handling with data forwarding and pipeline stalls

Optimized for throughput, power, and clock frequency

🚀 Future Work

Optimize HDL for reduced resource utilization

Add cache memory for faster access

Implement bus controllers for peripheral interfacing

Extend ISA with additional instructions
