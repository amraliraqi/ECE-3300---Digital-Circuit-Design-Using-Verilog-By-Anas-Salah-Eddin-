module D_Latch (
	input d,
	input clk,
	output reg q
	);

      always @(clk,d)
      begin
      	if(clk)
      	  q <= d;
      end
endmodule

module D_FF_pos (
	input d,
	input clk,
	output reg q
	);      
       always @(posedge clk)
       begin
       	q <= d;
       end
endmodule       

module D_FF_neg (
	input d,
	input clk,
	output reg q
	);      
       always @(negedge clk)
       begin
       	q <= d;
       end
endmodule       


module DUT (
	input d,
	input clk,
	output q_latch, q_ff_pos, q_ff_neg
	);

       D_Latch B0 (d,clk,q_latch);
       D_FF_pos B1 (d,clk,q_ff_pos);
       D_FF_neg B2 (d,clk,q_ff_neg);

endmodule       