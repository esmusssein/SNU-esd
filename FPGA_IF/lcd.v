module lcd_demo (clk, rst, cnt_1, cnt_10, sec_1, sec_10, min_1, min_10, hour_1, hour_10, lcd_e, lcd_rs, lcd_rw, lcd_data);
	parameter CNT_MAX = 4;
	localparam CNT_CLK_HALF = CNT_MAX-1;
	parameter LCD_CHAR = 16;
	parameter STABLE_DELAY = 19;
	parameter DISPLAY_DELAY = 399;
	
	parameter DELAY_20M    = 0;
	parameter FUNCTION_SET = 1;
	parameter ENTRY_MODE   = 2;
	parameter DISP_ON      = 3;
	parameter DISP_LINE1   = 4;
	parameter DISP_LINE2   = 5;
		
	input clk, rst;
	input [7:0] cnt_1, cnt_10, sec_1, sec_10, min_1, min_10, hour_1, hour_10;
	
	output reg lcd_e, lcd_rs;
	output lcd_rw;
	output reg [7:0] lcd_data;
	
	reg [2:0] cnt_clk;
	reg [4:0] cnt_delay_20m;
	reg [7:0] cnt_delay_2s;
	reg [4:0] cnt_line;
	reg [1:0] cnt_brightness;
	reg [2:0] lcd_routine;
	
	wire [7:0] reg_lcd_data1 [LCD_CHAR:0];
	wire [7:0] reg_lcd_data2 [LCD_CHAR:0];
	
	assign lcd_rw = 1'b0;
	
	assign reg_lcd_data1[0]  = 8'b10000000;
	assign reg_lcd_data1[1]  = "E";
	assign reg_lcd_data1[2]  = "S";
	assign reg_lcd_data1[3]  = "D";
	assign reg_lcd_data1[4]  = " ";
	assign reg_lcd_data1[5]  = " ";
	assign reg_lcd_data1[6]  = "2";
	assign reg_lcd_data1[7]  = "0";
	assign reg_lcd_data1[8]  = "1";
	assign reg_lcd_data1[9]  = "4";
	assign reg_lcd_data1[10] = " ";
	assign reg_lcd_data1[11] = "S";
	assign reg_lcd_data1[12] = "P";
	assign reg_lcd_data1[13] = "R";
	assign reg_lcd_data1[14] = "I";
	assign reg_lcd_data1[15] = "N";
	assign reg_lcd_data1[16] = "G";
	
	assign reg_lcd_data2[0]  = 8'b11000000;
	assign reg_lcd_data2[1]  = "T";
	assign reg_lcd_data2[2]  = "i";
	assign reg_lcd_data2[3]  = "m";
	assign reg_lcd_data2[4]  = "e";
	assign reg_lcd_data2[5]  = " ";
	assign reg_lcd_data2[6]  = hour_10;
	assign reg_lcd_data2[7]  = hour_1;
	assign reg_lcd_data2[8]  = ":";
	assign reg_lcd_data2[9]  = min_10;
	assign reg_lcd_data2[10] = min_1;
	assign reg_lcd_data2[11] = ":";
	assign reg_lcd_data2[12] = sec_10;
	assign reg_lcd_data2[13] = sec_1;
	assign reg_lcd_data2[14] = ":";
	assign reg_lcd_data2[15] = cnt_10;
	assign reg_lcd_data2[16] = cnt_1;
	
	always @(posedge clk or negedge rst) begin
		if (rst == 1'b0) begin
			cnt_clk <= 0;
		end else begin
			if (cnt_clk == CNT_MAX) cnt_clk <= 0;
			else                    cnt_clk <= cnt_clk+1'b1;
		end
	end
	
	always @(posedge clk or negedge rst) begin
		if (rst == 1'b0) begin
			cnt_delay_20m <= 0;
		end else begin
			if (lcd_routine == DELAY_20M) begin
				if (cnt_clk == CNT_MAX) begin
					if (cnt_delay_20m == STABLE_DELAY) cnt_delay_20m <= 0;
					else                               cnt_delay_20m <= cnt_delay_20m+1'b1;
				end
			end else begin
				cnt_delay_20m <= 0;
			end
		end
	end
	
	always @(posedge clk or negedge rst) begin
		if (rst == 1'b0) begin
			cnt_line <= 0;
		end else begin
			if (lcd_routine == DISP_LINE1 || lcd_routine == DISP_LINE2) begin
				if (cnt_clk == CNT_MAX) begin
					if (cnt_line == LCD_CHAR) cnt_line <= 0;
					else                      cnt_line <= cnt_line+1'b1;
				end
			end else begin
				cnt_line <= 0;
			end
		end
	end
	
	always @(posedge clk or negedge rst) begin
		if (rst == 1'b0) begin
			lcd_routine <= DELAY_20M;
		end else begin
			if (cnt_clk == CNT_MAX) begin
				case (lcd_routine)
					DELAY_20M: if (cnt_delay_20m == STABLE_DELAY) lcd_routine <= FUNCTION_SET;
					FUNCTION_SET: lcd_routine <= ENTRY_MODE;
					ENTRY_MODE:   lcd_routine <= DISP_ON;
					DISP_ON:      lcd_routine <= DISP_LINE1;
					DISP_LINE1: if (cnt_line == LCD_CHAR) lcd_routine <= DISP_LINE2;
					DISP_LINE2: if (cnt_line == LCD_CHAR) lcd_routine <= DISP_LINE1;
				endcase
			end
		end
	end
					
	always @(posedge clk or negedge rst) begin
		if (rst == 1'b0) begin
			lcd_e <= 1'b0;
		end else begin
			case (lcd_routine)
				DELAY_20M: lcd_e <= 1'b0;
				default begin
					if (cnt_clk >= 1 && (cnt_clk <= CNT_CLK_HALF)) lcd_e <= 1'b1;
					else                                           lcd_e <= 1'b0;
				end
			endcase
		end
	end
	
	always @(posedge clk or negedge rst) begin
		if (rst == 1'b0) begin
			lcd_rs <= 1'b0;
		end else begin
			if (lcd_routine == DISP_LINE1 || lcd_routine == DISP_LINE2) begin
				if (cnt_line == 0) lcd_rs <= 1'b0;
				else               lcd_rs <= 1'b1;
			end else begin
				lcd_rs <= 1'b0;
			end
		end
	end
	
	always @(posedge clk or negedge rst) begin
		if (rst == 1'b0) begin
			lcd_data <= 8'b00000000;
		end else begin
			case (lcd_routine)
				DELAY_20M:    lcd_data <= 8'b00000000;
				FUNCTION_SET: lcd_data <= 8'b00111000;
				ENTRY_MODE:   lcd_data <= 8'b00000110;
				DISP_ON:      lcd_data <= 8'b00001100;
				DISP_LINE1:   lcd_data <= reg_lcd_data1[cnt_line];
				DISP_LINE2:   lcd_data <= reg_lcd_data2[cnt_line];
				default       lcd_data <= 8'b00000000;
			endcase
		end
	end
endmodule
