module moore_011_detector (
	input clk, rst,
	input x,
	output y
	);

      reg [1:0] q_reg, q_next;

      localparam s0=2'b00;
      localparam s1=2'b01;
      localparam s2=2'b10;
      localparam s3=2'b11;

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
      	           q_next=s0;
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
      	           q_next=s0;
      	        else 
      	           q_next=s1;

      	     default: q_next=q_reg;
      	endcase
      end

      assign y = q_reg==s3 ;
endmodule


module mealy_011_detector (
	input clk, rst,
	input x,
	output y
	);

      reg [1:0] q_reg, q_next;

      localparam s0=2'b00;
      localparam s1=2'b01;
      localparam s2=2'b10;

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
      	           q_next=s0;
      	        else 
      	           q_next=s1; 

      	     s1:if(x)
      	           q_next=s2;
      	        else 
      	           q_next=s1;

      	     s2:if(x)
      	           q_next=s0;
      	        else 
      	           q_next=s1;

      	     default: q_next=q_reg;
      	endcase
      end

      assign y = (q_reg==s2) & x;
endmodule


module moore_101_detector (
	input clk, rst,
	input x,
	output y
	);

      reg [1:0] q_reg, q_next;

      localparam s0=2'b00;
      localparam s1=2'b01;
      localparam s2=2'b10;
      localparam s3=2'b11;

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
      	      q_next=s1;
      	    else  
      	      q_next=s0;

      	s1: if(x)
      	      q_next=s1;
      	    else  
      	      q_next=s2;


      	s2: if(x)
      	      q_next=s3;
      	    else  
      	      q_next=s0;


      	s3: if(x)
      	      q_next=s1;
      	    else  
      	      q_next=s2;
      	

      	default: q_next=q_reg;

      	endcase
      end

      assign y = q_reg==s3;

endmodule    


module mealy_101_detector (
	input clk, rst,
	input x,
	output y
	);

      reg [1:0] q_reg, q_next;

      localparam s0=2'b00;
      localparam s1=2'b01;
      localparam s2=2'b10;
      
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
      	      q_next=s1;
      	    else  
      	      q_next=s0;

      	s1: if(x)
      	      q_next=s1;
      	    else  
      	      q_next=s2;


      	s2: if(x)
      	      q_next=s1;
      	    else  
      	      q_next=s0;


       	default: q_next=q_reg;

      	endcase
      end

      assign y = ( q_reg==s2 ) & x;

endmodule        