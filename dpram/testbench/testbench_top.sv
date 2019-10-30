// Module top

// Time scale if required
`timescale 1ns/1ps

// Import UVM library
import    uvm_pkg::*;
// Include UVM macros
`include  "uvm_macros.svh"

// Include files for compiling
// file dependencies
`include  "dpram_agent.sv"
`include  "dpram_environment.sv"
`include  "base_test.sv"
`include  "dpram_interface.sv"

// testbench top module. It starts the test
module Top;
  // clock definition
  bit clock;
  // clock execution
  always #10 clock <= ~clock;

  // Instance of the DUT physical interface
  DPRAM_Interface dpram_interface(clock);

  // Instance of the DUT
  // No DUT

  // Program that starts the simulation
  initial begin
    uvm_config_db#(virtual DPRAM_Interface)::set(
      null,
      "uvm_test_top",
      "dpram_interface",
      dpram_interface   
    );
    
    // Executes test - Class name as argument
    run_test("Base_Test");
  end
endmodule: Top