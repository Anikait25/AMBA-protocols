module APB_protocol(
	input P_clk,
	input P_reset_n,
	input start_transfer,
	input rw,
	input [7:0]addr,
	input [7:0]wdata,
	output [7:0]rdata
	//output [7:0]P_wdata,
	//output [7:0]P_addr
);

wire P_sel;
wire P_enable;
wire P_write;
wire [7:0]P_addr;
wire [7:0]P_wdata;
wire [7:0]P_rdata;
wire P_ready;
wire P_slverr;

APB_master master(
	.P_clk(P_clk),
	.P_reset_n(P_reset_n),
	.P_sel(P_sel),
	.P_enable(P_enable),
	.P_write(P_write),
	.P_addr(P_addr),
	.P_wdata(P_wdata),
	.P_rdata(P_rdata),
	.rw(rw),
	.addr(addr),
	.wdata(wdata),
	.rdata(rdata),
	.P_ready(P_ready),
	.start_transfer(start_transfer),
	.P_slverr(P_slverr)
);

APB_slave slave(
	.P_clk(P_clk),
	.P_reset_n(P_reset_n),
	.P_sel(P_sel),
	.P_enable(P_enable),
	.P_write(P_write),
	.P_addr(P_addr),
	.P_wdata(P_wdata),
	.P_rdata(P_rdata),
	.P_ready(P_ready),
	.P_slverr(P_slverr)
);

endmodule