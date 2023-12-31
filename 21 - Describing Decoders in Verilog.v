module Decoder_2x4_if (
	input [1:0] x,
	input en,
	output reg [3:0] y
	);

      always @(x,en) begin
        y=4'b0000;
      	if (en) begin
      		if(x==2'b00)
      		    y[3]=1'b1;
      		else if(x==2'b01)
      		    y[2]=1'b1;
      		else if(x==2'b10)
      		    y[1]=1'b1;
      		else if(x==2'b11)
      		    y[0]=1'b1;
      		else 
      		    y=4'bxxxx;                 
      	end
      	else 
      		y=4'b0000;
      	
      end
endmodule


module Decoder_2x4_case (
	input [1:0] x,
	input en,
	output reg [3:0] y
	);

      always @(x,en) begin
        y=4'b0000;
      	if (en) begin
      		case(x)
      		  0: y[3]=1'b1;
      		  1: y[2]=1'b1;
      		  2: y[1]=1'b1;
      		  3: y[0]=1'b1;
      		default: y=4'bxxxx; 
      		endcase                 
      	end
      	else 
      		y=4'b0000;
      	
      end
endmodule

module Decoder_Generic #(parameter n=4) (
	input [n-1:0] x,
	input en,
	output reg [(2**n)-1:0] y
	);

      always @(x,en)
      begin
      	y='b0;
      	if (en) 
      		y[(2**n)-1-x] = 1'b1;
      	else 
      		y='b0;	      			
      end
endmodule      
