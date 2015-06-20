/**
 * A processor to compute Black-Scholes algorithm.
 *
 * Explanation of each constants:
 *
 *	- constK: K in range(0~100), as fixed point number integer 8-bit / fraction 15-bit
 * - const1: S*exp((r-0.5*sigma^2)*T) in range(0.6737947, 2202646.5), as fixed point number integer 23-bit / fraction 15-bit
 *	- const2: sigma*sqrt(T) in range (0, 3.1622777), as fixed point number integer 3-bit / fraction 15-bit
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
 * - acc_dout: Sum of present values in fixed point number integer 40-bit / fraction 15-bit.
 * - pow_acc_dout: Sum of power of 2 to each present values in fixed point number integer 40-bit / fraction 15-bit
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
	input [63:0] constK,
	input [63:0] const1,
	input [63:0] const2,
	input [3:0] cmd,

	output [3:0] status,
	output [63:0] sum_dout,
	output [63:0] pow_sum_dout
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
	reg [63:0] s_constK;			// (8, 15)
	reg [63:0] s_const1;			// (23, 15)
	reg [63:0] s_const2;			// (3, 15)
	reg [31:0] cnt_clk;
	reg [63:0] sum;				// (40, 15)
	reg [63:0] pow_sum;			// (40, 15)
	// To test computing Black-Scholes model process except for Gaussian Random Number Generator.
	reg [31:0] pseudo_grn;					// (17, 15)
	
	// Input and output of each modules.
	wire [19:0] const2_mult_din;			// (5, 15)
	wire [37:0] const2_mult_dout;			// (8, 30)
	wire [3:0] delay_2_cycle_din;
	wire [3:0] delay_2_cycle_dout;
	wire [7:0] special_exp_lut_din;		// (6, 2)
	wire [39:0] special_exp_lut_dout;	// (9, 31)
	wire [39:0] mult_for_exp_dina;		// (9, 31)
	wire [16:0] mult_for_exp_dinb;		// (2, 15)
	wire [56:0] mult_for_exp_dout;		// (11, 46)
	wire [56:0] const1_mult_din;			// (11, 46)
	wire [94:0] const1_mult_dout;			// (34, 61)
	wire [22:0] sub_from_k_din;			// (8, 15)
	wire [22:0] sub_from_k_dout;			// (8, 15)
	wire [22:0] pow_din;						// (8, 15)
	wire [45:0] pow_dout;					// (16, 30)
	
	assign status = state;
	// Multiply const2 and grn.
	assign const2_mult_din = pseudo_grn[19:0];
	// Demux from integer part of const2_mult_dout. If < -19 outputs 2, else if < 5 outputs 1, else outputs 0.
	assign delay_2_cycle_din = ($signed(const2_mult_dout[34:27]) < -19) ? 4'd2 : ($signed(const2_mult_dout[34:27]) < 5) ? 4'd1: 4'd0;
	// Lookup an exponential lut specialized for this application by (6, 2) of const2_mult_dout.
	assign special_exp_lut_din = const2_mult_dout[35:28];
	// Mutiply the result of exp lut and (1 + rest of bits of const2_mult_dout) to get appromixation of exp.
	assign mult_for_exp_dina = special_exp_lut_dout;
	assign mult_for_exp_dinb = {2'b01, 2'b00, const2_mult_dout[27:15]};
	// Multiply const1 and exp(const2*grn).
	assign const1_mult_din = mult_for_exp_dout[56:0];
	// Determine an operand to subtract to constK. If it is expected too small by the Demux above, set 0. Else if it is too large or larger than K, set K.
	assign sub_from_k_din = (delay_2_cycle_dout == 4'd2) ? 0 : (delay_2_cycle_dout == 4'd0 || $signed(s_constK[22:0]) < $signed(const1_mult_dout[94:46])) ? s_constK[22:0] : const1_mult_dout[68:46];
	assign pow_din = sub_from_k_dout;
	// For testing.
	//assign sum_dout = {const2_mult_dout[37:15], delay_2_cycle_dout};
	assign sum_dout = pow_dout[45:15];
	
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
			s_constK <= 63'd0;
			s_const1 <= 63'd0;
			s_const2 <= 63'd0;
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
				//pseudo_grn <= 32'b1111_1111_1111_1111_1000_0000_0000_0000;  // (17, 15)
				//pseudo_grn <= 32'b0000_0000_0000_0000_1000_0000_0000_0000;  // (17, 15)
				pseudo_grn <= 32'b1111_1111_1111_1110_0000_0000_0000_0000;
			end
			endcase
		end
	end
	
	/**
	 *
	 * @update sum
	 */
	/*always @(posedge clk or negedge nreset) begin
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
	/*always @(posedge clk or negedge nreset) begin
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
	end*/
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	mult_20_18 const2_mult(
		.aclr0(~nreset),
		.clock0(clk),
		.dataa_0(const2_mult_din),
		.datab_0(s_const2[17:0]),
		.result(const2_mult_dout)
	);
	
	// Latency 2 clock cycle.
	// Supports pipelining.
	delay_2_cycle mdelay_2_cycle(
		.nreset(nreset),
		.clock(clk),
		.din(delay_2_cycle_din),
		.dout(delay_2_cycle_dout)
	);
		
	// Latency 0 clock cycle.
	special_exp_lut mspecial_exp_lut(
		.din(special_exp_lut_din),
		.dout(special_exp_lut_dout)
	);
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	mult_40_17 mult_for_exp(
		.aclr0(~nreset),
		.clock0(clk),
		.dataa_0(mult_for_exp_dina),
		.datab_0(mult_for_exp_dinb),
		.result(mult_for_exp_dout)
	);
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	mult_57_38 const1_mult(
		.aclr0(~nreset),
		.clock0(clk),
		.dataa_0(const1_mult_din),
		.datab_0(s_const1[37:0]),
		.result(const1_mult_dout)
	);
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	sub_23_23 sub_from_k(
		.nreset(nreset),
		.clk(clk),
		.dina(s_constK[22:0]),
		.dinb(sub_from_k_din),
		.dout(sub_from_k_dout)
	);
	
	// Latency 1 clock cycle.
	// Supports pipelining.
	mult_23_23 pow(
		.aclr0(~nreset),
		.clock0(clk),
		.dataa_0(pow_din),
		.datab_0(pow_din),
		.result(pow_dout)
	);
	
