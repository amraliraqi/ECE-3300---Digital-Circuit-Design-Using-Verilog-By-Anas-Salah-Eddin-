module T_FF (
	input T,
	input clk,
	input rst,
	output Q,
	output Q_n);

      reg Q_reg, Q_next;
      always @(posedge clk or posedge rst) begin
      	if (rst) 
      		Q_reg <= 1'b0;
      	
      	else 
      		Q_reg <= Q_next;
      end

      always @(*)
      begin
      	Q_next = T ? ~Q_reg:Q_reg;
      end

      assign Q = Q_reg ;
      assign Q_n = ~Q_reg ;

endmodule      

module Asynch_counter (
	input clk,
	input rst,
	output [3:0] q,
	output [3:0] q_n
	);

     T_FF TFF0 (1'b1,clk,rst,q[0],q_n[0]);

     T_FF TFF1 (1'b1,q_n[0],rst,q[1],q_n[1]);
     
     T_FF TFF2 (1'b1,q_n[1],rst,q[2],q_n[2]);
     
     T_FF TFF3 (1'b1,q_n[2],rst,q[3],q_n[3]);

endmodule   



module Synch_counter (
	input clk,
	input rst,
	output [3:0] q,
	output [3:0] q_n
	);

     T_FF TFF0 (1'b1,clk,rst,q[0],q_n[0]);

     T_FF TFF1 (1'b1 & q[0] ,clk,rst,q[1],q_n[1]);
     
     T_FF TFF2 (1'b1 & q[0] & q[1],clk,rst,q[2],q_n[2]);
     
     T_FF TFF3 (1'b1 & q[0] & q[1] & q[2] ,clk,rst,q[3],q_n[3]);

endmodule       

