module normal_counter (
	input clk, rst, 
	input enable,
	output [2:0] q
	);

      localparam s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7;
      reg [2:0] q_reg, q_next;

      always @(posedge clk or posedge rst) begin
      	if (rst) 
      		q_reg <= s0;
      	
      	else 
      		q_reg <= q_next;
      end

      always @(*)
      begin
      	if(enable)
      	    case(q_reg)
      	    s0: q_next = s1;
      	    s1: q_next = s2;
      	    s2: q_next = s3;
      	    s3: q_next = s4;
      	    s4: q_next = s5;
      	    s5: q_next = s6;
      	    s6: q_next = s7;
      	    s7: q_next = s0;
      	    default: q_next = q_reg;
      	    endcase
      	else 
      	    q_next=q_reg;   
      end
      
      assign q = q_reg;

endmodule      


module dice (
	input clk, rst, 
	input enable,
	output [2:0] q
	);

      localparam s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7;
      reg [2:0] q_reg, q_next;

      always @(posedge clk or posedge rst) begin
      	if (rst) 
      		q_reg <= s0;
      	
      	else 
      		q_reg <= q_next;
      end

      always @(*)
      begin
      	if(enable)
      	    case(q_reg)
      	    s0: q_next = s2;
      	    s1: q_next = s7;
      	    s2: q_next = s5;
      	    s3: q_next = s3;
      	    s4: q_next = s1;
      	    s5: q_next = s6;
      	    s6: q_next = s0;
      	    s7: q_next = s4;
      	    default: q_next = q_reg;
      	    endcase
      	else 
      	    q_next=q_reg;   
      end
      
      assign q = q_reg;

endmodule      
