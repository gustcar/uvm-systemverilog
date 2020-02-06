`ifndef __PIPE_MONITOR_SV
`define __PIPE_MONITOR_SV

class Pipe_Monitor extends uvm_monitor;
  
  virtual Pipe_Interface pipe_vif;
  string monitor_interface;
  int num_pkts;
  
  uvm_analysis_port #(Data_Packet) item_collected_port;
  Data_Packet data_collected;
  Data_Packet data_clone;

  `uvm_component_uitls(Pipe_Monitor);

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(string)::get(this, "", "monitor_interface", monitor_interface))
      `uvm_fatal(
        "NOSTRING",
        {"Need interface name for: ", get_full_name(), ".monitor_interface"}
      )
    `uvm_info(
      get_type_name(),
      $sformatf("INTERFACE USED = %0s", monitor_interface),
      UVM_LOW
    )

    if (!uvm_config_db#(virtual Pipe_Interface)::get(this, "", monitor_interface, pipe_vif))
      `uvm_fatal(
        "NOVIF",
        {"virtual interface must be set for: ", get_full_name(), ".pipe_vif"}
      )
      
    item_collected_port = new("item_collected_port", this);
    data_collected = Data_Packet::type_id::create("data_collected");
    data_clone = Data_Packet::type_id::create("data_clone");

    `uvm_info(
      get_full_name(),
      "Build stage complete.",
      UVM_LOW
    )
    
  endfunction : build_phase

  virtual task run_phase(uvm_phae phase);
    collect_data();
  endtask : run_phase

  virtual task collect_data();
    wait(pipe_vif.enable);
    data_collected.cf = pipe_vif.cf;
    data_collected.data_in0 = pipe_vif.data_in0;
    data_collected.data_in1 = pipe_vif.data_in1;
    $cast(data_clone, data_collected.clone());
    item_collected_port.write(data_clone);
    num_pkts++;
  endtask: collect_data

  virtual function void report_phase(uvm_phase phase);
    `uvm_info(
      get_type_name(),
      $sformatf("REPORT: COLLECTED PACKETS = %0d", num_pkts),
      UVM_LOW
    )
  endfunction: report_phase
  
endclass: Pipe_Monitor

`endif
