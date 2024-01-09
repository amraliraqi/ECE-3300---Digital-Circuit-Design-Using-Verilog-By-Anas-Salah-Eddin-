module LFSR (
	input clk,
	input rst,
	output [1:3] q
	);

       reg [1:3] q_reg, q_next;
       wire tab;

       always @(posedge clk or posedge rst) begin
       	if (rst) 
       		q_reg <= 3'b001;
       	
       	else 
       		q_reg <= q_next;
       	
       end

       always @(*)
       begin
       	q_next={tab,q_reg[1:2]};
       end

       assign tab = q_reg[2] ^ q_reg[3];
       assign q = q_reg;

endmodule       