/**
 * A processor to compute Black-Scholes algorithm.
 *
 * Explanation of each constants:
 *
 *	- constK: K
 * - const1: S*exp((r-0.5*sigma^2)*T)
 *	- const2: sigma*sqrt(T)
 *	- const3: exp(-r*T)
 *
 * Constants above should be given from the M1 module.
 *
 *
 * Commands:
 *
 *	- RUN: When the processor is in IDLE state, command this to process algorithm.
 * - ACK: When the processor is in COMPLETE state, command this to be in IDLE to be ready for next computation.
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
	input [31:0] constK,
	input [31:0] const1,
	input [31:0] const2,
	input [31:0] const3,
	input [3:0] cmd,
	 
	output [3:0] status,
	output reg [31:0] acc_dout,
	output reg [31:0] pow_acc_dout
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
	reg [31:0] s_constK;
	reg [31:0] s_const1;
	reg [31:0] s_const2;
	reg [31:0] s_const3;
	reg [31:0] cnt_clk;
	// Each is an accumulate register of const3_mult_conv_dout values and pow_conv_dout values repectively.
	reg [63:0] acc;
	reg [63:0] pow_acc;
	// To test computing Black-Scholes model process except for Gaussian Random Number Generator.
	reg [31:0] pseudo_grn;
	
	wire clk_en;
	// Input and output of each modules in this processor.
	wire [31:0] const2_mult_din;
	wire [31:0] const2_mult_dout;
	wire [31:0] exp_din;
	wire [31:0] exp_dout;
	wire [31:0] const1_mult_din;
	wire [31:0] const1_mult_dout;
	wire [31:0] k_sub_din;
	wire [31:0] k_sub_dout;
	wire [31:0] const3_mult_din;
	wire [31:0] const3_mult_dout;
	wire [31:0] const3_mult_conv_din;
	wire [63:0] const3_mult_conv_dout;
	wire [31:0] pow_din;
	wire [31:0] pow_dout;
	wire [31:0] pow_conv_din;
	wire [63:0] pow_conv_dout;
	wire [63:0] fx_conv_din;
	wire [31:0] fx_conv_dout;
	
	assign status = state;
	assign clk_en = 1'b1;
	// Connect input and output of each modules.
	assign const2_mult_din = pseudo_grn;
	assign exp_din = const2_mult_dout;
	assign const1_mult_din = exp_dout;
	assign k_sub_din = const1_mult_dout;
	assign const3_mult_din = k_sub_dout[31] ? 32'd0 : k_sub_dout;
	assign const3_mult_conv_din = const3_mult_dout;
	assign pow_din = const3_mult_dout;
	assign pow_conv_din = pow_dout;
	assign fx_conv_din = (cnt_clk <= LATENCY_CONST3_MULT_CONV_DOUT + niter + 4) ? acc : pow_acc;
	
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
	 * @update s_const3
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			s_niter <= 32'd0;
			s_constK <= 32'd0;
			s_const1 <= 32'd0;
			s_const2 <= 32'd0;
			s_const3 <= 32'd0;
		end else begin
			case (state)
			IDLE: begin
				s_niter <= niter;
				s_constK <= constK;
				s_const1 <= const1;
				s_const2 <= const2;
				s_const3 <= const3;
			end
			default: begin
				s_niter <= s_niter;
				s_constK <= s_constK;
				s_const1 <= s_const1;
				s_const2 <= s_const2;
				s_const3 <= s_const3;
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
				default: begin
					cnt_clk <= cnt_clk;
				end
			endcase
		end
	end
	
	/**
	 *
	 * @update acc_dout
	 * @update pow_acc_dout
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			acc_dout <= 32'd0;
			pow_acc_dout <= 32'd0;
		end else begin
			case (state)
				RUNNING: begin
					if (cnt_clk <= LATENCY_CONST3_MULT_CONV_DOUT + niter + 8) begin
						acc_dout <= fx_conv_dout;
						pow_acc_dout <= 32'd0;
					end else begin
						acc_dout <= acc_dout;
						pow_acc_dout <= fx_conv_dout;
					end
				end
				default: begin
					acc_dout <= acc_dout;
					pow_acc_dout <= pow_acc_dout;
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
					pseudo_grn <= 32'b10111111100000000000000000000000;
					/*if (cnt_clk == 32'd0) begin
						pseudo_grn <= 32'b10111111100000000000000000000000;		// This represents -1 in form of IEEE float.
					end else if (cnt_clk == 32'd1) begin
						pseudo_grn <= 32'b10111111100000000000000000000000;		// This represents -3 in form of IEEE float.
					end else begin
						pseudo_grn <= 32'b10111111100000000000000000000000;		// This represents -2 in form of IEEE float.
					end*/
				end
				default: begin
					pseudo_grn <= pseudo_grn;
				end
			endcase
		end
	end
	
	/**
	 *
	 * @update acc
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			acc <= 64'd0;
		end else begin
			case (state)
				RUNNING: begin
					if (cnt_clk <= LATENCY_CONST3_MULT_CONV_DOUT + niter) begin
						acc <= acc + const3_mult_conv_dout;
					end else begin
						acc <= acc;
					end
				end
				COMPLETE: begin
					acc <= acc;
				end
				default: begin
					acc <= 64'd0;
				end
			endcase
		end
	end
	
	/**
	 *
	 * @update pow_acc
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			pow_acc <= 64'd0;
		end else begin
			case (state)
				RUNNING: begin
					if (cnt_clk <= LATENCY_POW_CONV_DOUT + niter) begin
						pow_acc <= pow_acc + pow_conv_dout;
					end else begin
						pow_acc <= pow_acc;
					end
				end
				COMPLETE: begin
					pow_acc<= pow_acc;
				end
				default: begin
					pow_acc <= 64'd0;
				end
			endcase
		end
	end
	/*
	// Latency: 5 clock cycle.
	// Supports pipelining.
	fp_mult const2_mult(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(s_const2),
		.datab(const2_mult_din),
		.result(const2_mult_dout)
	);
	
	// Latency: 17 clock cycle.
	// Supports pipelining.
	fp_exp exp(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.data(exp_din),
		.result(exp_dout)
	);
	
	// Latency: 5 clock cycle.
	// Supports pipelining.
	fp_mult const1_mult(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(s_const1),
		.datab(const1_mult_din),
		.result(const1_mult_dout)
	);
	
	// Latency: 7 clock cycle.
	// Supports pipelining.
	fp_sub k_sub(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(s_constK),
		.datab(k_sub_din),
		.result(k_sub_dout)
	);
	
	// Latency: 5 clock cycle.
	// Supports pipelining.
	fp_mult const3_mult(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(s_const3),
		.datab(const3_mult_din),
		.result(const3_mult_dout)
	);
	
	// A module that converts a floating point number to a fixed point number.
	// Output fixed number: custom 44-bit fraction 20-bit
	// Latency: 6 clock cycle.
	// Supports pipelining.
	fp_fx_conv const3_mult_conv(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(const3_mult_conv_din),
		.result(const3_mult_conv_dout)
	);
	
	// Latency: 5 clock cycle.
	// Supports pipelining.
	fp_mult pow(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(pow_din),
		.datab(pow_din),
		.result(pow_dout)
	);
	
	// A module that converts a floating point number to a fixed point number.
	// Output fixed number: custom 44-bit fraction 20-bit
	// Latency: 6 clock cycle.
	// Supports pipelining.
	fp_fx_conv pow_conv(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(pow_conv_din),
		.result(pow_conv_dout)
	);
	
	// A module that converts a fixed point number to a floating point number.
	// Input fixed number: custom 44-bit fraction 20-bit
	// Latency: 6 clock cycle.
	// Supports pipelining.
	fx_fp_conv fx_fp_conv(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(fx_conv_din),
		.result(fx_conv_dout)
	);*/
	 
endmodule
