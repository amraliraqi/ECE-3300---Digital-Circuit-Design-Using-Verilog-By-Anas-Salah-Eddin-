module moore_011_detector (
	input rst,
	input clk,
	input x,
	output y
	);

     reg [1:0] state_next, state_reg;

     always @(posedge clk or posedge rst) begin
     	if (rst) 
     		state_reg <= 2'b00;
     	
     	else 
     		state_reg <= state_next;
     end

     always @(*)
     begin
     	state_next[0] = (~state_reg[0] & state_reg[1]) | ~x ;
     	state_next[1] = (state_reg[0] ^ state_reg[1]) & x ;
     end

     assign y = state_reg[0] & state_reg[1];

endmodule   


module mealy_011_detector (
	input rst,
	input clk,
	input x,
	output y
	);

     reg [1:0] state_next, state_reg;

     always @(posedge clk or posedge rst) begin
     	if (rst) 
     		state_reg <= 2'b00;
     	
     	else 
     		state_reg <= state_next;
     end

     always @(*)
     begin
     	state_next[0] = ( ~state_reg[0] & ~x ) | (state_reg[1] & ~x);
     	state_next[1] = state_reg[0] & state_reg[1] & x;
     end

     assign y = ~state_reg[0] & state_reg[1] & x;

endmodule       


module moore_011_detector_3flipflops (
	input rst,
	input clk,
	input x,
	output y
	);

     reg [2:0] state_next, state_reg;

     always @(posedge clk or posedge rst) begin
     	if (rst) 
     		state_reg <= 3'b000;
     	
     	else 
     		state_reg <= state_next;
     end

     always @(*)
     begin
     	state_next[0] = state_reg[1] ;
     	state_next[1] = state_reg[2];
     	state_next[2] = x ;
     end

     assign y = ~state_reg[0] & state_reg[1] & state_reg[2];

endmodule   
