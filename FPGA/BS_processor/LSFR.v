module LSFR(
	input				clk,
	input				nreset,
	
	output  [19:0]	data_out  
);

	wire feedback0;
	wire feedback1;
	wire feedback2;

	reg [19:0] data;
	
	
	assign feedback0 = ~(data[19] ^ data[3]);
	assign feedback1 = ~(data[19] ^ data[7]);
	assign feedback2 = ~(data[19] ^ data[13]);
	
	assign data_out = data;

	always @ (posedge clk or negedge nreset)begin
		if(!nreset)begin
			data <= 20'b0000_0000_0000_0000_0001;
		end
		else begin		  
		    data <= {data[18:14],feedback2,data[12:8],feedback1,data[6:4],feedback0,data[2:0],data[19]};			
		end
	end
	
endmodule 
