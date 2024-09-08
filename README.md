# ASIC_Projects

Welcome to the ASIC_Projects repository! This repository contains various projects related to Application-Specific Integrated Circuits (ASICs). Below you will find an overview of the repository structure, installation instructions, and guidelines for contributing.

## Table of Contents

- [Introduction](#introduction)
- [Repository Structure]  (Spec docoument For each AISC project and RTL & Backend(SYN&DFT&Formailty) & PnR ) folders 

- [Contact]          Feel Free to ask me  (#zioza2002@gmail.com)

## Introduction

This repository is a collection of projects focused on the design, implementation, and testing of ASICs. Each project includes detailed documentation and source code to help you understand and reproduce the work.

## Repository Structure
1: Design and Implementation of a Low Power Configurable Multi Clock Digital System (RTL to GDS)
Project Overview
This project presents the complete design and implementation of a low-power, configurable multi-clock digital system. From RTL to GDS, the focus is on power optimization and clock configurability within a robust digital IC design flow.

Key Features
ALU Operations: Addition, Subtraction, Multiplication, Division, AND, OR, NAND, NOR, XOR, XNOR, CMP, and Shift operations.
Register File Operations: Write and read capabilities facilitated through specific command frames.
System Specifications:
REF_CLK: 50 MHz
UART_CLK: 3.6864 MHz
Always-On Clock Divider
Sequence of Operation
Configuration: Performed via Register File write operations.
Command Execution: The master sends various commands (RegFile and ALU operations).
Processing: Commands are processed by SYS_CTRL after reception through UART_RX.
Result Transmission: Results are sent back to the master via UART_TX.
Clock Domains
Clock Domain 1 (REF_CLK):
Register File
ALU
Clock Gating
SYS_CTRL
Clock Domain 2 (UART_CLK):
UART_TX
UART_RX
PULSE_GEN
Clock Dividers
Data Synchronization
RST Synchronizer
Data Synchronizer
ASYNC FIFO
This structure should work well for your README, providing a clear and concise overview of your project's functionality and features. Let me know if you want to add or modify anything further!
   
      
      
 2:  Design and Implementation of a Pipelined RISC-V Processor (RV32I) with APB Interface and UART Peripheral
Project Overview
This project involves the complete design and implementation of a Pipelined RISC-V Processor (RV32I) integrated with an Advanced Peripheral Bus (APB) Interface and UART Peripheral. The project was completed from RTL (Register Transfer Level) to GDSII (Graphical Data Stream Information Interchange) as part of the IEEEASU Advanced Digital IC Workshop.

Key Features
1. Pipelined RISC-V Processor (RV32I)
Architecture: A 32-bit RISC-V processor featuring a pipelined architecture, enabling simultaneous execution of multiple instructions for improved efficiency and performance.
ISA: Implements the RV32I instruction set architecture.
2. APB Master Interface
Functionality: Facilitates communication between the processor and various peripherals using the APB protocol, a popular bus standard in embedded systems.
3. Custom APB Address Decoder
Implementation: A custom APB address decoder designed to generate the appropriate PSEL (Peripheral Select) signals for each connected peripheral based on the address, ensuring correct data routing.
4. Asynchronous FIFO
Purpose: Prevents data loss caused by clock domain crossings (CDC), ensuring reliable data transfer between different clock domains.
5. UART with APB Slave Interface
Integration: A Universal Asynchronous Receiver-Transmitter (UART) with an APB Slave interface, allowing for serial communication between the processor and external devices. The design includes register layering for efficient data management.
Technical Details
RTL Design: Designed in Verilog HDL with a focus on modularity and reusability.
Synthesis: Synthesized using Synopsys Design Compiler.
Physical Design: Performed using Cadence SoC Encounter with a 130nm CMOS technology library.
Verification: Comprehensive verification using Mentor QuestaSim to ensure functionality and correctness of the design.
GDSII Export: Final layout exported to GDSII format for fabrication readiness.
Project Structure
/rtl: Contains all RTL design files.
/tb: Testbench files for simulation and verification.
/synth: Synthesis scripts and reports.
/layout: Physical design files, including DEF, LEF, and GDSII files.
/docs: Detailed documentation on the design, implementation, and verification process.
How to Run
Clone the Repository:

bash
Copy code
git clone <repo-link>
cd <repo-folder>
Simulation:

Navigate to the tb directory and run the simulation scripts using Mentor QuestaSim.
Synthesis:

Use the synthesis scripts in the synth folder with Synopsys Design Compiler.
Physical Design:

Load the layout files into Cadence SoC Encounter and follow the included scripts for placement, routing, and final GDSII export.
Documentation
For detailed documentation on the design process, implementation steps, and verification results, please refer to the Detailed Documentation included in this repository.

Acknowledgements
This project was part of the IEEEASU Advanced Digital IC Workshop. Special thanks to the workshop organizers and mentors for their guidance and support.
