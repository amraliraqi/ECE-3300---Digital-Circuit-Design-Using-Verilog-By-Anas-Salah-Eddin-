module FF (
	input d,
	input clk,
	input rst, //asynch
	input set, //synch
	output q
	);

       reg q_reg, q_next;

       always @(posedge clk or posedge rst)
        begin
       	if (rst) 
       		q_reg <= 1'b0;
       	else 
       		q_reg <= q_next;
       end

       always @(*)
       begin
       	if(set)
       	   q_next=1'b1;
       	else 
       	   q_next = d;  
       end

       assign q = q_reg;

endmodule       