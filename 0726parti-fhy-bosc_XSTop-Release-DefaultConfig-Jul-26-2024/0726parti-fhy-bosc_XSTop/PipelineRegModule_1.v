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
module PipelineRegModule_1(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input         io_in_bits_uop_exceptionVec_4,
  input         io_in_bits_uop_exceptionVec_5,
  input         io_in_bits_uop_exceptionVec_13,
  input         io_in_bits_uop_exceptionVec_21,
  input         io_in_bits_uop_preDecodeInfo_isRVC,
  input         io_in_bits_uop_ftqPtr_flag,
  input  [5:0]  io_in_bits_uop_ftqPtr_value,
  input  [3:0]  io_in_bits_uop_ftqOffset,
  input  [34:0] io_in_bits_uop_fuType,
  input  [8:0]  io_in_bits_uop_fuOpType,
  input         io_in_bits_uop_rfWen,
  input         io_in_bits_uop_fpWen,
  input         io_in_bits_uop_flushPipe,
  input  [6:0]  io_in_bits_uop_uopIdx,
  input  [7:0]  io_in_bits_uop_pdest,
  input         io_in_bits_uop_robIdx_flag,
  input  [7:0]  io_in_bits_uop_robIdx_value,
  input         io_in_bits_uop_storeSetHit,
  input         io_in_bits_uop_waitForRobIdx_flag,
  input  [7:0]  io_in_bits_uop_waitForRobIdx_value,
  input         io_in_bits_uop_loadWaitBit,
  input         io_in_bits_uop_loadWaitStrict,
  input         io_in_bits_uop_lqIdx_flag,
  input  [6:0]  io_in_bits_uop_lqIdx_value,
  input         io_in_bits_uop_sqIdx_flag,
  input  [5:0]  io_in_bits_uop_sqIdx_value,
  input         io_in_bits_uop_replayInst,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_uop_exceptionVec_4,
  output        io_out_bits_uop_exceptionVec_5,
  output        io_out_bits_uop_exceptionVec_13,
  output        io_out_bits_uop_exceptionVec_21,
  output        io_out_bits_uop_preDecodeInfo_isRVC,
  output        io_out_bits_uop_ftqPtr_flag,
  output [5:0]  io_out_bits_uop_ftqPtr_value,
  output [3:0]  io_out_bits_uop_ftqOffset,
  output [34:0] io_out_bits_uop_fuType,
  output [8:0]  io_out_bits_uop_fuOpType,
  output        io_out_bits_uop_rfWen,
  output        io_out_bits_uop_fpWen,
  output        io_out_bits_uop_flushPipe,
  output [6:0]  io_out_bits_uop_uopIdx,
  output [7:0]  io_out_bits_uop_pdest,
  output        io_out_bits_uop_robIdx_flag,
  output [7:0]  io_out_bits_uop_robIdx_value,
  output        io_out_bits_uop_storeSetHit,
  output        io_out_bits_uop_waitForRobIdx_flag,
  output [7:0]  io_out_bits_uop_waitForRobIdx_value,
  output        io_out_bits_uop_loadWaitBit,
  output        io_out_bits_uop_loadWaitStrict,
  output        io_out_bits_uop_lqIdx_flag,
  output [6:0]  io_out_bits_uop_lqIdx_value,
  output        io_out_bits_uop_sqIdx_flag,
  output [5:0]  io_out_bits_uop_sqIdx_value,
  output        io_out_bits_uop_replayInst
);

  wire        io_in_ready_0;
  reg         pipeline_reg_valid;
  wire        _io_out_bits_T = io_in_ready_0 & io_in_valid;
  assign io_in_ready_0 = ~pipeline_reg_valid | io_out_ready;
  reg         io_out_bits_r_uop_exceptionVec_4;
  reg         io_out_bits_r_uop_exceptionVec_5;
  reg         io_out_bits_r_uop_exceptionVec_13;
  reg         io_out_bits_r_uop_exceptionVec_21;
  reg         io_out_bits_r_uop_preDecodeInfo_isRVC;
  reg         io_out_bits_r_uop_ftqPtr_flag;
  reg  [5:0]  io_out_bits_r_uop_ftqPtr_value;
  reg  [3:0]  io_out_bits_r_uop_ftqOffset;
  reg  [34:0] io_out_bits_r_uop_fuType;
  reg  [8:0]  io_out_bits_r_uop_fuOpType;
  reg         io_out_bits_r_uop_rfWen;
  reg         io_out_bits_r_uop_fpWen;
  reg         io_out_bits_r_uop_flushPipe;
  reg  [6:0]  io_out_bits_r_uop_uopIdx;
  reg  [7:0]  io_out_bits_r_uop_pdest;
  reg         io_out_bits_r_uop_robIdx_flag;
  reg  [7:0]  io_out_bits_r_uop_robIdx_value;
  reg         io_out_bits_r_uop_storeSetHit;
  reg         io_out_bits_r_uop_waitForRobIdx_flag;
  reg  [7:0]  io_out_bits_r_uop_waitForRobIdx_value;
  reg         io_out_bits_r_uop_loadWaitBit;
  reg         io_out_bits_r_uop_loadWaitStrict;
  reg         io_out_bits_r_uop_lqIdx_flag;
  reg  [6:0]  io_out_bits_r_uop_lqIdx_value;
  reg         io_out_bits_r_uop_sqIdx_flag;
  reg  [5:0]  io_out_bits_r_uop_sqIdx_value;
  reg         io_out_bits_r_uop_replayInst;
  always @(posedge clock or posedge reset) begin
    if (reset)
      pipeline_reg_valid <= 1'h0;
    else
      pipeline_reg_valid <=
        _io_out_bits_T | ~(io_out_ready & pipeline_reg_valid) & pipeline_reg_valid;
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_io_out_bits_T) begin
      io_out_bits_r_uop_exceptionVec_4 <= io_in_bits_uop_exceptionVec_4;
      io_out_bits_r_uop_exceptionVec_5 <= io_in_bits_uop_exceptionVec_5;
      io_out_bits_r_uop_exceptionVec_13 <= io_in_bits_uop_exceptionVec_13;
      io_out_bits_r_uop_exceptionVec_21 <= io_in_bits_uop_exceptionVec_21;
      io_out_bits_r_uop_preDecodeInfo_isRVC <= io_in_bits_uop_preDecodeInfo_isRVC;
      io_out_bits_r_uop_ftqPtr_flag <= io_in_bits_uop_ftqPtr_flag;
      io_out_bits_r_uop_ftqPtr_value <= io_in_bits_uop_ftqPtr_value;
      io_out_bits_r_uop_ftqOffset <= io_in_bits_uop_ftqOffset;
      io_out_bits_r_uop_fuType <= io_in_bits_uop_fuType;
      io_out_bits_r_uop_fuOpType <= io_in_bits_uop_fuOpType;
      io_out_bits_r_uop_rfWen <= io_in_bits_uop_rfWen;
      io_out_bits_r_uop_fpWen <= io_in_bits_uop_fpWen;
      io_out_bits_r_uop_flushPipe <= io_in_bits_uop_flushPipe;
      io_out_bits_r_uop_uopIdx <= io_in_bits_uop_uopIdx;
      io_out_bits_r_uop_pdest <= io_in_bits_uop_pdest;
      io_out_bits_r_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag;
      io_out_bits_r_uop_robIdx_value <= io_in_bits_uop_robIdx_value;
      io_out_bits_r_uop_storeSetHit <= io_in_bits_uop_storeSetHit;
      io_out_bits_r_uop_waitForRobIdx_flag <= io_in_bits_uop_waitForRobIdx_flag;
      io_out_bits_r_uop_waitForRobIdx_value <= io_in_bits_uop_waitForRobIdx_value;
      io_out_bits_r_uop_loadWaitBit <= io_in_bits_uop_loadWaitBit;
      io_out_bits_r_uop_loadWaitStrict <= io_in_bits_uop_loadWaitStrict;
      io_out_bits_r_uop_lqIdx_flag <= io_in_bits_uop_lqIdx_flag;
      io_out_bits_r_uop_lqIdx_value <= io_in_bits_uop_lqIdx_value;
      io_out_bits_r_uop_sqIdx_flag <= io_in_bits_uop_sqIdx_flag;
      io_out_bits_r_uop_sqIdx_value <= io_in_bits_uop_sqIdx_value;
      io_out_bits_r_uop_replayInst <= io_in_bits_uop_replayInst;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:37];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [5:0] i = 6'h0; i < 6'h26; i += 6'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        pipeline_reg_valid = _RANDOM[6'h0][0];
        io_out_bits_r_uop_exceptionVec_4 = _RANDOM[6'h2][24];
        io_out_bits_r_uop_exceptionVec_5 = _RANDOM[6'h2][25];
        io_out_bits_r_uop_exceptionVec_13 = _RANDOM[6'h3][1];
        io_out_bits_r_uop_exceptionVec_21 = _RANDOM[6'h3][9];
        io_out_bits_r_uop_preDecodeInfo_isRVC = _RANDOM[6'h3][30];
        io_out_bits_r_uop_ftqPtr_flag = _RANDOM[6'h4][5];
        io_out_bits_r_uop_ftqPtr_value = _RANDOM[6'h4][11:6];
        io_out_bits_r_uop_ftqOffset = _RANDOM[6'h4][15:12];
        io_out_bits_r_uop_fuType = {_RANDOM[6'h5][31:10], _RANDOM[6'h6][12:0]};
        io_out_bits_r_uop_fuOpType = _RANDOM[6'h6][21:13];
        io_out_bits_r_uop_rfWen = _RANDOM[6'h6][22];
        io_out_bits_r_uop_fpWen = _RANDOM[6'h6][23];
        io_out_bits_r_uop_flushPipe = _RANDOM[6'h6][30];
        io_out_bits_r_uop_uopIdx = {_RANDOM[6'hE][31:28], _RANDOM[6'hF][2:0]};
        io_out_bits_r_uop_pdest = _RANDOM[6'h12][9:2];
        io_out_bits_r_uop_robIdx_flag = _RANDOM[6'h12][10];
        io_out_bits_r_uop_robIdx_value = _RANDOM[6'h12][18:11];
        io_out_bits_r_uop_storeSetHit = _RANDOM[6'h24][27];
        io_out_bits_r_uop_waitForRobIdx_flag = _RANDOM[6'h24][28];
        io_out_bits_r_uop_waitForRobIdx_value =
          {_RANDOM[6'h24][31:29], _RANDOM[6'h25][4:0]};
        io_out_bits_r_uop_loadWaitBit = _RANDOM[6'h25][5];
        io_out_bits_r_uop_loadWaitStrict = _RANDOM[6'h25][6];
        io_out_bits_r_uop_lqIdx_flag = _RANDOM[6'h25][12];
        io_out_bits_r_uop_lqIdx_value = _RANDOM[6'h25][19:13];
        io_out_bits_r_uop_sqIdx_flag = _RANDOM[6'h25][20];
        io_out_bits_r_uop_sqIdx_value = _RANDOM[6'h25][26:21];
        io_out_bits_r_uop_replayInst = _RANDOM[6'h25][28];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        pipeline_reg_valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = io_in_ready_0;
  assign io_out_valid = pipeline_reg_valid;
  assign io_out_bits_uop_exceptionVec_4 = io_out_bits_r_uop_exceptionVec_4;
  assign io_out_bits_uop_exceptionVec_5 = io_out_bits_r_uop_exceptionVec_5;
  assign io_out_bits_uop_exceptionVec_13 = io_out_bits_r_uop_exceptionVec_13;
  assign io_out_bits_uop_exceptionVec_21 = io_out_bits_r_uop_exceptionVec_21;
  assign io_out_bits_uop_preDecodeInfo_isRVC = io_out_bits_r_uop_preDecodeInfo_isRVC;
  assign io_out_bits_uop_ftqPtr_flag = io_out_bits_r_uop_ftqPtr_flag;
  assign io_out_bits_uop_ftqPtr_value = io_out_bits_r_uop_ftqPtr_value;
  assign io_out_bits_uop_ftqOffset = io_out_bits_r_uop_ftqOffset;
  assign io_out_bits_uop_fuType = io_out_bits_r_uop_fuType;
  assign io_out_bits_uop_fuOpType = io_out_bits_r_uop_fuOpType;
  assign io_out_bits_uop_rfWen = io_out_bits_r_uop_rfWen;
  assign io_out_bits_uop_fpWen = io_out_bits_r_uop_fpWen;
  assign io_out_bits_uop_flushPipe = io_out_bits_r_uop_flushPipe;
  assign io_out_bits_uop_uopIdx = io_out_bits_r_uop_uopIdx;
  assign io_out_bits_uop_pdest = io_out_bits_r_uop_pdest;
  assign io_out_bits_uop_robIdx_flag = io_out_bits_r_uop_robIdx_flag;
  assign io_out_bits_uop_robIdx_value = io_out_bits_r_uop_robIdx_value;
  assign io_out_bits_uop_storeSetHit = io_out_bits_r_uop_storeSetHit;
  assign io_out_bits_uop_waitForRobIdx_flag = io_out_bits_r_uop_waitForRobIdx_flag;
  assign io_out_bits_uop_waitForRobIdx_value = io_out_bits_r_uop_waitForRobIdx_value;
  assign io_out_bits_uop_loadWaitBit = io_out_bits_r_uop_loadWaitBit;
  assign io_out_bits_uop_loadWaitStrict = io_out_bits_r_uop_loadWaitStrict;
  assign io_out_bits_uop_lqIdx_flag = io_out_bits_r_uop_lqIdx_flag;
  assign io_out_bits_uop_lqIdx_value = io_out_bits_r_uop_lqIdx_value;
  assign io_out_bits_uop_sqIdx_flag = io_out_bits_r_uop_sqIdx_flag;
  assign io_out_bits_uop_sqIdx_value = io_out_bits_r_uop_sqIdx_value;
  assign io_out_bits_uop_replayInst = io_out_bits_r_uop_replayInst;
endmodule

