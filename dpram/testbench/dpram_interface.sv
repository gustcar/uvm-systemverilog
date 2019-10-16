`ifndef __DPRAM_INTERFACE_SV
`define __DPRAM_INTERFACE_SV

interface DPRAM_Interface (input bit clock);
  // Write signals
  logic       write_enable;
  logic [7:0] data_in;
  logic [7:0] write_address;
  // Read signals
  logic       read_enable;
  logic [7:0] data_out;
  logic [7:0] read_address;

  // Clocking blocks

  // Master - used for drivers
  clocking master_cb @(posedge clock);
    output  write_enable, data_in, write_address, read_enable, read_address;
    input   data_out;
  endclocking: master_cb

  // Slave - used for any slave BFMs
  clocking slave_cb @(posedge clock);
    output  data_out;
    input   write_enable, data_in, write_address, read_enable, read_address;
  endclocking: slave_cb

  // Monitor - for sampling by monitor components
  clocking monitor_cb @(posedge clock);
    input write_enable, data_in, write_address, read_enable, data_out, read_address;
  endclocking: monitor_cb

  // Modports
  modport master(clocking master_cb);
  modport slave(clocking slave_cb);
  modport passive(clocking monitor_cb);

endinterface: DPRAM_Interface

`endif
