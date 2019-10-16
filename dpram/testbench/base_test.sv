`ifndef __BASE_TEST_SV
`define __BASE_TEST_SV

//  Class: Base_Test  
//
class Base_Test extends uvm_test;
  `uvm_component_utils(Base_Test);

  dpram_environment dpram_env;

  //  Constructor: new
  function new(string name = "Base_Test", uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    this.dpram_env = dpram_environment::type_id::create("dpram_env", this);
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    #10
    `uvm_info(get_name(), "Yeah! It is working", UVM_MEDIUM)
    
    phase.drop_objection(this);
  endtask: run_phase
  
  // todo:
  local DPRAM_Interface dpram_vif;
  protected 
  
endclass: Base_Test

`endif