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
module PipelineConnectPipe(
  input          clock,
  input          reset,
  output         io_in_ready,
  input          io_in_valid,
  input  [31:0]  io_in_bits_instr,
  input  [9:0]   io_in_bits_foldpc,
  input          io_in_bits_exceptionVec_0,
  input          io_in_bits_exceptionVec_1,
  input          io_in_bits_exceptionVec_2,
  input          io_in_bits_exceptionVec_3,
  input          io_in_bits_exceptionVec_4,
  input          io_in_bits_exceptionVec_5,
  input          io_in_bits_exceptionVec_6,
  input          io_in_bits_exceptionVec_7,
  input          io_in_bits_exceptionVec_8,
  input          io_in_bits_exceptionVec_9,
  input          io_in_bits_exceptionVec_10,
  input          io_in_bits_exceptionVec_11,
  input          io_in_bits_exceptionVec_12,
  input          io_in_bits_exceptionVec_13,
  input          io_in_bits_exceptionVec_14,
  input          io_in_bits_exceptionVec_15,
  input          io_in_bits_exceptionVec_16,
  input          io_in_bits_exceptionVec_17,
  input          io_in_bits_exceptionVec_18,
  input          io_in_bits_exceptionVec_19,
  input          io_in_bits_exceptionVec_20,
  input          io_in_bits_exceptionVec_21,
  input          io_in_bits_exceptionVec_22,
  input          io_in_bits_exceptionVec_23,
  input          io_in_bits_trigger_frontendHit_0,
  input          io_in_bits_trigger_frontendHit_1,
  input          io_in_bits_trigger_frontendHit_2,
  input          io_in_bits_trigger_frontendHit_3,
  input          io_in_bits_trigger_frontendCanFire_0,
  input          io_in_bits_trigger_frontendCanFire_1,
  input          io_in_bits_trigger_frontendCanFire_2,
  input          io_in_bits_trigger_frontendCanFire_3,
  input          io_in_bits_preDecodeInfo_valid,
  input          io_in_bits_preDecodeInfo_isRVC,
  input  [1:0]   io_in_bits_preDecodeInfo_brType,
  input          io_in_bits_preDecodeInfo_isCall,
  input          io_in_bits_preDecodeInfo_isRet,
  input          io_in_bits_pred_taken,
  input          io_in_bits_crossPageIPFFix,
  input          io_in_bits_ftqPtr_flag,
  input  [5:0]   io_in_bits_ftqPtr_value,
  input  [3:0]   io_in_bits_ftqOffset,
  input  [3:0]   io_in_bits_srcType_0,
  input  [3:0]   io_in_bits_srcType_1,
  input  [3:0]   io_in_bits_srcType_2,
  input  [3:0]   io_in_bits_srcType_3,
  input  [3:0]   io_in_bits_srcType_4,
  input  [5:0]   io_in_bits_lsrc_0,
  input  [5:0]   io_in_bits_lsrc_1,
  input  [5:0]   io_in_bits_lsrc_2,
  input  [5:0]   io_in_bits_ldest,
  input  [34:0]  io_in_bits_fuType,
  input  [8:0]   io_in_bits_fuOpType,
  input          io_in_bits_rfWen,
  input          io_in_bits_fpWen,
  input          io_in_bits_vecWen,
  input          io_in_bits_v0Wen,
  input          io_in_bits_vlWen,
  input          io_in_bits_waitForward,
  input          io_in_bits_blockBackward,
  input          io_in_bits_flushPipe,
  input          io_in_bits_canRobCompress,
  input  [3:0]   io_in_bits_selImm,
  input  [19:0]  io_in_bits_imm,
  input          io_in_bits_fpu_typeTagOut,
  input          io_in_bits_fpu_wflags,
  input  [1:0]   io_in_bits_fpu_typ,
  input  [2:0]   io_in_bits_fpu_rm,
  input          io_in_bits_vpu_vill,
  input          io_in_bits_vpu_vma,
  input          io_in_bits_vpu_vta,
  input  [1:0]   io_in_bits_vpu_vsew,
  input  [2:0]   io_in_bits_vpu_vlmul,
  input          io_in_bits_vpu_specVill,
  input          io_in_bits_vpu_specVma,
  input          io_in_bits_vpu_specVta,
  input  [1:0]   io_in_bits_vpu_specVsew,
  input  [2:0]   io_in_bits_vpu_specVlmul,
  input          io_in_bits_vpu_vm,
  input  [7:0]   io_in_bits_vpu_vstart,
  input          io_in_bits_vpu_fpu_isFoldTo1_2,
  input          io_in_bits_vpu_fpu_isFoldTo1_4,
  input          io_in_bits_vpu_fpu_isFoldTo1_8,
  input  [2:0]   io_in_bits_vpu_nf,
  input  [1:0]   io_in_bits_vpu_veew,
  input          io_in_bits_vpu_isExt,
  input          io_in_bits_vpu_isNarrow,
  input          io_in_bits_vpu_isDstMask,
  input          io_in_bits_vpu_isOpMask,
  input          io_in_bits_vpu_isDependOldvd,
  input          io_in_bits_vpu_isWritePartVd,
  input          io_in_bits_vlsInstr,
  input          io_in_bits_wfflags,
  input          io_in_bits_isMove,
  input  [6:0]   io_in_bits_uopIdx,
  input  [5:0]   io_in_bits_uopSplitType,
  input          io_in_bits_isVset,
  input          io_in_bits_firstUop,
  input          io_in_bits_lastUop,
  input  [6:0]   io_in_bits_numWB,
  input  [2:0]   io_in_bits_commitType,
  input          io_out_ready,
  output         io_out_valid,
  output [31:0]  io_out_bits_instr,
  output [9:0]   io_out_bits_foldpc,
  output         io_out_bits_exceptionVec_0,
  output         io_out_bits_exceptionVec_1,
  output         io_out_bits_exceptionVec_2,
  output         io_out_bits_exceptionVec_3,
  output         io_out_bits_exceptionVec_4,
  output         io_out_bits_exceptionVec_5,
  output         io_out_bits_exceptionVec_6,
  output         io_out_bits_exceptionVec_7,
  output         io_out_bits_exceptionVec_8,
  output         io_out_bits_exceptionVec_9,
  output         io_out_bits_exceptionVec_10,
  output         io_out_bits_exceptionVec_11,
  output         io_out_bits_exceptionVec_12,
  output         io_out_bits_exceptionVec_13,
  output         io_out_bits_exceptionVec_14,
  output         io_out_bits_exceptionVec_15,
  output         io_out_bits_exceptionVec_16,
  output         io_out_bits_exceptionVec_17,
  output         io_out_bits_exceptionVec_18,
  output         io_out_bits_exceptionVec_19,
  output         io_out_bits_exceptionVec_20,
  output         io_out_bits_exceptionVec_21,
  output         io_out_bits_exceptionVec_22,
  output         io_out_bits_exceptionVec_23,
  output         io_out_bits_trigger_frontendHit_0,
  output         io_out_bits_trigger_frontendHit_1,
  output         io_out_bits_trigger_frontendHit_2,
  output         io_out_bits_trigger_frontendHit_3,
  output         io_out_bits_trigger_frontendCanFire_0,
  output         io_out_bits_trigger_frontendCanFire_1,
  output         io_out_bits_trigger_frontendCanFire_2,
  output         io_out_bits_trigger_frontendCanFire_3,
  output         io_out_bits_preDecodeInfo_valid,
  output         io_out_bits_preDecodeInfo_isRVC,
  output [1:0]   io_out_bits_preDecodeInfo_brType,
  output         io_out_bits_preDecodeInfo_isCall,
  output         io_out_bits_preDecodeInfo_isRet,
  output         io_out_bits_pred_taken,
  output         io_out_bits_crossPageIPFFix,
  output         io_out_bits_ftqPtr_flag,
  output [5:0]   io_out_bits_ftqPtr_value,
  output [3:0]   io_out_bits_ftqOffset,
  output [3:0]   io_out_bits_srcType_0,
  output [3:0]   io_out_bits_srcType_1,
  output [3:0]   io_out_bits_srcType_2,
  output [3:0]   io_out_bits_srcType_3,
  output [3:0]   io_out_bits_srcType_4,
  output [5:0]   io_out_bits_lsrc_0,
  output [5:0]   io_out_bits_lsrc_1,
  output [5:0]   io_out_bits_lsrc_2,
  output [5:0]   io_out_bits_lsrc_3,
  output [5:0]   io_out_bits_lsrc_4,
  output [5:0]   io_out_bits_ldest,
  output [34:0]  io_out_bits_fuType,
  output [8:0]   io_out_bits_fuOpType,
  output         io_out_bits_rfWen,
  output         io_out_bits_fpWen,
  output         io_out_bits_vecWen,
  output         io_out_bits_v0Wen,
  output         io_out_bits_vlWen,
  output         io_out_bits_waitForward,
  output         io_out_bits_blockBackward,
  output         io_out_bits_flushPipe,
  output         io_out_bits_canRobCompress,
  output [3:0]   io_out_bits_selImm,
  output [19:0]  io_out_bits_imm,
  output         io_out_bits_fpu_typeTagOut,
  output         io_out_bits_fpu_wflags,
  output [1:0]   io_out_bits_fpu_typ,
  output [2:0]   io_out_bits_fpu_rm,
  output         io_out_bits_vpu_vill,
  output         io_out_bits_vpu_vma,
  output         io_out_bits_vpu_vta,
  output [1:0]   io_out_bits_vpu_vsew,
  output [2:0]   io_out_bits_vpu_vlmul,
  output         io_out_bits_vpu_specVill,
  output         io_out_bits_vpu_specVma,
  output         io_out_bits_vpu_specVta,
  output [1:0]   io_out_bits_vpu_specVsew,
  output [2:0]   io_out_bits_vpu_specVlmul,
  output         io_out_bits_vpu_vm,
  output [7:0]   io_out_bits_vpu_vstart,
  output         io_out_bits_vpu_fpu_isFoldTo1_2,
  output         io_out_bits_vpu_fpu_isFoldTo1_4,
  output         io_out_bits_vpu_fpu_isFoldTo1_8,
  output [127:0] io_out_bits_vpu_vmask,
  output [2:0]   io_out_bits_vpu_nf,
  output [1:0]   io_out_bits_vpu_veew,
  output         io_out_bits_vpu_isExt,
  output         io_out_bits_vpu_isNarrow,
  output         io_out_bits_vpu_isDstMask,
  output         io_out_bits_vpu_isOpMask,
  output         io_out_bits_vpu_isDependOldvd,
  output         io_out_bits_vpu_isWritePartVd,
  output         io_out_bits_vlsInstr,
  output         io_out_bits_wfflags,
  output         io_out_bits_isMove,
  output [6:0]   io_out_bits_uopIdx,
  output [5:0]   io_out_bits_uopSplitType,
  output         io_out_bits_isVset,
  output         io_out_bits_firstUop,
  output         io_out_bits_lastUop,
  output [6:0]   io_out_bits_numWB,
  output [2:0]   io_out_bits_commitType,
  input          io_rightOutFire,
  input          io_isFlush
);

  reg          valid;
  wire         leftFire = io_in_valid & io_out_ready;
  reg  [31:0]  data_instr;
  reg  [9:0]   data_foldpc;
  reg          data_exceptionVec_0;
  reg          data_exceptionVec_1;
  reg          data_exceptionVec_2;
  reg          data_exceptionVec_3;
  reg          data_exceptionVec_4;
  reg          data_exceptionVec_5;
  reg          data_exceptionVec_6;
  reg          data_exceptionVec_7;
  reg          data_exceptionVec_8;
  reg          data_exceptionVec_9;
  reg          data_exceptionVec_10;
  reg          data_exceptionVec_11;
  reg          data_exceptionVec_12;
  reg          data_exceptionVec_13;
  reg          data_exceptionVec_14;
  reg          data_exceptionVec_15;
  reg          data_exceptionVec_16;
  reg          data_exceptionVec_17;
  reg          data_exceptionVec_18;
  reg          data_exceptionVec_19;
  reg          data_exceptionVec_20;
  reg          data_exceptionVec_21;
  reg          data_exceptionVec_22;
  reg          data_exceptionVec_23;
  reg          data_trigger_frontendHit_0;
  reg          data_trigger_frontendHit_1;
  reg          data_trigger_frontendHit_2;
  reg          data_trigger_frontendHit_3;
  reg          data_trigger_frontendCanFire_0;
  reg          data_trigger_frontendCanFire_1;
  reg          data_trigger_frontendCanFire_2;
  reg          data_trigger_frontendCanFire_3;
  reg          data_preDecodeInfo_valid;
  reg          data_preDecodeInfo_isRVC;
  reg  [1:0]   data_preDecodeInfo_brType;
  reg          data_preDecodeInfo_isCall;
  reg          data_preDecodeInfo_isRet;
  reg          data_pred_taken;
  reg          data_crossPageIPFFix;
  reg          data_ftqPtr_flag;
  reg  [5:0]   data_ftqPtr_value;
  reg  [3:0]   data_ftqOffset;
  reg  [3:0]   data_srcType_0;
  reg  [3:0]   data_srcType_1;
  reg  [3:0]   data_srcType_2;
  reg  [3:0]   data_srcType_3;
  reg  [3:0]   data_srcType_4;
  reg  [5:0]   data_lsrc_0;
  reg  [5:0]   data_lsrc_1;
  reg  [5:0]   data_lsrc_2;
  reg  [5:0]   data_lsrc_3;
  reg  [5:0]   data_lsrc_4;
  reg  [5:0]   data_ldest;
  reg  [34:0]  data_fuType;
  reg  [8:0]   data_fuOpType;
  reg          data_rfWen;
  reg          data_fpWen;
  reg          data_vecWen;
  reg          data_v0Wen;
  reg          data_vlWen;
  reg          data_waitForward;
  reg          data_blockBackward;
  reg          data_flushPipe;
  reg          data_canRobCompress;
  reg  [3:0]   data_selImm;
  reg  [19:0]  data_imm;
  reg          data_fpu_typeTagOut;
  reg          data_fpu_wflags;
  reg  [1:0]   data_fpu_typ;
  reg  [2:0]   data_fpu_rm;
  reg          data_vpu_vill;
  reg          data_vpu_vma;
  reg          data_vpu_vta;
  reg  [1:0]   data_vpu_vsew;
  reg  [2:0]   data_vpu_vlmul;
  reg          data_vpu_specVill;
  reg          data_vpu_specVma;
  reg          data_vpu_specVta;
  reg  [1:0]   data_vpu_specVsew;
  reg  [2:0]   data_vpu_specVlmul;
  reg          data_vpu_vm;
  reg  [7:0]   data_vpu_vstart;
  reg          data_vpu_fpu_isFoldTo1_2;
  reg          data_vpu_fpu_isFoldTo1_4;
  reg          data_vpu_fpu_isFoldTo1_8;
  reg  [127:0] data_vpu_vmask;
  reg  [2:0]   data_vpu_nf;
  reg  [1:0]   data_vpu_veew;
  reg          data_vpu_isExt;
  reg          data_vpu_isNarrow;
  reg          data_vpu_isDstMask;
  reg          data_vpu_isOpMask;
  reg          data_vpu_isDependOldvd;
  reg          data_vpu_isWritePartVd;
  reg          data_vlsInstr;
  reg          data_wfflags;
  reg          data_isMove;
  reg  [6:0]   data_uopIdx;
  reg  [5:0]   data_uopSplitType;
  reg          data_isVset;
  reg          data_firstUop;
  reg          data_lastUop;
  reg  [6:0]   data_numWB;
  reg  [2:0]   data_commitType;
  always @(posedge clock or posedge reset) begin
    if (reset)
      valid <= 1'h0;
    else
      valid <= ~io_isFlush & (leftFire | ~io_rightOutFire & valid);
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (leftFire) begin
      data_instr <= io_in_bits_instr;
      data_foldpc <= io_in_bits_foldpc;
      data_exceptionVec_0 <= io_in_bits_exceptionVec_0;
      data_exceptionVec_1 <= io_in_bits_exceptionVec_1;
      data_exceptionVec_2 <= io_in_bits_exceptionVec_2;
      data_exceptionVec_3 <= io_in_bits_exceptionVec_3;
      data_exceptionVec_4 <= io_in_bits_exceptionVec_4;
      data_exceptionVec_5 <= io_in_bits_exceptionVec_5;
      data_exceptionVec_6 <= io_in_bits_exceptionVec_6;
      data_exceptionVec_7 <= io_in_bits_exceptionVec_7;
      data_exceptionVec_8 <= io_in_bits_exceptionVec_8;
      data_exceptionVec_9 <= io_in_bits_exceptionVec_9;
      data_exceptionVec_10 <= io_in_bits_exceptionVec_10;
      data_exceptionVec_11 <= io_in_bits_exceptionVec_11;
      data_exceptionVec_12 <= io_in_bits_exceptionVec_12;
      data_exceptionVec_13 <= io_in_bits_exceptionVec_13;
      data_exceptionVec_14 <= io_in_bits_exceptionVec_14;
      data_exceptionVec_15 <= io_in_bits_exceptionVec_15;
      data_exceptionVec_16 <= io_in_bits_exceptionVec_16;
      data_exceptionVec_17 <= io_in_bits_exceptionVec_17;
      data_exceptionVec_18 <= io_in_bits_exceptionVec_18;
      data_exceptionVec_19 <= io_in_bits_exceptionVec_19;
      data_exceptionVec_20 <= io_in_bits_exceptionVec_20;
      data_exceptionVec_21 <= io_in_bits_exceptionVec_21;
      data_exceptionVec_22 <= io_in_bits_exceptionVec_22;
      data_exceptionVec_23 <= io_in_bits_exceptionVec_23;
      data_trigger_frontendHit_0 <= io_in_bits_trigger_frontendHit_0;
      data_trigger_frontendHit_1 <= io_in_bits_trigger_frontendHit_1;
      data_trigger_frontendHit_2 <= io_in_bits_trigger_frontendHit_2;
      data_trigger_frontendHit_3 <= io_in_bits_trigger_frontendHit_3;
      data_trigger_frontendCanFire_0 <= io_in_bits_trigger_frontendCanFire_0;
      data_trigger_frontendCanFire_1 <= io_in_bits_trigger_frontendCanFire_1;
      data_trigger_frontendCanFire_2 <= io_in_bits_trigger_frontendCanFire_2;
      data_trigger_frontendCanFire_3 <= io_in_bits_trigger_frontendCanFire_3;
      data_preDecodeInfo_valid <= io_in_bits_preDecodeInfo_valid;
      data_preDecodeInfo_isRVC <= io_in_bits_preDecodeInfo_isRVC;
      data_preDecodeInfo_brType <= io_in_bits_preDecodeInfo_brType;
      data_preDecodeInfo_isCall <= io_in_bits_preDecodeInfo_isCall;
      data_preDecodeInfo_isRet <= io_in_bits_preDecodeInfo_isRet;
      data_pred_taken <= io_in_bits_pred_taken;
      data_crossPageIPFFix <= io_in_bits_crossPageIPFFix;
      data_ftqPtr_flag <= io_in_bits_ftqPtr_flag;
      data_ftqPtr_value <= io_in_bits_ftqPtr_value;
      data_ftqOffset <= io_in_bits_ftqOffset;
      data_srcType_0 <= io_in_bits_srcType_0;
      data_srcType_1 <= io_in_bits_srcType_1;
      data_srcType_2 <= io_in_bits_srcType_2;
      data_srcType_3 <= io_in_bits_srcType_3;
      data_srcType_4 <= io_in_bits_srcType_4;
      data_lsrc_0 <= io_in_bits_lsrc_0;
      data_lsrc_1 <= io_in_bits_lsrc_1;
      data_lsrc_2 <= io_in_bits_lsrc_2;
      data_lsrc_3 <= 6'h0;
      data_lsrc_4 <= 6'h0;
      data_ldest <= io_in_bits_ldest;
      data_fuType <= io_in_bits_fuType;
      data_fuOpType <= io_in_bits_fuOpType;
      data_rfWen <= io_in_bits_rfWen;
      data_fpWen <= io_in_bits_fpWen;
      data_vecWen <= io_in_bits_vecWen;
      data_v0Wen <= io_in_bits_v0Wen;
      data_vlWen <= io_in_bits_vlWen;
      data_waitForward <= io_in_bits_waitForward;
      data_blockBackward <= io_in_bits_blockBackward;
      data_flushPipe <= io_in_bits_flushPipe;
      data_canRobCompress <= io_in_bits_canRobCompress;
      data_selImm <= io_in_bits_selImm;
      data_imm <= io_in_bits_imm;
      data_fpu_typeTagOut <= io_in_bits_fpu_typeTagOut;
      data_fpu_wflags <= io_in_bits_fpu_wflags;
      data_fpu_typ <= io_in_bits_fpu_typ;
      data_fpu_rm <= io_in_bits_fpu_rm;
      data_vpu_vill <= io_in_bits_vpu_vill;
      data_vpu_vma <= io_in_bits_vpu_vma;
      data_vpu_vta <= io_in_bits_vpu_vta;
      data_vpu_vsew <= io_in_bits_vpu_vsew;
      data_vpu_vlmul <= io_in_bits_vpu_vlmul;
      data_vpu_specVill <= io_in_bits_vpu_specVill;
      data_vpu_specVma <= io_in_bits_vpu_specVma;
      data_vpu_specVta <= io_in_bits_vpu_specVta;
      data_vpu_specVsew <= io_in_bits_vpu_specVsew;
      data_vpu_specVlmul <= io_in_bits_vpu_specVlmul;
      data_vpu_vm <= io_in_bits_vpu_vm;
      data_vpu_vstart <= io_in_bits_vpu_vstart;
      data_vpu_fpu_isFoldTo1_2 <= io_in_bits_vpu_fpu_isFoldTo1_2;
      data_vpu_fpu_isFoldTo1_4 <= io_in_bits_vpu_fpu_isFoldTo1_4;
      data_vpu_fpu_isFoldTo1_8 <= io_in_bits_vpu_fpu_isFoldTo1_8;
      data_vpu_vmask <= 128'h0;
      data_vpu_nf <= io_in_bits_vpu_nf;
      data_vpu_veew <= io_in_bits_vpu_veew;
      data_vpu_isExt <= io_in_bits_vpu_isExt;
      data_vpu_isNarrow <= io_in_bits_vpu_isNarrow;
      data_vpu_isDstMask <= io_in_bits_vpu_isDstMask;
      data_vpu_isOpMask <= io_in_bits_vpu_isOpMask;
      data_vpu_isDependOldvd <= io_in_bits_vpu_isDependOldvd;
      data_vpu_isWritePartVd <= io_in_bits_vpu_isWritePartVd;
      data_vlsInstr <= io_in_bits_vlsInstr;
      data_wfflags <= io_in_bits_wfflags;
      data_isMove <= io_in_bits_isMove;
      data_uopIdx <= io_in_bits_uopIdx;
      data_uopSplitType <= io_in_bits_uopSplitType;
      data_isVset <= io_in_bits_isVset;
      data_firstUop <= io_in_bits_firstUop;
      data_lastUop <= io_in_bits_lastUop;
      data_numWB <= io_in_bits_numWB;
      data_commitType <= io_in_bits_commitType;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:16];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h11; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        valid = _RANDOM[5'h0][0];
        data_instr = {_RANDOM[5'h0][31:1], _RANDOM[5'h1][0]};
        data_foldpc = _RANDOM[5'h2][19:10];
        data_exceptionVec_0 = _RANDOM[5'h2][20];
        data_exceptionVec_1 = _RANDOM[5'h2][21];
        data_exceptionVec_2 = _RANDOM[5'h2][22];
        data_exceptionVec_3 = _RANDOM[5'h2][23];
        data_exceptionVec_4 = _RANDOM[5'h2][24];
        data_exceptionVec_5 = _RANDOM[5'h2][25];
        data_exceptionVec_6 = _RANDOM[5'h2][26];
        data_exceptionVec_7 = _RANDOM[5'h2][27];
        data_exceptionVec_8 = _RANDOM[5'h2][28];
        data_exceptionVec_9 = _RANDOM[5'h2][29];
        data_exceptionVec_10 = _RANDOM[5'h2][30];
        data_exceptionVec_11 = _RANDOM[5'h2][31];
        data_exceptionVec_12 = _RANDOM[5'h3][0];
        data_exceptionVec_13 = _RANDOM[5'h3][1];
        data_exceptionVec_14 = _RANDOM[5'h3][2];
        data_exceptionVec_15 = _RANDOM[5'h3][3];
        data_exceptionVec_16 = _RANDOM[5'h3][4];
        data_exceptionVec_17 = _RANDOM[5'h3][5];
        data_exceptionVec_18 = _RANDOM[5'h3][6];
        data_exceptionVec_19 = _RANDOM[5'h3][7];
        data_exceptionVec_20 = _RANDOM[5'h3][8];
        data_exceptionVec_21 = _RANDOM[5'h3][9];
        data_exceptionVec_22 = _RANDOM[5'h3][10];
        data_exceptionVec_23 = _RANDOM[5'h3][11];
        data_trigger_frontendHit_0 = _RANDOM[5'h3][12];
        data_trigger_frontendHit_1 = _RANDOM[5'h3][13];
        data_trigger_frontendHit_2 = _RANDOM[5'h3][14];
        data_trigger_frontendHit_3 = _RANDOM[5'h3][15];
        data_trigger_frontendCanFire_0 = _RANDOM[5'h3][16];
        data_trigger_frontendCanFire_1 = _RANDOM[5'h3][17];
        data_trigger_frontendCanFire_2 = _RANDOM[5'h3][18];
        data_trigger_frontendCanFire_3 = _RANDOM[5'h3][19];
        data_preDecodeInfo_valid = _RANDOM[5'h3][28];
        data_preDecodeInfo_isRVC = _RANDOM[5'h3][29];
        data_preDecodeInfo_brType = _RANDOM[5'h3][31:30];
        data_preDecodeInfo_isCall = _RANDOM[5'h4][0];
        data_preDecodeInfo_isRet = _RANDOM[5'h4][1];
        data_pred_taken = _RANDOM[5'h4][2];
        data_crossPageIPFFix = _RANDOM[5'h4][3];
        data_ftqPtr_flag = _RANDOM[5'h4][4];
        data_ftqPtr_value = _RANDOM[5'h4][10:5];
        data_ftqOffset = _RANDOM[5'h4][14:11];
        data_srcType_0 = _RANDOM[5'h4][18:15];
        data_srcType_1 = _RANDOM[5'h4][22:19];
        data_srcType_2 = _RANDOM[5'h4][26:23];
        data_srcType_3 = _RANDOM[5'h4][30:27];
        data_srcType_4 = {_RANDOM[5'h4][31], _RANDOM[5'h5][2:0]};
        data_lsrc_0 = _RANDOM[5'h5][8:3];
        data_lsrc_1 = _RANDOM[5'h5][14:9];
        data_lsrc_2 = _RANDOM[5'h5][20:15];
        data_lsrc_3 = _RANDOM[5'h5][26:21];
        data_lsrc_4 = {_RANDOM[5'h5][31:27], _RANDOM[5'h6][0]};
        data_ldest = _RANDOM[5'h6][6:1];
        data_fuType = {_RANDOM[5'h6][31:7], _RANDOM[5'h7][9:0]};
        data_fuOpType = _RANDOM[5'h7][18:10];
        data_rfWen = _RANDOM[5'h7][19];
        data_fpWen = _RANDOM[5'h7][20];
        data_vecWen = _RANDOM[5'h7][21];
        data_v0Wen = _RANDOM[5'h7][22];
        data_vlWen = _RANDOM[5'h7][23];
        data_waitForward = _RANDOM[5'h7][25];
        data_blockBackward = _RANDOM[5'h7][26];
        data_flushPipe = _RANDOM[5'h7][27];
        data_canRobCompress = _RANDOM[5'h7][28];
        data_selImm = {_RANDOM[5'h7][31:29], _RANDOM[5'h8][0]};
        data_imm = _RANDOM[5'h8][20:1];
        data_fpu_typeTagOut = _RANDOM[5'h8][23];
        data_fpu_wflags = _RANDOM[5'h8][25];
        data_fpu_typ = _RANDOM[5'h9][1:0];
        data_fpu_rm = _RANDOM[5'h9][7:5];
        data_vpu_vill = _RANDOM[5'h9][8];
        data_vpu_vma = _RANDOM[5'h9][9];
        data_vpu_vta = _RANDOM[5'h9][10];
        data_vpu_vsew = _RANDOM[5'h9][12:11];
        data_vpu_vlmul = _RANDOM[5'h9][15:13];
        data_vpu_specVill = _RANDOM[5'h9][16];
        data_vpu_specVma = _RANDOM[5'h9][17];
        data_vpu_specVta = _RANDOM[5'h9][18];
        data_vpu_specVsew = _RANDOM[5'h9][20:19];
        data_vpu_specVlmul = _RANDOM[5'h9][23:21];
        data_vpu_vm = _RANDOM[5'h9][24];
        data_vpu_vstart = {_RANDOM[5'h9][31:25], _RANDOM[5'hA][0]};
        data_vpu_fpu_isFoldTo1_2 = _RANDOM[5'hA][8];
        data_vpu_fpu_isFoldTo1_4 = _RANDOM[5'hA][9];
        data_vpu_fpu_isFoldTo1_8 = _RANDOM[5'hA][10];
        data_vpu_vmask =
          {_RANDOM[5'hA][31:21],
           _RANDOM[5'hB],
           _RANDOM[5'hC],
           _RANDOM[5'hD],
           _RANDOM[5'hE][20:0]};
        data_vpu_nf = _RANDOM[5'hE][31:29];
        data_vpu_veew = _RANDOM[5'hF][1:0];
        data_vpu_isExt = _RANDOM[5'hF][3];
        data_vpu_isNarrow = _RANDOM[5'hF][4];
        data_vpu_isDstMask = _RANDOM[5'hF][5];
        data_vpu_isOpMask = _RANDOM[5'hF][6];
        data_vpu_isDependOldvd = _RANDOM[5'hF][8];
        data_vpu_isWritePartVd = _RANDOM[5'hF][9];
        data_vlsInstr = _RANDOM[5'hF][10];
        data_wfflags = _RANDOM[5'hF][11];
        data_isMove = _RANDOM[5'hF][12];
        data_uopIdx = _RANDOM[5'hF][19:13];
        data_uopSplitType = _RANDOM[5'hF][25:20];
        data_isVset = _RANDOM[5'hF][26];
        data_firstUop = _RANDOM[5'hF][27];
        data_lastUop = _RANDOM[5'hF][28];
        data_numWB = _RANDOM[5'h10][10:4];
        data_commitType = _RANDOM[5'h10][13:11];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = io_out_ready;
  assign io_out_valid = valid;
  assign io_out_bits_instr = data_instr;
  assign io_out_bits_foldpc = data_foldpc;
  assign io_out_bits_exceptionVec_0 = data_exceptionVec_0;
  assign io_out_bits_exceptionVec_1 = data_exceptionVec_1;
  assign io_out_bits_exceptionVec_2 = data_exceptionVec_2;
  assign io_out_bits_exceptionVec_3 = data_exceptionVec_3;
  assign io_out_bits_exceptionVec_4 = data_exceptionVec_4;
  assign io_out_bits_exceptionVec_5 = data_exceptionVec_5;
  assign io_out_bits_exceptionVec_6 = data_exceptionVec_6;
  assign io_out_bits_exceptionVec_7 = data_exceptionVec_7;
  assign io_out_bits_exceptionVec_8 = data_exceptionVec_8;
  assign io_out_bits_exceptionVec_9 = data_exceptionVec_9;
  assign io_out_bits_exceptionVec_10 = data_exceptionVec_10;
  assign io_out_bits_exceptionVec_11 = data_exceptionVec_11;
  assign io_out_bits_exceptionVec_12 = data_exceptionVec_12;
  assign io_out_bits_exceptionVec_13 = data_exceptionVec_13;
  assign io_out_bits_exceptionVec_14 = data_exceptionVec_14;
  assign io_out_bits_exceptionVec_15 = data_exceptionVec_15;
  assign io_out_bits_exceptionVec_16 = data_exceptionVec_16;
  assign io_out_bits_exceptionVec_17 = data_exceptionVec_17;
  assign io_out_bits_exceptionVec_18 = data_exceptionVec_18;
  assign io_out_bits_exceptionVec_19 = data_exceptionVec_19;
  assign io_out_bits_exceptionVec_20 = data_exceptionVec_20;
  assign io_out_bits_exceptionVec_21 = data_exceptionVec_21;
  assign io_out_bits_exceptionVec_22 = data_exceptionVec_22;
  assign io_out_bits_exceptionVec_23 = data_exceptionVec_23;
  assign io_out_bits_trigger_frontendHit_0 = data_trigger_frontendHit_0;
  assign io_out_bits_trigger_frontendHit_1 = data_trigger_frontendHit_1;
  assign io_out_bits_trigger_frontendHit_2 = data_trigger_frontendHit_2;
  assign io_out_bits_trigger_frontendHit_3 = data_trigger_frontendHit_3;
  assign io_out_bits_trigger_frontendCanFire_0 = data_trigger_frontendCanFire_0;
  assign io_out_bits_trigger_frontendCanFire_1 = data_trigger_frontendCanFire_1;
  assign io_out_bits_trigger_frontendCanFire_2 = data_trigger_frontendCanFire_2;
  assign io_out_bits_trigger_frontendCanFire_3 = data_trigger_frontendCanFire_3;
  assign io_out_bits_preDecodeInfo_valid = data_preDecodeInfo_valid;
  assign io_out_bits_preDecodeInfo_isRVC = data_preDecodeInfo_isRVC;
  assign io_out_bits_preDecodeInfo_brType = data_preDecodeInfo_brType;
  assign io_out_bits_preDecodeInfo_isCall = data_preDecodeInfo_isCall;
  assign io_out_bits_preDecodeInfo_isRet = data_preDecodeInfo_isRet;
  assign io_out_bits_pred_taken = data_pred_taken;
  assign io_out_bits_crossPageIPFFix = data_crossPageIPFFix;
  assign io_out_bits_ftqPtr_flag = data_ftqPtr_flag;
  assign io_out_bits_ftqPtr_value = data_ftqPtr_value;
  assign io_out_bits_ftqOffset = data_ftqOffset;
  assign io_out_bits_srcType_0 = data_srcType_0;
  assign io_out_bits_srcType_1 = data_srcType_1;
  assign io_out_bits_srcType_2 = data_srcType_2;
  assign io_out_bits_srcType_3 = data_srcType_3;
  assign io_out_bits_srcType_4 = data_srcType_4;
  assign io_out_bits_lsrc_0 = data_lsrc_0;
  assign io_out_bits_lsrc_1 = data_lsrc_1;
  assign io_out_bits_lsrc_2 = data_lsrc_2;
  assign io_out_bits_lsrc_3 = data_lsrc_3;
  assign io_out_bits_lsrc_4 = data_lsrc_4;
  assign io_out_bits_ldest = data_ldest;
  assign io_out_bits_fuType = data_fuType;
  assign io_out_bits_fuOpType = data_fuOpType;
  assign io_out_bits_rfWen = data_rfWen;
  assign io_out_bits_fpWen = data_fpWen;
  assign io_out_bits_vecWen = data_vecWen;
  assign io_out_bits_v0Wen = data_v0Wen;
  assign io_out_bits_vlWen = data_vlWen;
  assign io_out_bits_waitForward = data_waitForward;
  assign io_out_bits_blockBackward = data_blockBackward;
  assign io_out_bits_flushPipe = data_flushPipe;
  assign io_out_bits_canRobCompress = data_canRobCompress;
  assign io_out_bits_selImm = data_selImm;
  assign io_out_bits_imm = data_imm;
  assign io_out_bits_fpu_typeTagOut = data_fpu_typeTagOut;
  assign io_out_bits_fpu_wflags = data_fpu_wflags;
  assign io_out_bits_fpu_typ = data_fpu_typ;
  assign io_out_bits_fpu_rm = data_fpu_rm;
  assign io_out_bits_vpu_vill = data_vpu_vill;
  assign io_out_bits_vpu_vma = data_vpu_vma;
  assign io_out_bits_vpu_vta = data_vpu_vta;
  assign io_out_bits_vpu_vsew = data_vpu_vsew;
  assign io_out_bits_vpu_vlmul = data_vpu_vlmul;
  assign io_out_bits_vpu_specVill = data_vpu_specVill;
  assign io_out_bits_vpu_specVma = data_vpu_specVma;
  assign io_out_bits_vpu_specVta = data_vpu_specVta;
  assign io_out_bits_vpu_specVsew = data_vpu_specVsew;
  assign io_out_bits_vpu_specVlmul = data_vpu_specVlmul;
  assign io_out_bits_vpu_vm = data_vpu_vm;
  assign io_out_bits_vpu_vstart = data_vpu_vstart;
  assign io_out_bits_vpu_fpu_isFoldTo1_2 = data_vpu_fpu_isFoldTo1_2;
  assign io_out_bits_vpu_fpu_isFoldTo1_4 = data_vpu_fpu_isFoldTo1_4;
  assign io_out_bits_vpu_fpu_isFoldTo1_8 = data_vpu_fpu_isFoldTo1_8;
  assign io_out_bits_vpu_vmask = data_vpu_vmask;
  assign io_out_bits_vpu_nf = data_vpu_nf;
  assign io_out_bits_vpu_veew = data_vpu_veew;
  assign io_out_bits_vpu_isExt = data_vpu_isExt;
  assign io_out_bits_vpu_isNarrow = data_vpu_isNarrow;
  assign io_out_bits_vpu_isDstMask = data_vpu_isDstMask;
  assign io_out_bits_vpu_isOpMask = data_vpu_isOpMask;
  assign io_out_bits_vpu_isDependOldvd = data_vpu_isDependOldvd;
  assign io_out_bits_vpu_isWritePartVd = data_vpu_isWritePartVd;
  assign io_out_bits_vlsInstr = data_vlsInstr;
  assign io_out_bits_wfflags = data_wfflags;
  assign io_out_bits_isMove = data_isMove;
  assign io_out_bits_uopIdx = data_uopIdx;
  assign io_out_bits_uopSplitType = data_uopSplitType;
  assign io_out_bits_isVset = data_isVset;
  assign io_out_bits_firstUop = data_firstUop;
  assign io_out_bits_lastUop = data_lastUop;
  assign io_out_bits_numWB = data_numWB;
  assign io_out_bits_commitType = data_commitType;
endmodule

