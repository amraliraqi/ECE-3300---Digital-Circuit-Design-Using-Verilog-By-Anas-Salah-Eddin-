module debouncer_fsm (
	input clk, rst,
	input noisy, timer_done,
	output debounce, timer_rest
	);

      reg [1:0] q_reg, q_next ;
      localparam s0=0, s1=1, s2=2, s3=3 ;

      always @(posedge clk or posedge rst) begin
      	if (rst) 
      		q_reg <= s0;
      	else 
      		q_reg <= q_next;
      end

      always @(*)
      begin
      	case(q_reg)
      	   s0:if(noisy)
      	        q_next=s1;
      	      else
      	        q_next=s0;

      	   s1:if(noisy && ~timer_done)
      	        q_next=s1;
      	      else if(~noisy)
      	        q_next=s0;
      	      else if(noisy && timer_done)
      	        q_next=s2;
      	      else 
      	        q_next=s1;   

      	   s2:if(noisy)
      	        q_next=s2;
      	      else
      	        q_next=s3;

      	   s3:if(~noisy && ~timer_done)
      	        q_next=s3;
      	      else if(noisy)
      	        q_next=s2;
      	      else if(~noisy && timer_done)
      	        q_next=s0;
      	      else 
      	        q_next=s3;

      	   default: q_next=q_reg;                         
      	endcase
      end


      assign debounce = (q_reg==s2) | (q_reg==s3);
      assign timer_rest =(q_reg==s2) | (q_reg==s0) ;

endmodule      