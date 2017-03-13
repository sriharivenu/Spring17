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
// ABSTRACT:  Gray Counter 
//            Counter counts in gray fashion so as to take care of metastabilty
//	      across modules.
//
//----------------------------------------------------------------------


module gray_counter(clk,reset,clear,enable,nxt_bin_count,bin_count,gray_count);

  parameter WIDTH = 4;

  input clk,reset;
  input clear;
  input enable; 	// count enable for the counter to increment

  output [WIDTH-1:0] gray_count;
  output [WIDTH-1:0] nxt_bin_count,bin_count;

  reg [WIDTH-1:0] prsnt_state,nxt_state;
  reg [WIDTH-1:0] nxt_state_prev,nxt_state_temp;
  reg [WIDTH-1:0] bin_count;
  integer i;

  assign gray_count = prsnt_state;
  assign nxt_bin_count = nxt_state_temp;


  // state memory

  always @(posedge clk)
    if(!reset)
      begin
	prsnt_state<=0;
	bin_count<=0;
      end
    else
      begin
	if(enable)
	  begin
	    prsnt_state<=nxt_state;
	    bin_count <= nxt_state_temp;
          end
      end

 // Next state logic.  clear is very specfic to this
 // application and is not generic as of parameter goes.
 // the application for which this clear suits is 
 // the asynchronus FIFO

  always @(prsnt_state or enable or clear)
    begin
     if(!clear)
      begin
        for (i=0;i<=WIDTH-1;i=i+1)
	  begin
	    nxt_state_prev[i]=^(prsnt_state>>i);
	  end

        nxt_state_temp=nxt_state_prev+enable;
        nxt_state=(nxt_state_temp>>1)^nxt_state_temp;
      end
     else
	begin
          nxt_state_temp=0;
          nxt_state=0;
	end
    end

endmodule
