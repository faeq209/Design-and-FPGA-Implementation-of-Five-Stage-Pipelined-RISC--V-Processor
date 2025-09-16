This repository presents the design and FPGA implementation of a RISC-V (RV32I) 5-stage pipelined processor developed in Verilog HDL and deployed on the Xilinx Basys-3 FPGA (Artix-7). The processor architecture is based on the Harvard memory model, incorporating independent instruction and data memories, and supports 37 of the 47 RV32I instructions.

🔑 Key Contributions

Pipeline Implementation: Five pipeline stages—Instruction Fetch, Instruction Decode, Execute, Memory Access, and Write Back—achieving improved throughput and reduced cycle time.

Hazard Mitigation: Integration of a Hazard Control Unit (HCU) to manage data hazards through forwarding and to address control hazards via stalling.

Performance Evaluation:

Single-cycle design achieved a maximum operating frequency of 31.6 MHz with 244 mW power consumption.

Pipelined design improved maximum frequency to 87.8 MHz (≈2.78× higher) with reduced power consumption of 96 mW.

Validation: Verified through FPGA prototyping using benchmark programs (e.g., summation of N natural numbers, computation of the Nth Fibonacci term).

⚙️ Implementation Details

HDL: Verilog

Board: Xilinx Basys-3 (Artix-7 FPGA)

Toolchain: Xilinx Vivado

Memory:

Instruction Memory: 64 KB (ROM)

Data Memory: 16 KB (RAM)

I/O: 8-bit input (switches), 10-bit output (LEDs)

📈 Results & Insights

The proposed pipelined processor demonstrates a significant performance gain compared to its single-cycle counterpart, highlighting the impact of pipeline design and hazard control strategies on clock frequency and power efficiency.

📖 Reference

This work is published in the IEEE International Conference on Intelligent and Innovative Computing Technologies (I2CT), 2024.
👉 https://ieeexplore.ieee.org/document/10544184

🚀 Future Scope

HDL optimization to further reduce resource utilization.

Integration of cache memory to enhance memory performance.

Addition of bus controllers and peripheral interfacing.

Extension of the ISA beyond RV32I to support advanced applications.
