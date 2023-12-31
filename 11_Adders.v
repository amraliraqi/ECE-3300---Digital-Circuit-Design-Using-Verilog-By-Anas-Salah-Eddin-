module HalfAdder (
	input x, y,
	output sum, carry );

       assign sum = x ^ y ;
       assign carry = x & y ;

endmodule       


module FullAdder (
    input x, y, cin,
	output sum, carry );

	wire c1, c2, s2;

	HalfAdder HA1 (cin, s2, sum, c1);
	HalfAdder HA2 (x, y, s2, c2);

	assign carry = c1 | c2 ;

endmodule	


module RIppleCarryAdder_4bits (
	input [3:0] x, y,
	input cin,
	output [3:0] s,
	output cout
	);

     wire c1, c2, c3;

     FullAdder FA0 (x[0], y[0], cin, s[0], c1);
     FullAdder FA1 (x[1], y[1], c1, s[1], c2);
     FullAdder FA2 (x[2], y[2], c2, s[2], c3);
     FullAdder FA3 (x[3], y[3], c3, s[3], cout);
endmodule   

