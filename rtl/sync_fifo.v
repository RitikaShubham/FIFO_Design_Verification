module sync_fifo #(

parameter WIDTH = 8,
parameter DEPTH = 16

)(

input clk,
input reset,

input wr_en,
input rd_en,

input [WIDTH-1:0] data_in,

output reg [WIDTH-1:0] data_out,

output full,
output empty

);

localparam PTR_WIDTH = $clog2(DEPTH);
reg [WIDTH-1:0] mem[0:DEPTH-1];

reg [PTR_WIDTH:0] wr_ptr;
reg [PTR_WIDTH:0] rd_ptr;

assign empty = (wr_ptr == rd_ptr);

assign full =
    (wr_ptr[PTR_WIDTH] != rd_ptr[PTR_WIDTH]) &&
    (wr_ptr[PTR_WIDTH-1:0] == rd_ptr[PTR_WIDTH-1:0]);

    assign empty = (wr_ptr == rd_ptr);
    assign full =
    (wr_ptr[PTR_WIDTH] != rd_ptr[PTR_WIDTH]) &&
    (wr_ptr[PTR_WIDTH-1:0] == rd_ptr[PTR_WIDTH-1:0]);

always @(posedge clk)
begin
    if (reset)
    begin
        wr_ptr   <= 0;
        rd_ptr   <= 0;
        data_out <= 0;
    end
    else
    begin
        // Write Operation
        if (wr_en && !full)
        begin
            mem[wr_ptr[PTR_WIDTH-1:0]] <= data_in;
            wr_ptr <= wr_ptr + 1;
        end

        // Read Operation
        if (rd_en && !empty)
        begin
            data_out <= mem[rd_ptr[PTR_WIDTH-1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end
end

endmodule