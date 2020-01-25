`ifndef __PIPE_SEQUENCER_SV
`define __PIPE_SEQUENCER_SV

class Pipe_Sequencer extends uvm_sequencer #(Data_Packet);
  `uvm_component_utils(Pipe_equencer);

  function new(string name = "Pipe_Sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction: new
  
endclass: Pipe_Sequencer

`endif