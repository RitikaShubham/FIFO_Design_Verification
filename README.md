# 🚀 Parameterized Synchronous FIFO Design & Verification

## 📌 Project Overview

This project implements a **parameterized synchronous FIFO (First-In-First-Out)** in **Verilog HDL**. The design supports configurable data width and FIFO depth, making it reusable for different digital hardware applications.

The FIFO has been functionally verified using a custom Verilog testbench developed from scratch.

---

## 🎯 Features

- Parameterized FIFO Width
- Parameterized FIFO Depth
- Synchronous Read Operation
- Synchronous Write Operation
- Circular Buffer Architecture
- Full Flag Generation
- Empty Flag Generation
- Custom Verilog Testbench
- Functional Verification using Icarus Verilog

---

## 🏗️ FIFO Architecture

> *(Architecture diagram will be added here.)*

---

## 📂 Project Structure

```
FIFO_Design_Verification
│
├── rtl
│   └── sync_fifo.v          # RTL Design
│
├── tb
│   └── sync_fifo_tb.v       # Testbench
│
├── sim
│   └── fifo.vcd             # Simulation waveform
│
└── README.md
```

---

## ⚙️ Parameters

| Parameter | Description |
|-----------|-------------|
| WIDTH | Width of each FIFO data word |
| DEPTH | Number of FIFO locations |

---

## 📥 Inputs

| Signal | Description |
|---------|-------------|
| clk | System Clock |
| reset | Synchronous Reset |
| wr_en | Write Enable |
| rd_en | Read Enable |
| data_in | Input Data |

---

## 📤 Outputs

| Signal | Description |
|---------|-------------|
| data_out | Output Data |
| full | FIFO Full Flag |
| empty | FIFO Empty Flag |

---

## 🧪 Verification

The FIFO was verified using a custom Verilog testbench covering:

- Reset Operation
- Multiple Write Operations
- Multiple Read Operations
- Full Flag Checking
- Empty Flag Checking
- PASS/FAIL Verification using `$display`

---

## 🛠 Tools Used

- Verilog HDL
- VS Code
- Icarus Verilog
- Git
- GitHub

---

## 📈 Future Improvements

- Asynchronous FIFO
- Randomized Testbench
- SystemVerilog Assertions (SVA)
- Functional Coverage
- UVM Verification Environment

---

## 👩‍💻 Author

**Ritika Shubham**

Aspiring RTL Design & Design Verification Engineer
