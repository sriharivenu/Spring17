//------------------------------------------------------------------------------
//
//        This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 2001 - 2002   SYNOPSYS INC.
//                          ALL RIGHTS RESERVED
//
//        The entire notice above must be reproduced on all authorized
//       copies.
//
// AUTHOR:    Godwin Maben February 6, 2002
//
// VERSION:   synthesizable Architecture
//
//-------------------------------------------------------------------------------
//----------------------------------------------------------------------
// ABSTRACT:  Asynchrnous FIFO design  
//            legal range:  depth        [ 2 to 256 ]
//            legal range:  data_width   [ 1 to 256 ]
//            Input data:   data_in[data_width-1:0]
//            Output data : data_out[data_width-1:0]
//            Clock:push_clk,pop_clk
//	      Reset: Synchronous active low reset
//
//----------------------------------------------------------------------

module fifo(push_clk,
	    pop_clk,
	    reset_n,
	    push,
	    pop,
	    data_in,
	    data_out,
	    pop_empty,
	    push_full,
	    almost_empty,
	    almost_full
	    );

  parameter WIDTH = 32,
	    DEPTH = 16,
	    counter_width = 4,
	    almost_empty_level = 8,
	    almost_full_level = (DEPTH-8);

 input push_clk,pop_clk,reset_n,push,pop;
 input [WIDTH-1:0] data_in;
 output [WIDTH-1:0] data_out;
 output pop_empty,push_full,almost_empty,almost_full;

 wire [WIDTH-1:0] dataout;

 wire [counter_width-1:0] pop_count,push_count;
 wire [counter_width-1:0] wr_address,rd_address;



 push_ctrl #(DEPTH,counter_width,almost_full_level) 
	   push_logic(.push_clk(push_clk),
		      .reset_n(reset_n),
		      .pop_count(pop_count),
		      .push(push),
		      .push_full(push_full),
		      .almost_full(almost_full),
		      .bin_count(wr_address),
		      .push_count(push_count));

 pop_ctrl #(DEPTH,counter_width,almost_empty_level) 
	  pop_logic(.pop_clk(pop_clk),
		    .reset_n(reset_n),
		    .push_count(push_count),
		    .pop(pop),
		    .pop_empty(pop_empty),
		    .almost_empty(almost_empty),
		    .bin_count(rd_address),
		    .pop_count(pop_count));

 DW_ram_r_w_s_lat #(WIDTH,DEPTH) memory(.clk(push_clk), 
			 .cs_n(1'b0), 
			 .wr_n(~push), 
			 .rd_addr(rd_address),
		         .wr_addr(wr_address), 
			 .data_in(data_in), 
			 .data_out(dataout));

// to force a known value when fifo is empty
 assign data_out = (pop_empty)?0:dataout; 

endmodule
