module APB_slave(
	input P_clk,
	input P_reset_n,
	input P_sel,
	input P_enable,
	input P_write,
	input [7:0] P_addr,
	input [7:0] P_wdata,
	output reg [7:0] P_rdata,
	output reg P_ready,
	output P_slverr
);

reg [7:0] MEMORY [0:255];

assign P_slverr = 0;

always@(posedge P_clk)
begin
	if(!P_reset_n)
	begin
		P_rdata <= 0;
		P_ready <= 0;
	end 
	else if(P_sel && P_enable) 
		begin
			P_ready <= 1;
			if(P_write) begin
				MEMORY[P_addr] <= P_wdata;
				$display("data=%b",P_wdata);
			end
			else begin
				P_rdata <= MEMORY[P_addr];
				$display("rx_data=%b",P_rdata);
			end
		end
	else P_ready <= 0;
	end
endmodule