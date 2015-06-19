/**
 * A processor to compute Black-Scholes algorithm.
 *
 * Explanation of each constants:
 *
 *	- constK: K in fixed point number integer 8-bit / fraction 12-bit
 * - const1: S*exp((r-0.5*sigma^2)*T) in fixed point number integer 23-bit / fraction 12-bit
 *	- const2: sigma*sqrt(T) in fixed point number integer 3-bit / fraction 12-bit
 *
 * Constants above should be given from the M1 module.
 *
 * Commands:
 *
 *	- RUN: When the processor is in IDLE state, command this to process algorithm.
 * - ACK: When the processor is in COMPLETE state, command this to be in IDLE to be ready for next computation.
 *
 * Results:
 *
 * - acc_dout: Sum of present values in fixed point number integer 40-bit / fraction 12-bit.
 * - pow_acc_dout: Sum of power of 2 to each present values in fixed point number integer 40-bit / fraction 12-bit
 *
 * Processing Overview
 *
 * TODO
 *
 */
module processor(
	input clk,
	input nreset,
	input [31:0] niter,
	input [19:0] constK,
	input [34:0] const1,
	input [14:0] const2,
	input [3:0] cmd,
	 
	output [3:0] status,
	output reg [51:0] acc_dout,
	output reg [51:0] pow_acc_dout
);

	parameter CMD_RUN = 1;
	parameter CMD_ACK = 2;

	// Available states.
	parameter IDLE = 0;
	parameter RUNNING = 1;
	parameter COMPLETE = 2;
	// Latency of each final fixed point number outputs.
	localparam LATENCY_CONST3_MULT_CONV_DOUT = 45;
	localparam LATENCY_POW_CONV_DOUT = 50;
	
	reg [3:0] state;
	reg [3:0] nxt_state;
	reg [31:0] s_niter;
	reg [19:0] s_constK;
	reg [34:0] s_const1;
	reg [14:0] s_const2;
	reg [31:0] cnt_clk;
	reg [51:0] sum;
	reg [51:0] pow_sum;
	// To test computing Black-Scholes model process except for Gaussian Random Number Generator.
	reg [31:0] pseudo_grn;
	
	// Input and output of each modules.
	wire [28:0] const2_mult_din;
	wire [44:0] const2_mult_dout;
	wire [7:0] special_exp_lut_din;
	wire [20:0] special_exp_lut_dout;
	wire [20:0] mult_for_exp_21_din;
	wire [13:0] mult_for_exp_14_din;
	wire [34:0] mult_for_exp_dout;
	wire [34:0] sub_from_k_din;
	wire [34:0] sub_from_k_dout;
	sub_19_35 sub_from_k(
		.nreset(~nreset),
		.clk(clk),
		.dina(s_constk),
		.dinb(sub_from_k_din),
		.dout(sub_from_k_dout)
	);
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	mult_20_20 pow(
		.aclr0(~nreset),
		.clock0(clk),
		.dataa_0(pow_din),
		.datab_0(pow_din),
		.result(pow_dout)
	);
	
	assign status = state;
	
	/**
	 *
	 * @update state
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			state <= IDLE;
		end else begin
			state <= nxt_state;
		end
	end
	
	/**
	 * 
	 * @compute nxt_state
	 */
	always @(*) begin
		case (state)
		IDLE: begin
			if (cmd == CMD_RUN) begin
				nxt_state = RUNNING;
			end else begin
				nxt_state = IDLE;
			end
		end
		RUNNING: begin
			// TODO: How this know the computation ends?
			if (cnt_clk == LATENCY_POW_CONV_DOUT + niter + 8) begin
				nxt_state = COMPLETE;
			end else begin
				nxt_state = state;
			end
		end
		COMPLETE: begin
			nxt_state = state;
			if (cmd == CMD_ACK) begin
				nxt_state = IDLE;
			end else begin
				nxt_state = state;
			end
		end
		default: begin
			nxt_state = IDLE;
		end
		endcase
	end
	
	/**
	 *
	 * @update niter
	 * @update s_constK
	 * @update s_const1
	 * @update s_const2
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			s_niter <= 32'd0;
			s_constK <= 20'd0;
			s_const1 <= 35'd0;
			s_const2 <= 15'd0;
		end else begin
			case (state)
			IDLE: begin
				s_niter <= niter;
				s_constK <= constK;
				s_const1 <= const1;
				s_const2 <= const2;
			end
			endcase
		end
	end
	
	/**
	 *
	 * @update cnt_clk
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			cnt_clk <= 32'd0;
		end else begin
			case (state)
				RUNNING: begin
					cnt_clk <= cnt_clk + 32'd1;
				end
				IDLE: begin
					cnt_clk <= 32'd0;
				end
			endcase
		end
	end
	
	/**
	 *
	 * @update pseudo_grn
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			pseudo_grn <= 32'd0;
		end else begin
			case (state)
			RUNNING: begin
				pseudo_grn <= 32'b11111111111111111_000000000000000;	// This represents -1 in form of 17/15 fixed point number.
			end
			endcase
		end
	end
	
	/**
	 *
	 * @update sum
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sum <= 52'd0;
		end else begin
			case (state)
			IDLE: begin
				sum <= 52'd0;
			end
			RUNNING: begin
				// TODO
				if (cnt_clk <= LATENCY_CONST3_MULT_CONV_DOUT + niter) begin
					sum <= sum + const3_mult_conv_dout;
				end
			end
			endcase
		end
	end
	
	/**
	 *
	 * @update pow_sum
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			pow_sum <= 52'd0;
		end else begin
			case (state)
			IDLE: begin
				pow_sum <= 52'd0;
			end
			RUNNING: begin
				// TODO
				if (cnt_clk <= LATENCY_POW_CONV_DOUT + niter) begin
					pow_sum <= pow_sum + pow_conv_dout;
				end
			end
			endcase
		end
	end
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	mult_29_15 const2_mult(
		.aclr0(~nreset),
		.clock0(clk),
		.dataa_0(const2_mult_din),
		.datab_0(s_const2),
		.result(const2_mult_dout)
	);
	
	// Latency 0 clock cycle.
	special_exp_lut(
		.din(special_exp_lut_din),
		.dout(special_exp_lut_dout)
	);
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	mult_40_33 mult_for_exp(
		.aclr0(~nreset),
		.clock0(clk),
		.dataa_0(mult_for_exp_40_din),
		.datab_0(mult_for_exp_33_din),
		.result(mult_for_exp_dout)
	);
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	sub_19_35 sub_from_k(
		.nreset(~nreset),
		.clk(clk),
		.dina(s_constk),
		.dinb(sub_from_k_din),
		.dout(sub_from_k_dout)
	);
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	mult_20_20 pow(
		.aclr0(~nreset),
		.clock0(clk),
		.dataa_0(pow_din),
		.datab_0(pow_din),
		.result(pow_dout)
	);
	
endmodule

module sub_19_35(
	input nreset,
	input clk,
	input [18:0] dina,
	input [34:0] dinb,
	
	output reg [34:0] dout
);

	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			dout <= 34'd0;
		end else begin
			dout <= {dina, 16'd0} - dinb;
		end
	end

endmodule
