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
// ABSTRACT:  Pop Control State Machine 
//
//----------------------------------------------------------------------

module pop_ctrl(pop_clk,
		reset_n,
		push_count,
		pop,
		pop_empty,
		almost_empty,
		bin_count,
		pop_count);


parameter DEPTH = 64,
	  counter_width = 6,
	  almost_empty_level = 8;

input pop_clk;
input reset_n;
input [counter_width-1:0] push_count;
input pop;
output pop_empty;
output almost_empty;
output [counter_width-1:0] pop_count;
output [counter_width-1:0] bin_count;


// internal registers

reg [counter_width-1:0] sync_push_count,push_count_svd;
wire [counter_width-1:0] bin_count;
wire [counter_width-1:0] sync_push_countb,push_count_svdb;

wire internal_push,count_enable,counter_clear,make_empty;

wire [counter_width-1:0] nxt_pop_count,pop_count;

wire last_pop;
wire full_empty;



//   RTL SYNCRONIZER 
   always @(posedge pop_clk)
     if(!reset_n)
	begin
	  sync_push_count<=0;
	  push_count_svd<=0;
	end
     else
	begin
	   sync_push_count<=push_count; // level1
	   push_count_svd<=sync_push_count; // level2
	end


// After synching the counters convert to binary for comparison
gray2bin #(counter_width) synch1(.gray_count(sync_push_count),
				 .bin_count(sync_push_countb)
			        );
gray2bin #(counter_width) synch2(.gray_count(push_count_svd),
				 .bin_count(push_count_svdb)
			        );

// detech push from push domain so as to reset empty
assign internal_push = (sync_push_countb[0]^push_count_svdb);

assign count_enable = (pop&!pop_empty);



// under this condition fifo can be both full or empty since the
// fifo is circular
assign full_empty = (nxt_pop_count==sync_push_countb);

// to differentiaite whether it is full or empty 
// after pointer gets rolled over and previous was a pop 
// is the enable to decision
// push can happen when we enable empty while roll back
assign make_empty = (full_empty&pop);

// this condition is required if the depth of the memory
// is not equal to the number of bits of counter to clear counter
// for example depth is say 10 then counter size is 4 bits
// but counter should get cleared when 1010 not when 1111.
assign counter_clear = (bin_count==(DEPTH-1));


// registered empty generation and reset when push detected
rs_flop #(1,1)empty_flag(pop_clk,reset_n,make_empty,internal_push,pop_empty);

// almost empty condtion
//assign almost_empty = ((sync_push_countb-bin_count)<=almost_empty_level);
 wire [counter_width-1:0] watermark = (bin_count-sync_push_countb);
 assign almost_empty = (watermark>=almost_empty_level)|pop_empty;

// generates address to RAM dual port
gray_counter #(counter_width) push_counter(.clk(pop_clk),
					   .reset(reset_n),
					   .clear(counter_clear),
					   .enable(count_enable),
					   .nxt_bin_count(nxt_pop_count),
					   .bin_count(bin_count),
					   .gray_count(pop_count));


endmodule
