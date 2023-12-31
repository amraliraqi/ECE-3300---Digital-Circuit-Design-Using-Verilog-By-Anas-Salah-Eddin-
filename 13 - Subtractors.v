module AdderSubtractor_4bits (
	input [3:0] x,y,
	input A_S,
	output [3:0] s,
	output c // 0 for add, 1 for subb
	);
      
      wire [3:0] y_xored;
      generate
      	genvar i;
      	for (i = 0; i < 4; i = i + 1)
      	   assign y_xored[i] = y[i] ^ A_S;      		
        endgenerate

        Generic_RCA #(.n(4)) AS4 (x, y_xored, A_S, s, c);

endmodule    


module AdderSubtractor_nbits 
     #(parameter n=4)
    (
	input [n-1:0] x,y,
	input A_S,
	output [n-1:0] s,
	output c,
	output overflow // 0 for add, 1 for subb
	);
      
      wire [n-1:0] y_xored;
      generate
      	genvar i;
      	for (i = 0; i < n; i = i + 1)
      	   assign y_xored[i] = y[i] ^ A_S;      		
        endgenerate

        Generic_RCA #(.n(n)) ASn (x, y_xored, A_S, s, c);

        assign overflow = ( x[n-1] & y[n-1] & ~s[n-1] ) | ( ~x[n-1] & ~y[n-1] & s[n-1] );

endmodule            

