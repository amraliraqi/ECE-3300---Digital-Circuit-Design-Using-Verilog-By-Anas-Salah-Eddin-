module Arithmetic_AS #(parameter n=4) (
	input signed [n-1:0] x,y,
	output signed [n-1:0] sum,
	output carry,
	output overflow );

        assign {carry,sum} = x+y ;
        assign overflow = x[n-1] & y[n-1] & ~sum[n-1] | ~x[n-1] & ~y[n-1] & sum[n-1];
endmodule