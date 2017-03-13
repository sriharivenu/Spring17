// Write you SystemVerilog Assertions here !
//

module test(input clk, input o_wb_stb, input o_wb_cyc, input o_wb_we, input o_wb_adr, 
	input o_wb_dat, input i_wb_dat, input i_wb_ack, input reset_n);


// This is use to check if the strobe has known value
sequence wb_strobe_known;
	~($isunknown(o_wb_stb));
endsequence

// This is to check if cycle has known values
sequence wb_cyc_known;
	~($isunknown(o_wb_cyc));
endsequence

// This is to have a generalied sequence to check for known value
sequence wb_known(signal);
	~($isunknown(signal));
endsequence


sequence valid_adr_seq(o_wb_cyc, o_wb_stb);
	wb_cyc_known && wb_strobe_known |-> $rose(o_wb_cyc) && $rose(o_wb_stb);
endsequence

// Property general

property valid_chk(signal1, signal2, signal3, signal4);
	@(posedge clk)
	disable iff (~reset_n)
	if($stable(!signal3))
	valid_adr_seq(signal1,signal2) |=> wb_known(signal4)    //Not sure if to use rose or just leave it like that
	else
	valid_adr_seq(signal1, signal2) && $rose(signal3)|-> wb_known(signal4);
endproperty



// Condition for adr
cond_addr: assert property (valid_chk(o_wb_cyc,o_wb_stb, o_wb_we, o_wb_adr));


// Condition for write

cond_wrt: assert property (valid_chk(o_wb_cyc, o_wb_stb,o_wb_we, o_wb_dat));

// Condition for read

cond_read: assert property (valid_chk(o_wb_cyc, o_wb_stb, o_wb_we, i_wb_dat));

// Read-ack

property read_ack;
	@(posedge clk)
	disable iff(~reset_n)
	$rose(o_wb_cyc) && $rose(o_wb_stb) && $stable(!o_wb_we) |=> i_wb_ack;
endproperty

read_ack_prop: assert property(read_ack);
// Write-ack

property write_ack;
	@(posedge clk)
	disable iff (~reset_n)
	$rose(o_wb_cyc) && $rose(o_wb_stb) && $rose(o_wb_we) |=> i_wb_ack;
endproperty

write_ack_prop: assert property(write_ack);
	
endmodule





