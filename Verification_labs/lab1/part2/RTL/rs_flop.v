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
// ABSTRACT:  RS Flip Flop design
// 	D-Flop with the following truth
// 	table:
//      S       R       Q
//    ---------------------
//      0       0       Q(last)
//      0       1       0
//      1       0       1
//      1       1       0
//----------------------------------------------------------------------


module	rs_flop	(
	clk,
	reset_n,
	s,
	r,
	q_out
	);
parameter width = 1;
parameter reset_value = 0;

input			clk;
input			reset_n;
// Positive and synchronous
// reset.
input	[width-1:0]	s;
// Set input of the flop.
input	[width-1:0]	r;
// Reset input of the flop.

output	[width-1:0]	q_out;
// Final output of the flop.

reg	[width-1:0]	q_out;
wire [width-1:0] signal = (s | q_out) & ~r;

always @ (posedge clk)
  begin
   if (!reset_n)
      q_out <= reset_value;
   else
      q_out <= signal;
  end

endmodule // rs_flop is over.