endmodule

module delay_2_cycle(
	input nreset,
	input clock,
	input [3:0] din,
	
	output [3:0] dout
);

	reg [3:0] delay1;
	reg [3:0] delay2;
	
	assign dout = delay2;

	always @(posedge clock or negedge nreset) begin
		if (nreset == 1'b0) begin
			delay1 <= 4'd0;
			delay2 <= 4'd0;
		end else begin
			delay1 <= din;
			delay2 <= delay1;
		end
	end

endmodule

module sub_23_23(
	input nreset,
	input clk,
	input [22:0] dina,
	input [22:0] dinb,
	
	output reg [22:0] dout
);

	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			dout <= 22'd0;
		end else begin
			dout <= dina - dinb;
		end
	end

endmodule

/**
 * A module to provide lookup table of exponential (6,2) fixed point number.
 * Give (9, 31) fixed point number as the result.
 * Ignore if the input >= 5 or <= 18.
 */
module special_exp_lut(
	input [7:0] din,
	output [39:0] dout
);
	
	reg [39:0] x;
	
	assign dout = x;
	
	always @(*) begin
		case (din)
		8'b00000000 : x = 40'b0000000010000000000000000000000000000000; 8'b00000001 : x = 40'b0000000010100100010110101111000111100001; 8'b00000010 : x = 40'b0000000011010011000010010100110001110000; 8'b00000011 : x = 40'b0000000100001110111110011101101101000110; 8'b00000100 : x = 40'b0000000101011011111100001010100010110001; 8'b00000101 : x = 40'b0000000110111110110000111000111011011011; 8'b00000110 : x = 40'b0000001000111101101001111111110011001001; 8'b00000111 : x = 40'b0000001011100000100101101101001000001011; 8'b00001000 : x = 40'b0000001110110001110011001001011100011010; 8'b00001001 : x = 40'b0000010010111110011011100010000010111101; 8'b00001010 : x = 40'b0000011000010111010110111111011001001100; 8'b00001011 : x = 40'b0000011111010010010000011100001011110110; 8'b00001100 : x = 40'b0000101000001010111100101101111110110111; 8'b00001101 : x = 40'b0000110011100101001010011101101111000000; 8'b00001110 : x = 40'b0001000010001110110001110010000100111001; 8'b00001111 : x = 40'b0001010101000010101100101101000010100010;
		8'b00010000 : x = 40'b0001101101001100100100000010111000100111; 8'b00010001 : x = 40'b0010001100001101011111100010011011011010; 8'b00010010 : x = 40'b0010110100000010001100010101101111000011; 8'b00010011 : x = 40'b0011100111001010110010011101010111011011; 8'b00010100 : x = 40'b0100101000110100111000100110010111000000;
		/*
		8'b00010101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00010110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00010111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00011000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00011001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00011010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00011011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00011100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00011101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00011110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00011111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		8'b00100000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00100001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00100010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00100011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00100100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00100101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00100110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00100111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00101000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00101001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00101010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00101011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00101100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00101101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00101110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00101111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		8'b00110000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00110001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00110010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00110011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00110100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00110101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00110110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00110111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00111000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00111001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00111010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00111011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00111100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00111101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00111110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b00111111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		8'b01000000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01000001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01000010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01000011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01000100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01000101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01000110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01000111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01001000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01001001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01001010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01001011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01001100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01001101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01001110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01001111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		8'b01010000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01010001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01010010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01010011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01010100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01010101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01010110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01010111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01011000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01011001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01011010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01011011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01011100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01011101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01011110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01011111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		8'b01100000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01100001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01100010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01100011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01100100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01100101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01100110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01100111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01101000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01101001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01101010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01101011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01101100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01101101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01101110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01101111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		8'b01110000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01110001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01110010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01110011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01110100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01110101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01110110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01110111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01111000 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01111001 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01111010 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01111011 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01111100 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01111101 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01111110 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 8'b01111111 : x = 40'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		8'b10000000 : x = 40'b0000000000000000000000000000000000000000; 8'b10000001 : x = 40'b0000000000000000000000000000000000000000; 8'b10000010 : x = 40'b0000000000000000000000000000000000000000; 8'b10000011 : x = 40'b0000000000000000000000000000000000000000; 8'b10000100 : x = 40'b0000000000000000000000000000000000000000; 8'b10000101 : x = 40'b0000000000000000000000000000000000000000; 8'b10000110 : x = 40'b0000000000000000000000000000000000000000; 8'b10000111 : x = 40'b0000000000000000000000000000000000000000; 8'b10001000 : x = 40'b0000000000000000000000000000000000000000; 8'b10001001 : x = 40'b0000000000000000000000000000000000000000; 8'b10001010 : x = 40'b0000000000000000000000000000000000000000; 8'b10001011 : x = 40'b0000000000000000000000000000000000000000; 8'b10001100 : x = 40'b0000000000000000000000000000000000000000; 8'b10001101 : x = 40'b0000000000000000000000000000000000000000; 8'b10001110 : x = 40'b0000000000000000000000000000000000000000; 8'b10001111 : x = 40'b0000000000000000000000000000000000000000;
		8'b10010000 : x = 40'b0000000000000000000000000000000000000000; 8'b10010001 : x = 40'b0000000000000000000000000000000000000000; 8'b10010010 : x = 40'b0000000000000000000000000000000000000000; 8'b10010011 : x = 40'b0000000000000000000000000000000000000000; 8'b10010100 : x = 40'b0000000000000000000000000000000000000000; 8'b10010101 : x = 40'b0000000000000000000000000000000000000000; 8'b10010110 : x = 40'b0000000000000000000000000000000000000000; 8'b10010111 : x = 40'b0000000000000000000000000000000000000000; 8'b10011000 : x = 40'b0000000000000000000000000000000000000000; 8'b10011001 : x = 40'b0000000000000000000000000000000000000000; 8'b10011010 : x = 40'b0000000000000000000000000000000000000000; 8'b10011011 : x = 40'b0000000000000000000000000000000000000000; 8'b10011100 : x = 40'b0000000000000000000000000000000000000000; 8'b10011101 : x = 40'b0000000000000000000000000000000000000000; 8'b10011110 : x = 40'b0000000000000000000000000000000000000000; 8'b10011111 : x = 40'b0000000000000000000000000000000000000000;
		8'b10100000 : x = 40'b0000000000000000000000000000000000000000; 8'b10100001 : x = 40'b0000000000000000000000000000000000000000; 8'b10100010 : x = 40'b0000000000000000000000000000000000000000; 8'b10100011 : x = 40'b0000000000000000000000000000000000000000; 8'b10100100 : x = 40'b0000000000000000000000000000000000000000; 8'b10100101 : x = 40'b0000000000000000000000000000000000000000; 8'b10100110 : x = 40'b0000000000000000000000000000000000000000; 8'b10100111 : x = 40'b0000000000000000000000000000000000000000; 8'b10101000 : x = 40'b0000000000000000000000000000000000000000; 8'b10101001 : x = 40'b0000000000000000000000000000000000000000; 8'b10101010 : x = 40'b0000000000000000000000000000000000000000;
		*/
		8'b10101011 : x = 40'b0000000000000000000000000000000000000001; 8'b10101100 : x = 40'b0000000000000000000000000000000000000001; 8'b10101101 : x = 40'b0000000000000000000000000000000000000010; 8'b10101110 : x = 40'b0000000000000000000000000000000000000010; 8'b10101111 : x = 40'b0000000000000000000000000000000000000011;
		8'b10110000 : x = 40'b0000000000000000000000000000000000000100; 8'b10110001 : x = 40'b0000000000000000000000000000000000000101; 8'b10110010 : x = 40'b0000000000000000000000000000000000000111; 8'b10110011 : x = 40'b0000000000000000000000000000000000001001; 8'b10110100 : x = 40'b0000000000000000000000000000000000001100; 8'b10110101 : x = 40'b0000000000000000000000000000000000001111; 8'b10110110 : x = 40'b0000000000000000000000000000000000010011; 8'b10110111 : x = 40'b0000000000000000000000000000000000011001; 8'b10111000 : x = 40'b0000000000000000000000000000000000100000; 8'b10111001 : x = 40'b0000000000000000000000000000000000101001; 8'b10111010 : x = 40'b0000000000000000000000000000000000110101; 8'b10111011 : x = 40'b0000000000000000000000000000000001000101; 8'b10111100 : x = 40'b0000000000000000000000000000000001011000; 8'b10111101 : x = 40'b0000000000000000000000000000000001110010; 8'b10111110 : x = 40'b0000000000000000000000000000000010010010; 8'b10111111 : x = 40'b0000000000000000000000000000000010111100;
		8'b11000000 : x = 40'b0000000000000000000000000000000011110001; 8'b11000001 : x = 40'b0000000000000000000000000000000100110110; 8'b11000010 : x = 40'b0000000000000000000000000000000110001110; 8'b11000011 : x = 40'b0000000000000000000000000000000111111111; 8'b11000100 : x = 40'b0000000000000000000000000000001010010000; 8'b11000101 : x = 40'b0000000000000000000000000000001101001011; 8'b11000110 : x = 40'b0000000000000000000000000000010000111011; 8'b11000111 : x = 40'b0000000000000000000000000000010101101110; 8'b11001000 : x = 40'b0000000000000000000000000000011011111001; 8'b11001001 : x = 40'b0000000000000000000000000000100011110100; 8'b11001010 : x = 40'b0000000000000000000000000000101110000000; 8'b11001011 : x = 40'b0000000000000000000000000000111011000100; 8'b11001100 : x = 40'b0000000000000000000000000001001011110110; 8'b11001101 : x = 40'b0000000000000000000000000001100001011000; 8'b11001110 : x = 40'b0000000000000000000000000001111101000010; 8'b11001111 : x = 40'b0000000000000000000000000010100000100011;
		8'b11010000 : x = 40'b0000000000000000000000000011001110001010; 8'b11010001 : x = 40'b0000000000000000000000000100001000101110; 8'b11010010 : x = 40'b0000000000000000000000000101010011111010; 8'b11010011 : x = 40'b0000000000000000000000000110110100011100; 8'b11010100 : x = 40'b0000000000000000000000001000110000011010; 8'b11010101 : x = 40'b0000000000000000000000001011001111100101; 8'b11010110 : x = 40'b0000000000000000000000001110011011111110; 8'b11010111 : x = 40'b0000000000000000000000010010100010011001; 8'b11011000 : x = 40'b0000000000000000000000010111110011010111; 8'b11011001 : x = 40'b0000000000000000000000011110100100000010; 8'b11011010 : x = 40'b0000000000000000000000100111001111100111; 8'b11011011 : x = 40'b0000000000000000000000110010011000111110; 8'b11011100 : x = 40'b0000000000000000000001000000101100111100; 8'b11011101 : x = 40'b0000000000000000000001010011000101000101; 8'b11011110 : x = 40'b0000000000000000000001101010101011010000; 8'b11011111 : x = 40'b0000000000000000000010001000111110011000;
		8'b11100000 : x = 40'b0000000000000000000010101111111000010000; 8'b11100001 : x = 40'b0000000000000000000011100001110101010100; 8'b11100010 : x = 40'b0000000000000000000100100001111110011011; 8'b11100011 : x = 40'b0000000000000000000101110100010101011111; 8'b11100100 : x = 40'b0000000000000000000111011110000101101011; 8'b11100101 : x = 40'b0000000000000000001001100101111000001100; 8'b11100110 : x = 40'b0000000000000000001100010100001111000011; 8'b11100111 : x = 40'b0000000000000000001111110100000111010010; 8'b11101000 : x = 40'b0000000000000000010100010011100101000111; 8'b11101001 : x = 40'b0000000000000000011010000100101100011001; 8'b11101010 : x = 40'b0000000000000000100001011110101001010010; 8'b11101011 : x = 40'b0000000000000000101010111111001101011111; 8'b11101100 : x = 40'b0000000000000000110111001100100111111111; 8'b11101101 : x = 40'b0000000000000001000110110111111110101101; 8'b11101110 : x = 40'b0000000000000001011011000000010100000100; 8'b11101111 : x = 40'b0000000000000001110100110110100100010001;
		8'b11110000 : x = 40'b0000000000000010010110000010101010110111; 8'b11110001 : x = 40'b0000000000000011000000101010000100100110; 8'b11110010 : x = 40'b0000000000000011110111011000001000000011; 8'b11110011 : x = 40'b0000000000000100111101101000110110100001; 8'b11110100 : x = 40'b0000000000000110010111110110110000110011; 8'b11110101 : x = 40'b0000000000001000001011101100100111000100; 8'b11110110 : x = 40'b0000000000001010100000011100001011100000; 8'b11110111 : x = 40'b0000000000001101011111011011100011000111; 8'b11111000 : x = 40'b0000000000010001010100101010101010100011; 8'b11111001 : x = 40'b0000000000010110001111100011100101111110; 8'b11111010 : x = 40'b0000000000011100100011111000011101110010; 8'b11111011 : x = 40'b0000000000100100101011000011000001101110; 8'b11111100 : x = 40'b0000000000101111000101101010110001101100; 8'b11111101 : x = 40'b0000000000111100011101101000000111010111; 8'b11111110 : x = 40'b0000000001001101101000101100101111110001; 8'b11111111 : x = 40'b0000000001100011101011111011111001111010;

		default: x = 40'b0000000000000000000000000000000000000000;
		endcase
	end
	
endmodule
