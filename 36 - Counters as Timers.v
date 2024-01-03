module Counter_Timer #(parameter finalvalue=255) (
	input clk,
	input rst,
	input enable,
	output reg tick
	);

      localparam n=$clog2(finalvalue);

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
        tick= q_reg == finalvalue; 
      	q_next= tick ? 'b0 : q_reg+1;
      end

endmodule       