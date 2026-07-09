`timescale 1ns/1ps

module sync_fifo_tb;

reg clk;
reg reset;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;


sync_fifo #(
    .WIDTH(8),
    .DEPTH(16)
) dut (
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;


initial
begin
$dumpfile("sim/fifo.vcd");
$dumpvars(0, sync_fifo_tb);

    clk     = 0;
    reset   = 1;
    wr_en   = 0;
    rd_en   = 0;
    data_in = 0;

    #20;

    reset = 0;
    #10;

// ---------- Write 10 ----------
wr_en   = 1;
data_in = 8'd10;

#10;

$display("Time=%0t wr_ptr=%0d rd_ptr=%0d data_in=%0d data_out=%0d full=%b empty=%b",
         $time, dut.wr_ptr, dut.rd_ptr, data_in, data_out, full, empty);

// ---------- Write 20 ----------
data_in = 8'd20;

#10;

$display("Time=%0t wr_ptr=%0d rd_ptr=%0d data_in=%0d data_out=%0d full=%b empty=%b",
         $time, dut.wr_ptr, dut.rd_ptr, data_in, data_out, full, empty);

// ---------- Write 30 ----------
data_in = 8'd30;

#10;

$display("Time=%0t wr_ptr=%0d rd_ptr=%0d data_in=%0d data_out=%0d full=%b empty=%b",
         $time, dut.wr_ptr, dut.rd_ptr, data_in, data_out, full, empty);

// ---------- Write 40 ----------
data_in = 8'd40;

#10;

$display("Time=%0t wr_ptr=%0d rd_ptr=%0d data_in=%0d data_out=%0d full=%b empty=%b",
         $time, dut.wr_ptr, dut.rd_ptr, data_in, data_out, full, empty);

// Stop Writing
wr_en = 0;

#20;

// ---------- Read ----------
rd_en = 1;

#10;
if (data_out == 8'd10)
    $display("PASS : Read 10 correctly");
else
    $display("FAIL : Expected 10, Got %0d", data_out);
#10;
$display("Time=%0t | READ | data_out=%0d | wr_ptr=%0d | rd_ptr=%0d | full=%b | empty=%b",
         $time, data_out, dut.wr_ptr, dut.rd_ptr, full, empty);
#10;
$display("Time=%0t | READ | data_out=%0d | wr_ptr=%0d | rd_ptr=%0d | full=%b | empty=%b",
         $time, data_out, dut.wr_ptr, dut.rd_ptr, full, empty);
#10;
$display("Time=%0t | READ | data_out=%0d | wr_ptr=%0d | rd_ptr=%0d | full=%b | empty=%b",
         $time, data_out, dut.wr_ptr, dut.rd_ptr, full, empty);

rd_en = 0;

#20;

$finish;

end

endmodule