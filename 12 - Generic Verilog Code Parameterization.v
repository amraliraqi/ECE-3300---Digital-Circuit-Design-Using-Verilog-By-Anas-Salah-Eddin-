module Generic_RCA 
  #(parameter n=4)
  ( input [n-1:0] x, y,
    input cin,
    output [n-1:0] s,
    output cout 
  	);

    wire [n:0] c;
    assign c[0] = cin;

    generate
      	genvar i;
      	for (i = 0; i < n; i = i + 1)
      		FullAdder FA (x[i], y[i], c[i], s[i], c[i+1]);
      endgenerate  

      assign cout = c[n] ;
endmodule      

module Generic_RCA_Test 
  ( input [15:0] x, y,
    input cin_xy,
    output [15:0] s_xy,
    output cout_xy,

    input [6:0] a, b,
    input cin_ab,
    output [6:0] s_ab,
    output cout_ab 
    );
      Generic_RCA #(.n(16)) RCA16 (x, y, cin_xy, s_xy, cout_xy);
      Generic_RCA #(.n(7)) RCA7 (a, b, cin_ab, s_ab, cout_ab);

endmodule
