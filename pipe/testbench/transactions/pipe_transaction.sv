`ifndef __PIPE_TRANSACTION_SV
`define __PIPE_TRANSACTION_SV

class Data_Packet extends uvm_sequence_item;
  // Data to be randomized
  rand  bit [1:0]   correction_factor;
  rand  bit         enable;
  rand  bit [15:0]  data_input_0;
  rand  bit [15:0]  data_input_1;
  rand  bit [15:0]  data_output_0;
  rand  bit [15:0]  data_output_1;
  // control knob
  rand  int         delay;

  // Utility macro
  `uvm_object_util_begin(Data_Packet)
  // Field automation macros
    `uvm_field_int(correction_factor, UVM_DEFAULT)
    `uvm_field_int(enable, UVM_DEFAULT)
    `uvm_field_int(data_input_0, UVM_DEFAULT)
    `uvm_field_int(data_input_1, UVM_DEFAULT)
    `uvm_field_int(data_output_0, UVM_DEFAULT)
    `uvm_field_int(data_output_1, UVM_DEFAULT)
    `uvm_field_int(delay, UVM_DEFAULT)
  `uvm_object_util_end

  // constructor
  function new(string name="Data_Packet");
    super.new(name);
  endfunction
endclass

`endif