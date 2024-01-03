module Register_Generic_Struc #(parameter n=4) (
	input clk,
	input [n-1:0] d,
	input rst, //asynch
	output [n-1:0] q);

       genvar i;
       generate
       	for(i=0; i<n; i=i+1)
       	begin: register
       	 FF FF(
	           .d(d[i]),
	           .clk(clk),
	           .rst(rst), 
	           .q(q[n]) 
	           );	
       	end
       	
       endgenerate
endmodule

module Register_Generic_Behav #(parameter n=4) (
	input clk, rst,
	input [n-1:0] d,
	output [n-1:0] q
	);

       reg [n-1:0] q_reg, q_next;

       always @(posedge clk,posedge rst)
       begin
       	if(rst)
       	 q_reg <= 'b0;
       	else 
       	 q_reg <= q_next;
       end

       always @(d) 
       begin
       	q_next=d;
       end
       
       assign q = q_reg;
endmodule

module Register_Load #(parameter n=4) (
	input clk,
	input rst,
	input load,
	input [n-1:0] d,
	output [n-1:0] q
	);

	 reg q_reg, q_next;

	 always @(posedge clk or posedge rst)
	        begin
	        	if (rst) 
	        		q_reg <= 'b0;
	        	else  
	        		q_reg <= q_next;
	        end

	 always @(load, d, q_reg)
	 begin
	      if(load)
	         q_next=d;
	      else         	
	        q_next=q_reg; 
	 end 
	 
	 assign q = q_reg;

endmodule	

module Register_Shift #(parameter n=4) (
	input clk,
	input rst,
	input dir, // 1 for rightshift and 0 for lesft shift
	input si,
	output so
	);       

	reg [n-1:0] q_reg, q_next;

	always @(posedge clk or posedge rst) begin
	    	if (rst) 
	    		q_reg <= 'b0;
	    	
	    	else 
	    		q_reg <= q_next;
	    end   

	always @(*) 
	begin
	    	if(dir)
	    	  q_next = {si, q_reg[n-1:1]};
	    	else 
	    	  q_next = {q_reg[n-2:0], si};
	end

	assign so = dir ? q_reg[0]:q_reg[n-1] ; 

endmodule	   

module Register_PAS #(parameter n=4) (
	input clk, rst,
	input si,
	input shift_load, // 0 for shiftright and 1 for load
	input [n-1:0] d,
	output s0,
	output [n-1:0] q
	);

      reg [n-1:0] q_reg, q_next ;

      always @(posedge clk or posedge rst) begin
      	if (rst)
      		q_reg <= 'b0;      		
      	else 
      		q_reg <= q_next;
      end

      always @(*)
      begin
      	if(shift_load)
      	   q_next=d;
      	else 
      	   q_next= {si,d[n-1:1]};  
      end

      assign q = q_reg;
      assign s0 = q_reg[0];
endmodule      


module Registers_USR #(parameter n=4) (
	input clk,
	input rst,
	input [1:0] s,
	input msb,
	input lsb,
	input [n-1:0] d,
	output [n-1:0] q
	);
      
      reg [n-1:0] q_reg, q_next;

      always @(posedge clk or posedge rst) begin
      	if (rst)
      		q_reg <= 'b0;      		
      	else 
      		q_reg <= q_next;
      end

      always @(*)
      begin
      	case(s)
      	  2'b00: q_next=q_reg;
      	  2'b01: q_next={msb,q_reg[n-1:1]};
      	  2'b10: q_next={q_reg[n-2:0],lsb};
      	  2'b11: q_next=d;
      	  default:q_next=q_reg;
      	endcase
      end

      assign q = q_reg ;
endmodule      
