interface dut_in;
    logic           clk, rst;
    logic           CIN;
    logic   [2:0]   opcode;
    logic   [31:0]  A, B;
endinterface: dut_in

interface dut_out;
    logic           clk;
    logic   [31:0]  OUT;
    logic   	    COUT;
    logic           VOUT;
endinterface: dut_out
