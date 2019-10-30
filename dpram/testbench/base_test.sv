`ifndef __BASE_TEST_SV
`define __BASE_TEST_SV

//  Class: Base_Test  
//
class Base_Test extends uvm_test;
  `uvm_component_utils(Base_Test);

  DPRAM_Environment dpram_env;
  virtual DPRAM_Interface dpram_vif;

  //  Constructor: new
  function new(string name = "Base_Test", uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    // Instance of DPRAM_Environment
    this.dpram_env = DPRAM_Environment::type_id::create("dpram_env", this);

    // Get the Virtual Interface named <dpram_interface> from Config_DB
    assert (uvm_config_db#(virtual DPRAM_Interface)::get(this, "", "dpram_interface", dpram_vif)) begin
      $display(" => BASE TEST VIRTUAL INTERFACE HERE");
      `uvm_warning(get_name(), "=> [BASE TEST] Virtual interface set in dpram_vif field correctly")
    end else `uvm_fatal(get_name(), "=> [BASE TEST] Impossible to get the virtual interface from config_db")

    // Set the Virtual Interface to the environment (for now)
    
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    #10;
    `uvm_info(get_name(), "Yeah! It is working", UVM_MEDIUM)
    
    phase.drop_objection(this);
  endtask: run_phase
  
  // todo:
  local virtual DPRAM_Interface dpram_vif;
  protected ;
  
endclass: Base_Test

`endif