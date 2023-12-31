module SynchCircuit (
	input clk,
	input a, b, c,
	output f, g
	);

       reg f_reg, g_reg;
       reg f_next, g_next;

       always @(posedge clk)
       begin
       	     f_reg <= f_next;
       	     g_reg <= g_next;
       end


       always @(*)
       begin
       	f_next = a & ~g_reg;
       	g_next = b | c;
       end

       assign f = f_reg ;
       assign g = g_reg ;

endmodule       
