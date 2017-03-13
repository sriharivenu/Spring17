
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
// ABSTRACT:  gray 2 binary conversion to account for decoding the read and 
//            write address from gray value across 
//
//----------------------------------------------------------------------

module gray2bin(gray_count,bin_count);

  parameter COUNT_WIDTH = 4;
  input [COUNT_WIDTH-1:0] gray_count;
  output [COUNT_WIDTH-1:0] bin_count;
  reg [COUNT_WIDTH-1:0] bin_count;

  integer i;


  always @(gray_count)
    begin
      for (i=0;i<=COUNT_WIDTH-1;i=i+1)
	begin
	  bin_count[i]=^(gray_count>>i);
	end
    end


endmodule
