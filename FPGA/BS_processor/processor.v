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
	input req,
	 
	output [4:0] status,
	output [31:0] dout
);

	wire [31:0] acc_dout;
	wire [31:0] acc_dina;
	reg [31:0] acc_dinb;

	assign status = 4'b0000;
	assign acc_dina = 32'b00111111100111100000010000011001;
	assign dout = acc_dinb;
	
	integer cnt_clk;
	
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			cnt_clk <= 0;
			acc_dinb <= 32'd0;
		end else begin
			if (cnt_clk < 12) begin
				cnt_clk <= cnt_clk + 1;
				acc_dinb <= acc_dout;
			end else begin
				cnt_clk <= cnt_clk;
				acc_dinb <= acc_dinb;
			end
		end
	end
	
	altfp_add accumulator(
		.clock(clk),
		.dataa(acc_dina),
		.datab(acc_dinb),
		.result(acc_dout)
	);
	 
endmodule
