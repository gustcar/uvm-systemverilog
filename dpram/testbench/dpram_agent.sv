//  Class: DPRAM_Agent
//
class DPRAM_Agent extends uvm_agent;
  `uvm_component_utils(DPRAM_Agent);

  //  Group: Config
  
  // todo: Transaction Class
  // Analysis Port
  uvm_analysis_port #(DPRAM_Transaction) dpram_agent_analysis_port;

  // todo: Agent components
  // Agent components declaration
  // DPRAM_Sequencer dpram_sequencer;
  // DPRAM_Driver    dpram_driver;
  // DPRAM_Monitor   dpram_monitor;

  //  Constructor: new
  function new(string name = "DPRAM_Agent", uvm_component parent);
    super.new(name, parent);
    `uvm_warning(get_name(), " => Agent Created")
    
  endfunction: new

  //  Function: build_phase
  function void build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    // super.build_phase(phase);

    // Instance of the Analysis Port
    this.dpram_agent_analysis_port = new("dpram_agent_analysis_port", this);

    // dpram_sequencer = DPRAM_Sequencer::type_id::create("dpram_sequencer", this);
    // dpram_driver = DPRAM_Driver::type_id::create("dpram_driver", this);
    // dpram_monitor = DPRAM_Monitor::type_id::create("dpram_monitor", this);

  endfunction: build_phase

  //  Function: connect_phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // todo: connect driver and sequencer port-export
    // todo: connect monitor and agent analysis port
  endfunction: connect_phase  
  
endclass: DPRAM_Agent