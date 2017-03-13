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
// ABSTRACT:  Push Control State Machine 
//----------------------------------------------------------------------

module push_ctrl(push_clk,
		 reset_n,
		 pop_count, // counter from read domain for full generation
		 push,
		 push_full,
		 almost_full,
		 bin_count,
		 push_count // counter to read domain for empty generation
                );
  parameter DEPTH = 64,
	    counter_width = 6,
	    almost_full_level = 8;

  input push_clk;
  input reset_n;
  input [counter_width-1:0] pop_count;
  input push;
  output push_full;
  output almost_full;

  output [counter_width-1:0] push_count;
  output [counter_width-1:0] bin_count;

  wire internal_pop,count_enable,push_clear,make_full;

  wire [counter_width-1:0] push_count;
  wire [counter_width-1:0] bin_count;
  wire [counter_width-1:0] nxt_push_count,gray_count;

  reg  [counter_width-1:0] sync_pop_count,pop_count_svd;
  wire  [counter_width-1:0] sync_pop_countb,pop_count_svdb;
  wire err_stage1,err_stage2;

  wire last_push;
  wire full_empty;



// 2 level synchronizer
  always @(posedge push_clk)
    begin
      if(!reset_n)
	 begin
	   sync_pop_count<=0;
	   pop_count_svd<=0;
	 end
      else
	 begin
	   sync_pop_count<=pop_count;
	   pop_count_svd<=sync_pop_count;
	 end
    end




// After synching the counters convert to binary for comparison
gray2bin #(counter_width) synch1(.gray_count(sync_pop_count),
				 .bin_count(sync_pop_countb)
				 );
gray2bin #(counter_width) synch2(.gray_count(pop_count_svd),
				 .bin_count(pop_count_svdb)
				 );

// To detect a pop from read logic to reset full when there
// was a pop in read domain
 assign internal_pop = (pop_count_svdb[0]^sync_pop_countb[0]);


 assign count_enable = (push & !push_full);

// under this condition fifo can be full or empty 
// for circular fifO
assign full_empty = (nxt_push_count==sync_pop_countb);


// this condition is required if the depth of the memory
// is not equal to the number of bits of counter to clear counter
// for example depth is say 10 then counter size is 4 bits
// but counter should get cleared when 1010 not when 1111.
wire counter_clear = (bin_count == (DEPTH-1));

// to find out full or empty we need to 
// detect previous push and counters are equal
assign make_full = (full_empty&push);

// sr flop to set full flag and when both s and r are 1 the output is 0
rs_flop full_flag(push_clk,reset_n,make_full,internal_pop,push_full);

// almost full condition(can yield -ve results though but safe!!!!).
wire [counter_width-1:0] watermark = (bin_count-sync_pop_countb);
assign almost_full = ((watermark >= almost_full_level)|push_full);



 // push counter
 // gray counter is used so as to enable
 // synchronization to be smooth without any metastable hazard.
 // the chances of flops entering metastabilty is more when 
 // trying to synchronize a multibit hardware such as counter.
 // by using a gray counter we are making sure that only one flop
 // can get into metastabilty at the worst case and MTBF as a whole
 // counter output while synching is very big number.
 // since we consider 2 level synchs 2 clock is quite reasonable
 // amount to let the output settle to a known value.


 gray_counter #(counter_width) push_counter(.clk(push_clk),
			   .reset(reset_n),
			   .clear(counter_clear),
			   .enable(count_enable),
			   .nxt_bin_count(nxt_push_count),
			   .bin_count(bin_count),
			   .gray_count(push_count));


endmodule
