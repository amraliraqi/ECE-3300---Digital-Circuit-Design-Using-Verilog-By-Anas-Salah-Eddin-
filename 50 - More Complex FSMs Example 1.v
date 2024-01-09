module mealy_010_1001 (
	input clk, rst,
	input x,
	output y
	);

      localparam s0=3'b000;
      localparam s1=3'b001;
      localparam s2=3'b010;
      localparam s3=3'b011;
      localparam s4=3'b100;
      localparam s5=3'b101;

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
       	 s0: if(x)
       	       q_next=s3;
       	     else
       	       q_next=s1;  
       	 s1:if(x)
       	       q_next=s2;
       	     else
       	       q_next=s1;
       	 s2:if(x)
       	       q_next=s3;
       	     else
       	       q_next=s1;
       	 s3:if(x)
       	       q_next=s3;
       	     else
       	       q_next=s4;
       	 s4:if(x)
       	       q_next=s2;
       	     else
       	       q_next=s5;
       	 s5:if(x)
       	       q_next=s2;
       	     else
       	       q_next=s1;
       	 default:q_next=q_reg;
       	endcase
       end 

       assign y = ((q_reg==s2) & ~x) | ((q_reg==s5) & x);
endmodule       