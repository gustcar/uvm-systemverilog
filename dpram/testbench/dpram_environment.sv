`ifndef __DPRAM_ENVIRONMENT_SV
`define __DPRAM_ENVIRONMENT_SV

//

//  Class: dpram_environment
//
class DPRAM_Environment extends uvm_env;
  `uvm_component_utils(DPRAM_Environment);

  DPRAM_Agent dpram_agent;
  virtual DPRAM_Interface dpram_vif;

  //  Constructor: new
  function new(string name = "DPRAM_Environment", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_full_name(), "Environment Created", UVM_LOW)
  endfunction: new

  function void build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    //super.build_phase(phase);
    
    dpram_agent = DPRAM_Agent::type_id::create("dpram_agent", this);

    // assert (
    //   uvm_config_db#(virtual DPRAM_Interface)::get(
    //     .cntxt(this),
    //     .inst_name(""),
    //     .field_name("dpram_interface"),
    //     .value(dpram_vif)
    //     )
    // ) begin
    //   $display(" => ENV VIRTUAL INTERFACE HERE");
    //   `uvm_warning(get_name(), "=> [ENV] Virtual interface set in dpram_vif field correctly")
    // end else `uvm_fatal(get_name(), "=> [ENV] Impossible to get the virtual interface from config_db")
    
  endfunction: build_phase
  
  
endclass: DPRAM_Environment
`endif