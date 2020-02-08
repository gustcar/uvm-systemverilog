`ifndef __PIPE_ENVIRONMENT_SV
`define __PIPE_ENVIRONMENT_SV

//  Class: Pipe_Environment
//
class Pipe_Environment extends uvm_env;
  `uvm_component_utils(Pipe_Environment);

  // uvm components' declaration [composition]
  Pipe_Agent pipe_agent;

  // METHODS

  //  Constructor: new
  function new(string name = "Pipe_Environment", uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    pipe_agent = Pipe_Agent::type_id::create("pipe_agent", this);

    `uvm_info(
      get_full_name(),
      "Build stage complete.",
      UVM_LOW
    )
  endfunction: build_phase
  
endclass: Pipe_Environment


`endif
