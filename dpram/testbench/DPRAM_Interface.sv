`ifndef __DPRAM_INTERFACE_SV
`define __DPRAM_INTERFACE_SV

interface DPRAM_interface (input bit clock);
  // Write signals
  logic       writeEnable;
  logic [7:0] dataIn;
  logic [7:0] writeAddress;
  // Read signals
  logic       readEnable;
  logic [7:0] dataOut;
  logic [7:0] readAddress;

  // Clocking blocks

  // Master - used for drivers
  clocking master_cb @(posedge clock);
    output  writeEnable, dataIn, writeAddress, readEnable, readAddress;
    input   dataOut;
  endclocking: master_cb

  // Slave - used for any slave BFMs
  clocking slave_cb @(posedge clock);
    output  dataOut;
    input   writeEnable, dataIn, writeAddress, readEnable, readAddress;
  endclocking: slave_cb

  // Monitor - for sampling by monitor components
  clocking monitor_cb @(posedge clock);
    input writeEnable, dataIn, writeAddress, readEnable, dataOut, readAddress;
  endclocking: monitor_cb

  // Modports
  modport master(clocking master_cb);
  modport slave(clocking slave_cb);
  modport passive(clocking monitor_cb);

endinterface: DPRAM_interface

`endif
