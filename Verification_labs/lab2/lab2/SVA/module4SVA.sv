module module4SVA (
input clk, input i_wb_ack, input extra_write_r, int state
);

import FSMProperties::*;

// states recreated
localparam [3:0] WB_IDLE            = 3'd0,
                 WB_BURST1          = 3'd1,
                 WB_BURST2          = 3'd2,
                 WB_BURST3          = 3'd3,
                 WB_WAIT_ACK        = 3'd4;


/*place your properties here*/

wb_idle_property: assert property(FSMValidTransition(clk, (state == WB_IDLE), 1, (state == (WB_IDLE)) || (state == WB_BURST1) || (state==WB_WAIT_ACK) )); 

wb_burst1_property: assert property(FSMValidTransition(clk, (state == WB_BURST1), i_wb_ack, (state == WB_BURST2)));

wb_burst2_property: assert property(FSMValidTransition(clk, (state == WB_BURST2), i_wb_ack, (state == WB_BURST3)));

wb_burst3_property: assert property(FSMValidTransition(clk, (state == WB_BURST3), i_wb_ack, (state == WB_WAIT_ACK)));

wait_ack_property1: assert property(FSMValidTransition(clk, (state == WB_WAIT_ACK), (extra_write_r || !i_wb_ack), (state == WB_WAIT_ACK)));

wait_ack_property2: assert property(FSMValidTransition(clk, (state == WB_WAIT_ACK), (!extra_write_r && i_wb_ack), (state == WB_IDLE)));


lock_state: assert property (FSMTimeOut(clk, state, 1000));

endmodule

module Wrapper ;

bind a25_wishbone module4SVA wrp (
	.clk(i_clk),
	.i_wb_ack(i_wb_ack),
	.extra_write_r(extra_write_r),
	.state(wishbone_st)
);

endmodule
