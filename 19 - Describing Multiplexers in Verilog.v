module Multiplexer_2x1 (
	input w0,w1,
	input s,
	output f
	);

    assign f = s ? w1:w0 ;

endmodule

module Multiplexer_4x1_1 (
	input w0,w1,w2,w3,
	input [1:0] s,
	output f
	);

     assign f = s[1] ? (s[0] ? w3 : w2) : (s[0] ? w1 : w0) ;

endmodule

module Multiplexer_4x1_2 (
	input w0,w1,w2,w3,
	input [1:0] s,
	output reg f
	);

     always @(*) begin
     	if (s==2'b00) 
     		f=w0;
     	else if (s==2'b01) 
     		f=w1;
     	else if (s==2'b10) 
     		f=w2;
     	else if (s==2'b11) 
     		f=w3;
     	else  
     		f=1'bx;			
     end

endmodule     


module Multiplexer_4x1_3 (
	input w0,w1,w2,w3,
	input [1:0] s,
	output reg f
	);

     always @(*) begin
     	case(s)
     	   2'b00: f=w0;
     	   2'b01: f=w1;
     	   2'b10: f=w2;
     	   2'b11: f=w3;
     	default:  f=1'bx; 
     	endcase
     end	

endmodule


module Multiplexer_Generic #(parameter n=5) (
	input [n-1:0] w,
	input [$clog2(n)-1:0] s,
	output reg f
	);

      assign f = w[s] ;

      /*integer i;

      always @(w,s) 
      begin
         f='bx;  	
    	   for (i = 0; i < n; i = i + 1)
    	         if(i==s)
    	           f=w[i];	
    	end */

endmodule    	