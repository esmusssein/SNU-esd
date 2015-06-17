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

    assign status = 4'b0000;
	 assign dout = 32'b1001_1000_0111_0101_0100_0011_0010_0001;

endmodule
