/**
 * A module that manipulate signals from M1 to M3.
 *
 * @input clk
 * @input nRESET
 * @input FPGA_nRST
 * @input HOST_nOE
 * @input HOST_nCS
 * @input HOST_ADD
 * @input HDI
 * @input HDO
 * @input DIP_D
 * @input PUSH_RD
 * @input PUSH_SW
 * @input clk_1k
 * @input clk_3k
 * @input sw
 * @output CLCD_RS
 * @output CLCD_RW
 * @output CLCD_E
 * @output CLCD_DQ
 * @output LED_D
 * @output SEG_COM
 * @output SEG_DATA
 * @output DOT_SCAN
 * @output DOT_DATA
 * @output Piezo
 * @output PUSH_LD
 * @output host_sel
 */
module host_itf (
	clk, nRESET, FPGA_nRST, HOST_nOE, HOST_nWE, HOST_nCS, HOST_ADD, HDI, HDO,
	CLCD_RS, CLCD_RW, CLCD_E, CLCD_DQ, LED_D, SEG_COM, SEG_DATA, DOT_SCAN, DOT_DATA,
	Piezo, DIP_D, PUSH_RD, PUSH_LD, PUSH_SW,
	clk_3k, host_sel, sw, clk_1k,INT);
	
	input clk, nRESET, FPGA_nRST, HOST_nOE, HOST_nWE, HOST_nCS;
	input [20:0] HOST_ADD;
	input [15:0] HDI;
	input [15:0] DIP_D;
	input  [3:0] PUSH_RD;
	input  [3:0] PUSH_SW;
	input clk_3k, clk_1k, sw;
	
	output reg [15:0] HDO;
	output CLCD_RS, CLCD_RW, CLCD_E;
	output [7:0] CLCD_DQ;
	output [7:0] LED_D;
	output reg [5:0] SEG_COM;
	output reg [7:0] SEG_DATA;
	output [9:0] DOT_SCAN;
	output [6:0] DOT_DATA;
	output Piezo ;
	output [3:0] PUSH_LD;
	output host_sel;
	output INT;

	/***************************************
	 * Common part.
	 **************************************/
	
	reg [15:0] x8800_0010, x8800_0020, x8800_0030, x8800_0031, x8800_0032, x8800_0033, x8800_0034, x8800_0035, x8800_0036, x8800_0040, x8800_0042, x8800_0050, x8800_0072, x8800_0090, x8800_00A0, x8800_00A2, x8800_00B0, x8800_00C0, x8800_00D0, x8800_00E0, x8800_00F0;
	wire [15:0] x8800_0062, x8800_0022, x8800_0070, x8800_0080, x8800_0092;
	reg [1:0] reg_sw;
	reg V_SEL;
	reg INT1;
	integer clk_cnt;

	/**
	 *
	 * @update x8800_0010
	 * @update x8800_0020
	 * @update x8800_0040
	 * @update x8800_0042
	 * @update x8800_0050
	 * @update x8800_0072
	 * @update x8800_0090
	 * @update x8800_00A0
	 * @update x8800_00B0
	 * @update x8800_00C0
	 * @update x8800_00D0
	 * @update x8800_00E0
	 * @update x8800_00F0
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			x8800_0010 <= 16'b0;
			x8800_0020 <= 16'b0;
			x8800_0072 <= 16'b0;
			x8800_0090 <= 16'b0;
			x8800_00A0 <= 16'b0;
			x8800_00B0 <= 16'b0;
			x8800_00C0 <= 16'b0;
			x8800_00D0 <= 16'b0;
			x8800_00E0 <= 16'b0;
			x8800_00F0 <= 16'b0;
		end else begin
			if (HOST_nCS == 1'b0 && HOST_nWE == 1'b0 && HOST_nOE == 1'b1) begin
				case (HOST_ADD[19:0])
					20'h00010: x8800_0010 <= HDI;
					20'h00020: x8800_0020 <= HDI;
					20'h00072: x8800_0072 <= HDI;
					20'h000A0: x8800_00A0 <= HDI;
					20'h000B0: x8800_00B0 <= HDI;
					20'h000C0: x8800_00C0 <= HDI;
					20'h000D0: x8800_00D0 <= HDI;
					20'h000E0: x8800_00E0 <= HDI;
					20'h000F0: x8800_00F0 <= HDI;
				endcase
			end else begin
				if (FPGA_nRST == 1'b0)    x8800_00F0 <= 16'b0;
				else if (reg_sw == 2'b10) x8800_00F0 <= ~x8800_00F0;
				if (LED_STATE == LED_DONE) x8800_0020[0] <= 1'b0; 
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
					20'h00010: HDO <= x8800_0010;
					20'h00020: HDO <= x8800_0020;
					20'h00030: HDO <= x8800_0030;
					20'h00034: HDO <= x8800_0034;
					20'h00035: HDO <= x8800_0035;
					20'h00036: HDO <= x8800_0036;		
					20'h00040: HDO <= x8800_0040;
					20'h00042: HDO <= x8800_0042;
					20'h00050: HDO <= x8800_0050;					
					20'h00022: HDO <= x8800_0022;
					20'h00062: HDO <= x8800_0062;
					20'h00070: HDO <= x8800_0070;
					20'h00072: HDO <= x8800_0072;
					20'h00080: HDO <= x8800_0080;
					20'h00090: HDO <= x8800_0090;
					20'h00092: HDO <= x8800_0092;
					20'h000A0: HDO <= x8800_00A0;
					20'h000B0: HDO <= x8800_00B0;
					20'h000C0: HDO <= x8800_00C0;
					20'h000D0: HDO <= x8800_00D0;
					20'h000E0: HDO <= x8800_00E0;
					20'h000F0: HDO <= x8800_00F0;
				endcase
			end
		end
	end
	
	assign CLCD_RS  = x8800_0010[10];
	assign CLCD_RW  = x8800_0010[9];
	assign CLCD_E   = x8800_0010[8];
	assign CLCD_DQ  = x8800_0010[7:0];
	
	//assign SEG_COM  = ~x8800_0030[5:0];
	//assign SEG_DATA = x8800_0032[7:0];
	
	assign DOT_SCAN = x8800_0040[9:0];
	assign DOT_DATA = x8800_0042[6:0];
	
	assign Piezo    = (x8800_0050[0] == 1'b1) ? 1'b1 : 1'b0;
	
	assign x8800_0070 = (nRESET == 1'b1) ? {12'b0, PUSH_RD} : 16'b0;
	assign PUSH_LD = x8800_0072[3:0];
	
	assign x8800_0022 = (nRESET == 1'b1) ? DIP_D : 16'b0;
	assign x8800_0062 = x8800_0022;
	assign x8800_0080 = (nRESET == 1'b1) ? {12'b0, ~PUSH_SW} : 16'b0;
	assign x8800_0092 = (nRESET == 1'b1) ? {10'b0, 6'b101010} : 16'b0;
	
	assign host_sel = x8800_00F0[0];
	
	/**
	 *
	 * @update V_SEL
	 * @update clk_cnt
	 */
	always @(posedge clk_3k or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			V_SEL <= 1'b1;
			clk_cnt <= 0;
		end else begin
			if (sw == 1'b0) begin
				if (clk_cnt >= 3) clk_cnt <= 3;
				else              clk_cnt <= clk_cnt+1'b1;
				
				if (clk_cnt == 2) V_SEL <= 1'b0;
				else              V_SEL <= 1'b1;
			end else begin
				clk_cnt <= 0;
			end
		end
	end
	
	/**
	 * @update reg_sw
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			reg_sw <= 2'b0;
		end else begin
			reg_sw <= {reg_sw[0], V_SEL};
		end
	end

		reg BCLK_1Hz;
	integer CNT_1Hz;
	
	/**
	 * 
	 * @update BCLK_1Hz
	 * @update CNT_1Hz
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			BCLK_1Hz <= 1'b0;
			CNT_1Hz <= 0;
		end else begin
			if (CNT_1Hz == 24999999) begin
				CNT_1Hz <= 0;
				BCLK_1Hz <= ~BCLK_1Hz;
			end else begin
				CNT_1Hz <= CNT_1Hz+1'b1;
			end
		end
	end
	
	/**************************************
	 * 7 segment part.
	 *
	 * Use x8800_0030 ~ x8800_0033 as its device register
	 * to get command and data from M1 host.
	 *
	 * x8800_0033[7:6]: command bits
	 * x8800_0030, x8800_0031, x8800_0032: input data bytes
	 **************************************/
	
	parameter CLK_CNT_FOR_ONE_SEC = 50000000 - 1;
	// Possible states.
	parameter SEG_IDLE = 0;
	parameter SEG_SET = 1;
	parameter SEG_RUN = 2;
	parameter SEG_READY = 3;
	
	// 1kHz clock for 7 segment.
	reg seg_clk;
	reg [2:0] state;
	// sec_a: last position of 7 segment, ..., sec_f: first position of 7 segment.
	reg [3:0] sec_a, sec_b, sec_c, sec_d, sec_e, sec_f;
	reg [2:0] cnt_segcon;
	integer my_clk_cnt;

	/**
	 *
	 * @update x8800_0030
	 * @update x8800_0031
	 * @update x8800_0032
	 * @update x8800_0033
	 * @update x8800_0034
	 * @update x8800_0035
	 * @update x8800_0036
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			x8800_0030 <= 16'b0;
			x8800_0031 <= 16'b0;
			x8800_0032 <= 16'b0;
			x8800_0033 <= 16'b0;
		end else begin
			if (HOST_nCS == 1'b0 && HOST_nWE == 1'b0 && HOST_nOE == 1'b1) begin
				case (HOST_ADD[19:0])
					20'h00030: x8800_0030 <= HDI;
					20'h00031: x8800_0031 <= HDI;
					20'h00032: x8800_0032 <= HDI;
					20'h00033: x8800_0033 <= HDI;
				endcase
			end else begin
				x8800_0030 <= x8800_0030;
				x8800_0031 <= x8800_0031;
				x8800_0032 <= x8800_0032;
				x8800_0033 <= x8800_0033;
			end
		end
	end
	

	/**
	 *
	 * @update state
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			state <= SEG_IDLE;
		end else begin
			case (state)
				SEG_IDLE: begin
					x8800_0034[3:0] <= 0;
					x8800_0034[7:4] <= 0;
					x8800_0034[11:8]<= 0;
					x8800_0034[15:12]<= 0;
					x8800_0036[3:0] <= 0;
					x8800_0036[7:4] <= 0;
					if (x8800_0033[7:6] == 2'b01) begin
						state <= SEG_SET;
					end else begin
						state <= SEG_IDLE;
					end
				end
				SEG_SET: begin
					x8800_0034[3:0] <= sec_a;
					x8800_0034[7:4] <= sec_b;
					x8800_0034[11:8] <= sec_c;
					x8800_0034[15:12] <= sec_d;
					x8800_0036[3:0] <= sec_e;
					x8800_0036[7:4] <= sec_f;
					state <= SEG_READY;
				end
				SEG_READY: begin
					if (x8800_0033[7:6] == 2'b01) begin
						state <= SEG_SET;
					end else if (x8800_0033[7:6] == 2'b10) begin
						state <= SEG_RUN;
					end else begin
						state <= SEG_READY;
					end
				end
				SEG_RUN: begin
					x8800_0034[3:0] <= sec_a;
					x8800_0034[7:4] <= sec_b;
					x8800_0034[11:8] <= sec_c;
					x8800_0034[15:12] <= sec_d;
					x8800_0036[3:0] <= sec_e;
					x8800_0036[7:4] <= sec_f;
					if (x8800_0033[7:6] == 2'b11) begin
						state <= SEG_READY;
					end else if (sec_a == 0 && sec_b == 0 && sec_c == 0 && sec_d == 0 && sec_e == 0 && sec_f == 0) begin
					   state <= SEG_IDLE;
					end else begin
						state <= SEG_RUN;
					end
				end
				default: begin
					state <= SEG_IDLE;
				end
			endcase
		end
	end
	
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
	 * @update seg_clk
	 */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			seg_clk <= 0;
		end else begin
			if ((my_clk_cnt + 1) % 25000 == 0) begin
				seg_clk <= ~seg_clk;
			end else begin
				seg_clk <= seg_clk;
			end
		end
	end
	
	/**
	 *
	 * @update sec_a
	 * @updata INT	
	 */
	assign INT = INT1;
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			sec_a <= 0;
			INT1 	<= 0;
		end else begin
			if (state == SEG_SET) begin
				sec_a <= x8800_0030[3:0];
				INT1 <= 1;
			end else if (state == SEG_RUN) begin
				if (my_clk_cnt == CLK_CNT_FOR_ONE_SEC) begin
					if (sec_a == 0) begin
						sec_a <= 9;
					end else begin
						sec_a <= sec_a - 1'b1;
					end
					INT1 <= 1;
				end else if (my_clk_cnt == CLK_CNT_FOR_ONE_SEC/2) begin 
					INT1 <= 0;
				end else begin
				   INT1 <= INT1;
			   end
			end 
		end
	end
	
	/**
	 *
	 * @update sec_b
	 */ 
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			sec_b <= 0;
		end else begin
			if (state == SEG_SET) begin
				sec_b <= x8800_0030[7:4];
			end else if (sec_a == 0 && my_clk_cnt == CLK_CNT_FOR_ONE_SEC && state == SEG_RUN) begin
				if (sec_b == 0) begin
					sec_b <= 9;
				end else begin
					sec_b <= sec_b - 1'b1;
				end				
			end
		end
	end
	
	/**
	 *
	 * @update sec_c
	 */	
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			sec_c <= 0;
		end else begin
			if (state == SEG_SET) begin
				sec_c <= x8800_0031[3:0];
			end else if (sec_b == 0 && sec_a == 0 && my_clk_cnt == CLK_CNT_FOR_ONE_SEC && state == SEG_RUN) begin
				if (sec_c == 0) begin
					sec_c <= 9;
				end else begin
					sec_c <= sec_c - 1'b1;
				end
			end
		end
	end

	/**
	 *
	 * @update sec_d
	 */	
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			sec_d <= 0;
		end else begin
			if (state == SEG_SET) begin
				sec_d <= x8800_0031[7:4];		
			end else if (sec_c == 0 && sec_b == 0 && sec_a == 0 && my_clk_cnt == CLK_CNT_FOR_ONE_SEC && state == SEG_RUN) begin
				if (sec_d == 0) begin
					sec_d <= 9;
				end else begin
					sec_d <= sec_d - 1'b1;
				end
			end
		end
	end
	
	/**
	 *
	 * @update sec_e
	 */	
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			sec_e <= 0;
		end else begin
			if (state == SEG_SET) begin
				sec_e <= x8800_0032[3:0];				
			end else if (sec_d == 0 && sec_c == 0 && sec_b == 0 && sec_a == 0 && my_clk_cnt == CLK_CNT_FOR_ONE_SEC && state == SEG_RUN) begin
				if (sec_e == 0) begin
					sec_e <= 9;
				end else begin
					sec_e <= sec_e - 1'b1;
				end
			end
		end
	end

	/**
	 *
	 * @update sec_f
	 */	
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			sec_f <= 0;
		end else begin
			if (state == SEG_SET) begin
				sec_f <= x8800_0032[7:4];				
			end else if (sec_e == 0 && sec_d == 0 && sec_c == 0 && sec_b == 0 && sec_a == 0 && my_clk_cnt == CLK_CNT_FOR_ONE_SEC && state == SEG_RUN) begin
				if (sec_f == 0) begin
					sec_f <= 9;
				end else begin
					sec_f <= sec_f - 1'b1;
				end
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
				3'd0:   begin SEG_COM <= 6'b011111; SEG_DATA <= {conv_int(sec_a), 1'b0}; end
				3'd1:   begin SEG_COM <= 6'b101111; SEG_DATA <= {conv_int(sec_b), 1'b0}; end
				3'd2:   begin SEG_COM <= 6'b110111; SEG_DATA <= {conv_int(sec_c), 1'b0}; end
				3'd3:   begin SEG_COM <= 6'b111011; SEG_DATA <= {conv_int(sec_d), 1'b0}; end
				3'd4:   begin SEG_COM <= 6'b111101; SEG_DATA <= {conv_int(sec_e), 1'b0}; end
				3'd5:   begin SEG_COM <= 6'b111110; SEG_DATA <= {conv_int(sec_f), 1'b0}; end
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

	/**************************************
	 * LED part.
	 *************************************/
	 
	parameter LED_STOP = 0;
	parameter LED_START = 1;
	parameter LED_DONE = 2;
	
	reg [1:0] LED_STATE, NEXT_LED_STATE;
	wire LED_CONTROL, LED_DIR;
	wire [2:0] LED_POS;
	
	reg LED_EN1, LED_EN;
	reg [7:0] LED_ON1, LED_ON;
		
	assign LED_CONTROL = x8800_0020[0];
	assign LED_DIR     = x8800_0020[1];
	assign LED_POS     = x8800_0020[4:2];

	reg [4:0] TTT;
	
	assign LED_D = LED_ON;
	always @(LED_STATE or LED_CONTROL) begin
		LED_EN1 = 0;
		LED_ON1 = 0;
		
		NEXT_LED_STATE = LED_STOP;
			
		case (LED_STATE)
			LED_STOP: begin
				if (LED_CONTROL) begin
					NEXT_LED_STATE = LED_START;
					LED_EN1 = 1;
					case (LED_POS)
					3'd0: LED_ON1 = 8'b10000000;
					3'd1: LED_ON1 = 8'b01000000;
					3'd2: LED_ON1 = 8'b00100000;
					3'd3: LED_ON1 = 8'b00010000;
					3'd4: LED_ON1 = 8'b00001000;
					3'd5: LED_ON1 = 8'b00000100;
					3'd6: LED_ON1 = 8'b00000010;
					3'd7: LED_ON1 = 8'b00000001;
					default LED_ON1 = 8'b11111111;
				endcase
				end
			end
			LED_START: begin
				if (LED_DIR == 1'b0) begin
					if (LED_ON[7] == 1'b1) begin
						NEXT_LED_STATE = LED_DONE;
					end else begin
						NEXT_LED_STATE = LED_START;
						LED_ON1 = {LED_ON[6:0], 1'b0};
					end
				end else if (LED_DIR == 1'b1) begin
					if (LED_ON[0] == 1'b1) begin
						NEXT_LED_STATE = LED_DONE;
					end else begin
						NEXT_LED_STATE = LED_START;
						LED_ON1 = {1'b0, LED_ON[7:1]};
					end
				end
			end
			LED_DONE: begin
				NEXT_LED_STATE = LED_STOP;
			end
		endcase
	end
	
	always @(posedge BCLK_1Hz or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			LED_EN <= 1'b0;
			LED_ON <= 8'b0;
		end else begin
			LED_EN <= LED_EN1;
			LED_ON <= LED_ON1;
		end
	end

	always @(posedge BCLK_1Hz or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			LED_STATE <= LED_STOP;
		end else begin
			LED_STATE <= NEXT_LED_STATE;
		end
	end
endmodule

