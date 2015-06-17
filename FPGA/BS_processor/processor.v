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

	wire [31:0] fd1;
	wire [31:0] fd2;
	wire [31:0] acc_dout;
	reg [31:0] acc_dina;
	reg [31:0] acc_dinb;

	assign status = 4'b0000;
	assign fd1 = 32'b00111111100111100000010000011001;  // 1.2345
	assign fd2 = 32'b01000110010000001110010000000000;  // 12345
	assign dout = acc_dinb;
	
	integer cnt_clk;
	
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			cnt_clk <= 0;
		end else begin
			if (cnt_clk < 10000) begin
				cnt_clk <= cnt_clk + 1;
			end else begin
				cnt_clk <= cnt_clk;
			end
		end
	end
	
	always @(posedge clk or negedge nreset) begin
		if (nreset == 1'b0) begin
			acc_dina <= fd1;
			acc_dinb <= 32'd0;
		end else begin
			if (cnt_clk == 1) begin
				acc_dina <= fd2;
				acc_dinb <= 32'd0;
			end else if (cnt_clk < 16) begin
				acc_dina <= fd2;
				acc_dinb <= acc_dout;
			end else begin
				acc_dina <= acc_dina;
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
