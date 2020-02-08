`ifndef __PIPE_AGENT_SV
`define __PIPE_AGENT_SV

//  Class: Pipe_Agent
//
class Pipe_Agent extends uvm_agent;
  //  Fields
  protected uvm_active_passive_enum is_active = UVM_ACTIVE;

  // uvm components' declaration [composition]
  Pipe_Sequencer  pipe_sequencer;
  Pipe_Driver     pipe_Driver;
  Pipe_Monitor    pipe_monitor;

  // register agent class with factory
  // parameter: component type = Pipe_Agent
  `uvm_component_utils_begin(Pipe_Agent)
    // parameters:
    //  enum type = uvm_active_passive_enum,
    //  field name = is_active,
    //  flags = UVM_DEFAULT
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
  `uvm_component_utils_end
  
  // Constructor
  function new(string name = "Pipe_Agent", uvm_component parent);
    super.new(name, parent);
  endfunction: new

  // PHASE METHODS

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Active agent
    if (is_active == UVM_ACTIVE) begin
      // instantiates sequencer and driver using the factory mechanism
      pipe_sequencer = Pipe_Sequencer::type_id::create("pipe_sequencer", this);
      pipe_driver = Pipe_Driver::type_id::create("pipe_driver", this);
    end
    // Passive agent
    pipe_monitor = Pipe_Monitor::type_id::create("pipe_monitor", this);

    // Build phase completed
    `uvm_info(
      get_full_name(),
      "Build stage complete.",
      UVM_LOW
    )
    
  endfunction: build_phase
  
  // Connect phase
  function void connect_phase(uvm_phase phase);
    if (is_active == UVM_ACTIVE) begin
      pipe_driver.seq_item_port.connect(pipe_sequencer.seq_item_export);
    end

    // Connect phase completed
    `uvm_info(
      get_full_name(),
      "Connect stage complete.",
      UVM_LOW
    )
  endfunction: connect_phase

endclass: Pipe_Agent


`endif
