`include "uvm_macros.svh"
package scoreboard; 
import uvm_pkg::*;
import sequences::*;

class alu_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(alu_scoreboard)

    uvm_analysis_export #(alu_transaction_in) sb_in;
    uvm_analysis_export #(alu_transaction_out) sb_out;

    uvm_tlm_analysis_fifo #(alu_transaction_in) fifo_in;
    uvm_tlm_analysis_fifo #(alu_transaction_out) fifo_out;

    alu_transaction_in tx_in;
    alu_transaction_out tx_out;

    function new(string name, uvm_component parent);
        super.new(name,parent);
        tx_in=new("tx_in");
        tx_out=new("tx_out");
    endfunction: new

    function void build_phase(uvm_phase phase);
        sb_in=new("sb_in",this);
        sb_out=new("sb_out",this);
        fifo_in=new("fifo_in",this);
        fifo_out=new("fifo_out",this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        sb_in.connect(fifo_in.analysis_export);
        sb_out.connect(fifo_out.analysis_export);
    endfunction: connect_phase

    task run();
        forever begin
            fifo_in.get(tx_in);
            fifo_out.get(tx_out);
            compare();
        end
    endtask: run

    extern virtual function [33:0] getresult; 
    extern virtual function void compare; 
        
endclass: alu_scoreboard

function void alu_scoreboard::compare;
    //TODO: Write this function to check whether the output of the DUT matches
    //the spec.
    //Use the getresult() function to get the spec output.
    //Consider using `uvm_info(ID,MSG,VERBOSITY) in this function to print the
    //results of the comparison.
    //You can use tx_in.convert2string() and tx_out.convert2string() for
    //debugging purposes

    logic cout;
    logic vout;
    logic [31:0] out;
    {vout, cout, out} = getresult();
    if((vout != tx_out.VOUT) &&  ((tx_in.opcode == 3'b101) || (tx_in.opcode == 3'b110)) )begin
	`uvm_info("ERR_MSG1", $sformatf("VOUT mismatch!!!  Scoreboard result: %b and DUT result: %b, opcode: %d, A: %h, B: %h, OUT: %h, sb res: %h, cin: %b", vout, tx_out.VOUT, tx_in.opcode, tx_in.A, tx_in.B, tx_out.OUT, out, tx_in.CIN), UVM_HIGH);
	tx_in.convert2string();
	tx_out.convert2string();
	end
    if(cout != tx_out.COUT) begin
	`uvm_info("ERR_MSG2", $sformatf("COUT mismatch!!! Scoreboard result: %b and DUT result: %b, opcode: %d, A: %h, B: %h, OUT: %h", cout, tx_out.COUT, tx_in.opcode, tx_in.A, tx_in.B, tx_out.OUT), UVM_HIGH);
	tx_in.convert2string();
	tx_out.convert2string();
	end
    if(out != tx_out.OUT) begin
	`uvm_info("ERR_MSG3", $sformatf("OUT mismatch!!! Scoreboard result: %b and DUT result: %b, opcode: %d, A: %h, B: %h, sb res: %h, dut res: %h, cin: %b",out, tx_out.OUT, tx_in.opcode, tx_in.A, tx_in.B, out, tx_out.OUT, tx_in.CIN), UVM_HIGH);
	tx_in.convert2string();
	tx_out.convert2string();
	end
		
endfunction

function [33:0] alu_scoreboard::getresult;
    //TODO: Remove the statement below
    //Modify this function to return a 34-bit result {VOUT, COUT,OUT[31:0]} which is
    //consistent with the given spec.
    logic cout_res;
    logic vout_res;
    logic [31:0] out_res;
    if(tx_in.rst) begin
	cout_res = 0;
	out_res = 32'h00000000;
	vout_res = 0;
    	return { vout_res, cout_res,out_res[31:0]};
    end

    case(tx_in.opcode)
	3'b000: begin
		cout_res = 1'b0;
		out_res = tx_in.A;
		vout_res = 1'bx; // Not sure if it is correct, check it.
		return {vout_res, cout_res, out_res[31:0]};
		end
	3'b001: begin
		cout_res = 1'b0;
		out_res = (tx_in.A & tx_in.B);
		vout_res = 1'bx;
		return {vout_res, cout_res, out_res[31:0]};
		end
	3'b010: begin
		cout_res = 1'b0;
		out_res = ~(tx_in.A);
		vout_res = 1'bx;
		return {vout_res, cout_res, out_res[31:0]};
		end
	3'b011: begin
		cout_res = 1'b0;
		out_res = (tx_in.A | tx_in.B);
		vout_res = 1'bx;
		return {vout_res, cout_res, out_res[31:0]};
		end
	3'b100: begin
		cout_res = 1'b0;
		out_res = (tx_in.A ^ tx_in.B);
		vout_res = 1'bx;
		return {vout_res, cout_res, out_res[31:0]};
		end
	3'b101: begin
		{cout_res, out_res} = (tx_in.A + tx_in.B + tx_in.CIN);
		if((tx_in.A[31] == tx_in.B[31]) && (~out_res[31] == tx_in.A[31])) begin
			vout_res = 1'b1;
	             end
		else begin
			vout_res = 1'b0;
		     end
		return {vout_res, cout_res, out_res[31:0]};
		end
	3'b110: begin
		if(tx_in.CIN == 1'b0) begin
			cout_res = 1'b0;
			out_res = 32'h00000000;
			vout_res = 1'b0;
			return {vout_res, cout_res, out_res[31:0]};
			end
		{cout_res, out_res} = (tx_in.A - tx_in.B);
		if((tx_in.A[31] != tx_in.B[31]) && (out_res[31] != tx_in.A[31])) begin	
			vout_res = 1'b1;
		     end
		else begin
			vout_res = 1'b0;
		     end
		return {vout_res, cout_res, out_res[31:0]};
		end
	default: begin
		 cout_res = 1'b0;
		 vout_res = 1'b0;
		 out_res = 32'h00000000;
		 return{vout_res, cout_res, out_res[31:0]};
		 end
   endcase
		
endfunction

endpackage: scoreboard
