module moore (
	input clk, rst,
	input x,
	output y
	);

      localparam s0=0;
      localparam s1=1;
      localparam s2=2;
      localparam s3=3;
      localparam s4=4;
      localparam s5=5;

      reg [2:0] q_reg, q_next;

      always @(posedge clk or posedge rst) begin
      	if (rst) 
      		q_reg <= s0;
      	
      	else
      		q_reg <= q_next;
      end

      always @(*)
      begin
      	case(q_reg)
      	s0:if(x)
      	     q_next=s1;
      	   else 
      	     q_next=s2; 
      	s1:if(x)
      	     q_next=s0;
      	   else 
      	     q_next=s4;
      	s2:if(x)
      	     q_next=s1;
      	   else 
      	     q_next=s3;
      	s3:if(x)
      	     q_next=s5;
      	   else 
      	     q_next=s3;
      	s4:if(x)
      	     q_next=s0;
      	   else 
      	     q_next=s5;
      	s5:if(x)
      	     q_next=s3;
      	   else 
      	     q_next=s5;
      	default:q_next=q_reg;
      	endcase
      end

      assign y = q_reg==s5;

endmodule      