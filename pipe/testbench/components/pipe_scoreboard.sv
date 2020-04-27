class Pipe_Scoreboard extends uvm_scoreboard;
  uvm_tlm_analysis_fifo #(Data_Packet) input_packets_collected;
  uvm_tlm_analysis_fifo #(Data_Packet) output_packets_collected;

  Data_Packet input_packet, output_packets;

  `uvm_component_utils(Pipe_Scoreboard)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function build_phase(uvm_phase phase);
    super.build_phase(phase);

    input_packets_collected = new("input_packets_collected", this);
    output_packets_collected = new("output_packets_collected", this);

    input_packet = Data_Packet::type_id::create("input_packet");
    output_packet = Data_Packet::type_id::create("output_packet");

    `uvm_info(get_full_name(), "Build stage completed", UVM_LOW)
  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
    watcher();
  endtask: run_phase

  virtual task watcher();
    forever begin
      input_packets_collected.get(input_packet);
      output_packets_collected.get(output_packet);
      compare_data();
    end
  endtask: watcher

  virtual task compare_data();
    bit [15:0] expected_data0;
    bit [15:0] expected_data1;

    if ((input_packet.data_input_0 == 16'h0000) || (input_packet.data_input_0 == 16'hffff))
      expected_data0 = input_packet.data_input_0;
    else
      expected_data0 = input_packet.data_input_0 * input_packet.correction_factor;

    if ((input_packet.data_input_1 == 16'h0000) || (input_packet.data_input_1 == 16'hffff))
      expected_data1 = input_packet.data_input_1;
    else
      expected_data1 = input_packet.data_input_1 * input_packet.correction_factor;

    if (expected_data0 != output_packet.data_output_0)
      `uvm_error(
        get_type_name(),
        $sformatf(
          "Actual output data %0h does not match expected %0h",
          output_packet.data_output_0,
          expected_data0
        )
      )

      if (expected_data1 != output_packet.data_output_1)
      `uvm_error(
        get_type_name(),
        $sformatf(
          "Actual output data %0h does not match expected %0h",
          output_packet.data_output_1,
          expected_data1
        )
      )
      
  endtask: compare_data
endclass : Pipe_Scoreboard