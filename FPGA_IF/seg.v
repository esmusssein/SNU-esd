/**
 * Module that manipulates 7 segments hardware.
 *
 * @input clk 1kHz clock.
 * @input nreset
 * @output seg_com
 * @output seg_disp
 * @output cnt_1
 * @output cnt_10
 * @output sec_1
 * @output sec_10
 * @output min_1
 * @output min_10
 * @output hour_1
 * @output hour_10
 */
module seg_test (clk, nreset, seg_com, seg_disp, cnt_1, cnt_10, sec_1, sec_10, min_1, min_10, hour_1, hour_10);
	input clk, nreset;
	output reg [5:0] seg_com;
	output reg [7:0] seg_disp;
	output [7:0] cnt_1, cnt_10, sec_1, sec_10, min_1, min_10, hour_1, hour_10;
	
	// sec_a: last section of 7 segment hardware, ..., sec_f: first section of 7 segment hardware.
	reg [3:0] sec_a, sec_b, sec_c, sec_d, sec_e, sec_f, sec_g, sec_h;
	integer cnt;
	reg [2:0] cnt_segcon;
	
	// Outputs to control lcd hardware.
	assign cnt_1   = conv_lcd(sec_a);
	assign cnt_10  = conv_lcd(sec_b);
	assign sec_1   = conv_lcd(sec_c);
	assign sec_10  = conv_lcd(sec_d);
	assign min_1   = conv_lcd(sec_e);
	assign min_10  = conv_lcd(sec_f);
	assign hour_1  = conv_lcd(sec_g);
	assign hour_10 = conv_lcd(sec_h);
	
	parameter MAX_CNT = 999;
	
	/**
	 * Let cnt 1Hz.
	 *
	 * @update cnt
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			cnt <= 0;
		end else begin
			if (cnt == MAX_CNT) begin
				cnt <= 0;
			end else begin
				cnt <= cnt + 1'b1;
			end
		end
	end
	
	/**
	 *
	 * @update sec_a
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sec_a <= 0;
		end else begin
			if (cnt == MAX_CNT) begin
				if (sec_a == 0) begin
					sec_a <= 9;
				end else begin
					sec_a <= sec_a - 1'b1;
				end
			end
		end
	end
	
	/**
	 *
	 * @update sec_b
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sec_b <= 1;
		end else begin
			if (sec_a == 0 && cnt == MAX_CNT) begin
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
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sec_c <= 0;
		end else begin
			if (sec_b == 0 && sec_a == 0 && cnt == MAX_CNT) begin
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
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sec_d <= 0;
		end else begin
			if (sec_c == 0 && sec_b == 0 && sec_a == 0 && cnt == MAX_CNT) begin
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
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sec_e <= 0;
		end else begin
			if (sec_d == 0 && sec_c == 0 && sec_b == 0 && sec_a == 0 && cnt == MAX_CNT) begin
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
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sec_f <= 1;
		end else begin
			if (sec_e == 0 && sec_d == 0 && sec_c == 0 && sec_b == 0 && sec_a == 0 && cnt == MAX_CNT) begin
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
	 * @update sec_g
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sec_g <= 0;
		end else begin
			if (sec_f == 5 && sec_e == 9 && sec_d == 5 && sec_c == 9 && sec_b == 9 && sec_a == 9 && cnt == MAX_CNT) begin
				if (sec_g == 9) sec_g <= 0;
				else            sec_g <= sec_f+1'b1;
			end
		end
	end	

	/**
	 *
	 * @update sec_h
	 */	
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			sec_h <= 0;
		end else begin
			if (sec_g == 9 && sec_f == 5 && sec_e == 9 && sec_d == 5 && sec_c == 9 && sec_b == 9 && sec_a == 9 && cnt == MAX_CNT) begin
				if (sec_h == 2) sec_h <= 0;
				else            sec_h <= sec_f+1'b1;
			end
		end
	end			
	
	/**
	 *
	 * @update cnt_segcon, seg_com, seg_disp
	 */
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			seg_com <= 0;
			seg_disp <= 0;
		end else begin
			if (cnt_segcon == 5) cnt_segcon <= 0;
			else                 cnt_segcon <= cnt_segcon+1'b1;
			
			case (cnt_segcon)
				3'd0:   begin seg_com <= 6'b011111; seg_disp <= {conv_int(sec_a), 1'b0}; end
				3'd1:   begin seg_com <= 6'b101111; seg_disp <= {conv_int(sec_b), 1'b0}; end
				3'd2:   begin seg_com <= 6'b110111; seg_disp <= {conv_int(sec_c), 1'b0}; end
				3'd3:   begin seg_com <= 6'b111011; seg_disp <= {conv_int(sec_d), 1'b0}; end
				3'd4:   begin seg_com <= 6'b111101; seg_disp <= {conv_int(sec_e), 1'b0}; end
				3'd5:   begin seg_com <= 6'b111110; seg_disp <= {conv_int(sec_f), 1'b0}; end
				default begin seg_com <= 6'b111111; seg_disp <= 8'b00000000; end
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
	
	function [7:0] conv_lcd;
		input [3:0] cnt;
		begin
			case (cnt)
				4'd0:   conv_lcd = 8'b00110000;
				4'd1:   conv_lcd = 8'b00110001;
				4'd2:   conv_lcd = 8'b00110010;
				4'd3:   conv_lcd = 8'b00110011;
				4'd4:   conv_lcd = 8'b00110100;
				4'd5:   conv_lcd = 8'b00110101;
				4'd6:   conv_lcd = 8'b00110110;
				4'd7:   conv_lcd = 8'b00110111;
				4'd8:   conv_lcd = 8'b00111000;
				4'd9:   conv_lcd = 8'b00111001;
				default conv_lcd = 8'b00000000;
			endcase
		end
	endfunction
endmodule
