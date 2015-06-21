module BoxMuller(
	input          clk,
	input          nreset,

	output [31:0]	g_randnum_out
	);
	
	wire [19:0] uniform_randnum;
	wire [11:0] u0;  //for sqrt(-2log(u0))
	wire [9:0] u1;  //for cos(2*pi*u1)
	wire [15:0]	rare_sqrt_minus_log_x;
	wire [16:0] sqrt_minus_log_x;   //sign(1)+int(3)+fraction(13)
	
	wire [15:0] rare_cosx;          //sign_int(1)+fraction(16)
	wire [16:0] cosx_fraction;      //int(0000)+fraction(13)
	wire [16:0] cosx;               //int(4)+fraction(13)
	wire [33:0] rare_result;        
  
	assign u0 = {uniform_randnum[3:2],uniform_randnum[8:7],uniform_randnum[15:14],uniform_randnum[18:17],uniform_randnum[2:1],uniform_randnum[12:11]};
	assign u1 = {uniform_randnum[6:5],uniform_randnum[2:1],uniform_randnum[17:16],uniform_randnum[12:11],uniform_randnum[19:18]};
	

	assign cosx = {u1[9],rare_cosx};
	assign sqrt_minus_log_x = {1'b0,rare_sqrt_minus_log_x};
	
	assign g_randnum_out = {{12{rare_result[33]}},rare_result[33:14]};//2's complement

	
	LSFR lsfr0(
		.clk(clk),
		.nreset(nreset),
		.data_out(uniform_randnum)
	);
	//????? 1+13?? ????
	 cosin cos0(
		.data_in(u1),
		.cos_x_out(rare_cosx)
	);
	
	sqrt_log sl0(
		.data_in(u0),
		.data_out(rare_sqrt_minus_log_x)
	);
  //17(1+3+13)x17(1+3+13)
	mult_17_17 sigh_mult(
	  .aclr0(!nreset),
	  .clock0(clk),
	  .dataa_0(cosx),
	  .datab_0(sqrt_minus_log_x),
	  .result(rare_result)
	);
	  

endmodule