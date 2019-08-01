`ifndef __BASE_TEST_SV
`define __BASE_TEST_SV

//  Class: Base_Test  
//
class se_Test extends uvm_test;
  `uvm_component_utils(Base_Test);

  //  Constructor: new
  function new(string name = "Base_Test", uvm_component parent);
    super.new(name, parent);
  endfunction: new

  local DPRAM_Interface DPRAM_readVirtualInterface;
  local DPRAM_Interface DPRAM_writeVirtualInterface;
  protected 
  
endclass: Base_Test


`endif
