//  Module: Dummy_Dut
// todo: refactor interface access
module Dummy_Dut (
    DPRAM_Interface dif
  );
  import uvm_pkg::*;

  string message;

  always @(posedge dif.clock) begin
    message = $sformatf(
                "DUT received write_enable=%b, write_address=%d, data_in=%d, read_enable=%b, read_address=%d, data_out=%d", dif.write_enable,
                dif.write_address,
                dif.data_in,
                dif.read_enable,
                dif.read_address,
                dif.data_out);

    `uvm_info("Dummy DUT", message, UVM_MEDIUM)
    
  end
  
endmodule: Dummy_Dut
