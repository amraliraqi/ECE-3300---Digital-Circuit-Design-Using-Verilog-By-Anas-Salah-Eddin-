module BCD_Counter(
	input clk,
	input rst,
	input enable,
	output [4:0] q,
	output reg done
	);     
     reg [4:0] q_reg, q_next;

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
       done = q_reg == 9 ;
       q_next = done ? 'b0 : q_reg+1 ;
     end

     assign q = q_reg ;

endmodule     

module MultiDecade_Counter (
	input clk,
	input rst,
	input enable,
	output [3:0] ones, tens, hundreds,
	output done
	);

     wire done0,done1,done2;
     BCD_Counter BCD0 (
	    .clk(clk),
	    .rst(rst),
	    .enable(enable),
	    .q(ones),
	    .done(done0)
	);     


     BCD_Counter BCD1 (
	    .clk(clk),
	    .rst(rst),
	    .enable(enable & done0),
	    .q(tens),
	    .done(done1)
	);     


     BCD_Counter BCD2 (
	    .clk(clk),
	    .rst(rst),
	    .enable(enable & done0 & done1),
	    .q(hundreds),
	    .done(done2)
	);     

     assign done = enable & done0 & done1 & done2;

endmodule     