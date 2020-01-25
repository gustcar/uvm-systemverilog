`ifndef __PIPE_RANDOM_SEQUENCE_SV
`define __PIPE_RANDOM_SEQUENCE_SV

class Pipe_Random_Sequence extends uvm_sequence #(Data_Packet);
  `uvm_object_utils(Pipe_Random_Sequence)

  function new(string name = "Pipe_Random_Sequence");
    super.new(name);
  endfunction : new
  
  virtual task body();
    `uvm_do(req)
  endtask : body
endclass

`endif
