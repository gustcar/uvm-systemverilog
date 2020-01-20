// Simple interface for now
interface Pipe_Interface (input logic clk, rst_n);
  // correction_factor
  logic [1:0] cf;
  // Data inputs
  logic [15:0]  data_in0;
  logic [15:0]  data_in1;
  // Data outputs
  logic [15:0]  data_out0;
  logic [15:0]  data_out1;
  // Enable signal
  logic enable;
endinterface : Pipe_Interface