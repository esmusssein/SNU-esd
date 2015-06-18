/**
 * A processor to compute Black-Scholes algorithm.
 */
module processor(
	input clk,
	input nreset,
	input [31:0] constK,
	input [31:0] const1,
	input [31:0] const2,
	input [31:0] const3,
	input [3:0] cmd,
	 
	output [3:0] status,
	output [31:0] dout
);

	parameter CMD_RUN = 1;
	parameter CMD_ACK = 2;

	parameter IDLE = 0;
	parameter RUNNING = 1;
	parameter COMPLETE = 2;
	
	reg [3:0] state;
	reg [3:0] nxt_state;
	reg [31:0] s_constK;
	reg [31:0] s_const1;
	reg [31:0] s_const2;
	reg [31:0] s_const3;
	// Final result values.
	reg [31:0] sum;
	reg [31:0] pow_sum;
	// For testing.
	reg [31:0] cnt_clk;
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
	assign fx_conv_din = const3_mult_conv_dout;
	// Assign final processor value.
	assign dout = sum;
	
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
			if (cnt_clk == 32'd52) begin
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
	 * @update s_constK
	 * @update s_const1
	 * @update s_const2
	 * @update s_const3
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			s_constK <= 32'd0;
			s_const1 <= 32'd0;
			s_const2 <= 32'd0;
			s_const3 <= 32'd0;
		end else begin
			case (state)
			IDLE: begin
				s_constK <= constK;
				s_const1 <= const1;
				s_const2 <= const2;
				s_const3 <= const3;
			end
			default: begin
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
	 * @update pseudo_grn
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			pseudo_grn <= 32'd0;
		end else begin
			case (state)
				RUNNING: begin
					if (cnt_clk == 32'd0) begin
						pseudo_grn <= 32'b10111111100000000000000000000000;		// This represents -1 in form of IEEE float.
					end else begin
						pseudo_grn <= 32'b11000000000000000000000000000000;		// This represents -2 in form of IEEE float.
					end
				end
				default: begin
					pseudo_grn <= pseudo_grn;
				end
			endcase
		end
	end
	
	/**
	 *
	 * @update sum, pow_sum
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sum <= 32'd0;
			pow_sum <= 32'd0;
		end else begin
			case (state)
				RUNNING: begin
					sum <= fx_conv_dout;
					pow_sum <= 32'd0;
				end
				COMPLETE: begin
					sum <= sum;
					pow_sum <= pow_sum;
				end
				default: begin
					sum <= 32'd0;
					pow_sum <= 32'd0;
				end
			endcase
		end
	end
	
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
	fp_fx_conv const3_mult_conv(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(const3_mult_conv_din),
		.result(const3_mult_conv_dout)
	);
	
	// A module that converts a fixed point number to a floating point number.
	// Input fixed number: custom 44-bit fraction 20-bit
	// Latency: 6 clock cycle.
	fx_fp_conv fx_fp_conv(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(fx_conv_din),
		.result(fx_conv_dout)
	);
	
	// Latency: 5 clock cycle.
	// Supports pipelining.
	/*fp_mult pow(
		.aclr(~nreset),
		.clk_en(clk_en),
		.clock(clk),
		.dataa(pow_din),
		.datab(pow_din),
		.result(pow_dout)
	);*/
	 
endmodule
