module Ziggurat (
	input clk,
	input nreset
	
	input control_bit;
	
	inout  reg [15:0] SRAM_DATA ;
	output reg [17:0] SRAM_ADDR ;
	output reg 			SRAM_nCS ;
	output reg 			SRAM_nOE ;
	output reg 			SRAM_nWE ;
	output [31:0]		g_randnum_out;
	output				invalid_bit_out;
	output				complete_bit_out;
	
};
	wire [19:0] uniform_randnum;
	wire [14:0] u0;
	wire [14:0] u1;
	wire [14:0] u2;
	wire [31:0] u0_stdandard;
	wire [31:0] u1_stdandard;
	wire [31:0] u2_stdandard;

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
	
	reg [31:0] x [255:0] = '{ 32'h0001d3bb 32'h0001b981 32'h0001a8fd 32'h00019cbe 32'h000192ee 32'h00018ab0 32'h00018390 32'h00017d42 32'h00017799 32'h00017272 32'h00016db6 32'h00016954 32'h0001653c 32'h00016166 32'h00015dc8 32'h00015a5c 32'h0001571b 32'h00015401 32'h00015109 32'h00014e32 32'h00014b77 32'h000148d6 32'h0001464c 32'h000143d9 32'h0001417a 32'h00013f2d 32'h00013cf2 32'h00013ac7 32'h000138ab 32'h0001369d 32'h0001349c 32'h000132a7 32'h000130be 32'h00012ee0 32'h00012d0d 32'h00012b43 32'h00012982 32'h000127cb 32'h0001261b 32'h00012474 32'h000122d4 32'h0001213b 32'h00011fa9 32'h00011e1e 32'h00011c99 32'h00011b1a 32'h000119a1 32'h0001182d 32'h000116bf 32'h00011556 32'h000113f1 32'h00011292 32'h00011136 32'h00010fdf 32'h00010e8d 32'h00010d3e 32'h00010bf3 32'h00010aac 32'h00010969 32'h00010829 32'h000106ed 32'h000105b3 32'h0001047d 32'h0001034a 32'h0001021a 32'h000100ed 32'h0000ffc2 32'h0000fe9b 32'h0000fd75 32'h0000fc53 32'h0000fb32 32'h0000fa15 32'h0000f8f9 32'h0000f7e0 32'h0000f6c9 32'h0000f5b4 32'h0000f4a1 32'h0000f390 32'h0000f280 32'h0000f173 32'h0000f068 32'h0000ef5e 32'h0000ee56 32'h0000ed50 32'h0000ec4b 32'h0000eb48 32'h0000ea46 32'h0000e946 32'h0000e848 32'h0000e74a 32'h0000e64f 32'h0000e554 32'h0000e45b 32'h0000e363 32'h0000e26c 32'h0000e176 32'h0000e082 32'h0000df8e 32'h0000de9c 32'h0000ddab 32'h0000dcbb 32'h0000dbcb 32'h0000dadd 32'h0000d9f0 32'h0000d903 32'h0000d818 32'h0000d72d 32'h0000d643 32'h0000d55a 32'h0000d472 32'h0000d38a 32'h0000d2a3 32'h0000d1bd 32'h0000d0d8 32'h0000cff3 32'h0000cf0f 32'h0000ce2b 32'h0000cd48 32'h0000cc66 32'h0000cb84 32'h0000caa3 32'h0000c9c2 32'h0000c8e1 32'h0000c801 32'h0000c722 32'h0000c643 32'h0000c564 32'h0000c486 32'h0000c3a8 32'h0000c2ca 32'h0000c1ed 32'h0000c110 32'h0000c033 32'h0000bf56 32'h0000be7a 32'h0000bd9e 32'h0000bcc2 32'h0000bbe6 32'h0000bb0b 32'h0000ba2f 32'h0000b954 32'h0000b879 32'h0000b79e 32'h0000b6c3 32'h0000b5e8 32'h0000b50d 32'h0000b432 32'h0000b357 32'h0000b27c 32'h0000b1a0 32'h0000b0c5 32'h0000afea 32'h0000af0f 32'h0000ae33 32'h0000ad57 32'h0000ac7c 32'h0000aba0 32'h0000aac3 32'h0000a9e7 32'h0000a90a 32'h0000a82d 32'h0000a750 32'h0000a672 32'h0000a594 32'h0000a4b5 32'h0000a3d6 32'h0000a2f7 32'h0000a218 32'h0000a137 32'h0000a057 32'h00009f75 32'h00009e94 32'h00009db1 32'h00009cce 32'h00009beb 32'h00009b07 32'h00009a22 32'h0000993c 32'h00009856 32'h0000976e 32'h00009686 32'h0000959d 32'h000094b4 32'h000093c9 32'h000092dd 32'h000091f0 32'h00009103 32'h00009014 32'h00008f24 32'h00008e33 32'h00008d40 32'h00008c4d 32'h00008b58 32'h00008a61 32'h0000896a 32'h00008871 32'h00008776 32'h00008679 32'h0000857b 32'h0000847c 32'h0000837a 32'h00008277 32'h00008172 32'h0000806a 32'h00007f61 32'h00007e55 32'h00007d47 32'h00007c37 32'h00007b24 32'h00007a0f 32'h000078f7 32'h000077dc 32'h000076bf 32'h0000759e 32'h0000747a 32'h00007353 32'h00007228 32'h000070f9 32'h00006fc7 32'h00006e90 32'h00006d56 32'h00006c16 32'h00006ad2 32'h00006989 32'h0000683b 32'h000066e7 32'h0000658d 32'h0000642c 32'h000062c5 32'h00006157 32'h00005fe1 32'h00005e62 32'h00005cdb 32'h00005b4a 32'h000059af 32'h00005808 32'h00005656 32'h00005495 32'h000052c6 32'h000050e7 32'h00004ef6 32'h00004cf0 32'h00004ad4 32'h0000489e 32'h0000464a 32'h000043d4 32'h00004134 32'h00003e64 32'h00003b58 32'h00003800 32'h00003446 32'h00003003 32'h00002af9 32'h000024a1 32'h00001b8d 32'h00000000 };
	reg [31:0] y [255:0] = '{ 32'h00000029 32'h00000055 32'h00000084 32'h000000b4 32'h000000e7 32'h0000011a 32'h0000014e 32'h00000184 32'h000001ba 32'h000001f1 32'h00000229 32'h00000261 32'h0000029a 32'h000002d4 32'h0000030f 32'h0000034a 32'h00000386 32'h000003c2 32'h000003ff 32'h0000043c 32'h0000047a 32'h000004b8 32'h000004f7 32'h00000536 32'h00000576 32'h000005b6 32'h000005f7 32'h00000638 32'h0000067a 32'h000006bc 32'h000006ff 32'h00000742 32'h00000785 32'h000007c9 32'h0000080d 32'h00000852 32'h00000897 32'h000008dd 32'h00000922 32'h00000969 32'h000009af 32'h000009f6 32'h00000a3e 32'h00000a86 32'h00000ace 32'h00000b17 32'h00000b60 32'h00000ba9 32'h00000bf3 32'h00000c3d 32'h00000c88 32'h00000cd3 32'h00000d1e 32'h00000d69 32'h00000db5 32'h00000e02 32'h00000e4f 32'h00000e9c 32'h00000ee9 32'h00000f37 32'h00000f85 32'h00000fd4 32'h00001023 32'h00001072 32'h000010c2 32'h00001112 32'h00001163 32'h000011b4 32'h00001205 32'h00001256 32'h000012a8 32'h000012fb 32'h0000134d 32'h000013a0 32'h000013f4 32'h00001447 32'h0000149c 32'h000014f0 32'h00001545 32'h0000159a 32'h000015f0 32'h00001646 32'h0000169c 32'h000016f3 32'h0000174a 32'h000017a1 32'h000017f9 32'h00001852 32'h000018aa 32'h00001903 32'h0000195d 32'h000019b6 32'h00001a10 32'h00001a6b 32'h00001ac6 32'h00001b21 32'h00001b7d 32'h00001bd9 32'h00001c35 32'h00001c92 32'h00001cf0 32'h00001d4d 32'h00001dab 32'h00001e0a 32'h00001e69 32'h00001ec8 32'h00001f27 32'h00001f88 32'h00001fe8 32'h00002049 32'h000020aa 32'h0000210c 32'h0000216e 32'h000021d1 32'h00002234 32'h00002297 32'h000022fb 32'h0000235f 32'h000023c4 32'h00002429 32'h0000248f 32'h000024f5 32'h0000255b 32'h000025c2 32'h00002629 32'h00002691 32'h000026f9 32'h00002762 32'h000027cb 32'h00002835 32'h0000289f 32'h0000290a 32'h00002975 32'h000029e0 32'h00002a4c 32'h00002ab9 32'h00002b26 32'h00002b93 32'h00002c01 32'h00002c70 32'h00002cdf 32'h00002d4f 32'h00002dbf 32'h00002e2f 32'h00002ea0 32'h00002f12 32'h00002f84 32'h00002ff7 32'h0000306a 32'h000030de 32'h00003152 32'h000031c7 32'h0000323d 32'h000032b3 32'h0000332a 32'h000033a1 32'h00003419 32'h00003491 32'h0000350a 32'h00003584 32'h000035fe 32'h00003679 32'h000036f5 32'h00003771 32'h000037ee 32'h0000386b 32'h000038e9 32'h00003968 32'h000039e8 32'h00003a68 32'h00003ae9 32'h00003b6a 32'h00003bed 32'h00003c70 32'h00003cf4 32'h00003d78 32'h00003dfe 32'h00003e84 32'h00003f0b 32'h00003f92 32'h0000401b 32'h000040a4 32'h0000412e 32'h000041b9 32'h00004245 32'h000042d2 32'h00004360 32'h000043ee 32'h0000447e 32'h0000450e 32'h000045a0 32'h00004632 32'h000046c5 32'h0000475a 32'h000047ef 32'h00004885 32'h0000491d 32'h000049b6 32'h00004a4f 32'h00004aea 32'h00004b86 32'h00004c23 32'h00004cc2 32'h00004d62 32'h00004e03 32'h00004ea5 32'h00004f48 32'h00004fed 32'h00005094 32'h0000513c 32'h000051e5 32'h00005290 32'h0000533c 32'h000053eb 32'h0000549a 32'h0000554c 32'h000055ff 32'h000056b4 32'h0000576b 32'h00005824 32'h000058df 32'h0000599c 32'h00005a5b 32'h00005b1d 32'h00005be1 32'h00005ca7 32'h00005d70 32'h00005e3c 32'h00005f0a 32'h00005fdb 32'h000060b0 32'h00006187 32'h00006262 32'h00006341 32'h00006423 32'h0000650a 32'h000065f5 32'h000066e4 32'h000067d8 32'h000068d2 32'h000069d2 32'h00006ad7 32'h00006be4 32'h00006cf8 32'h00006e15 32'h00006f3b 32'h0000706c 32'h000071a9 32'h000072f4 32'h00007451 32'h000075c2 32'h0000774d 32'h000078fc 32'h00007add 32'h00007d11 32'h00008000 };
	
	reg [31:0] ln2 = 32'b0000_0000_0000_0000_0101_0010_1010_0001;
	reg [31:0] one = 32'b0000_0000_0000_0000_1000_0000_0000_0000;
	
	reg [3:0] state;
	reg [3:0] nxt_state;
	
	reg	invalid_bit;	//1 : false when checked, 2 : true when checked
	reg	complete_bit;		//inform 10^7 is complete to processor, 1 : complete, 0 : continue
	wire	cnt_end_bit;		//receive from lfsr 10^7 is over 1: over, 0 : continue;
	
	assign u0 = {uniform_randnum[3:2],uniform_randnum[8:7],uniform_randnum[15:14],uniform_randnum[18:17],uniform_randnum[2:1],uniform_randnum[14:13],uniform_randnum[17],uniform_randnum[12:11]};
	assign u1 = {uniform_randnum[6:5],uniform_randnum[2:1],uniform_randnum[17:16],uniform_randnum[12:11],uniform_randnum[0],uniform_randnum[13:12],uniform_randnum[7:6],uniform_randnum[15:14]};
	assign u2 = {uniform_randnum[3:2],uniform_randnum[9:8],uniform_randnum[6:5],uniform_randnum[4:3],uniform_randnum[10:9],uniform_randnum[15:14],uniform_randnum[19],uniform_randnum[14:13]};
	assign i	 = uniform_randnumi[7:0];
	
	assign u0_stdandard = u0;
	assign u1_stdandard = u1;
	assign u2_stdandard = u2;

	////////////case1////////////// 
	assign u0_multi_xi_1	= u0*x[i-1];			
	assign x_case1			= u0_multi_xi_1[46:15];	//17 int + 15 fraction result
	

	////////////case2////////////// 
	assign u1_multi2		= (u1_stdandard>>1);
	assign lnU1				= u1_stdandard-one-ln2;
	assign lnU1_negative	= (~lnU1)+1;		//2's complement 1 is not same as integer 1;
	assign x_case2			=	lnU1_netive/x[1];
	assign u2_multi2		= (u2_stdandard>>1);
	assign lnU2				= u2_stdandard-one-ln2;
	assign y_case2			= (~lnU1)+1;
	assign y_multi2		= y_case2>>1;
	
	////////////case3////////////// 
	assign yi_width					= y[i]-y[i-1];
	assign u1_multi_yi_width		= u1*yi_width;
	assign y_case3						= y[i-1]+u1_multi_yi_width[46:15];
	assign x_case1_squaring			= x_case1[17:0]*x_case1[17:0];
	assign x_case1_square			= x_case1_squaring[35:12];
	assign x_case1_square_div2 	= x_case1_square>>1;
	assign x_case1_sq_div2_minus	= (~x_case1_square_div2)+1;
	
	
	reg [3:0] state;
	reg [3:0] nxt_state;
	
	parameter IDLE = 0;
	parameter RUNNING = 1;
	parameter COMPLETE = 2;

	
	assign g_randnum_out 	= g_randnum;
	assign invalid_bit_out	= invalid_bit;
	assign complete_bit_out = complete_bit;
	
	always @ (posedge clk, negedge nreset)begin
		if(!nreset)begin
			state <= IDLE;
		end
		else begin
			state <= nxt_state;
		end
	end
	
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
			// TODO: How this know the computation ends?
			if (cnt_end_bit) begin
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
			invalid_bit 		<= 0;
			complete_bit 	<= 0;
		end
		RUNNING: begin
			invalid_bit 	<= 0;
			complete_bit	<= 0;
			if( u0_multi_xi_1 < x[i] ) begin
				g_randnum <= x_case1;
			end
			else if( i == 0 ) begin
				if(y_multi2 > x[2]) begin
					g_randnum <= x_case2;
				end
				else begin
					invalid_bit <= 1;
				end
			end
			else begin
				if ( y_case3 < x_case1_sq_div2_minus) begin
					g_randnum <= x_case1;
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
			valid_bit		<= 0;
			complete_bit	<= 0;
		end
		endcase
	end
	
	
	
	lfsr0 lsfr0(
		.clk(clk),
		.nreset(nreset),
		.control_bit(control_bit),
		.cnt_end_bit_out(cnt_end_bit),
		.data(uniform_randnum),
	);
	expo expo0(
		.clk(clk),
		.nreset(nreset),
		.data_in(
		.data_out(uniform_randnum)
	};
	log log0(
		.clk(clk),
		.nreset(nreset),
		.data_in(
		.data_out(uniform_randnum)
	};
endmodule