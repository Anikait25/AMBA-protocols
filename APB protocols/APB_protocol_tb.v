module APB_protocol_tb;
reg P_clk;
reg P_reset_n;
reg start_transfer;
reg rw;
reg [7:0]addr;
reg [7:0]wdata;
wire [7:0]rdata;
//wire [7:0]P_wdata;
//wire [7:0]P_addr;

APB_protocol protocol(
	.P_clk(P_clk),
	.P_reset_n(P_reset_n),
	.start_transfer(start_transfer),
	.rw(rw),
	.addr(addr),
	.wdata(wdata),
	.rdata(rdata)
	//.P_wdata(P_wdata),
	//.P_addr(P_addr)
);

initial
P_clk = 0;
always #5 P_clk = ~P_clk;

initial
begin
P_reset_n = 0;
start_transfer = 0;
rw = 0;
addr = 0;
wdata = 0;

// Apply reset
#20;
P_reset_n = 1;

// --- Write transaction ---
#10;
start_transfer = 1;
rw = 1;
addr = 8'h0A;
wdata = 8'h55;
              // Write
  // Start transfer
#10;
start_transfer = 0;
#10;

// --- Read transaction ---

start_transfer = 1;
rw = 0; 
addr = 8'h0A;
             // Read
#10;
start_transfer = 0;
#100;
$stop;
end
endmodule