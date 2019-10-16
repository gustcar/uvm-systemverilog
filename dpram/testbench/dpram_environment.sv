//

//  Class: dpram_environment
//
class DPRAM_Environment extends uvm_env;
  `uvm_component_utils(dpram_environment);

  //  Constructor: new
  function new(string name = "DPRAM_Environment", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_full_name(), "Environment Created", UVM_LOW)
  endfunction: new
  
endclass: DPRAM_Environment
