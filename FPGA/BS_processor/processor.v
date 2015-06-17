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
			nxt_state = nxt_state;
		end
		COMPLETE: begin
			if (cmd == CMD_ACK) begin
				nxt_state = IDLE;
			end else begin
				nxt_state = nxt_state;
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
	
	assign dout = s_const3;
	 
endmodule
