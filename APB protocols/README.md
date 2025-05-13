# AMBA APB Protocol Controller

A **Verilog-based controller** for the **AMBA APB (Advanced Peripheral Bus)** protocol. This project enables communication between a master and slave using the APB protocol, optimized for low-bandwidth, low-power applications. The controller can be easily integrated into FPGA-based embedded systems.

---

## 🚀 Features

- ✅ Implements the AMBA **APB Protocol**
- 🔁 Simple master-slave communication with two-phase data transfer
- 🧱 Clean and modular Verilog HDL design
- 🧪 Simulation-ready with testbench support
- 🔌 Optimized for Intel MAX10 FPGA (10M50DAF484C7G)
- 💡 Parameterizable for different slave peripherals

---

## 🧠 Description

This project implements a hardware controller that supports the **AMBA APB (Advanced Peripheral Bus)** protocol. It provides:
- A **master** module to initiate communication
- A **slave** module to respond to read and write operations
- A **top-level module** to integrate and manage the master-slave interaction

All components are written in Verilog and are designed to be synthesized on an FPGA.

---

## 🛠 Modules Included

### 🔹 APB Master
- Initiates read and write operations
- Handles address, data, and control signals
- Supports **two-phase** transfer with handshake mechanism (`PREADY`, `PENABLE`)

### 🔹 APB Slave
- Responds to read and write requests from the master
- Provides data on read and acknowledges write operations
- Supports **PREADY** signal for response readiness

### 🔹 Top-Level Controller
- Manages the interface between master and slave
- Handles clock, reset, address, and data control signals
- Integrates the **APB Master** and **APB Slave** modules

---

## ⚙️ Protocol Behavior

The APB protocol uses a **two-phase** communication where:
- The **PSEL** signal selects the slave.
- The **PENABLE** signal indicates the second cycle of the transfer.
- The **PREADY** signal from the slave indicates that it is ready for the operation to complete.

---

## 🧪 Simulation Instructions

You can simulate the APB controller using any Verilog simulator (ModelSim recommended):

1. Instantiate the `top_module`.
2. Apply reset (`rst = 1` → `rst = 0`).
3. Provide clock (`clk`) and protocol-related control signals.
4. Drive test input data and observe slave responses.
5. Simulate read and write transactions and observe waveform signals.

Use `$display`, `$monitor`, or waveform viewer to observe the **PREADY**, **PENABLE**, and **PSEL** signals to validate protocol behavior.

---

## 💻 Tools Used

- **Verilog HDL**
- **ModelSim Intel FPGA Edition** (Simulation)
- **Quartus Prime Lite** (Synthesis/Implementation)
- **Target FPGA:** Intel MAX10 (10M50DAF484C7G)

---

## 📌 Future Enhancements

- ✅ Add support for **multiple slaves** in the same bus
- ✅ Parameterized **data width** support
- ✅ Integration with higher-level bus systems like **AXI** or **AHB**
- ✅ Optimized clock and reset logic for power efficiency
- ✅ Add **interrupt handling** for APB transactions

## 📄 License

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute this work with proper attribution.

---

## 👨‍💻 Author

- **Anikait Sarkar**
- RSA SEIP VLSI Trainee
