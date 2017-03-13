`include "uvm_macros.svh"
package coverage;
import sequences::*;
import uvm_pkg::*;

class alu_subscriber_in extends uvm_subscriber #(alu_transaction_in);
    `uvm_component_utils(alu_subscriber_in)

    //Declare Variables
    logic [31:0] A;
    logic [31:0] B;
    logic [2:0] opcode;
    logic cin;

    //Test-1 : for part A covers the cross too. but commented for other tests similarly the ignore_bins is used for test-1 in opcode_cov but removed for other tests.
    covergroup inputs;
    	opcode_cov: coverpoint opcode{
			bins pass_A = {0};
			bins bit_and = {1};
			bins bit_not = {2};
			bins bit_or = {3};
			bins bit_xor = {4};
			bins bit_add = {5};
			bins bit_sub = {6};
			//ignore_bins unused = {7}; // For test-1
			bins bit_unsued = {7};		    
		    }
	cin_sub: coverpoint cin iff(opcode == 3'b110){
		    	bins cinsub = {1};
			ignore_bins notvalid_sub = {0};
		    }
	cin_add: coverpoint cin iff(opcode == 3'b101){
		    	bins cinadd_0 = {0};
			bins cinadd_1 = {1};
		    }
	cross_sub: cross opcode_cov, cin_sub;
	cross_add: cross opcode_cov, cin_add;

	// Not sure if we need to cover A and B.
	input_A: coverpoint A{
			option.auto_bin_max = 32;
		    }
	input_B: coverpoint B{
			option.auto_bin_max = 32;
		    }
	
	
	// Test-2 : Here the covergroup is changed to use the
	//cross_op_inp: cross opcode_cov, input_A, input_B;
	//cross_inp_cinsub: cross input_A, input_B, cin_sub;
 	//cross_inp_cinadd: cross input_A, input_B, cin_add;

	// Test-3: same as test-2
	
    endgroup: inputs
    

    function new(string name, uvm_component parent);
        super.new(name,parent);
        // TODO: Uncomment
        inputs=new;
    endfunction: new

    function void write(alu_transaction_in t);
        A={t.A};
        B={t.B};
        opcode={t.opcode};
        cin={t.CIN};
        // TODO: Uncomment
        inputs.sample();
    endfunction: write

endclass: alu_subscriber_in

class alu_subscriber_out extends uvm_subscriber #(alu_transaction_out);
    `uvm_component_utils(alu_subscriber_out)

    logic [31:0] out;
    logic cout;
    logic vout;

    //TODO: Add covergroups for the outputs
    covergroup outputs;
    cout_cov: coverpoint cout {
			bins cout_0 = {0};
			bins cout_1 = {1};
		}
    vout_cov: coverpoint vout; /*{
			bins vout_0 = {0};
			bins vout_1 = {1};	
		}*/
    out_cov: coverpoint out {
			option.auto_bin_max = 32; // For test1,2,3
			//option.auto_bin_max = 64; // Exclusively for 3.
		}
    //coss_cov: cross cout_cov, vout_cov, out_cov;
    endgroup: outputs
    

function new(string name, uvm_component parent);
    super.new(name,parent);
    // TODO: Uncomment
    outputs=new;
endfunction: new

function void write(alu_transaction_out t);
    out={t.OUT};
    cout={t.COUT};
    vout={t.VOUT};
    //TODO: Uncomment
    outputs.sample();
endfunction: write
endclass: alu_subscriber_out

endpackage: coverage
