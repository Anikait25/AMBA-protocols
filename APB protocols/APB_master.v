module APB_master(
	input P_clk,
	input P_reset_n,
	output reg P_sel,
	output reg P_enable,
	output reg P_write,
	output reg [7:0] P_addr,
	output reg [7:0] P_wdata,
	input [7:0] P_rdata,
	input rw,
	input [7:0] addr,
	input [7:0] wdata,
	output reg [7:0] rdata,
	input P_ready,
	input start_transfer,
	input P_slverr
);

localparam IDLE = 0;
localparam SETUP = 1;
localparam ACCESS = 2;
reg [1:0]state;

always@(posedge P_clk)
begin
	if(!P_reset_n)
	begin
		state <= IDLE;
		P_sel <= 0;
		P_enable <= 0;
	end
	else begin
		case(state)
			IDLE:
				begin
					P_sel <= 0;
					P_enable <= 0;
					if(start_transfer) state <= SETUP;
					else state <= IDLE;
				end
			SETUP:
				begin
					P_sel <= 1;
					P_enable <= 1;
					P_addr <= addr;
					P_write <= rw;
					if(rw) begin
						P_wdata <= wdata;
					end
					else begin
					state <= ACCESS;
					end
				end
			ACCESS:
				begin
					P_enable <= 1;
					if(P_ready) begin
						if(!rw) begin 
							rdata <= P_rdata;
						end
					state <= ACCESS;
					end
				end
		endcase
	end
end

endmodule
