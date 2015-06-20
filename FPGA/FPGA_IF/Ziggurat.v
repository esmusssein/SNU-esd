module Ziggurat (
	input clk,
	input nreset,
	input control_bit,

	output [31:0]		g_randnum_out,
	output				invalid_bit_out,
	output				complete_bit_out

);

	
	wire [19:0] uniform_randnum;
	wire [14:0] u0;
	wire [14:0] u1;
	wire [14:0] u2;
	wire [31:0] u0_stdandard;
	wire [31:0] u1_stdandard;
	wire [31:0] u2_stdandard;
	
	wire [31:0] xi;
	wire [31:0] xi_1;
	wire [31:0] yi;
	wire [31:0] yi_1;
	
	wire [31:0] x1 = 32'h0001b981;
	wire [31:0] x2 = 32'h0001a8fd;
	wire [46:0] u0_multi_xi_1;
	wire [31:0] x_case1;
	
	wire [31:0] u1_multi2;
	wire [31:0] lnU1;
	wire [31:0] lnU1_negative;
	wire [31:0] x_case2;
	wire [31:0] u2_multi2;
	wire [31:0] lnU2;
	wire [31:0] y_case2;
	wire [31:0] y_multi2;
	
	wire [31:0] yi_width;
	wire [31:0] y_case3;
	wire [35:0] x_case1_squaring;
	
	wire [46:0] u1_multi_yi_width;
	
	
	reg [31:0] ln2 = 32'b0000_0000_0000_0000_0101_0010_1010_0001;
	reg [31:0] one = 32'b0000_0000_0000_0000_1000_0000_0000_0000;
	
	reg [1:0] state;
	reg [1:0] nxt_state;
	assign state_out = state;
	reg	invalid_bit;	//1 : false when checked, 2 : true when checked
	reg	complete_bit;		//inform 10^7 is complete to processor, 1 : complete, 0 : continue
	wire	cnt_end_bit;		//receive from lfsr 10^7 is over 1: over, 0 : continue;
	
	reg [31:0] g_randnum;
	
	assign u0 = {uniform_randnum[3:2],uniform_randnum[8:7],uniform_randnum[15:14],uniform_randnum[18:17],uniform_randnum[2:1],uniform_randnum[14:13],uniform_randnum[17],uniform_randnum[12:11]};
	assign u1 = {uniform_randnum[6:5],uniform_randnum[2:1],uniform_randnum[17:16],uniform_randnum[12:11],uniform_randnum[0],uniform_randnum[13:12],uniform_randnum[7:6],uniform_randnum[15:14]};
	assign u2 = {uniform_randnum[3:2],uniform_randnum[9:8],uniform_randnum[6:5],uniform_randnum[4:3],uniform_randnum[10:9],uniform_randnum[15:14],uniform_randnum[19],uniform_randnum[14:13]};
	assign i	 = uniform_randnum[7:0];
	
	assign u0_stdandard = u0;
	assign u1_stdandard = u1;
	assign u2_stdandard = u2;

	////////////case1////////////// 
	assign u0_multi_xi_1	= u0*xi_1;			
	assign x_case1			= u0_multi_xi_1[46:15];	//17 int + 15 fraction result
	

	////////////case2////////////// 
	assign u1_multi2		= (u1_stdandard>>1);
	assign lnU1				= u1_stdandard-one-ln2;
	assign lnU1_negative	= (~lnU1)+1;		//2's complement 1 is not same as integer 1;
	assign x_case2			=	lnU1_negative/x1;
	assign u2_multi2		= (u2_stdandard>>1);
	assign lnU2				= u2_stdandard-one-ln2;
	assign y_case2			= (~lnU1)+1;
	assign y_multi2		= y_case2>>1;
	
	////////////case3////////////// 
	assign yi_width					= yi-yi_1;
	assign u1_multi_yi_width		= u1*yi_width;
	assign y_case3						= yi_1+u1_multi_yi_width[46:15];
	assign x_case1_squaring			= x_case1[17:0]*x_case1[17:0];
	assign x_case1_square			= x_case1_squaring[35:12];
	assign x_case1_square_div2 	= x_case1_square>>1;
	assign x_case1_sq_div2_minus	= (~x_case1_square_div2)+1;
	
	

	parameter IDLE = 0;
	parameter RUNNING = 1;
	parameter COMPLETE = 2;


	assign g_randnum_out 	= g_randnum;
	assign invalid_bit_out	= invalid_bit;
	assign complete_bit_out = complete_bit;
	
	
	integer count;
	
	
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
			if (complete_bit) begin
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
			invalid_bit 	<= 0;
			complete_bit 	<= 0;
			count				<=	0;
		end
		RUNNING: begin
			invalid_bit 	<= 0;
			if(count == 10000000) complete_bit <= 1;
			else 						 complete_bit <= 0;
			if( u0_multi_xi_1 < xi ) begin
				g_randnum <= x_case1;
				count		 <=	count+1;
			end
			else if( i == 0 ) begin
				if(y_multi2 > x2) begin
					g_randnum <= x_case2;
					count		 <=	count+1;
				end
				else begin
					invalid_bit <= 1;
				end
			end
			else begin
				if ( y_case3 < x_case1_sq_div2_minus) begin
					g_randnum <= x_case1;
					count		 <= count+1;
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
			invalid_bit		<= 0;
			complete_bit	<= 0;
		end
		endcase
	end
	
	
	
	lsfr lsfr0(
		.clk(clk),
		.nreset(nreset),
		.data_out(uniform_randnum)
	);
	xis xi0(
		.data_in(i),
		.data_out2(xi_temp)
	);
	yis yi0(
		.data_in(i),
		.data_out2(yi)
	);
	xis ximinus10(
		.data_in(i-1),
		.data_out2(xi_1)
	);
	yis yiminus10(
		.data_in(i-1),
		.data_out2(yi_1)
	);
	
endmodule