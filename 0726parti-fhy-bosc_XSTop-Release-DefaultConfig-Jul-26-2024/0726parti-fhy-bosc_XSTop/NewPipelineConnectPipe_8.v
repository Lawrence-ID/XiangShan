// Generated by CIRCT firtool-1.74.0
// Include register initializers in init blocks unless synthesis is set
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS
// Standard header to adapt well known macros for register randomization.
// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM
// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM
// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY
// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_
module NewPipelineConnectPipe_8(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [7:0]  io_in_bits_rf_2_0_addr,
  input  [7:0]  io_in_bits_rf_1_0_addr,
  input  [7:0]  io_in_bits_rf_0_0_addr,
  input  [34:0] io_in_bits_common_fuType,
  input  [8:0]  io_in_bits_common_fuOpType,
  input         io_in_bits_common_robIdx_flag,
  input  [7:0]  io_in_bits_common_robIdx_value,
  input  [7:0]  io_in_bits_common_pdest,
  input         io_in_bits_common_rfWen,
  input         io_in_bits_common_fpWen,
  input         io_in_bits_common_vecWen,
  input         io_in_bits_common_v0Wen,
  input         io_in_bits_common_fpu_wflags,
  input  [2:0]  io_in_bits_common_fpu_rm,
  input  [1:0]  io_in_bits_common_vpu_vsew,
  input  [3:0]  io_in_bits_common_dataSources_0_value,
  input  [3:0]  io_in_bits_common_dataSources_1_value,
  input  [3:0]  io_in_bits_common_dataSources_2_value,
  input         io_in_bits_common_l1ExuOH_0_8,
  input         io_in_bits_common_l1ExuOH_0_9,
  input         io_in_bits_common_l1ExuOH_0_10,
  input         io_in_bits_common_l1ExuOH_0_11,
  input         io_in_bits_common_l1ExuOH_1_8,
  input         io_in_bits_common_l1ExuOH_1_9,
  input         io_in_bits_common_l1ExuOH_1_10,
  input         io_in_bits_common_l1ExuOH_1_11,
  input         io_in_bits_common_l1ExuOH_2_8,
  input         io_in_bits_common_l1ExuOH_2_9,
  input         io_in_bits_common_l1ExuOH_2_10,
  input         io_in_bits_common_l1ExuOH_2_11,
  input  [1:0]  io_in_bits_common_loadDependency_0,
  input  [1:0]  io_in_bits_common_loadDependency_1,
  input  [1:0]  io_in_bits_common_loadDependency_2,
  input         io_out_ready,
  output        io_out_valid,
  output [7:0]  io_out_bits_rf_2_0_addr,
  output [7:0]  io_out_bits_rf_1_0_addr,
  output [7:0]  io_out_bits_rf_0_0_addr,
  output [34:0] io_out_bits_common_fuType,
  output [8:0]  io_out_bits_common_fuOpType,
  output        io_out_bits_common_robIdx_flag,
  output [7:0]  io_out_bits_common_robIdx_value,
  output [7:0]  io_out_bits_common_pdest,
  output        io_out_bits_common_rfWen,
  output        io_out_bits_common_fpWen,
  output        io_out_bits_common_vecWen,
  output        io_out_bits_common_v0Wen,
  output        io_out_bits_common_fpu_wflags,
  output [2:0]  io_out_bits_common_fpu_rm,
  output [1:0]  io_out_bits_common_vpu_vsew,
  output [3:0]  io_out_bits_common_dataSources_0_value,
  output [3:0]  io_out_bits_common_dataSources_1_value,
  output [3:0]  io_out_bits_common_dataSources_2_value,
  output        io_out_bits_common_l1ExuOH_0_8,
  output        io_out_bits_common_l1ExuOH_0_9,
  output        io_out_bits_common_l1ExuOH_0_10,
  output        io_out_bits_common_l1ExuOH_0_11,
  output        io_out_bits_common_l1ExuOH_1_8,
  output        io_out_bits_common_l1ExuOH_1_9,
  output        io_out_bits_common_l1ExuOH_1_10,
  output        io_out_bits_common_l1ExuOH_1_11,
  output        io_out_bits_common_l1ExuOH_2_8,
  output        io_out_bits_common_l1ExuOH_2_9,
  output        io_out_bits_common_l1ExuOH_2_10,
  output        io_out_bits_common_l1ExuOH_2_11,
  output [1:0]  io_out_bits_common_loadDependency_0,
  output [1:0]  io_out_bits_common_loadDependency_1,
  output [1:0]  io_out_bits_common_loadDependency_2
);

  reg         valid;
  wire        io_in_ready_0 = io_out_ready | ~valid;
  wire        _data_T = io_in_ready_0 & io_in_valid;
  reg  [7:0]  data_rf_2_0_addr;
  reg  [7:0]  data_rf_1_0_addr;
  reg  [7:0]  data_rf_0_0_addr;
  reg  [34:0] data_common_fuType;
  reg  [8:0]  data_common_fuOpType;
  reg         data_common_robIdx_flag;
  reg  [7:0]  data_common_robIdx_value;
  reg  [7:0]  data_common_pdest;
  reg         data_common_rfWen;
  reg         data_common_fpWen;
  reg         data_common_vecWen;
  reg         data_common_v0Wen;
  reg         data_common_fpu_wflags;
  reg  [2:0]  data_common_fpu_rm;
  reg  [1:0]  data_common_vpu_vsew;
  reg  [3:0]  data_common_dataSources_0_value;
  reg  [3:0]  data_common_dataSources_1_value;
  reg  [3:0]  data_common_dataSources_2_value;
  reg         data_common_l1ExuOH_0_8;
  reg         data_common_l1ExuOH_0_9;
  reg         data_common_l1ExuOH_0_10;
  reg         data_common_l1ExuOH_0_11;
  reg         data_common_l1ExuOH_1_8;
  reg         data_common_l1ExuOH_1_9;
  reg         data_common_l1ExuOH_1_10;
  reg         data_common_l1ExuOH_1_11;
  reg         data_common_l1ExuOH_2_8;
  reg         data_common_l1ExuOH_2_9;
  reg         data_common_l1ExuOH_2_10;
  reg         data_common_l1ExuOH_2_11;
  reg  [1:0]  data_common_loadDependency_0;
  reg  [1:0]  data_common_loadDependency_1;
  reg  [1:0]  data_common_loadDependency_2;
  always @(posedge clock or posedge reset) begin
    if (reset)
      valid <= 1'h0;
    else
      valid <= _data_T;
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_data_T) begin
      data_rf_2_0_addr <= io_in_bits_rf_2_0_addr;
      data_rf_1_0_addr <= io_in_bits_rf_1_0_addr;
      data_rf_0_0_addr <= io_in_bits_rf_0_0_addr;
      data_common_fuType <= io_in_bits_common_fuType;
      data_common_fuOpType <= io_in_bits_common_fuOpType;
      data_common_robIdx_flag <= io_in_bits_common_robIdx_flag;
      data_common_robIdx_value <= io_in_bits_common_robIdx_value;
      data_common_pdest <= io_in_bits_common_pdest;
      data_common_rfWen <= io_in_bits_common_rfWen;
      data_common_fpWen <= io_in_bits_common_fpWen;
      data_common_vecWen <= io_in_bits_common_vecWen;
      data_common_v0Wen <= io_in_bits_common_v0Wen;
      data_common_fpu_wflags <= io_in_bits_common_fpu_wflags;
      data_common_fpu_rm <= io_in_bits_common_fpu_rm;
      data_common_vpu_vsew <= io_in_bits_common_vpu_vsew;
      data_common_dataSources_0_value <= io_in_bits_common_dataSources_0_value;
      data_common_dataSources_1_value <= io_in_bits_common_dataSources_1_value;
      data_common_dataSources_2_value <= io_in_bits_common_dataSources_2_value;
      data_common_l1ExuOH_0_8 <= io_in_bits_common_l1ExuOH_0_8;
      data_common_l1ExuOH_0_9 <= io_in_bits_common_l1ExuOH_0_9;
      data_common_l1ExuOH_0_10 <= io_in_bits_common_l1ExuOH_0_10;
      data_common_l1ExuOH_0_11 <= io_in_bits_common_l1ExuOH_0_11;
      data_common_l1ExuOH_1_8 <= io_in_bits_common_l1ExuOH_1_8;
      data_common_l1ExuOH_1_9 <= io_in_bits_common_l1ExuOH_1_9;
      data_common_l1ExuOH_1_10 <= io_in_bits_common_l1ExuOH_1_10;
      data_common_l1ExuOH_1_11 <= io_in_bits_common_l1ExuOH_1_11;
      data_common_l1ExuOH_2_8 <= io_in_bits_common_l1ExuOH_2_8;
      data_common_l1ExuOH_2_9 <= io_in_bits_common_l1ExuOH_2_9;
      data_common_l1ExuOH_2_10 <= io_in_bits_common_l1ExuOH_2_10;
      data_common_l1ExuOH_2_11 <= io_in_bits_common_l1ExuOH_2_11;
      data_common_loadDependency_0 <= io_in_bits_common_loadDependency_0;
      data_common_loadDependency_1 <= io_in_bits_common_loadDependency_1;
      data_common_loadDependency_2 <= io_in_bits_common_loadDependency_2;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:20];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h15; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        valid = _RANDOM[5'h0][0];
        data_rf_2_0_addr = _RANDOM[5'h0][8:1];
        data_rf_1_0_addr = _RANDOM[5'h0][19:12];
        data_rf_0_0_addr = _RANDOM[5'h0][30:23];
        data_common_fuType = {_RANDOM[5'h1][31:18], _RANDOM[5'h2][20:0]};
        data_common_fuOpType = _RANDOM[5'h2][29:21];
        data_common_robIdx_flag = _RANDOM[5'h9][30];
        data_common_robIdx_value = {_RANDOM[5'h9][31], _RANDOM[5'hA][6:0]};
        data_common_pdest = _RANDOM[5'hA][19:12];
        data_common_rfWen = _RANDOM[5'hA][20];
        data_common_fpWen = _RANDOM[5'hA][21];
        data_common_vecWen = _RANDOM[5'hA][22];
        data_common_v0Wen = _RANDOM[5'hA][23];
        data_common_fpu_wflags = _RANDOM[5'hA][28];
        data_common_fpu_rm = _RANDOM[5'hB][10:8];
        data_common_vpu_vsew = _RANDOM[5'hB][15:14];
        data_common_dataSources_0_value = _RANDOM[5'h11][16:13];
        data_common_dataSources_1_value = _RANDOM[5'h11][20:17];
        data_common_dataSources_2_value = _RANDOM[5'h11][24:21];
        data_common_l1ExuOH_0_8 = _RANDOM[5'h12][1];
        data_common_l1ExuOH_0_9 = _RANDOM[5'h12][2];
        data_common_l1ExuOH_0_10 = _RANDOM[5'h12][3];
        data_common_l1ExuOH_0_11 = _RANDOM[5'h12][4];
        data_common_l1ExuOH_1_8 = _RANDOM[5'h12][29];
        data_common_l1ExuOH_1_9 = _RANDOM[5'h12][30];
        data_common_l1ExuOH_1_10 = _RANDOM[5'h12][31];
        data_common_l1ExuOH_1_11 = _RANDOM[5'h13][0];
        data_common_l1ExuOH_2_8 = _RANDOM[5'h13][25];
        data_common_l1ExuOH_2_9 = _RANDOM[5'h13][26];
        data_common_l1ExuOH_2_10 = _RANDOM[5'h13][27];
        data_common_l1ExuOH_2_11 = _RANDOM[5'h13][28];
        data_common_loadDependency_0 = _RANDOM[5'h14][23:22];
        data_common_loadDependency_1 = _RANDOM[5'h14][25:24];
        data_common_loadDependency_2 = _RANDOM[5'h14][27:26];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = io_in_ready_0;
  assign io_out_valid = valid;
  assign io_out_bits_rf_2_0_addr = data_rf_2_0_addr;
  assign io_out_bits_rf_1_0_addr = data_rf_1_0_addr;
  assign io_out_bits_rf_0_0_addr = data_rf_0_0_addr;
  assign io_out_bits_common_fuType = data_common_fuType;
  assign io_out_bits_common_fuOpType = data_common_fuOpType;
  assign io_out_bits_common_robIdx_flag = data_common_robIdx_flag;
  assign io_out_bits_common_robIdx_value = data_common_robIdx_value;
  assign io_out_bits_common_pdest = data_common_pdest;
  assign io_out_bits_common_rfWen = data_common_rfWen;
  assign io_out_bits_common_fpWen = data_common_fpWen;
  assign io_out_bits_common_vecWen = data_common_vecWen;
  assign io_out_bits_common_v0Wen = data_common_v0Wen;
  assign io_out_bits_common_fpu_wflags = data_common_fpu_wflags;
  assign io_out_bits_common_fpu_rm = data_common_fpu_rm;
  assign io_out_bits_common_vpu_vsew = data_common_vpu_vsew;
  assign io_out_bits_common_dataSources_0_value = data_common_dataSources_0_value;
  assign io_out_bits_common_dataSources_1_value = data_common_dataSources_1_value;
  assign io_out_bits_common_dataSources_2_value = data_common_dataSources_2_value;
  assign io_out_bits_common_l1ExuOH_0_8 = data_common_l1ExuOH_0_8;
  assign io_out_bits_common_l1ExuOH_0_9 = data_common_l1ExuOH_0_9;
  assign io_out_bits_common_l1ExuOH_0_10 = data_common_l1ExuOH_0_10;
  assign io_out_bits_common_l1ExuOH_0_11 = data_common_l1ExuOH_0_11;
  assign io_out_bits_common_l1ExuOH_1_8 = data_common_l1ExuOH_1_8;
  assign io_out_bits_common_l1ExuOH_1_9 = data_common_l1ExuOH_1_9;
  assign io_out_bits_common_l1ExuOH_1_10 = data_common_l1ExuOH_1_10;
  assign io_out_bits_common_l1ExuOH_1_11 = data_common_l1ExuOH_1_11;
  assign io_out_bits_common_l1ExuOH_2_8 = data_common_l1ExuOH_2_8;
  assign io_out_bits_common_l1ExuOH_2_9 = data_common_l1ExuOH_2_9;
  assign io_out_bits_common_l1ExuOH_2_10 = data_common_l1ExuOH_2_10;
  assign io_out_bits_common_l1ExuOH_2_11 = data_common_l1ExuOH_2_11;
  assign io_out_bits_common_loadDependency_0 = data_common_loadDependency_0;
  assign io_out_bits_common_loadDependency_1 = data_common_loadDependency_1;
  assign io_out_bits_common_loadDependency_2 = data_common_loadDependency_2;
endmodule

