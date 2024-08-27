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
module UncacheBufferEntry_2(
  input         clock,
  input         reset,
  input  [1:0]  io_id,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [7:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  input         io_req_valid,
  input         io_req_bits_uop_exceptionVec_4,
  input         io_req_bits_uop_exceptionVec_13,
  input         io_req_bits_uop_exceptionVec_21,
  input         io_req_bits_uop_preDecodeInfo_isRVC,
  input         io_req_bits_uop_ftqPtr_flag,
  input  [5:0]  io_req_bits_uop_ftqPtr_value,
  input  [3:0]  io_req_bits_uop_ftqOffset,
  input  [34:0] io_req_bits_uop_fuType,
  input  [8:0]  io_req_bits_uop_fuOpType,
  input         io_req_bits_uop_rfWen,
  input         io_req_bits_uop_fpWen,
  input  [6:0]  io_req_bits_uop_uopIdx,
  input  [7:0]  io_req_bits_uop_pdest,
  input         io_req_bits_uop_robIdx_flag,
  input  [7:0]  io_req_bits_uop_robIdx_value,
  input         io_req_bits_uop_storeSetHit,
  input         io_req_bits_uop_waitForRobIdx_flag,
  input  [7:0]  io_req_bits_uop_waitForRobIdx_value,
  input         io_req_bits_uop_loadWaitBit,
  input         io_req_bits_uop_loadWaitStrict,
  input         io_req_bits_uop_lqIdx_flag,
  input  [6:0]  io_req_bits_uop_lqIdx_value,
  input         io_req_bits_uop_sqIdx_flag,
  input  [5:0]  io_req_bits_uop_sqIdx_value,
  input         io_req_bits_uop_replayInst,
  input  [40:0] io_req_bits_vaddr,
  input  [35:0] io_req_bits_paddr,
  input  [40:0] io_req_bits_gpaddr,
  input  [15:0] io_req_bits_mask,
  input         io_req_bits_data_wen_dup_5,
  input         io_ldout_ready,
  output        io_ldout_valid,
  output        io_ldout_bits_uop_exceptionVec_4,
  output        io_ldout_bits_uop_exceptionVec_5,
  output        io_ldout_bits_uop_exceptionVec_13,
  output        io_ldout_bits_uop_exceptionVec_21,
  output        io_ldout_bits_uop_preDecodeInfo_isRVC,
  output        io_ldout_bits_uop_ftqPtr_flag,
  output [5:0]  io_ldout_bits_uop_ftqPtr_value,
  output [3:0]  io_ldout_bits_uop_ftqOffset,
  output [34:0] io_ldout_bits_uop_fuType,
  output [8:0]  io_ldout_bits_uop_fuOpType,
  output        io_ldout_bits_uop_rfWen,
  output        io_ldout_bits_uop_fpWen,
  output        io_ldout_bits_uop_flushPipe,
  output [6:0]  io_ldout_bits_uop_uopIdx,
  output [7:0]  io_ldout_bits_uop_pdest,
  output        io_ldout_bits_uop_robIdx_flag,
  output [7:0]  io_ldout_bits_uop_robIdx_value,
  output        io_ldout_bits_uop_storeSetHit,
  output        io_ldout_bits_uop_waitForRobIdx_flag,
  output [7:0]  io_ldout_bits_uop_waitForRobIdx_value,
  output        io_ldout_bits_uop_loadWaitBit,
  output        io_ldout_bits_uop_loadWaitStrict,
  output        io_ldout_bits_uop_lqIdx_flag,
  output [6:0]  io_ldout_bits_uop_lqIdx_value,
  output        io_ldout_bits_uop_sqIdx_flag,
  output [5:0]  io_ldout_bits_uop_sqIdx_value,
  output        io_ldout_bits_uop_replayInst,
  output [63:0] io_ld_raw_data_lqData,
  output [8:0]  io_ld_raw_data_uop_fuOpType,
  output        io_ld_raw_data_uop_fpWen,
  output [2:0]  io_ld_raw_data_addrOffset,
  input         io_rob_pendingld,
  input         io_rob_pendingPtr_flag,
  input  [7:0]  io_rob_pendingPtr_value,
  input         io_uncache_req_ready,
  output        io_uncache_req_valid,
  output [35:0] io_uncache_req_bits_addr,
  output [7:0]  io_uncache_req_bits_mask,
  output [6:0]  io_uncache_req_bits_id,
  input         io_uncache_resp_valid,
  input  [63:0] io_uncache_resp_bits_data,
  input         io_uncache_resp_bits_nderr,
  input         io_trigger_hitLoadAddrTriggerHitVec_0,
  input         io_trigger_hitLoadAddrTriggerHitVec_1,
  input         io_trigger_hitLoadAddrTriggerHitVec_2,
  input         io_trigger_hitLoadAddrTriggerHitVec_3,
  output        io_trigger_lqLoadAddrTriggerHitVec_0,
  output        io_trigger_lqLoadAddrTriggerHitVec_1,
  output        io_trigger_lqLoadAddrTriggerHitVec_2,
  output        io_trigger_lqLoadAddrTriggerHitVec_3,
  output        io_select,
  output        io_flush,
  output        io_exception_valid,
  output        io_exception_bits_uop_exceptionVec_4,
  output        io_exception_bits_uop_exceptionVec_5,
  output        io_exception_bits_uop_exceptionVec_13,
  output        io_exception_bits_uop_exceptionVec_21,
  output [6:0]  io_exception_bits_uop_uopIdx,
  output        io_exception_bits_uop_robIdx_flag,
  output [7:0]  io_exception_bits_uop_robIdx_value,
  output [40:0] io_exception_bits_vaddr,
  output [40:0] io_exception_bits_gpaddr
);

  reg             req_valid;
  reg             req_uop_exceptionVec_4;
  reg             req_uop_exceptionVec_13;
  reg             req_uop_exceptionVec_21;
  reg             req_uop_preDecodeInfo_isRVC;
  reg             req_uop_ftqPtr_flag;
  reg  [5:0]      req_uop_ftqPtr_value;
  reg  [3:0]      req_uop_ftqOffset;
  reg  [34:0]     req_uop_fuType;
  reg  [8:0]      req_uop_fuOpType;
  reg             req_uop_rfWen;
  reg             req_uop_fpWen;
  reg             req_uop_flushPipe;
  reg  [6:0]      req_uop_uopIdx;
  reg  [7:0]      req_uop_pdest;
  reg             req_uop_robIdx_flag;
  reg  [7:0]      req_uop_robIdx_value;
  reg             req_uop_storeSetHit;
  reg             req_uop_waitForRobIdx_flag;
  reg  [7:0]      req_uop_waitForRobIdx_value;
  reg             req_uop_loadWaitBit;
  reg             req_uop_loadWaitStrict;
  reg             req_uop_lqIdx_flag;
  reg  [6:0]      req_uop_lqIdx_value;
  reg             req_uop_sqIdx_flag;
  reg  [5:0]      req_uop_sqIdx_value;
  reg             req_uop_replayInst;
  reg  [40:0]     req_vaddr;
  reg  [35:0]     req_paddr;
  reg  [40:0]     req_gpaddr;
  reg  [15:0]     req_mask;
  reg             triggerResult_0;
  reg             triggerResult_1;
  reg             triggerResult_2;
  reg             triggerResult_3;
  reg  [1:0]      uncacheState;
  reg  [63:0]     uncacheData;
  reg             nderr;
  wire [8:0]      _io_flush_flushItself_T_1 = {req_uop_robIdx_flag, req_uop_robIdx_value};
  wire [8:0]      _io_flush_flushItself_T_2 =
    {io_redirect_bits_robIdx_flag, io_redirect_bits_robIdx_value};
  wire            differentFlag = req_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag;
  wire            compare = req_uop_robIdx_value > io_redirect_bits_robIdx_value;
  wire            _GEN =
    req_valid & io_redirect_valid
    & (io_redirect_bits_level & _io_flush_flushItself_T_1 == _io_flush_flushItself_T_2
       | differentFlag ^ compare);
  wire            _GEN_0 = _GEN | ~io_req_valid;
  reg             REG_0;
  reg             REG_1;
  reg             REG_2;
  reg             REG_3;
  reg             pendingld_last_REG;
  reg             pendingPtr_next_r_flag;
  reg  [7:0]      pendingPtr_next_r_value;
  wire            io_uncache_req_valid_0 = uncacheState == 2'h1;
  wire            io_exception_valid_0 = io_ldout_ready & (&uncacheState);
  wire            _GEN_1 = io_ldout_ready & (&uncacheState);
  wire [8:0]      _pendingPtr_next_T_1 =
    {pendingPtr_next_r_flag, pendingPtr_next_r_value};
  wire [3:0][1:0] _GEN_2 =
    {{(&uncacheState) & _GEN_1 ? 2'h0 : uncacheState},
     {io_uncache_resp_valid ? 2'h3 : uncacheState},
     {io_uncache_req_ready & io_uncache_req_valid_0 ? 2'h2 : uncacheState},
     {req_valid & pendingld_last_REG & _io_flush_flushItself_T_1 == _pendingPtr_next_T_1
        ? 2'h1
        : uncacheState}};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      req_valid <= 1'h0;
      triggerResult_0 <= 1'h0;
      triggerResult_1 <= 1'h0;
      triggerResult_2 <= 1'h0;
      triggerResult_3 <= 1'h0;
      uncacheState <= 2'h0;
      nderr <= 1'h0;
      pendingld_last_REG <= 1'h0;
      pendingPtr_next_r_flag <= 1'h0;
      pendingPtr_next_r_value <= 8'h0;
    end
    else begin
      req_valid <= ~(io_exception_valid_0 | _GEN) & (io_req_valid | ~_GEN_1 & req_valid);
      if (io_req_valid & io_req_bits_data_wen_dup_5) begin
        triggerResult_0 <= io_trigger_hitLoadAddrTriggerHitVec_0;
        triggerResult_1 <= io_trigger_hitLoadAddrTriggerHitVec_1;
        triggerResult_2 <= io_trigger_hitLoadAddrTriggerHitVec_2;
        triggerResult_3 <= io_trigger_hitLoadAddrTriggerHitVec_3;
      end
      uncacheState <= _GEN_2[uncacheState];
      if (io_uncache_resp_valid)
        nderr <= io_uncache_resp_bits_nderr;
      else
        nderr <= _GEN_0 & nderr;
      pendingld_last_REG <= io_rob_pendingld;
      if (~({io_rob_pendingPtr_flag,
             io_rob_pendingPtr_value} == _pendingPtr_next_T_1)) begin
        pendingPtr_next_r_flag <= io_rob_pendingPtr_flag;
        pendingPtr_next_r_value <= io_rob_pendingPtr_value;
      end
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_GEN_0) begin
    end
    else begin
      req_uop_exceptionVec_4 <= io_req_bits_uop_exceptionVec_4;
      req_uop_exceptionVec_13 <= io_req_bits_uop_exceptionVec_13;
      req_uop_exceptionVec_21 <= io_req_bits_uop_exceptionVec_21;
      req_uop_preDecodeInfo_isRVC <= io_req_bits_uop_preDecodeInfo_isRVC;
      req_uop_ftqPtr_flag <= io_req_bits_uop_ftqPtr_flag;
      req_uop_ftqPtr_value <= io_req_bits_uop_ftqPtr_value;
      req_uop_ftqOffset <= io_req_bits_uop_ftqOffset;
      req_uop_fuType <= io_req_bits_uop_fuType;
      req_uop_fuOpType <= io_req_bits_uop_fuOpType;
      req_uop_rfWen <= io_req_bits_uop_rfWen;
      req_uop_fpWen <= io_req_bits_uop_fpWen;
    end
    req_uop_flushPipe <= _GEN_0 & req_uop_flushPipe;
    if (_GEN_0) begin
    end
    else begin
      req_uop_uopIdx <= io_req_bits_uop_uopIdx;
      req_uop_pdest <= io_req_bits_uop_pdest;
      req_uop_robIdx_flag <= io_req_bits_uop_robIdx_flag;
      req_uop_robIdx_value <= io_req_bits_uop_robIdx_value;
      req_uop_storeSetHit <= io_req_bits_uop_storeSetHit;
      req_uop_waitForRobIdx_flag <= io_req_bits_uop_waitForRobIdx_flag;
      req_uop_waitForRobIdx_value <= io_req_bits_uop_waitForRobIdx_value;
      req_uop_loadWaitBit <= io_req_bits_uop_loadWaitBit;
      req_uop_loadWaitStrict <= io_req_bits_uop_loadWaitStrict;
      req_uop_lqIdx_flag <= io_req_bits_uop_lqIdx_flag;
      req_uop_lqIdx_value <= io_req_bits_uop_lqIdx_value;
      req_uop_sqIdx_flag <= io_req_bits_uop_sqIdx_flag;
      req_uop_sqIdx_value <= io_req_bits_uop_sqIdx_value;
      req_uop_replayInst <= io_req_bits_uop_replayInst;
      req_vaddr <= io_req_bits_vaddr;
      req_paddr <= io_req_bits_paddr;
      req_gpaddr <= io_req_bits_gpaddr;
      req_mask <= io_req_bits_mask;
    end
    if (io_uncache_resp_valid)
      uncacheData <= io_uncache_resp_bits_data;
    REG_0 <= triggerResult_0;
    REG_1 <= triggerResult_1;
    REG_2 <= triggerResult_2;
    REG_3 <= triggerResult_3;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:75];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [6:0] i = 7'h0; i < 7'h4C; i += 7'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        req_valid = _RANDOM[7'h0][0];
        req_uop_exceptionVec_4 = _RANDOM[7'h2][24];
        req_uop_exceptionVec_13 = _RANDOM[7'h3][1];
        req_uop_exceptionVec_21 = _RANDOM[7'h3][9];
        req_uop_preDecodeInfo_isRVC = _RANDOM[7'h3][30];
        req_uop_ftqPtr_flag = _RANDOM[7'h4][5];
        req_uop_ftqPtr_value = _RANDOM[7'h4][11:6];
        req_uop_ftqOffset = _RANDOM[7'h4][15:12];
        req_uop_fuType = {_RANDOM[7'h5][31:10], _RANDOM[7'h6][12:0]};
        req_uop_fuOpType = _RANDOM[7'h6][21:13];
        req_uop_rfWen = _RANDOM[7'h6][22];
        req_uop_fpWen = _RANDOM[7'h6][23];
        req_uop_flushPipe = _RANDOM[7'h6][30];
        req_uop_uopIdx = {_RANDOM[7'hE][31:28], _RANDOM[7'hF][2:0]};
        req_uop_pdest = _RANDOM[7'h12][9:2];
        req_uop_robIdx_flag = _RANDOM[7'h12][10];
        req_uop_robIdx_value = _RANDOM[7'h12][18:11];
        req_uop_storeSetHit = _RANDOM[7'h24][27];
        req_uop_waitForRobIdx_flag = _RANDOM[7'h24][28];
        req_uop_waitForRobIdx_value = {_RANDOM[7'h24][31:29], _RANDOM[7'h25][4:0]};
        req_uop_loadWaitBit = _RANDOM[7'h25][5];
        req_uop_loadWaitStrict = _RANDOM[7'h25][6];
        req_uop_lqIdx_flag = _RANDOM[7'h25][12];
        req_uop_lqIdx_value = _RANDOM[7'h25][19:13];
        req_uop_sqIdx_flag = _RANDOM[7'h25][20];
        req_uop_sqIdx_value = _RANDOM[7'h25][26:21];
        req_uop_replayInst = _RANDOM[7'h25][28];
        req_vaddr = {_RANDOM[7'h26][31:2], _RANDOM[7'h27][10:0]};
        req_paddr = {_RANDOM[7'h27][31:11], _RANDOM[7'h28][14:0]};
        req_gpaddr = {_RANDOM[7'h28][31:15], _RANDOM[7'h29][23:0]};
        req_mask = {_RANDOM[7'h29][31:24], _RANDOM[7'h2A][7:0]};
        triggerResult_0 = _RANDOM[7'h48][27];
        triggerResult_1 = _RANDOM[7'h48][28];
        triggerResult_2 = _RANDOM[7'h48][29];
        triggerResult_3 = _RANDOM[7'h48][30];
        uncacheState = {_RANDOM[7'h48][31], _RANDOM[7'h49][0]};
        uncacheData = {_RANDOM[7'h49][31:1], _RANDOM[7'h4A], _RANDOM[7'h4B][0]};
        nderr = _RANDOM[7'h4B][1];
        REG_0 = _RANDOM[7'h4B][2];
        REG_1 = _RANDOM[7'h4B][3];
        REG_2 = _RANDOM[7'h4B][4];
        REG_3 = _RANDOM[7'h4B][5];
        pendingld_last_REG = _RANDOM[7'h4B][6];
        pendingPtr_next_r_flag = _RANDOM[7'h4B][7];
        pendingPtr_next_r_value = _RANDOM[7'h4B][15:8];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        req_valid = 1'h0;
        triggerResult_0 = 1'h0;
        triggerResult_1 = 1'h0;
        triggerResult_2 = 1'h0;
        triggerResult_3 = 1'h0;
        uncacheState = 2'h0;
        nderr = 1'h0;
        pendingld_last_REG = 1'h0;
        pendingPtr_next_r_flag = 1'h0;
        pendingPtr_next_r_value = 8'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_ldout_valid = &uncacheState;
  assign io_ldout_bits_uop_exceptionVec_4 = req_uop_exceptionVec_4;
  assign io_ldout_bits_uop_exceptionVec_5 = nderr;
  assign io_ldout_bits_uop_exceptionVec_13 = req_uop_exceptionVec_13;
  assign io_ldout_bits_uop_exceptionVec_21 = req_uop_exceptionVec_21;
  assign io_ldout_bits_uop_preDecodeInfo_isRVC = req_uop_preDecodeInfo_isRVC;
  assign io_ldout_bits_uop_ftqPtr_flag = req_uop_ftqPtr_flag;
  assign io_ldout_bits_uop_ftqPtr_value = req_uop_ftqPtr_value;
  assign io_ldout_bits_uop_ftqOffset = req_uop_ftqOffset;
  assign io_ldout_bits_uop_fuType = req_uop_fuType;
  assign io_ldout_bits_uop_fuOpType = req_uop_fuOpType;
  assign io_ldout_bits_uop_rfWen = req_uop_rfWen;
  assign io_ldout_bits_uop_fpWen = req_uop_fpWen;
  assign io_ldout_bits_uop_flushPipe = req_uop_flushPipe;
  assign io_ldout_bits_uop_uopIdx = req_uop_uopIdx;
  assign io_ldout_bits_uop_pdest = req_uop_pdest;
  assign io_ldout_bits_uop_robIdx_flag = req_uop_robIdx_flag;
  assign io_ldout_bits_uop_robIdx_value = req_uop_robIdx_value;
  assign io_ldout_bits_uop_storeSetHit = req_uop_storeSetHit;
  assign io_ldout_bits_uop_waitForRobIdx_flag = req_uop_waitForRobIdx_flag;
  assign io_ldout_bits_uop_waitForRobIdx_value = req_uop_waitForRobIdx_value;
  assign io_ldout_bits_uop_loadWaitBit = req_uop_loadWaitBit;
  assign io_ldout_bits_uop_loadWaitStrict = req_uop_loadWaitStrict;
  assign io_ldout_bits_uop_lqIdx_flag = req_uop_lqIdx_flag;
  assign io_ldout_bits_uop_lqIdx_value = req_uop_lqIdx_value;
  assign io_ldout_bits_uop_sqIdx_flag = req_uop_sqIdx_flag;
  assign io_ldout_bits_uop_sqIdx_value = req_uop_sqIdx_value;
  assign io_ldout_bits_uop_replayInst = req_uop_replayInst;
  assign io_ld_raw_data_lqData = uncacheData;
  assign io_ld_raw_data_uop_fuOpType = req_uop_fuOpType;
  assign io_ld_raw_data_uop_fpWen = req_uop_fpWen;
  assign io_ld_raw_data_addrOffset = req_paddr[2:0];
  assign io_uncache_req_valid = io_uncache_req_valid_0;
  assign io_uncache_req_bits_addr = req_paddr;
  assign io_uncache_req_bits_mask = req_paddr[3] ? req_mask[15:8] : req_mask[7:0];
  assign io_uncache_req_bits_id = {5'h0, io_id};
  assign io_trigger_lqLoadAddrTriggerHitVec_0 = (&uncacheState) & REG_0;
  assign io_trigger_lqLoadAddrTriggerHitVec_1 = (&uncacheState) & REG_1;
  assign io_trigger_lqLoadAddrTriggerHitVec_2 = (&uncacheState) & REG_2;
  assign io_trigger_lqLoadAddrTriggerHitVec_3 = (&uncacheState) & REG_3;
  assign io_select = |uncacheState;
  assign io_flush =
    req_valid & io_redirect_valid
    & (io_redirect_bits_level & _io_flush_flushItself_T_1 == _io_flush_flushItself_T_2
       | differentFlag ^ compare);
  assign io_exception_valid = io_exception_valid_0;
  assign io_exception_bits_uop_exceptionVec_4 = req_uop_exceptionVec_4;
  assign io_exception_bits_uop_exceptionVec_5 = nderr;
  assign io_exception_bits_uop_exceptionVec_13 = req_uop_exceptionVec_13;
  assign io_exception_bits_uop_exceptionVec_21 = req_uop_exceptionVec_21;
  assign io_exception_bits_uop_uopIdx = req_uop_uopIdx;
  assign io_exception_bits_uop_robIdx_flag = req_uop_robIdx_flag;
  assign io_exception_bits_uop_robIdx_value = req_uop_robIdx_value;
  assign io_exception_bits_vaddr = req_vaddr;
  assign io_exception_bits_gpaddr = req_gpaddr;
endmodule

