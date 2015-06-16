module host_itf (
	clk, nRESET, FPGA_nRST, HOST_nOE, HOST_nWE, HOST_nCS, HOST_ADD, HDI, HDO,
	CLCD_RS, CLCD_RW, CLCD_E, CLCD_DQ, LED_D, SEG_COM, SEG_DATA, DOT_SCAN, DOT_DATA,
	Piezo, DIP_D, PUSH_RD, PUSH_LD, PUSH_SW,
	clk_3k, host_sel, sw);
	
	input clk, nRESET, FPGA_nRST, HOST_nOE, HOST_nWE, HOST_nCS;
	input [20:0] HOST_ADD;
	input [15:0] HDI;
	output reg [15:0] HDO;
	
	output CLCD_RS, CLCD_RW, CLCD_E;
	output [7:0] CLCD_DQ;
	output [7:0] LED_D;
	output [5:0] SEG_COM;
	output [7:0] SEG_DATA;
	output [9:0] DOT_SCAN;
	output [6:0] DOT_DATA;
	output Piezo ;
	input [15:0] DIP_D;
	input  [3:0] PUSH_RD;
	output [3:0] PUSH_LD;
	input  [3:0] PUSH_SW;
	
	input clk_3k, sw;
	output host_sel;
	
	reg [15:0] x8800_0010, x8800_0020, x8800_0030, x8800_0032, x8800_0040, x8800_0042, x8800_0050, x8800_0072, x8800_0090, x8800_00A0, x8800_00A2, x8800_00B0, x8800_00C0, x8800_00D0, x8800_00E0, x8800_00F0;
	wire [15:0] x8800_0062, x8800_0022, x8800_0070, x8800_0080, x8800_0092;
	reg [1:0] reg_sw;
	reg V_SEL;
	integer clk_cnt;

	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			x8800_0010 <= 16'b0;
			x8800_0020 <= 16'b0;
			x8800_0030 <= 16'b0;
			x8800_0032 <= 16'b0;
			x8800_0040 <= 16'b0;
			x8800_0042 <= 16'b0;
			x8800_0050 <= 16'b0;
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
					20'h00030: x8800_0030 <= HDI;
					20'h00032: x8800_0032 <= HDI;
					20'h00040: x8800_0040 <= HDI;
					20'h00042: x8800_0042 <= HDI;
					20'h00050: x8800_0050 <= HDI;
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
	
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			HDO <= 16'b0;
		end else begin
			if (HOST_nCS == 1'b0 && HOST_nOE == 1'b0) begin
				case (HOST_ADD[19:0])
					20'h00010: HDO <= x8800_0010;
					20'h00020: HDO <= x8800_0020;
					20'h00030: HDO <= x8800_0030;
					20'h00032: HDO <= x8800_0032;
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
	
	assign SEG_COM  = ~x8800_0030[5:0];
	assign SEG_DATA = x8800_0032[7:0];
	
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
	
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			reg_sw <= 2'b0;
		end else begin
			reg_sw <= {reg_sw[0], V_SEL};
		end
	end

		reg BCLK_1Hz;
	integer CNT_1Hz;
	
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

