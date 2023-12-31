module Encoder_4x2_if (
	input [3:0] x,
	output reg [1:0] y,
	output z
	);
       assign z = |x ;
       always @(x)
       begin
       	if(x[3])
       	  y=2'b11;
       	else if(x[2])
       	  y=2'b10;
       	else if(x[1])
       	  y=2'b01;
       	else if(x[0])
       	  y=2'b00;
       	else 
       	  y=2'bxx;       
       end
endmodule


module Encoder_4x2_case (
	input [3:0] x,
	output reg [1:0] y,
	output z
	);
       assign z = |x ;
       always @(x)
       begin
       	casex(x)
       	  4'b1xxx: y=2'b11;
       	  4'b01xx: y=2'b10;
       	  4'b001x: y=2'b01;
       	  4'b0001: y=2'b00;
       	default: y=2'bxx;  
       	endcase       
       end
endmodule


module Encoder_Generic #(parameter n=4) (
	input [n-1:0] x,
	output reg [$clog2(n)-1:0] y,
	output z 
	);

     assign z = |x ;

     integer i;

     always @(x)
     begin
        y='bx;
     	for(i=0 ; i<n ; i=i+1)
     	   if(x[i])
     	    y=i;
     end
endmodule     