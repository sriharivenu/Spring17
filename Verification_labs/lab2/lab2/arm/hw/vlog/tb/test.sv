// Write you SystemVerilog Assertions here !
//

module test(input clk, input o_wb_stb, input o_wb_cyc, input o_wb_we, input [31:0] o_wb_adr, 
	input [31:0] o_wb_dat, input [31:0] i_wb_dat, input i_wb_ack, input reset_n);


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
	wb_cyc_known ##0 wb_strobe_known ##0 $rose(o_wb_cyc) && $rose(o_wb_stb);
//	$rose(o_wb_cyc) ##0 $rose(o_wb_stb);
endsequence

// Property general

property valid_chk(antecedent, consequent);
	@(posedge clk)
	disable iff(~reset_n)
	antecedent |-> (~$isunknown(consequent));
endproperty

//function antecedent(cyc,stb,we,ack = 1);
//	valid_adr_seq(cyc,stb)


// Cycle and strobe known validation

stb: assert property( @(posedge clk) wb_strobe_known);
cyc: assert property( @(posedge clk) wb_cyc_known);

// Condition for adr
cond_addr: assert property (valid_chk(valid_adr_seq(o_wb_cyc,o_wb_stb),o_wb_adr));


// Condition for write

cond_wrt: assert property (valid_chk(valid_adr_seq(o_wb_cyc,o_wb_stb) ##0 $rose(o_wb_we),o_wb_dat));

// Condition for read

cond_read: assert property (valid_chk(valid_adr_seq(o_wb_cyc,o_wb_stb) ##0 $stable(!o_wb_we) && (~$isunknown(o_wb_adr)) ##[1:$] (!o_wb_we ##0 $rose(i_wb_ack)), i_wb_dat)); // Removed ##1 i_wb_ack from the antecedent

// Read-ack

property read_ack;
	@(posedge clk)
	disable iff(~reset_n)
	$rose(o_wb_cyc) && $rose(o_wb_stb) && $stable(!o_wb_we) |-> ##[1:$] $rose(i_wb_ack);
endproperty

read_ack_prop: assert property(read_ack);
// Write-ack

property write_ack;
	@(posedge clk)
	disable iff (~reset_n)
	$rose(o_wb_cyc) && $rose(o_wb_stb) && $rose(o_wb_we) |-> ##[1:$] $rose(i_wb_ack);// Removed o_wd_adr from this
endproperty

write_ack_prop: assert property(write_ack);
	
// Reset condition
property reset_cyc_stb;
	@(posedge clk)
	$fell(reset_n) |-> (o_wb_cyc == 0) && (o_wb_stb == 0);
endproperty

reset_cond: assert property(reset_cyc_stb);

endmodule





