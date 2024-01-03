module Modulus_Counter #(parameter finalvalue = 18, n = $clog2(finalvalue)) (
	input clk,
	input rst,
	input enable,
	output [n-1:0] q
	);

     reg done;     
     reg [n-1:0] q_reg, q_next;

     always @(posedge clk or posedge rst) begin
     	if (rst) 
     		q_reg <= 'b0;
     	
     	else if (enable) 
     		q_reg <= q_next;
     	else
     	   q_reg <= q_reg;
     end

     always @(*)
     begin
       done = q_reg == finalvalue ;
       q_next = done ? 'b0 : q_reg+1 ;
     end

     assign q = q_reg ;

endmodule     