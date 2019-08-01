// Module top

// Time scale if required
`timescale 1ns/1ps

// Import UVM library
import    uvm_pkg::*;
// Include UVM macros
`include  "uvm_macros.svh"

// Include files for compiling
// file dependencies
//`include  "Base_Test.sv"
`include "DPRAM_Interface.sv"

// testbench top module. It starts the test
module top;
  // clock definition
  bit clock;
  // clock execution
  always #10 clock <= ~clock;

  // Instance of the DUT physical interface
  DPRAM_Interface DPRAM_interface(clock);

  // Instance of the DUT

  // Program that starts the simulation
  initial begin // o tipo
    uvm_config_db#(virtual Dut_Interface)::set(
      null,
      "uvm_test_top",
      "DPRAM_interface", // x
      DPRAM_interface    // x
    );
    
    // Executes test - e o nome do teste
    //run_test("Base_Test");
  end
endmodule: top
