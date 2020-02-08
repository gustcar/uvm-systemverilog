`ifndef __DUT_ENVIRONMENT_SV
`define __DUT_ENVIRONMENT_SV

//  Class: Dut_Environment
//
class Dut_Environment extends uvm_env;
  `uvm_component_utils(Dut_Environment);

  // uvm components' declaration [composition]
  Pipe_Environment pipe_environment_input;
  Pipe_Environment pipe_environment_output;
  // todo: implement scoreboard
  // Pipe_Scoreboard pipe_scoreboard;

  //  Constructor
  function new(string name = "Dut_Environment", uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Configuration database
    uvm_config_db#(int)::set(
      this, 
      "pipe_environment_input.pipe_agent", 
      "is_active", 
      UVM_ACTIVE
    );
    uvm_config_db#(int)::set(
      this, 
      "pipe_environment_output.pipe_agent", 
      "is_active", 
      UVM_PASSIVE
    );
    uvm_config_db#(string)::set(
      this, 
      "pipe_environment_input.pipe_agent.pipe_monitor",
      "monitor_interface", 
      "input_interface"
    );
    uvm_config_db#(string)::set(
      this, 
      "pipe_environment_output.pipe_agent.pipe_monitor",
      "monitor_interface", 
      "output_interface"
    );
    
    pipe_environment_input = Pipe_Environment::type_id::create("pipe_environment_input", this);
    pipe_environment_output = Pipe_Environment::type_id::create("pipe_environment_output", this);
    pipe_scoreboard = Pipe_Scoreboard::type_id::create("pipe_scoreboard", this);
    
    `uvm_info(
      get_full_name(),
      "Build stage complete.",
      UVM_LOW
    )
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    // simplified connection. Different from the book
    pipe_environment_input.pipe_agent.item_collected_port.connect(
      pipe_scoreboard.input_packets_collected.analysis_export
    );
    pipe_environment_output.pipe_agent.item_collected_port.connect(
      pipe_scoreboard.output_packets_collected.analysis_export
    );
  endfunction: connect_phase
endclass: Dut_Environment

`endif
