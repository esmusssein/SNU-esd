module BoxMuller(
	input clk,
	input nreset
	input control_bit;

	output [31:0]		g_randnum_out;
	output				invalid_bit_out;
	output				complete_bit_out;
	);
	
	wire [19:0] uniform_randnum;
	wire [14:0] u0;
	wire [14:0] u1;
	wire [31:0] 
	assign u0 = {uniform_randnum[3:2],uniform_randnum[8:7],uniform_randnum[15:14],uniform_randnum[18:17],uniform_randnum[2:1],uniform_randnum[14:13],uniform_randnum[17],uniform_randnum[12:11]};
	assign u1 = {uniform_randnum[6:5],uniform_randnum[2:1],uniform_randnum[17:16],uniform_randnum[12:11],uniform_randnum[0],uniform_randnum[13:12],uniform_randnum[7:6],uniform_randnum[15:14]};
	
	
	always @ (posedge clk, negedge nreset)begin
		if(!nreset)begin
			state <= IDLE;
		end
		else begin
			state <= nxt_state;
		end
	end
	
	always @(*) begin
		case (state)
		IDLE: begin
			if (control_bit == 0) begin
				nxt_state <= IDLE;
			end else begin
				nxt_state <= RUNNING;
			end
		end
		RUNNING: begin
			// TODO: How this know the computation ends?
			if (cnt_end_bit) begin
				nxt_state <= COMPLETE;
			end else begin
				nxt_state <= RUNNING;
			end
		end
		COMPLETE: begin
			nxt_state <= COMPLETE;
		end
		default: begin
			nxt_state <= IDLE;
		end
		endcase
	end

	always @(*) begin
		case (state)
		IDLE: begin	
			invalid_bit 		<= 0;
			complete_bit 	<= 0;
		end
		RUNNING: begin
			invalid_bit 	<= 0;
			complete_bit	<= 0;
			if( u0_multi_xi_1 < x[i] ) begin
				g_randnum <= x_case1;
			end
			else if( i == 0 ) begin
				if(y_multi2 > x[2]) begin
					g_randnum <= x_case2;
				end
				else begin
					invalid_bit <= 1;
				end
			end
			else begin
				if ( y_case3 < x_case1_sq_div2_minus) begin
					g_randnum <= x_case1;
				end
				else begin
					invalid_bit <= 1;
				end
			end
		end
		COMPLETE: begin
			invalid_bit		<= 0;
			complete_bit	<= 1;
		end
		default: begin
			valid_bit		<= 0;
			complete_bit	<= 0;
		end
		endcase
	end
	
	lfsr0 lsfr0(
		.clk(clk),
		.nreset(nreset),
		.control_bit(control_bit),
		.cnt_end_bit_out(cnt_end_bit),
		.data(uniform_randnum),
	);
	sqrt_minus2_ln (
	data_in;
	output 	[31:0] data_out;
);
	always@(*)begin
		case(data_in)
		default:
		endcase
	end
endmodule

	
endmodule