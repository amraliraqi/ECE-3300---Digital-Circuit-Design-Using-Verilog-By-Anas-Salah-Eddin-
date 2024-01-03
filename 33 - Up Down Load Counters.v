module Counter_up_down_Load #(parameter n=4) (
	input clk,
	input rst,
	input en,
	input up_down, // 1 for up and 0 for down
	input load,
	input [n-1:0] d,
	output [n-1:0] q
	);
     
     reg [n-1:0] q_reg, q_next;

     always @(posedge clk or posedge rst) begin
     	if (rst)
     		q_reg <= 'b0;
     	
     	else if (en) 
     		q_reg <= q_next; 
     	else 
     	    q_reg <= q_reg;
     end

     always @(*)
     begin
     	casex ({load,up_down})
     	2'b00: q_next=q_reg-1;
     	2'b01: q_next=q_reg+1;
     	2'b1x: q_next=d;
     	default: q_next=q_reg;
     	endcase
     end

     assign q = q_reg ;
endmodule     

