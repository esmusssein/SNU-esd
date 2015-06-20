/**
 * A module that manipulate signals from M1 to M3.
 */
module host_itf (
   input clk,
   input nRESET,
   input FPGA_nRST,
	input HOST_nOE,
	input HOST_nWE,
	input HOST_nCS,
	input [20:0] HOST_ADD,
	input [15:0] HDI,
	input [3:0] proc_status,
	input [63:0] proc_sum_dout,
	input [63:0] proc_pow_sum_dout,
	
	output reg [15:0] HDO,
	output reg [5:0] SEG_COM,
	output reg [7:0] SEG_DATA,
	output host_sel,
	output [31:0] niter,
	output [63:0] constK,
	output [63:0] const1,
	output [63:0] const2,
	output [3:0] proc_cmd
);

	parameter PROC_CMD_ACK = 2;
	parameter PROC_STATUS_IDLE = 0;
	parameter PROC_STATUS_COMPLETE = 2;
	
	// Dedicated registers for constants for computation.
	reg [15:0] x8800_0000;
	reg [15:0] x8800_0002;
	reg [15:0] x8800_0004;
	reg [15:0] x8800_0006;
	reg [15:0] x8800_0008;
	reg [15:0] x8800_000A;
	reg [15:0] x8800_000C;
	reg [15:0] x8800_000E;
	reg [15:0] x8800_0010;
	reg [15:0] x8800_0012;
	reg [15:0] x8800_0014;
	reg [15:0] x8800_0016;
	reg [15:0] x8800_0018;
	reg [15:0] x8800_001A;
	// Redundant registers.
	/*reg [15:0] x8800_001C;
	reg [15:0] x8800_001E;
	reg [15:0] x8800_0020;
	reg [15:0] x8800_0022;
	reg [15:0] x8800_0024;
	reg [15:0] x8800_0026;
	reg [15:0] x8800_0028;
	reg [15:0] x8800_002A;
	reg [15:0] x8800_002C;
	reg [15:0] x8800_002E;*/
	// Command registers.
	reg [15:0] x8800_1000;
	// Dedicated registers for results.
	reg [15:0] x8800_3000;
	reg [15:0] x8800_3002;
	reg [15:0] x8800_3004;
	reg [15:0] x8800_3006;
	reg [15:0] x8800_3008;
	reg [15:0] x8800_300A;
	reg [15:0] x8800_300C;
	reg [15:0] x8800_300E;
	
	assign host_sel = 1'b1;
	assign constK = {x8800_0006, x8800_0004, x8800_0002, x8800_0000};
	assign const1 = {x8800_000E, x8800_000C, x8800_000A, x8800_0008};
	assign const2 = {x8800_0016, x8800_0014, x8800_0012, x8800_0010};
	assign niter = {x8800_001A, x8800_0018};
	assign proc_cmd = (proc_status == PROC_STATUS_COMPLETE) ? PROC_CMD_ACK : x8800_1000[3:0];
	
   /**
	 *
	 * @update x8800_xxxx
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			x8800_0000 <= 16'd0;
			x8800_0002 <= 16'd0;
			x8800_0004 <= 16'd0;
			x8800_0006 <= 16'd0;
			x8800_0008 <= 16'd0;
			x8800_000A <= 16'd0;
			x8800_000C <= 16'd0;
			x8800_000E <= 16'd0;
			x8800_0010 <= 16'd0;
			x8800_0012 <= 16'd0;
			x8800_0014 <= 16'd0;
			x8800_0016 <= 16'd0;
			x8800_0018 <= 16'd0;
			x8800_001A <= 16'd0;
			/*x8800_001C <= 16'd0;
			x8800_001E <= 16'd0;
			x8800_0020 <= 16'd0;
			x8800_0022 <= 16'd0;
			x8800_0024 <= 16'd0;
			x8800_0026 <= 16'd0;
			x8800_0028 <= 16'd0;
			x8800_002A <= 16'd0;
			x8800_002C <= 16'd0;
			x8800_002E <= 16'd0;*/
			x8800_1000 <= 16'd0;
		end else begin
			if (proc_status == PROC_STATUS_COMPLETE) begin
				x8800_1000 <= PROC_STATUS_IDLE;
			end else if (HOST_nCS == 1'b0 && HOST_nWE == 1'b0 && HOST_nOE == 1'b1 && HOST_ADD[20] == 1'b0) begin
				case (HOST_ADD[19:0])
					20'h00000: x8800_0000 <= HDI;
					20'h00002: x8800_0002 <= HDI;
					20'h00004: x8800_0004 <= HDI;
					20'h00006: x8800_0006 <= HDI;
					20'h00008: x8800_0008 <= HDI;
					20'h0000A: x8800_000A <= HDI;
					20'h0000C: x8800_000C <= HDI;
					20'h0000E: x8800_000E <= HDI;
					20'h00010: x8800_0010 <= HDI;
					20'h00012: x8800_0012 <= HDI;
					20'h00014: x8800_0014 <= HDI;
					20'h00016: x8800_0016 <= HDI;
					20'h00018: x8800_0018 <= HDI;
					20'h0001A: x8800_001A <= HDI;
					/*20'h0001C: x8800_001C <= HDI;
					20'h0001E: x8800_001E <= HDI;
					20'h00020: x8800_0020 <= HDI;
					20'h00022: x8800_0022 <= HDI;
					20'h00024: x8800_0024 <= HDI;
					20'h00026: x8800_0026 <= HDI;
					20'h00028: x8800_0028 <= HDI;
					20'h0002A: x8800_002A <= HDI;
					20'h0002C: x8800_002C <= HDI;
					20'h0002E: x8800_002E <= HDI;*/
					20'h01000: x8800_1000 <= HDI;
				endcase
			end
		end
	end
	
	/**
	 *
	 * @update HDO
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			HDO <= 16'b0;
		end else begin
			if (HOST_nCS == 1'b0 && HOST_nOE == 1'b0) begin
				case (HOST_ADD[19:0])
					20'h03000: HDO <= x8800_3000;
					20'h03002: HDO <= x8800_3002;
					20'h03004: HDO <= x8800_3004;
					20'h03006: HDO <= x8800_3006;
					20'h03008: HDO <= x8800_3008;
					20'h0300A: HDO <= x8800_300A;
					20'h0300C: HDO <= x8800_300C;
					20'h0300E: HDO <= x8800_300E;
				endcase
			end
		end
	end
	
	/**
	 *
	 * @update x8800_3xxx
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			x8800_3000 <= 16'd0;
			x8800_3002 <= 16'd0;
			x8800_3004 <= 16'd0;
			x8800_3006 <= 16'd0;
			x8800_3008 <= 16'd0;
			x8800_300A <= 16'd0;
			x8800_300C <= 16'd0;
			x8800_300E <= 16'd0;
		end else begin
			case (proc_status)
			PROC_STATUS_COMPLETE: begin
				x8800_3000 <= proc_sum_dout[15:0];
				x8800_3002 <= proc_sum_dout[31:16];
				x8800_3004 <= proc_sum_dout[47:32];
				x8800_3006 <= proc_sum_dout[63:48];
				x8800_3008 <= proc_pow_sum_dout[15:0];
				x8800_300A <= proc_pow_sum_dout[31:16];
				x8800_300C <= proc_pow_sum_dout[47:32];
				x8800_300E <= proc_pow_sum_dout[63:48];
			end
			endcase
		end
	end
	
	/**
	 * TODO: set SRAM control signal.
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
		end else begin
			if (HOST_nCS == 1'b0 && HOST_nWE == 1'b0 && HOST_nOE == 1'b1 && HOST_ADD[20] == 1'b1) begin
			end
		end
	end
	
	/**************************************
	 * 7 segment part.
	 **************************************/
	
	parameter CLK_CNT_FOR_ONE_SEC = 50000000 - 1;
	parameter CLK_CNT_FOR_HALF_MILLISEC = 25000 - 1;
	
	// 1kHz clock for 7 segment.
	reg seg_clk;
	reg [2:0] cnt_segcon;
	integer my_clk_cnt;
	integer my_clk_cnt2;
	
	/**
	 *
	 * @update my_clk_cnt
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			my_clk_cnt <= 0;
		end else begin
			if (my_clk_cnt == CLK_CNT_FOR_ONE_SEC) begin
				my_clk_cnt <= 0;
			end else begin
				my_clk_cnt <= my_clk_cnt + 1;
			end
		end
	end
	
	/**
	 *
	 * @update my_clk_cnt2
	 *	@update seg_clk;
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			my_clk_cnt2 <= 0;
			seg_clk <= 0;
		end else begin
			if (my_clk_cnt2 == CLK_CNT_FOR_HALF_MILLISEC) begin
				my_clk_cnt2 <= 0;
				seg_clk <= ~seg_clk;
			end else begin
				my_clk_cnt2 <= my_clk_cnt2 + 1;
				seg_clk <= seg_clk;
			end
		end
	end
	
	/**
	 *
	 * @update cnt_segcon, SEG_COM, SEG_DATA
	 */
	always @(posedge seg_clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			SEG_COM <= 0;
			SEG_DATA <= 0;
		end else begin
			if (cnt_segcon == 5) cnt_segcon <= 0;
			else                 cnt_segcon <= cnt_segcon+1'b1;
			
			case (cnt_segcon)
				3'd0:   begin SEG_COM <= 6'b011111; SEG_DATA <= {conv_int(x8800_3000[3:0]), 1'b0}; end
				3'd1:   begin SEG_COM <= 6'b101111; SEG_DATA <= {conv_int(x8800_3000[7:4]), 1'b0}; end
				3'd2:   begin SEG_COM <= 6'b110111; SEG_DATA <= {conv_int(x8800_3000[11:8]), 1'b0}; end
				3'd3:   begin SEG_COM <= 6'b111011; SEG_DATA <= {conv_int(x8800_3000[15:12]), 1'b0}; end
				3'd4:   begin SEG_COM <= 6'b111101; SEG_DATA <= {conv_int(x8800_3002[3:0]), 1'b0}; end
				3'd5:   begin SEG_COM <= 6'b111110; SEG_DATA <= {conv_int(x8800_3002[7:4]), 1'b0}; end
				default begin SEG_COM <= 6'b111111; SEG_DATA <= 8'b00000000; end
			endcase
		end
	end
	
	function [6:0] conv_int;
		input [3:0] cnt;
		begin
			case (cnt)
				4'd0:   conv_int = 7'b1111110;
				4'd1:   conv_int = 7'b0110000;
				4'd2:   conv_int = 7'b1101101;
				4'd3:   conv_int = 7'b1111001;
				4'd4:   conv_int = 7'b0110011;
				4'd5:   conv_int = 7'b1011011;
				4'd6:   conv_int = 7'b1011111;
				4'd7:   conv_int = 7'b1110000;
				4'd8:   conv_int = 7'b1111111;
				4'd9:   conv_int = 7'b1111011;
				default conv_int = 7'b0000000;
			endcase
		end
	endfunction
endmodule

