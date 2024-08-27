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
module NewPipelineConnectPipe_14(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [6:0]  io_in_bits_rf_4_0_addr,
  input  [6:0]  io_in_bits_rf_3_0_addr,
  input  [6:0]  io_in_bits_rf_2_0_addr,
  input  [6:0]  io_in_bits_rf_1_0_addr,
  input  [6:0]  io_in_bits_rf_0_0_addr,
  input  [34:0] io_in_bits_common_fuType,
  input  [8:0]  io_in_bits_common_fuOpType,
  input         io_in_bits_common_robIdx_flag,
  input  [7:0]  io_in_bits_common_robIdx_value,
  input  [6:0]  io_in_bits_common_pdest,
  input         io_in_bits_common_vecWen,
  input         io_in_bits_common_v0Wen,
  input         io_in_bits_common_fpu_wflags,
  input         io_in_bits_common_vpu_vma,
  input         io_in_bits_common_vpu_vta,
  input  [1:0]  io_in_bits_common_vpu_vsew,
  input  [2:0]  io_in_bits_common_vpu_vlmul,
  input         io_in_bits_common_vpu_vm,
  input  [7:0]  io_in_bits_common_vpu_vstart,
  input  [6:0]  io_in_bits_common_vpu_vuopIdx,
  input         io_in_bits_common_vpu_isExt,
  input         io_in_bits_common_vpu_isNarrow,
  input         io_in_bits_common_vpu_isDstMask,
  input         io_in_bits_common_vpu_isOpMask,
  input  [3:0]  io_in_bits_common_dataSources_0_value,
  input  [3:0]  io_in_bits_common_dataSources_1_value,
  input  [3:0]  io_in_bits_common_dataSources_2_value,
  input  [3:0]  io_in_bits_common_dataSources_3_value,
  input  [3:0]  io_in_bits_common_dataSources_4_value,
  input         io_out_ready,
  output        io_out_valid,
  output [6:0]  io_out_bits_rf_4_0_addr,
  output [6:0]  io_out_bits_rf_3_0_addr,
  output [6:0]  io_out_bits_rf_2_0_addr,
  output [6:0]  io_out_bits_rf_1_0_addr,
  output [6:0]  io_out_bits_rf_0_0_addr,
  output [34:0] io_out_bits_common_fuType,
  output [8:0]  io_out_bits_common_fuOpType,
  output        io_out_bits_common_robIdx_flag,
  output [7:0]  io_out_bits_common_robIdx_value,
  output [6:0]  io_out_bits_common_pdest,
  output        io_out_bits_common_vecWen,
  output        io_out_bits_common_v0Wen,
  output        io_out_bits_common_fpu_wflags,
  output        io_out_bits_common_vpu_vma,
  output        io_out_bits_common_vpu_vta,
  output [1:0]  io_out_bits_common_vpu_vsew,
  output [2:0]  io_out_bits_common_vpu_vlmul,
  output        io_out_bits_common_vpu_vm,
  output [7:0]  io_out_bits_common_vpu_vstart,
  output [6:0]  io_out_bits_common_vpu_vuopIdx,
  output        io_out_bits_common_vpu_isExt,
  output        io_out_bits_common_vpu_isNarrow,
  output        io_out_bits_common_vpu_isDstMask,
  output        io_out_bits_common_vpu_isOpMask,
  output [3:0]  io_out_bits_common_dataSources_0_value,
  output [3:0]  io_out_bits_common_dataSources_1_value,
  output [3:0]  io_out_bits_common_dataSources_2_value,
  output [3:0]  io_out_bits_common_dataSources_3_value,
  output [3:0]  io_out_bits_common_dataSources_4_value
);

  reg         valid;
  wire        io_in_ready_0 = io_out_ready | ~valid;
  wire        _data_T = io_in_ready_0 & io_in_valid;
  reg  [6:0]  data_rf_4_0_addr;
  reg  [6:0]  data_rf_3_0_addr;
  reg  [6:0]  data_rf_2_0_addr;
  reg  [6:0]  data_rf_1_0_addr;
  reg  [6:0]  data_rf_0_0_addr;
  reg  [34:0] data_common_fuType;
  reg  [8:0]  data_common_fuOpType;
  reg         data_common_robIdx_flag;
  reg  [7:0]  data_common_robIdx_value;
  reg  [6:0]  data_common_pdest;
  reg         data_common_vecWen;
  reg         data_common_v0Wen;
  reg         data_common_fpu_wflags;
  reg         data_common_vpu_vma;
  reg         data_common_vpu_vta;
  reg  [1:0]  data_common_vpu_vsew;
  reg  [2:0]  data_common_vpu_vlmul;
  reg         data_common_vpu_vm;
  reg  [7:0]  data_common_vpu_vstart;
  reg  [6:0]  data_common_vpu_vuopIdx;
  reg         data_common_vpu_isExt;
  reg         data_common_vpu_isNarrow;
  reg         data_common_vpu_isDstMask;
  reg         data_common_vpu_isOpMask;
  reg  [3:0]  data_common_dataSources_0_value;
  reg  [3:0]  data_common_dataSources_1_value;
  reg  [3:0]  data_common_dataSources_2_value;
  reg  [3:0]  data_common_dataSources_3_value;
  reg  [3:0]  data_common_dataSources_4_value;
  always @(posedge clock or posedge reset) begin
    if (reset)
      valid <= 1'h0;
    else
      valid <= _data_T;
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_data_T) begin
      data_rf_4_0_addr <= io_in_bits_rf_4_0_addr;
      data_rf_3_0_addr <= io_in_bits_rf_3_0_addr;
      data_rf_2_0_addr <= io_in_bits_rf_2_0_addr;
      data_rf_1_0_addr <= io_in_bits_rf_1_0_addr;
      data_rf_0_0_addr <= io_in_bits_rf_0_0_addr;
      data_common_fuType <= io_in_bits_common_fuType;
      data_common_fuOpType <= io_in_bits_common_fuOpType;
      data_common_robIdx_flag <= io_in_bits_common_robIdx_flag;
      data_common_robIdx_value <= io_in_bits_common_robIdx_value;
      data_common_pdest <= io_in_bits_common_pdest;
      data_common_vecWen <= io_in_bits_common_vecWen;
      data_common_v0Wen <= io_in_bits_common_v0Wen;
      data_common_fpu_wflags <= io_in_bits_common_fpu_wflags;
      data_common_vpu_vma <= io_in_bits_common_vpu_vma;
      data_common_vpu_vta <= io_in_bits_common_vpu_vta;
      data_common_vpu_vsew <= io_in_bits_common_vpu_vsew;
      data_common_vpu_vlmul <= io_in_bits_common_vpu_vlmul;
      data_common_vpu_vm <= io_in_bits_common_vpu_vm;
      data_common_vpu_vstart <= io_in_bits_common_vpu_vstart;
      data_common_vpu_vuopIdx <= io_in_bits_common_vpu_vuopIdx;
      data_common_vpu_isExt <= io_in_bits_common_vpu_isExt;
      data_common_vpu_isNarrow <= io_in_bits_common_vpu_isNarrow;
      data_common_vpu_isDstMask <= io_in_bits_common_vpu_isDstMask;
      data_common_vpu_isOpMask <= io_in_bits_common_vpu_isOpMask;
      data_common_dataSources_0_value <= io_in_bits_common_dataSources_0_value;
      data_common_dataSources_1_value <= io_in_bits_common_dataSources_1_value;
      data_common_dataSources_2_value <= io_in_bits_common_dataSources_2_value;
      data_common_dataSources_3_value <= io_in_bits_common_dataSources_3_value;
      data_common_dataSources_4_value <= io_in_bits_common_dataSources_4_value;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:32];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [5:0] i = 6'h0; i < 6'h21; i += 6'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        valid = _RANDOM[6'h0][0];
        data_rf_4_0_addr = _RANDOM[6'h0][7:1];
        data_rf_3_0_addr = _RANDOM[6'h0][17:11];
        data_rf_2_0_addr = _RANDOM[6'h0][27:21];
        data_rf_1_0_addr = {_RANDOM[6'h0][31], _RANDOM[6'h1][5:0]};
        data_rf_0_0_addr = _RANDOM[6'h1][15:9];
        data_common_fuType = {_RANDOM[6'h2][31:11], _RANDOM[6'h3][13:0]};
        data_common_fuOpType = _RANDOM[6'h3][22:14];
        data_common_robIdx_flag = _RANDOM[6'h18][23];
        data_common_robIdx_value = _RANDOM[6'h18][31:24];
        data_common_pdest = _RANDOM[6'h19][11:5];
        data_common_vecWen = _RANDOM[6'h19][12];
        data_common_v0Wen = _RANDOM[6'h19][13];
        data_common_fpu_wflags = _RANDOM[6'h19][18];
        data_common_vpu_vma = _RANDOM[6'h1A][2];
        data_common_vpu_vta = _RANDOM[6'h1A][3];
        data_common_vpu_vsew = _RANDOM[6'h1A][5:4];
        data_common_vpu_vlmul = _RANDOM[6'h1A][8:6];
        data_common_vpu_vm = _RANDOM[6'h1A][17];
        data_common_vpu_vstart = _RANDOM[6'h1A][25:18];
        data_common_vpu_vuopIdx = _RANDOM[6'h1B][12:6];
        data_common_vpu_isExt = _RANDOM[6'h1F][28];
        data_common_vpu_isNarrow = _RANDOM[6'h1F][29];
        data_common_vpu_isDstMask = _RANDOM[6'h1F][30];
        data_common_vpu_isOpMask = _RANDOM[6'h1F][31];
        data_common_dataSources_0_value = _RANDOM[6'h20][6:3];
        data_common_dataSources_1_value = _RANDOM[6'h20][10:7];
        data_common_dataSources_2_value = _RANDOM[6'h20][14:11];
        data_common_dataSources_3_value = _RANDOM[6'h20][18:15];
        data_common_dataSources_4_value = _RANDOM[6'h20][22:19];
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
  assign io_out_bits_rf_4_0_addr = data_rf_4_0_addr;
  assign io_out_bits_rf_3_0_addr = data_rf_3_0_addr;
  assign io_out_bits_rf_2_0_addr = data_rf_2_0_addr;
  assign io_out_bits_rf_1_0_addr = data_rf_1_0_addr;
  assign io_out_bits_rf_0_0_addr = data_rf_0_0_addr;
  assign io_out_bits_common_fuType = data_common_fuType;
  assign io_out_bits_common_fuOpType = data_common_fuOpType;
  assign io_out_bits_common_robIdx_flag = data_common_robIdx_flag;
  assign io_out_bits_common_robIdx_value = data_common_robIdx_value;
  assign io_out_bits_common_pdest = data_common_pdest;
  assign io_out_bits_common_vecWen = data_common_vecWen;
  assign io_out_bits_common_v0Wen = data_common_v0Wen;
  assign io_out_bits_common_fpu_wflags = data_common_fpu_wflags;
  assign io_out_bits_common_vpu_vma = data_common_vpu_vma;
  assign io_out_bits_common_vpu_vta = data_common_vpu_vta;
  assign io_out_bits_common_vpu_vsew = data_common_vpu_vsew;
  assign io_out_bits_common_vpu_vlmul = data_common_vpu_vlmul;
  assign io_out_bits_common_vpu_vm = data_common_vpu_vm;
  assign io_out_bits_common_vpu_vstart = data_common_vpu_vstart;
  assign io_out_bits_common_vpu_vuopIdx = data_common_vpu_vuopIdx;
  assign io_out_bits_common_vpu_isExt = data_common_vpu_isExt;
  assign io_out_bits_common_vpu_isNarrow = data_common_vpu_isNarrow;
  assign io_out_bits_common_vpu_isDstMask = data_common_vpu_isDstMask;
  assign io_out_bits_common_vpu_isOpMask = data_common_vpu_isOpMask;
  assign io_out_bits_common_dataSources_0_value = data_common_dataSources_0_value;
  assign io_out_bits_common_dataSources_1_value = data_common_dataSources_1_value;
  assign io_out_bits_common_dataSources_2_value = data_common_dataSources_2_value;
  assign io_out_bits_common_dataSources_3_value = data_common_dataSources_3_value;
  assign io_out_bits_common_dataSources_4_value = data_common_dataSources_4_value;
endmodule

