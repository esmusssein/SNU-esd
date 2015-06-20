module LSFR(
	input					clk,
	input					nreset,
	
	output  [19:0]	data_out
	
);
	
	parameter IDLE = 0;
	parameter RUNNING = 1;
	parameter COMPLETE = 2;
	
	//reg [1:0] state;
	//reg [1:0] nxt_state;
	
	wire feedback; 
	reg [19:0] data = 20'b0000_0000_0000_0000_0000;
	
	assign feedback = ~(data[6] ^ data[19]);
	assign data_out = data[19:0];
	
	always @(posedge clk, negedge nreset ) begin
		if(!nreset)begin
			data <= 20'b0000_0000_0001_0000_0001;
		end
		else begin
			data <= {data[18:0],feedback};
		end
	end

	
	
	/*always @ (posedge clk, negedge nreset)begin
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
			nxt_state <= RUNNING;
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
			data <= 20'b0000_0000_0001_0000_0001;
		end
		RUNNING: begin
			data <= {data[18:0],feedback};
		end
		COMPLETE: begin
		end
		default: begin
		end
		endcase
	end
*/
endmodule 
