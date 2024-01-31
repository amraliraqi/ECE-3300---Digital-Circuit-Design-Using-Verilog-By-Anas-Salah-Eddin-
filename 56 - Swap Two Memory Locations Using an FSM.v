module RegisterFile #(parameter N=7, Bits=8) (
	input clk,
	input we,
	input [N-1:0] adress_w, adress_r,
	input [Bits-1:0] data_w,
	output [Bits-1:0] data_r
	);

       reg [Bits-1:0] memory [0:(2**N)-1] ;

       always @(posedge clk)
       begin
       	if(we)
       	   memory[adress_w] <= data_w;
       end
      
       assign data_r = memory[adress_r];

endmodule       

module mux_4x1 #(parameter N=7) (
	input [N-1:0] zero, one, two, three,
	input [1:0] sel,
	output reg [N-1:0] f
	);

      always @(*)
      begin
      	if (sel==0)
      	  f = zero ;
      	else if (sel==1)
      	  f = one ;
      	else if (sel==2)
      	  f = two ;
      	else 
      	  f = three ;      
      end

endmodule 


module FSM_Controller (
	input clk, rst, 
	input swap,
	output [1:0] sel,
	output w
	);

      reg [1:0] current_state, next_state ;
      localparam s0 = 0;
      localparam s1 = 1;
      localparam s2 = 2;
      localparam s3 = 3;

      always @(posedge clk or posedge rst) begin
      	if (rst) 
      		current_state <= s0;
      	
      	else 
      		current_state <= next_state;
      end 

      always @(*)
      begin
      	case(current_state)
      	s0: if(swap)
      	      next_state=s1;
      	    else  
      	      next_state=s0;
      	s1:next_state=s2;
      	s2:next_state=s3;
      	s3:next_state=s0;
      	endcase
      end

      assign sel = current_state;
      assign w = current_state != s0;

endmodule      


module topmodule #(parameter N=7, Bits=8) (
	input clk,
	input we,
	input swap,
	input rst,
	input [N-1:0] adress_w, adress_r,
	input [N-1:0] adress_A, adress_B,
	input [Bits-1:0] data_w,
	output [Bits-1:0] data_r
	); 

      wire [1:0] sel ;
      wire w;
      wire [N-1:0] f_mux1, f_mux2 ;

      FSM_Controller D1 (clk, rst, swap, sel, w) ;
      mux_4x1  #(.N(N)) D2 (adress_w, 'b0, adress_A, adress_B, sel, f_mux1) ;
      mux_4x1  #(.N(N)) D3 (adress_r, adress_A, adress_B, 'b0, sel, f_mux2) ;
      RegisterFile #(.N(N), .Bits(Bits)) D4 (clk, w?1'b1:we, f_mux1, f_mux2, w?data_r:data_w, data_r);

endmodule      