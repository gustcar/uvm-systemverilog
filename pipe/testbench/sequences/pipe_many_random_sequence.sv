`ifndef __PIPE_MANY_RANDOM_SEQUENCE_SV
`define __PIPE_MANY_RANDOM_SEQUENCE_SV

class Pipe_Many_Random_Sequence extends uvm_sequence #(Data_Packet);
  `uvm_object_utils(Pipe_Many_Random_Sequence)

  rand byte unsigned loop;

  constraint limit {
    loop inside {[5:10]};
  }

  function new(string name = "Pipe_Many_Random_Sequence");
    super.new(name);
  endfunction: new
  
  virtual task body();
    for (int i = 0; i < loop; i++) begin
      `uvm_do(req)
    end
  endtask : body
  
endclass : Pipe_Many_Random_Sequence

`endif
