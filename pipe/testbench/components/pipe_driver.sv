class Pipe_Driver extends uvm_driver #(Data_Packet);
  `uvm_component_utils(Pipe_Driver)

  virtual Pipe_Interface pipe_vif;

  // Constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual Pipe_Interface)::get(this, "", "input_interface", pipe_vif))
      `uvm_fatal("NO_VIF", {"virtual interface must be set for:", get_full_name(), ".pipe_vif"})
    
    `uvm_info(get_full_name(), "Build stage complete.", UVM_LOW) 
  endfunction : build_phase

  // Run phase
  virtual task run_phase(uvm_phase phase);
    fork
      reset();
      get_and_drive();
    join
  endtask : run_phase

  virtual task reset();
    @(negedge pipe_vif.rst_n);
    `uvm_info(get_type_name(), "Resetting signals ", UVM_LOW)
    pipe_vif.cf = 2'b0;
    pipe_vif.data_in0 = 16'b0;
    pipe_vif.data_in1 = 16'b0;
    pipe_vif.enable = 1'b0;
  endtask : reset

  virtual task get_and_drive();
    forever begin
      while (pipe_vif.rst_n != 1'b0) begin
        seq_item_port.get_next_item(req);
        drive_packet(req);
        seq_item_port.item_done();
      end
    end
  endtask: get_and_drive

  virtual task drive_packet(Data_Packet packet);
    pipe_vif.enable = 1'b0;
    repeat (packet.delay) @(posedge pipe_vif.clk);
    pipe_vif.enable = packet.enable;
    pipe_vif.cf = packet.cf;
    pipe_vif.data_in0 = packet.data_in0;
    pipe_vif.data_in1 = packet.data_in1;
    @(posedge pipe_vif.clk);
    pipe_vif.enable = 1'b0;
  endtask : drive_packet
endclass : Pipe_Driver