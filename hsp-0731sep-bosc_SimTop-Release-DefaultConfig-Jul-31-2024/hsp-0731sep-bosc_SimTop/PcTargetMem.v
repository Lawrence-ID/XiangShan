// Generated by CIRCT firtool-1.62.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
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
// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS
// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS
module PcTargetMem(
  input         clock,
  input         reset,
  input         io_fromFrontendFtq_pc_mem_wen,
  input         io_fromFrontendFtq_pc_mem_waddr_flag,
  input  [5:0]  io_fromFrontendFtq_pc_mem_waddr_value,
  input  [40:0] io_fromFrontendFtq_pc_mem_wdata_startAddr,
  input  [40:0] io_fromFrontendFtq_pc_mem_wdata_nextLineAddr,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_0,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_1,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_2,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_3,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_4,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_5,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_6,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_7,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_8,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_9,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_10,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_11,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_12,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_13,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_14,
  input         io_fromFrontendFtq_pc_mem_wdata_isNextMask_15,
  input         io_fromFrontendFtq_newest_entry_en,
  input  [40:0] io_fromFrontendFtq_newest_entry_target,
  input         io_fromFrontendFtq_newest_entry_ptr_flag,
  input  [5:0]  io_fromFrontendFtq_newest_entry_ptr_value,
  input         io_toDataPath_fromDataPathValid_0,
  input         io_toDataPath_fromDataPathValid_1,
  input         io_toDataPath_fromDataPathValid_2,
  input         io_toDataPath_fromDataPathFtqPtr_0_flag,
  input  [5:0]  io_toDataPath_fromDataPathFtqPtr_0_value,
  input         io_toDataPath_fromDataPathFtqPtr_1_flag,
  input  [5:0]  io_toDataPath_fromDataPathFtqPtr_1_value,
  input         io_toDataPath_fromDataPathFtqPtr_2_flag,
  input  [5:0]  io_toDataPath_fromDataPathFtqPtr_2_value,
  input  [3:0]  io_toDataPath_fromDataPathFtqOffset_0,
  input  [3:0]  io_toDataPath_fromDataPathFtqOffset_1,
  input  [3:0]  io_toDataPath_fromDataPathFtqOffset_2,
  output [38:0] io_toDataPath_toDataPathTargetPC_0,
  output [38:0] io_toDataPath_toDataPathTargetPC_1,
  output [38:0] io_toDataPath_toDataPathTargetPC_2,
  output [38:0] io_toDataPath_toDataPathPC_0,
  output [38:0] io_toDataPath_toDataPathPC_1,
  output [38:0] io_toDataPath_toDataPathPC_2
);

  wire [40:0] _targetMem_io_rdata_0_addr_startAddr;
  wire        _targetMem_io_rdata_0_flag;
  wire [40:0] _targetMem_io_rdata_1_addr_startAddr;
  wire        _targetMem_io_rdata_1_flag;
  wire [40:0] _targetMem_io_rdata_2_addr_startAddr;
  wire        _targetMem_io_rdata_2_flag;
  wire [40:0] _targetMem_io_rdata_4_addr_startAddr;
  wire [40:0] _targetMem_io_rdata_4_addr_nextLineAddr;
  wire        _targetMem_io_rdata_4_addr_isNextMask_0;
  wire        _targetMem_io_rdata_4_addr_isNextMask_1;
  wire        _targetMem_io_rdata_4_addr_isNextMask_2;
  wire        _targetMem_io_rdata_4_addr_isNextMask_3;
  wire        _targetMem_io_rdata_4_addr_isNextMask_4;
  wire        _targetMem_io_rdata_4_addr_isNextMask_5;
  wire        _targetMem_io_rdata_4_addr_isNextMask_6;
  wire        _targetMem_io_rdata_4_addr_isNextMask_7;
  wire        _targetMem_io_rdata_4_addr_isNextMask_8;
  wire        _targetMem_io_rdata_4_addr_isNextMask_9;
  wire        _targetMem_io_rdata_4_addr_isNextMask_10;
  wire        _targetMem_io_rdata_4_addr_isNextMask_11;
  wire        _targetMem_io_rdata_4_addr_isNextMask_12;
  wire        _targetMem_io_rdata_4_addr_isNextMask_13;
  wire        _targetMem_io_rdata_4_addr_isNextMask_14;
  wire        _targetMem_io_rdata_4_addr_isNextMask_15;
  wire [40:0] _targetMem_io_rdata_5_addr_startAddr;
  wire [40:0] _targetMem_io_rdata_5_addr_nextLineAddr;
  wire        _targetMem_io_rdata_5_addr_isNextMask_0;
  wire        _targetMem_io_rdata_5_addr_isNextMask_1;
  wire        _targetMem_io_rdata_5_addr_isNextMask_2;
  wire        _targetMem_io_rdata_5_addr_isNextMask_3;
  wire        _targetMem_io_rdata_5_addr_isNextMask_4;
  wire        _targetMem_io_rdata_5_addr_isNextMask_5;
  wire        _targetMem_io_rdata_5_addr_isNextMask_6;
  wire        _targetMem_io_rdata_5_addr_isNextMask_7;
  wire        _targetMem_io_rdata_5_addr_isNextMask_8;
  wire        _targetMem_io_rdata_5_addr_isNextMask_9;
  wire        _targetMem_io_rdata_5_addr_isNextMask_10;
  wire        _targetMem_io_rdata_5_addr_isNextMask_11;
  wire        _targetMem_io_rdata_5_addr_isNextMask_12;
  wire        _targetMem_io_rdata_5_addr_isNextMask_13;
  wire        _targetMem_io_rdata_5_addr_isNextMask_14;
  wire        _targetMem_io_rdata_5_addr_isNextMask_15;
  wire [40:0] _targetMem_io_rdata_6_addr_startAddr;
  wire [40:0] _targetMem_io_rdata_6_addr_nextLineAddr;
  wire        _targetMem_io_rdata_6_addr_isNextMask_0;
  wire        _targetMem_io_rdata_6_addr_isNextMask_1;
  wire        _targetMem_io_rdata_6_addr_isNextMask_2;
  wire        _targetMem_io_rdata_6_addr_isNextMask_3;
  wire        _targetMem_io_rdata_6_addr_isNextMask_4;
  wire        _targetMem_io_rdata_6_addr_isNextMask_5;
  wire        _targetMem_io_rdata_6_addr_isNextMask_6;
  wire        _targetMem_io_rdata_6_addr_isNextMask_7;
  wire        _targetMem_io_rdata_6_addr_isNextMask_8;
  wire        _targetMem_io_rdata_6_addr_isNextMask_9;
  wire        _targetMem_io_rdata_6_addr_isNextMask_10;
  wire        _targetMem_io_rdata_6_addr_isNextMask_11;
  wire        _targetMem_io_rdata_6_addr_isNextMask_12;
  wire        _targetMem_io_rdata_6_addr_isNextMask_13;
  wire        _targetMem_io_rdata_6_addr_isNextMask_14;
  wire        _targetMem_io_rdata_6_addr_isNextMask_15;
  reg         targetMem_io_wen_0_last_REG;
  reg  [5:0]  targetMem_io_waddr_0_r;
  reg  [40:0] targetMem_io_wdata_0_r_addr_startAddr;
  reg  [40:0] targetMem_io_wdata_0_r_addr_nextLineAddr;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_0;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_1;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_2;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_3;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_4;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_5;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_6;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_7;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_8;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_9;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_10;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_11;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_12;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_13;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_14;
  reg         targetMem_io_wdata_0_r_addr_isNextMask_15;
  reg         targetMem_io_wdata_0_r_flag;
  reg         currentNewestFtqPtr_r_flag;
  reg  [5:0]  currentNewestFtqPtr_r_value;
  reg  [40:0] currentNewestTarget;
  reg         targetReadPtrVec_0_flag;
  reg         targetReadPtrVec_1_flag;
  reg         targetReadPtrVec_2_flag;
  reg         hitNewestFtqPtr;
  reg         hitNewestFtqPtr_1;
  reg         hitNewestFtqPtr_2;
  reg  [3:0]  pcVec_0_r;
  wire [15:0] _GEN =
    {{_targetMem_io_rdata_4_addr_isNextMask_15},
     {_targetMem_io_rdata_4_addr_isNextMask_14},
     {_targetMem_io_rdata_4_addr_isNextMask_13},
     {_targetMem_io_rdata_4_addr_isNextMask_12},
     {_targetMem_io_rdata_4_addr_isNextMask_11},
     {_targetMem_io_rdata_4_addr_isNextMask_10},
     {_targetMem_io_rdata_4_addr_isNextMask_9},
     {_targetMem_io_rdata_4_addr_isNextMask_8},
     {_targetMem_io_rdata_4_addr_isNextMask_7},
     {_targetMem_io_rdata_4_addr_isNextMask_6},
     {_targetMem_io_rdata_4_addr_isNextMask_5},
     {_targetMem_io_rdata_4_addr_isNextMask_4},
     {_targetMem_io_rdata_4_addr_isNextMask_3},
     {_targetMem_io_rdata_4_addr_isNextMask_2},
     {_targetMem_io_rdata_4_addr_isNextMask_1},
     {_targetMem_io_rdata_4_addr_isNextMask_0}};
  reg  [3:0]  pcVec_1_r;
  wire [15:0] _GEN_0 =
    {{_targetMem_io_rdata_5_addr_isNextMask_15},
     {_targetMem_io_rdata_5_addr_isNextMask_14},
     {_targetMem_io_rdata_5_addr_isNextMask_13},
     {_targetMem_io_rdata_5_addr_isNextMask_12},
     {_targetMem_io_rdata_5_addr_isNextMask_11},
     {_targetMem_io_rdata_5_addr_isNextMask_10},
     {_targetMem_io_rdata_5_addr_isNextMask_9},
     {_targetMem_io_rdata_5_addr_isNextMask_8},
     {_targetMem_io_rdata_5_addr_isNextMask_7},
     {_targetMem_io_rdata_5_addr_isNextMask_6},
     {_targetMem_io_rdata_5_addr_isNextMask_5},
     {_targetMem_io_rdata_5_addr_isNextMask_4},
     {_targetMem_io_rdata_5_addr_isNextMask_3},
     {_targetMem_io_rdata_5_addr_isNextMask_2},
     {_targetMem_io_rdata_5_addr_isNextMask_1},
     {_targetMem_io_rdata_5_addr_isNextMask_0}};
  reg  [3:0]  pcVec_2_r;
  wire [15:0] _GEN_1 =
    {{_targetMem_io_rdata_6_addr_isNextMask_15},
     {_targetMem_io_rdata_6_addr_isNextMask_14},
     {_targetMem_io_rdata_6_addr_isNextMask_13},
     {_targetMem_io_rdata_6_addr_isNextMask_12},
     {_targetMem_io_rdata_6_addr_isNextMask_11},
     {_targetMem_io_rdata_6_addr_isNextMask_10},
     {_targetMem_io_rdata_6_addr_isNextMask_9},
     {_targetMem_io_rdata_6_addr_isNextMask_8},
     {_targetMem_io_rdata_6_addr_isNextMask_7},
     {_targetMem_io_rdata_6_addr_isNextMask_6},
     {_targetMem_io_rdata_6_addr_isNextMask_5},
     {_targetMem_io_rdata_6_addr_isNextMask_4},
     {_targetMem_io_rdata_6_addr_isNextMask_3},
     {_targetMem_io_rdata_6_addr_isNextMask_2},
     {_targetMem_io_rdata_6_addr_isNextMask_1},
     {_targetMem_io_rdata_6_addr_isNextMask_0}};
  wire [6:0]  _hitNewestFtqPtr_T_10 =
    {io_fromFrontendFtq_newest_entry_en
       ? io_fromFrontendFtq_newest_entry_ptr_flag
       : currentNewestFtqPtr_r_flag,
     io_fromFrontendFtq_newest_entry_en
       ? io_fromFrontendFtq_newest_entry_ptr_value
       : currentNewestFtqPtr_r_value};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      targetMem_io_wen_0_last_REG <= 1'h0;
      hitNewestFtqPtr <= 1'h0;
      hitNewestFtqPtr_1 <= 1'h0;
      hitNewestFtqPtr_2 <= 1'h0;
    end
    else begin
      targetMem_io_wen_0_last_REG <= io_fromFrontendFtq_pc_mem_wen;
      if (io_toDataPath_fromDataPathValid_0)
        hitNewestFtqPtr <=
          {io_toDataPath_fromDataPathFtqPtr_0_flag,
           io_toDataPath_fromDataPathFtqPtr_0_value} == _hitNewestFtqPtr_T_10;
      if (io_toDataPath_fromDataPathValid_1)
        hitNewestFtqPtr_1 <=
          {io_toDataPath_fromDataPathFtqPtr_1_flag,
           io_toDataPath_fromDataPathFtqPtr_1_value} == _hitNewestFtqPtr_T_10;
      if (io_toDataPath_fromDataPathValid_2)
        hitNewestFtqPtr_2 <=
          {io_toDataPath_fromDataPathFtqPtr_2_flag,
           io_toDataPath_fromDataPathFtqPtr_2_value} == _hitNewestFtqPtr_T_10;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_fromFrontendFtq_pc_mem_wen) begin
      targetMem_io_waddr_0_r <= io_fromFrontendFtq_pc_mem_waddr_value;
      targetMem_io_wdata_0_r_addr_startAddr <= io_fromFrontendFtq_pc_mem_wdata_startAddr;
      targetMem_io_wdata_0_r_addr_nextLineAddr <=
        io_fromFrontendFtq_pc_mem_wdata_nextLineAddr;
      targetMem_io_wdata_0_r_addr_isNextMask_0 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_0;
      targetMem_io_wdata_0_r_addr_isNextMask_1 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_1;
      targetMem_io_wdata_0_r_addr_isNextMask_2 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_2;
      targetMem_io_wdata_0_r_addr_isNextMask_3 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_3;
      targetMem_io_wdata_0_r_addr_isNextMask_4 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_4;
      targetMem_io_wdata_0_r_addr_isNextMask_5 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_5;
      targetMem_io_wdata_0_r_addr_isNextMask_6 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_6;
      targetMem_io_wdata_0_r_addr_isNextMask_7 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_7;
      targetMem_io_wdata_0_r_addr_isNextMask_8 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_8;
      targetMem_io_wdata_0_r_addr_isNextMask_9 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_9;
      targetMem_io_wdata_0_r_addr_isNextMask_10 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_10;
      targetMem_io_wdata_0_r_addr_isNextMask_11 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_11;
      targetMem_io_wdata_0_r_addr_isNextMask_12 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_12;
      targetMem_io_wdata_0_r_addr_isNextMask_13 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_13;
      targetMem_io_wdata_0_r_addr_isNextMask_14 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_14;
      targetMem_io_wdata_0_r_addr_isNextMask_15 <=
        io_fromFrontendFtq_pc_mem_wdata_isNextMask_15;
      targetMem_io_wdata_0_r_flag <= io_fromFrontendFtq_pc_mem_waddr_flag;
    end
    if (io_fromFrontendFtq_newest_entry_en) begin
      currentNewestFtqPtr_r_flag <= io_fromFrontendFtq_newest_entry_ptr_flag;
      currentNewestFtqPtr_r_value <= io_fromFrontendFtq_newest_entry_ptr_value;
      currentNewestTarget <= io_fromFrontendFtq_newest_entry_target;
    end
    if (io_toDataPath_fromDataPathValid_0) begin
      targetReadPtrVec_0_flag <= io_toDataPath_fromDataPathFtqPtr_0_flag;
      pcVec_0_r <= io_toDataPath_fromDataPathFtqOffset_0;
    end
    if (io_toDataPath_fromDataPathValid_1) begin
      targetReadPtrVec_1_flag <= io_toDataPath_fromDataPathFtqPtr_1_flag;
      pcVec_1_r <= io_toDataPath_fromDataPathFtqOffset_1;
    end
    if (io_toDataPath_fromDataPathValid_2) begin
      targetReadPtrVec_2_flag <= io_toDataPath_fromDataPathFtqPtr_2_flag;
      pcVec_2_r <= io_toDataPath_fromDataPathFtqOffset_2;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:6];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h7; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        targetMem_io_wen_0_last_REG = _RANDOM[3'h0][0];
        targetMem_io_waddr_0_r = _RANDOM[3'h0][6:1];
        targetMem_io_wdata_0_r_addr_startAddr =
          {_RANDOM[3'h0][31:7], _RANDOM[3'h1][15:0]};
        targetMem_io_wdata_0_r_addr_nextLineAddr =
          {_RANDOM[3'h1][31:16], _RANDOM[3'h2][24:0]};
        targetMem_io_wdata_0_r_addr_isNextMask_0 = _RANDOM[3'h2][25];
        targetMem_io_wdata_0_r_addr_isNextMask_1 = _RANDOM[3'h2][26];
        targetMem_io_wdata_0_r_addr_isNextMask_2 = _RANDOM[3'h2][27];
        targetMem_io_wdata_0_r_addr_isNextMask_3 = _RANDOM[3'h2][28];
        targetMem_io_wdata_0_r_addr_isNextMask_4 = _RANDOM[3'h2][29];
        targetMem_io_wdata_0_r_addr_isNextMask_5 = _RANDOM[3'h2][30];
        targetMem_io_wdata_0_r_addr_isNextMask_6 = _RANDOM[3'h2][31];
        targetMem_io_wdata_0_r_addr_isNextMask_7 = _RANDOM[3'h3][0];
        targetMem_io_wdata_0_r_addr_isNextMask_8 = _RANDOM[3'h3][1];
        targetMem_io_wdata_0_r_addr_isNextMask_9 = _RANDOM[3'h3][2];
        targetMem_io_wdata_0_r_addr_isNextMask_10 = _RANDOM[3'h3][3];
        targetMem_io_wdata_0_r_addr_isNextMask_11 = _RANDOM[3'h3][4];
        targetMem_io_wdata_0_r_addr_isNextMask_12 = _RANDOM[3'h3][5];
        targetMem_io_wdata_0_r_addr_isNextMask_13 = _RANDOM[3'h3][6];
        targetMem_io_wdata_0_r_addr_isNextMask_14 = _RANDOM[3'h3][7];
        targetMem_io_wdata_0_r_addr_isNextMask_15 = _RANDOM[3'h3][8];
        targetMem_io_wdata_0_r_flag = _RANDOM[3'h3][10];
        currentNewestFtqPtr_r_flag = _RANDOM[3'h3][11];
        currentNewestFtqPtr_r_value = _RANDOM[3'h3][17:12];
        currentNewestTarget = {_RANDOM[3'h3][31:18], _RANDOM[3'h4][26:0]};
        targetReadPtrVec_0_flag = _RANDOM[3'h4][27];
        targetReadPtrVec_1_flag = _RANDOM[3'h5][2];
        targetReadPtrVec_2_flag = _RANDOM[3'h5][9];
        hitNewestFtqPtr = _RANDOM[3'h5][23];
        hitNewestFtqPtr_1 = _RANDOM[3'h5][24];
        hitNewestFtqPtr_2 = _RANDOM[3'h5][25];
        pcVec_0_r = _RANDOM[3'h5][30:27];
        pcVec_1_r = {_RANDOM[3'h5][31], _RANDOM[3'h6][2:0]};
        pcVec_2_r = _RANDOM[3'h6][6:3];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        targetMem_io_wen_0_last_REG = 1'h0;
        hitNewestFtqPtr = 1'h0;
        hitNewestFtqPtr_1 = 1'h0;
        hitNewestFtqPtr_2 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SyncDataModuleTemplate__64entry_5 targetMem (
    .clock                         (clock),
    .reset                         (reset),
    .io_ren_0                      (io_toDataPath_fromDataPathValid_0),
    .io_ren_1                      (io_toDataPath_fromDataPathValid_1),
    .io_ren_2                      (io_toDataPath_fromDataPathValid_2),
    .io_ren_4                      (io_toDataPath_fromDataPathValid_0),
    .io_ren_5                      (io_toDataPath_fromDataPathValid_1),
    .io_ren_6                      (io_toDataPath_fromDataPathValid_2),
    .io_raddr_0                    (6'(io_toDataPath_fromDataPathFtqPtr_0_value + 6'h1)),
    .io_raddr_1                    (6'(io_toDataPath_fromDataPathFtqPtr_1_value + 6'h1)),
    .io_raddr_2                    (6'(io_toDataPath_fromDataPathFtqPtr_2_value + 6'h1)),
    .io_raddr_4                    (io_toDataPath_fromDataPathFtqPtr_0_value),
    .io_raddr_5                    (io_toDataPath_fromDataPathFtqPtr_1_value),
    .io_raddr_6                    (io_toDataPath_fromDataPathFtqPtr_2_value),
    .io_rdata_0_addr_startAddr     (_targetMem_io_rdata_0_addr_startAddr),
    .io_rdata_0_flag               (_targetMem_io_rdata_0_flag),
    .io_rdata_1_addr_startAddr     (_targetMem_io_rdata_1_addr_startAddr),
    .io_rdata_1_flag               (_targetMem_io_rdata_1_flag),
    .io_rdata_2_addr_startAddr     (_targetMem_io_rdata_2_addr_startAddr),
    .io_rdata_2_flag               (_targetMem_io_rdata_2_flag),
    .io_rdata_4_addr_startAddr     (_targetMem_io_rdata_4_addr_startAddr),
    .io_rdata_4_addr_nextLineAddr  (_targetMem_io_rdata_4_addr_nextLineAddr),
    .io_rdata_4_addr_isNextMask_0  (_targetMem_io_rdata_4_addr_isNextMask_0),
    .io_rdata_4_addr_isNextMask_1  (_targetMem_io_rdata_4_addr_isNextMask_1),
    .io_rdata_4_addr_isNextMask_2  (_targetMem_io_rdata_4_addr_isNextMask_2),
    .io_rdata_4_addr_isNextMask_3  (_targetMem_io_rdata_4_addr_isNextMask_3),
    .io_rdata_4_addr_isNextMask_4  (_targetMem_io_rdata_4_addr_isNextMask_4),
    .io_rdata_4_addr_isNextMask_5  (_targetMem_io_rdata_4_addr_isNextMask_5),
    .io_rdata_4_addr_isNextMask_6  (_targetMem_io_rdata_4_addr_isNextMask_6),
    .io_rdata_4_addr_isNextMask_7  (_targetMem_io_rdata_4_addr_isNextMask_7),
    .io_rdata_4_addr_isNextMask_8  (_targetMem_io_rdata_4_addr_isNextMask_8),
    .io_rdata_4_addr_isNextMask_9  (_targetMem_io_rdata_4_addr_isNextMask_9),
    .io_rdata_4_addr_isNextMask_10 (_targetMem_io_rdata_4_addr_isNextMask_10),
    .io_rdata_4_addr_isNextMask_11 (_targetMem_io_rdata_4_addr_isNextMask_11),
    .io_rdata_4_addr_isNextMask_12 (_targetMem_io_rdata_4_addr_isNextMask_12),
    .io_rdata_4_addr_isNextMask_13 (_targetMem_io_rdata_4_addr_isNextMask_13),
    .io_rdata_4_addr_isNextMask_14 (_targetMem_io_rdata_4_addr_isNextMask_14),
    .io_rdata_4_addr_isNextMask_15 (_targetMem_io_rdata_4_addr_isNextMask_15),
    .io_rdata_5_addr_startAddr     (_targetMem_io_rdata_5_addr_startAddr),
    .io_rdata_5_addr_nextLineAddr  (_targetMem_io_rdata_5_addr_nextLineAddr),
    .io_rdata_5_addr_isNextMask_0  (_targetMem_io_rdata_5_addr_isNextMask_0),
    .io_rdata_5_addr_isNextMask_1  (_targetMem_io_rdata_5_addr_isNextMask_1),
    .io_rdata_5_addr_isNextMask_2  (_targetMem_io_rdata_5_addr_isNextMask_2),
    .io_rdata_5_addr_isNextMask_3  (_targetMem_io_rdata_5_addr_isNextMask_3),
    .io_rdata_5_addr_isNextMask_4  (_targetMem_io_rdata_5_addr_isNextMask_4),
    .io_rdata_5_addr_isNextMask_5  (_targetMem_io_rdata_5_addr_isNextMask_5),
    .io_rdata_5_addr_isNextMask_6  (_targetMem_io_rdata_5_addr_isNextMask_6),
    .io_rdata_5_addr_isNextMask_7  (_targetMem_io_rdata_5_addr_isNextMask_7),
    .io_rdata_5_addr_isNextMask_8  (_targetMem_io_rdata_5_addr_isNextMask_8),
    .io_rdata_5_addr_isNextMask_9  (_targetMem_io_rdata_5_addr_isNextMask_9),
    .io_rdata_5_addr_isNextMask_10 (_targetMem_io_rdata_5_addr_isNextMask_10),
    .io_rdata_5_addr_isNextMask_11 (_targetMem_io_rdata_5_addr_isNextMask_11),
    .io_rdata_5_addr_isNextMask_12 (_targetMem_io_rdata_5_addr_isNextMask_12),
    .io_rdata_5_addr_isNextMask_13 (_targetMem_io_rdata_5_addr_isNextMask_13),
    .io_rdata_5_addr_isNextMask_14 (_targetMem_io_rdata_5_addr_isNextMask_14),
    .io_rdata_5_addr_isNextMask_15 (_targetMem_io_rdata_5_addr_isNextMask_15),
    .io_rdata_6_addr_startAddr     (_targetMem_io_rdata_6_addr_startAddr),
    .io_rdata_6_addr_nextLineAddr  (_targetMem_io_rdata_6_addr_nextLineAddr),
    .io_rdata_6_addr_isNextMask_0  (_targetMem_io_rdata_6_addr_isNextMask_0),
    .io_rdata_6_addr_isNextMask_1  (_targetMem_io_rdata_6_addr_isNextMask_1),
    .io_rdata_6_addr_isNextMask_2  (_targetMem_io_rdata_6_addr_isNextMask_2),
    .io_rdata_6_addr_isNextMask_3  (_targetMem_io_rdata_6_addr_isNextMask_3),
    .io_rdata_6_addr_isNextMask_4  (_targetMem_io_rdata_6_addr_isNextMask_4),
    .io_rdata_6_addr_isNextMask_5  (_targetMem_io_rdata_6_addr_isNextMask_5),
    .io_rdata_6_addr_isNextMask_6  (_targetMem_io_rdata_6_addr_isNextMask_6),
    .io_rdata_6_addr_isNextMask_7  (_targetMem_io_rdata_6_addr_isNextMask_7),
    .io_rdata_6_addr_isNextMask_8  (_targetMem_io_rdata_6_addr_isNextMask_8),
    .io_rdata_6_addr_isNextMask_9  (_targetMem_io_rdata_6_addr_isNextMask_9),
    .io_rdata_6_addr_isNextMask_10 (_targetMem_io_rdata_6_addr_isNextMask_10),
    .io_rdata_6_addr_isNextMask_11 (_targetMem_io_rdata_6_addr_isNextMask_11),
    .io_rdata_6_addr_isNextMask_12 (_targetMem_io_rdata_6_addr_isNextMask_12),
    .io_rdata_6_addr_isNextMask_13 (_targetMem_io_rdata_6_addr_isNextMask_13),
    .io_rdata_6_addr_isNextMask_14 (_targetMem_io_rdata_6_addr_isNextMask_14),
    .io_rdata_6_addr_isNextMask_15 (_targetMem_io_rdata_6_addr_isNextMask_15),
    .io_wen_0                      (targetMem_io_wen_0_last_REG),
    .io_waddr_0                    (targetMem_io_waddr_0_r),
    .io_wdata_0_addr_startAddr     (targetMem_io_wdata_0_r_addr_startAddr),
    .io_wdata_0_addr_nextLineAddr  (targetMem_io_wdata_0_r_addr_nextLineAddr),
    .io_wdata_0_addr_isNextMask_0  (targetMem_io_wdata_0_r_addr_isNextMask_0),
    .io_wdata_0_addr_isNextMask_1  (targetMem_io_wdata_0_r_addr_isNextMask_1),
    .io_wdata_0_addr_isNextMask_2  (targetMem_io_wdata_0_r_addr_isNextMask_2),
    .io_wdata_0_addr_isNextMask_3  (targetMem_io_wdata_0_r_addr_isNextMask_3),
    .io_wdata_0_addr_isNextMask_4  (targetMem_io_wdata_0_r_addr_isNextMask_4),
    .io_wdata_0_addr_isNextMask_5  (targetMem_io_wdata_0_r_addr_isNextMask_5),
    .io_wdata_0_addr_isNextMask_6  (targetMem_io_wdata_0_r_addr_isNextMask_6),
    .io_wdata_0_addr_isNextMask_7  (targetMem_io_wdata_0_r_addr_isNextMask_7),
    .io_wdata_0_addr_isNextMask_8  (targetMem_io_wdata_0_r_addr_isNextMask_8),
    .io_wdata_0_addr_isNextMask_9  (targetMem_io_wdata_0_r_addr_isNextMask_9),
    .io_wdata_0_addr_isNextMask_10 (targetMem_io_wdata_0_r_addr_isNextMask_10),
    .io_wdata_0_addr_isNextMask_11 (targetMem_io_wdata_0_r_addr_isNextMask_11),
    .io_wdata_0_addr_isNextMask_12 (targetMem_io_wdata_0_r_addr_isNextMask_12),
    .io_wdata_0_addr_isNextMask_13 (targetMem_io_wdata_0_r_addr_isNextMask_13),
    .io_wdata_0_addr_isNextMask_14 (targetMem_io_wdata_0_r_addr_isNextMask_14),
    .io_wdata_0_addr_isNextMask_15 (targetMem_io_wdata_0_r_addr_isNextMask_15),
    .io_wdata_0_flag               (targetMem_io_wdata_0_r_flag)
  );
  assign io_toDataPath_toDataPathTargetPC_0 =
    hitNewestFtqPtr
      ? currentNewestTarget[38:0]
      : _targetMem_io_rdata_0_flag == targetReadPtrVec_0_flag
          ? _targetMem_io_rdata_0_addr_startAddr[38:0]
          : 39'h7FFFFFFFFF;
  assign io_toDataPath_toDataPathTargetPC_1 =
    hitNewestFtqPtr_1
      ? currentNewestTarget[38:0]
      : _targetMem_io_rdata_1_flag == targetReadPtrVec_1_flag
          ? _targetMem_io_rdata_1_addr_startAddr[38:0]
          : 39'h7FFFFFFFFF;
  assign io_toDataPath_toDataPathTargetPC_2 =
    hitNewestFtqPtr_2
      ? currentNewestTarget[38:0]
      : _targetMem_io_rdata_2_flag == targetReadPtrVec_2_flag
          ? _targetMem_io_rdata_2_addr_startAddr[38:0]
          : 39'h7FFFFFFFFF;
  assign io_toDataPath_toDataPathPC_0 =
    {_GEN[pcVec_0_r] & _targetMem_io_rdata_4_addr_startAddr[5]
       ? _targetMem_io_rdata_4_addr_nextLineAddr[38:6]
       : _targetMem_io_rdata_4_addr_startAddr[38:6],
     5'(_targetMem_io_rdata_4_addr_startAddr[5:1] + {1'h0, pcVec_0_r}),
     1'h0};
  assign io_toDataPath_toDataPathPC_1 =
    {_GEN_0[pcVec_1_r] & _targetMem_io_rdata_5_addr_startAddr[5]
       ? _targetMem_io_rdata_5_addr_nextLineAddr[38:6]
       : _targetMem_io_rdata_5_addr_startAddr[38:6],
     5'(_targetMem_io_rdata_5_addr_startAddr[5:1] + {1'h0, pcVec_1_r}),
     1'h0};
  assign io_toDataPath_toDataPathPC_2 =
    {_GEN_1[pcVec_2_r] & _targetMem_io_rdata_6_addr_startAddr[5]
       ? _targetMem_io_rdata_6_addr_nextLineAddr[38:6]
       : _targetMem_io_rdata_6_addr_startAddr[38:6],
     5'(_targetMem_io_rdata_6_addr_startAddr[5:1] + {1'h0, pcVec_2_r}),
     1'h0};
endmodule

