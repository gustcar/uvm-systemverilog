class Pipe_Coverage extends uvm_subscriber #(Data-Packet);
  Data_Packet packet;
  int count;

  `uvm_component_utils(Pipe_Coverage)

  covergroup cg;
    option.per_instance = 1;
    cov_cf: coverpoint packet.correction_factor;
    cov_en: coverpoint packet.enable;
    cov_in0: coverpoint packet.data_input_0;
    cov_in1: coverpoint packet.data_input_1;
    cov_out0: coverpoint packet.data_output_0;
    cov_out1: coverpoint packet.data_output_1;
    cov_del: coverpoint packet.delay;
  endgroup: cg

  function new(string name, uvm_component parent);
    super.new(name, parent);
    cg = new();
  endfunction: new
  
  function void write(Data_Packet packet);
    this.packet = packet;
    this.count++;
    cg.sample();
  endfunction: write

  virtual function void extract_phase(uvm_phase phase);
    `uvm_info(
      get_type_name(),
      $sformatf(
        "Number of coverage packets collected = %0d",
        this.count),
      UVM_LOW
    )
    
    `uvm_info(
      get_type_name(),
      $sformatf("Current coverage = %f", cg.get_coverage()),
      UVM_LOW
    )
  endfunction: extract_phase

endclass: Pipe_Coverage