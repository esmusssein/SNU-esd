/**
 * A module that manipulate signals from M1 to M3 and shared memory between M1 and M3.
 */
module host_itf (
	input clk,
	input nRESET,
	input FPGA_nRST,
	input HOST_nOE,
	input HOST_nWE,
	input HOST_nCS,
	input [20:0] HOST_ADD,
	input [15:0] HDI,
	input [15:0] DIP_D,
	input [3:0] PUSH_RD,
	input [3:0] PUSH_SW,
	input [31:0] proc_dout,
    
	output reg [15:0] HDO,
	output CLCD_RS,
	output CLCD_RW,
	output CLCD_E,
	output [7:0] CLCD_DQ,
	output [7:0] LED_D,
	output reg [5:0] SEG_COM,
	output reg [7:0] SEG_DATA,
	output [9:0] DOT_SCAN,
	output [6:0] DOT_DATA,
	output Piezo,
	output [3:0] PUSH_LD,
	output host_sel
);
   
	reg [15:0] x8800_0000, x8800_0002, x8800_0004, x8800_0006, x8800_0008, x8800_000A, x8800_000C, x8800_000E;

	/**
	 *
	 * @update x8800_xxxx
    */
	always @(posedge clk or negedge nRESET) begin
		if (nRESET == 1'b0) begin
			x8800_0000 <= 16'd0;
			x8800_0002 <= 16'd0;
         x8800_0004 <= 16'd0;
         x8800_0006 <= 16'd0;
         x8800_0008 <= 16'd0;
         x8800_000A <= 16'd0;
         x8800_000C <= 16'd0;
         x8800_000E <= 16'd0;
      end else begin
         if (HOST_nCS == 1'b0 && HOST_nWE == 1'b0 && HOST_nOE == 1'b1) begin
            case (HOST_ADD[19:0])
               20'h00000: x8800_0000 <= HDI;
               20'h00002: x8800_0002 <= HDI;
               20'h00004: x8800_0004 <= HDI;
               20'h00006: x8800_0006 <= HDI;
               20'h00008: x8800_0008 <= HDI;
               20'h0000A: x8800_000A <= HDI;
               20'h0000C: x8800_000C <= HDI;
               20'h0000E: x8800_000E <= HDI;
            endcase
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
               default: begin
                  HDO <= 16'd0;
               end
            endcase
         end
      end
   end
   
   assign host_sel = 1'b1;
   
   
   /**************************************
    * 7 segment part.
    **************************************/
   
   parameter CLK_CNT_FOR_ONE_SEC = 50000000 - 1;
   
   // 1kHz clock for 7 segment.
   reg seg_clk;
   reg [2:0] cnt_segcon;
   integer my_clk_cnt;
   
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
            3'd0:   begin SEG_COM <= 6'b011111; SEG_DATA <= {conv_int(proc_dout[3:0]), 1'b0}; end
            3'd1:   begin SEG_COM <= 6'b101111; SEG_DATA <= {conv_int(proc_dout[7:4]), 1'b0}; end
            3'd2:   begin SEG_COM <= 6'b110111; SEG_DATA <= {conv_int(proc_dout[11:8]), 1'b0}; end
            3'd3:   begin SEG_COM <= 6'b111011; SEG_DATA <= {conv_int(proc_dout[15:12]), 1'b0}; end
            3'd4:   begin SEG_COM <= 6'b111101; SEG_DATA <= {conv_int(proc_dout[3:0]), 1'b0}; end
            3'd5:   begin SEG_COM <= 6'b111110; SEG_DATA <= {conv_int(proc_dout[7:4]), 1'b0}; end
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
endmodule

