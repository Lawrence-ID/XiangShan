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
module VLSplitBufferImp(
  input          clock,
  input          reset,
  input          io_redirect_valid,
  input          io_redirect_bits_robIdx_flag,
  input  [7:0]   io_redirect_bits_robIdx_value,
  input          io_redirect_bits_level,
  output         io_in_ready,
  input          io_in_valid,
  input  [15:0]  io_in_bits_flowMask,
  input  [40:0]  io_in_bits_baseAddr,
  input  [127:0] io_in_bits_stride,
  input  [4:0]   io_in_bits_flowNum,
  input  [1:0]   io_in_bits_eew,
  input  [2:0]   io_in_bits_sew,
  input  [2:0]   io_in_bits_emul,
  input  [2:0]   io_in_bits_lmul,
  input  [2:0]   io_in_bits_instType,
  input  [4:0]   io_in_bits_indexedSplitOffset,
  input          io_in_bits_uop_ftqPtr_flag,
  input  [5:0]   io_in_bits_uop_ftqPtr_value,
  input  [3:0]   io_in_bits_uop_ftqOffset,
  input  [34:0]  io_in_bits_uop_fuType,
  input  [8:0]   io_in_bits_uop_fuOpType,
  input  [31:0]  io_in_bits_uop_imm,
  input  [6:0]   io_in_bits_uop_vpu_vuopIdx,
  input  [6:0]   io_in_bits_uop_uopIdx,
  input          io_in_bits_uop_lastUop,
  input  [7:0]   io_in_bits_uop_pdest,
  input          io_in_bits_uop_robIdx_flag,
  input  [7:0]   io_in_bits_uop_robIdx_value,
  input          io_in_bits_uop_lqIdx_flag,
  input  [6:0]   io_in_bits_uop_lqIdx_value,
  input          io_in_bits_uop_sqIdx_flag,
  input  [5:0]   io_in_bits_uop_sqIdx_value,
  input  [127:0] io_in_bits_uopOffset,
  input          io_in_bits_preIsSplit,
  input  [3:0]   io_in_bits_mBIndex,
  input  [2:0]   io_in_bits_alignedType,
  input  [7:0]   io_in_bits_indexVlMaxInVd,
  input  [3:0]   io_in_bits_usLowBitsAddr,
  input          io_in_bits_usAligned128,
  input  [31:0]  io_in_bits_usMask,
  input          io_out_ready,
  output         io_out_valid,
  output [40:0]  io_out_bits_vaddr,
  output [15:0]  io_out_bits_mask,
  output [3:0]   io_out_bits_reg_offset,
  output [2:0]   io_out_bits_alignedType,
  output         io_out_bits_vecActive,
  output         io_out_bits_uop_exceptionVec_4,
  output         io_out_bits_uop_exceptionVec_5,
  output         io_out_bits_uop_exceptionVec_13,
  output         io_out_bits_uop_exceptionVec_21,
  output         io_out_bits_uop_preDecodeInfo_isRVC,
  output         io_out_bits_uop_ftqPtr_flag,
  output [5:0]   io_out_bits_uop_ftqPtr_value,
  output [3:0]   io_out_bits_uop_ftqOffset,
  output [34:0]  io_out_bits_uop_fuType,
  output [8:0]   io_out_bits_uop_fuOpType,
  output         io_out_bits_uop_rfWen,
  output         io_out_bits_uop_fpWen,
  output [31:0]  io_out_bits_uop_imm,
  output [6:0]   io_out_bits_uop_uopIdx,
  output         io_out_bits_uop_lastUop,
  output [7:0]   io_out_bits_uop_pdest,
  output         io_out_bits_uop_robIdx_flag,
  output [7:0]   io_out_bits_uop_robIdx_value,
  output         io_out_bits_uop_storeSetHit,
  output         io_out_bits_uop_waitForRobIdx_flag,
  output [7:0]   io_out_bits_uop_waitForRobIdx_value,
  output         io_out_bits_uop_loadWaitBit,
  output         io_out_bits_uop_loadWaitStrict,
  output         io_out_bits_uop_lqIdx_flag,
  output [6:0]   io_out_bits_uop_lqIdx_value,
  output         io_out_bits_uop_sqIdx_flag,
  output [5:0]   io_out_bits_uop_sqIdx_value,
  output         io_out_bits_usSecondInv,
  output [3:0]   io_out_bits_mBIndex,
  output [7:0]   io_out_bits_elemIdx,
  output [7:0]   io_out_bits_elemIdxInsideVd
);

  wire         inActiveIssue;
  wire         activeIssue;
  wire         splitFinish;
  wire         needCancel;
  reg  [15:0]  uopq_flowMask;
  reg  [40:0]  uopq_baseAddr;
  reg  [127:0] uopq_stride;
  reg  [4:0]   uopq_flowNum;
  reg  [1:0]   uopq_eew;
  reg  [2:0]   uopq_sew;
  reg  [2:0]   uopq_emul;
  reg  [2:0]   uopq_lmul;
  reg  [2:0]   uopq_instType;
  reg  [4:0]   uopq_indexedSplitOffset;
  reg          uopq_uop_exceptionVec_4;
  reg          uopq_uop_exceptionVec_5;
  reg          uopq_uop_exceptionVec_13;
  reg          uopq_uop_exceptionVec_21;
  reg          uopq_uop_preDecodeInfo_isRVC;
  reg          uopq_uop_ftqPtr_flag;
  reg  [5:0]   uopq_uop_ftqPtr_value;
  reg  [3:0]   uopq_uop_ftqOffset;
  reg  [34:0]  uopq_uop_fuType;
  reg  [8:0]   uopq_uop_fuOpType;
  reg          uopq_uop_rfWen;
  reg          uopq_uop_fpWen;
  reg  [31:0]  uopq_uop_imm;
  reg  [6:0]   uopq_uop_vpu_vuopIdx;
  reg  [6:0]   uopq_uop_uopIdx;
  reg          uopq_uop_lastUop;
  reg  [7:0]   uopq_uop_pdest;
  reg          uopq_uop_robIdx_flag;
  reg  [7:0]   uopq_uop_robIdx_value;
  reg          uopq_uop_storeSetHit;
  reg          uopq_uop_waitForRobIdx_flag;
  reg  [7:0]   uopq_uop_waitForRobIdx_value;
  reg          uopq_uop_loadWaitBit;
  reg          uopq_uop_loadWaitStrict;
  reg          uopq_uop_lqIdx_flag;
  reg  [6:0]   uopq_uop_lqIdx_value;
  reg          uopq_uop_sqIdx_flag;
  reg  [5:0]   uopq_uop_sqIdx_value;
  reg  [127:0] uopq_uopOffset;
  reg          uopq_preIsSplit;
  reg  [3:0]   uopq_mBIndex;
  reg  [2:0]   uopq_alignedType;
  reg  [7:0]   uopq_indexVlMaxInVd;
  reg  [3:0]   regOffset;
  reg          uopq_usAligned128;
  reg  [31:0]  uopq_usMask;
  reg          allocated;
  reg  [4:0]   splitIdx;
  reg  [127:0] strideOffsetReg;
  wire [8:0]   _flushItself_T_2 =
    {io_redirect_bits_robIdx_flag, io_redirect_bits_robIdx_value};
  wire         _canAccept_T_2 = activeIssue | inActiveIssue;
  wire         canAccept = ~allocated | allocated & splitFinish & _canAccept_T_2;
  wire         doEnqueue =
    canAccept & io_in_valid
    & ~(io_redirect_valid
        & (io_redirect_bits_level
           & {io_in_bits_uop_robIdx_flag, io_in_bits_uop_robIdx_value} == _flushItself_T_2
           | io_in_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
           ^ io_in_bits_uop_robIdx_value > io_redirect_bits_robIdx_value));
  wire         issueValid = allocated & ~needCancel;
  wire [2:0]   elemIdx_uopFlowsLog2 =
    ~(uopq_instType[0]) | $signed(uopq_emul) > $signed(uopq_lmul)
      ? 3'(3'(($signed(uopq_emul) > 3'sh0 ? 3'h0 : uopq_emul) - 3'h4) - {1'h0, uopq_eew})
      : 3'(3'(($signed(uopq_lmul) > 3'sh0 ? 3'h0 : uopq_lmul) - 3'h4)
           - {1'h0, uopq_sew[1:0]});
  wire [7:0]   elemIdx =
    {1'h0, elemIdx_uopFlowsLog2 == 3'h0 ? uopq_uop_vpu_vuopIdx : 7'h0}
    | (elemIdx_uopFlowsLog2 == 3'h1 ? {uopq_uop_vpu_vuopIdx, splitIdx[0]} : 8'h0)
    | (elemIdx_uopFlowsLog2 == 3'h2 ? {uopq_uop_vpu_vuopIdx[5:0], splitIdx[1:0]} : 8'h0)
    | (elemIdx_uopFlowsLog2 == 3'h3 ? {uopq_uop_vpu_vuopIdx[4:0], splitIdx[2:0]} : 8'h0)
    | (elemIdx_uopFlowsLog2 == 3'h4 ? {uopq_uop_vpu_vuopIdx[3:0], splitIdx[3:0]} : 8'h0);
  wire [7:0]   _GEN = elemIdx & uopq_indexVlMaxInVd;
  wire         _indexedStride_T_111 = _GEN == 8'h0;
  wire         _indexedStride_T_112 = _GEN == 8'h1;
  wire         _indexedStride_T_100 = _GEN == 8'h2;
  wire         _indexedStride_T_101 = _GEN == 8'h3;
  wire         _indexedStride_T_75 = _GEN == 8'h4;
  wire         _indexedStride_T_76 = _GEN == 8'h5;
  wire         _indexedStride_T_77 = _GEN == 8'h6;
  wire         _indexedStride_T_78 = _GEN == 8'h7;
  wire [40:0]  _vaddr_T_2 =
    41'(uopq_baseAddr
        + 41'(uopq_uopOffset[40:0]
              + (uopq_instType[0]
                   ? {9'h0,
                      {16'h0,
                       {8'h0,
                        uopq_eew == 2'h0
                          ? (_indexedStride_T_111 ? uopq_stride[7:0] : 8'h0)
                            | (_indexedStride_T_112 ? uopq_stride[15:8] : 8'h0)
                            | (_indexedStride_T_100 ? uopq_stride[23:16] : 8'h0)
                            | (_indexedStride_T_101 ? uopq_stride[31:24] : 8'h0)
                            | (_indexedStride_T_75 ? uopq_stride[39:32] : 8'h0)
                            | (_indexedStride_T_76 ? uopq_stride[47:40] : 8'h0)
                            | (_indexedStride_T_77 ? uopq_stride[55:48] : 8'h0)
                            | (_indexedStride_T_78 ? uopq_stride[63:56] : 8'h0)
                            | (_GEN == 8'h8 ? uopq_stride[71:64] : 8'h0)
                            | (_GEN == 8'h9 ? uopq_stride[79:72] : 8'h0)
                            | (_GEN == 8'hA ? uopq_stride[87:80] : 8'h0)
                            | (_GEN == 8'hB ? uopq_stride[95:88] : 8'h0)
                            | (_GEN == 8'hC ? uopq_stride[103:96] : 8'h0)
                            | (_GEN == 8'hD ? uopq_stride[111:104] : 8'h0)
                            | (_GEN == 8'hE ? uopq_stride[119:112] : 8'h0)
                            | (_GEN == 8'hF ? uopq_stride[127:120] : 8'h0)
                          : 8'h0}
                         | (uopq_eew == 2'h1
                              ? (_indexedStride_T_111 ? uopq_stride[15:0] : 16'h0)
                                | (_indexedStride_T_112 ? uopq_stride[31:16] : 16'h0)
                                | (_indexedStride_T_100 ? uopq_stride[47:32] : 16'h0)
                                | (_indexedStride_T_101 ? uopq_stride[63:48] : 16'h0)
                                | (_indexedStride_T_75 ? uopq_stride[79:64] : 16'h0)
                                | (_indexedStride_T_76 ? uopq_stride[95:80] : 16'h0)
                                | (_indexedStride_T_77 ? uopq_stride[111:96] : 16'h0)
                                | (_indexedStride_T_78 ? uopq_stride[127:112] : 16'h0)
                              : 16'h0)}
                        | (uopq_eew == 2'h2
                             ? (_indexedStride_T_111 ? uopq_stride[31:0] : 32'h0)
                               | (_indexedStride_T_112 ? uopq_stride[63:32] : 32'h0)
                               | (_indexedStride_T_100 ? uopq_stride[95:64] : 32'h0)
                               | (_indexedStride_T_101 ? uopq_stride[127:96] : 32'h0)
                             : 32'h0)}
                     | ((&uopq_eew)
                          ? (_indexedStride_T_111 ? uopq_stride[40:0] : 41'h0)
                            | (_indexedStride_T_112 ? uopq_stride[104:64] : 41'h0)
                          : 41'h0)
                   : strideOffsetReg[40:0])));
  wire [30:0]  mask =
    {15'h0,
     {8'h0,
      {4'h0,
       {2'h0, {1'h0, uopq_alignedType == 3'h0} | {2{uopq_alignedType == 3'h1}}}
         | {4{uopq_alignedType == 3'h2}}} | {8{uopq_alignedType == 3'h3}}}
       | {16{uopq_alignedType == 3'h4}}} << _vaddr_T_2[3:0];
  wire [31:0]  _vecActive_T = 32'h1 << splitIdx;
  wire [15:0]  _GEN_0 = _vecActive_T[15:0] & uopq_flowMask;
  wire         _usSplitVaddr_T = splitIdx == 5'h0;
  wire         _usSplitVaddr_T_1 = splitIdx == 5'h1;
  wire         usNoSplit =
    (uopq_usAligned128 | uopq_usMask[31:16] == 16'h0) & ~uopq_preIsSplit
    & _usSplitVaddr_T;
  wire [8:0]   _flushItself_T_1 = {uopq_uop_robIdx_flag, uopq_uop_robIdx_value};
  wire         differentFlag = uopq_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag;
  wire         compare = uopq_uop_robIdx_value > io_redirect_bits_robIdx_value;
  assign needCancel =
    io_redirect_valid
    & (io_redirect_bits_level & _flushItself_T_1 == _flushItself_T_2 | differentFlag
       ^ compare) & allocated;
  wire [4:0]   _GEN_1 =
    {3'h0, usNoSplit ? 2'h2 : {1'h0, 1'(inActiveIssue + activeIssue)}};
  assign splitFinish = splitIdx >= 5'(uopq_flowNum - _GEN_1);
  assign activeIssue = issueValid & io_out_ready & ((|_GEN_0) | ~uopq_preIsSplit);
  assign inActiveIssue = issueValid & ~(|_GEN_0) & uopq_preIsSplit;
  wire [7:0]   io_out_bits_uop_lqIdx_new_value =
    8'({1'h0, uopq_uop_lqIdx_value} + {3'h0, splitIdx});
  wire [8:0]   _io_out_bits_uop_lqIdx_diff_T_4 =
    9'({1'h0, io_out_bits_uop_lqIdx_new_value} - 9'h48);
  wire         io_out_bits_uop_lqIdx_reverse_flag =
    $signed(_io_out_bits_uop_lqIdx_diff_T_4) > -9'sh1;
  always @(posedge clock) begin
    if (doEnqueue) begin
      uopq_flowMask <= io_in_bits_flowMask;
      uopq_baseAddr <= io_in_bits_baseAddr;
      uopq_stride <= io_in_bits_stride;
      uopq_flowNum <= io_in_bits_flowNum;
      uopq_eew <= io_in_bits_eew;
      uopq_sew <= io_in_bits_sew;
      uopq_emul <= io_in_bits_emul;
      uopq_lmul <= io_in_bits_lmul;
      uopq_instType <= io_in_bits_instType;
      uopq_indexedSplitOffset <= io_in_bits_indexedSplitOffset;
      uopq_uop_ftqPtr_flag <= io_in_bits_uop_ftqPtr_flag;
      uopq_uop_ftqPtr_value <= io_in_bits_uop_ftqPtr_value;
      uopq_uop_ftqOffset <= io_in_bits_uop_ftqOffset;
      uopq_uop_fuType <= io_in_bits_uop_fuType;
      uopq_uop_fuOpType <= io_in_bits_uop_fuOpType;
      uopq_uop_imm <= io_in_bits_uop_imm;
      uopq_uop_vpu_vuopIdx <= io_in_bits_uop_vpu_vuopIdx;
      uopq_uop_uopIdx <= io_in_bits_uop_uopIdx;
      uopq_uop_lastUop <= io_in_bits_uop_lastUop;
      uopq_uop_pdest <= io_in_bits_uop_pdest;
      uopq_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag;
      uopq_uop_robIdx_value <= io_in_bits_uop_robIdx_value;
      uopq_uop_waitForRobIdx_value <= 8'h0;
      uopq_uop_lqIdx_flag <= io_in_bits_uop_lqIdx_flag;
      uopq_uop_lqIdx_value <= io_in_bits_uop_lqIdx_value;
      uopq_uop_sqIdx_flag <= io_in_bits_uop_sqIdx_flag;
      uopq_uop_sqIdx_value <= io_in_bits_uop_sqIdx_value;
      uopq_uopOffset <= io_in_bits_uopOffset;
      uopq_preIsSplit <= io_in_bits_preIsSplit;
      uopq_mBIndex <= io_in_bits_mBIndex;
      uopq_alignedType <= io_in_bits_alignedType;
      uopq_indexVlMaxInVd <= io_in_bits_indexVlMaxInVd;
      regOffset <= io_in_bits_usLowBitsAddr;
      uopq_usAligned128 <= io_in_bits_usAligned128;
      uopq_usMask <= io_in_bits_usMask;
    end
    uopq_uop_exceptionVec_4 <= ~doEnqueue & uopq_uop_exceptionVec_4;
    uopq_uop_exceptionVec_5 <= ~doEnqueue & uopq_uop_exceptionVec_5;
    uopq_uop_exceptionVec_13 <= ~doEnqueue & uopq_uop_exceptionVec_13;
    uopq_uop_exceptionVec_21 <= ~doEnqueue & uopq_uop_exceptionVec_21;
    uopq_uop_preDecodeInfo_isRVC <= ~doEnqueue & uopq_uop_preDecodeInfo_isRVC;
    uopq_uop_rfWen <= ~doEnqueue & uopq_uop_rfWen;
    uopq_uop_fpWen <= ~doEnqueue & uopq_uop_fpWen;
    uopq_uop_storeSetHit <= ~doEnqueue & uopq_uop_storeSetHit;
    uopq_uop_waitForRobIdx_flag <= ~doEnqueue & uopq_uop_waitForRobIdx_flag;
    uopq_uop_loadWaitBit <= ~doEnqueue & uopq_uop_loadWaitBit;
    uopq_uop_loadWaitStrict <= ~doEnqueue & uopq_uop_loadWaitStrict;
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      allocated <= 1'h0;
      splitIdx <= 5'h0;
      strideOffsetReg <= 128'h0;
    end
    else begin
      allocated <= doEnqueue | ~(needCancel | splitFinish & _canAccept_T_2) & allocated;
      if (io_redirect_valid
          & (io_redirect_bits_level & _flushItself_T_1 == _flushItself_T_2 | differentFlag
             ^ compare)) begin
        splitIdx <= 5'h0;
        strideOffsetReg <= 128'h0;
      end
      else begin
        if (_canAccept_T_2)
          splitIdx <= splitFinish ? 5'h0 : 5'(splitIdx + _GEN_1);
        if (splitFinish) begin
          if (_canAccept_T_2)
            strideOffsetReg <= 128'h0;
        end
        else if (_canAccept_T_2 & uopq_preIsSplit)
          strideOffsetReg <= 128'(strideOffsetReg + uopq_stride);
      end
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:60];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [5:0] i = 6'h0; i < 6'h3D; i += 6'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        uopq_flowMask = _RANDOM[6'h0][15:0];
        uopq_baseAddr = {_RANDOM[6'h5][31:8], _RANDOM[6'h6][16:0]};
        uopq_stride =
          {_RANDOM[6'h6][31:17],
           _RANDOM[6'h7],
           _RANDOM[6'h8],
           _RANDOM[6'h9],
           _RANDOM[6'hA][16:0]};
        uopq_flowNum = _RANDOM[6'hA][21:17];
        uopq_eew = _RANDOM[6'hA][30:29];
        uopq_sew = {_RANDOM[6'hA][31], _RANDOM[6'hB][1:0]};
        uopq_emul = _RANDOM[6'hB][4:2];
        uopq_lmul = _RANDOM[6'hB][7:5];
        uopq_instType = _RANDOM[6'hB][18:16];
        uopq_indexedSplitOffset = _RANDOM[6'hC][9:5];
        uopq_uop_exceptionVec_4 = _RANDOM[6'hF][1];
        uopq_uop_exceptionVec_5 = _RANDOM[6'hF][2];
        uopq_uop_exceptionVec_13 = _RANDOM[6'hF][10];
        uopq_uop_exceptionVec_21 = _RANDOM[6'hF][18];
        uopq_uop_preDecodeInfo_isRVC = _RANDOM[6'h10][7];
        uopq_uop_ftqPtr_flag = _RANDOM[6'h10][14];
        uopq_uop_ftqPtr_value = _RANDOM[6'h10][20:15];
        uopq_uop_ftqOffset = _RANDOM[6'h10][24:21];
        uopq_uop_fuType = {_RANDOM[6'h11][31:19], _RANDOM[6'h12][21:0]};
        uopq_uop_fuOpType = _RANDOM[6'h12][30:22];
        uopq_uop_rfWen = _RANDOM[6'h12][31];
        uopq_uop_fpWen = _RANDOM[6'h13][0];
        uopq_uop_imm = {_RANDOM[6'h13][31:13], _RANDOM[6'h14][12:0]};
        uopq_uop_vpu_vuopIdx = _RANDOM[6'h16][11:5];
        uopq_uop_uopIdx = _RANDOM[6'h1B][11:5];
        uopq_uop_lastUop = _RANDOM[6'h1B][14];
        uopq_uop_pdest = _RANDOM[6'h1E][18:11];
        uopq_uop_robIdx_flag = _RANDOM[6'h1E][19];
        uopq_uop_robIdx_value = _RANDOM[6'h1E][27:20];
        uopq_uop_storeSetHit = _RANDOM[6'h31][4];
        uopq_uop_waitForRobIdx_flag = _RANDOM[6'h31][5];
        uopq_uop_waitForRobIdx_value = _RANDOM[6'h31][13:6];
        uopq_uop_loadWaitBit = _RANDOM[6'h31][14];
        uopq_uop_loadWaitStrict = _RANDOM[6'h31][15];
        uopq_uop_lqIdx_flag = _RANDOM[6'h31][21];
        uopq_uop_lqIdx_value = _RANDOM[6'h31][28:22];
        uopq_uop_sqIdx_flag = _RANDOM[6'h31][29];
        uopq_uop_sqIdx_value = {_RANDOM[6'h31][31:30], _RANDOM[6'h32][3:0]};
        uopq_uopOffset =
          {_RANDOM[6'h32][31:15],
           _RANDOM[6'h33],
           _RANDOM[6'h34],
           _RANDOM[6'h35],
           _RANDOM[6'h36][14:0]};
        uopq_preIsSplit = _RANDOM[6'h36][15];
        uopq_mBIndex = _RANDOM[6'h36][19:16];
        uopq_alignedType = _RANDOM[6'h36][22:20];
        uopq_indexVlMaxInVd = _RANDOM[6'h36][30:23];
        regOffset = {_RANDOM[6'h36][31], _RANDOM[6'h37][2:0]};
        uopq_usAligned128 = _RANDOM[6'h37][3];
        uopq_usMask = {_RANDOM[6'h37][31:4], _RANDOM[6'h38][3:0]};
        allocated = _RANDOM[6'h38][4];
        splitIdx = _RANDOM[6'h38][9:5];
        strideOffsetReg =
          {_RANDOM[6'h38][31:10],
           _RANDOM[6'h39],
           _RANDOM[6'h3A],
           _RANDOM[6'h3B],
           _RANDOM[6'h3C][9:0]};
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        allocated = 1'h0;
        splitIdx = 5'h0;
        strideOffsetReg = 128'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = canAccept;
  assign io_out_valid = issueValid & ((|_GEN_0) | ~uopq_preIsSplit);
  assign io_out_bits_vaddr =
    uopq_preIsSplit
      ? _vaddr_T_2
      : {2'h0,
         (_usSplitVaddr_T ? {_vaddr_T_2[38:4], 4'h0} : 39'h0)
           | (_usSplitVaddr_T_1 ? 39'({_vaddr_T_2[38:4], 4'h0} + 39'h10) : 39'h0)};
  assign io_out_bits_mask =
    uopq_preIsSplit
      ? mask[15:0]
      : (_usSplitVaddr_T ? uopq_usMask[15:0] : 16'h0)
        | (_usSplitVaddr_T_1 ? uopq_usMask[31:16] : 16'h0);
  assign io_out_bits_reg_offset = regOffset;
  assign io_out_bits_alignedType = uopq_alignedType;
  assign io_out_bits_vecActive = ~uopq_preIsSplit | (|_GEN_0);
  assign io_out_bits_uop_exceptionVec_4 = uopq_uop_exceptionVec_4;
  assign io_out_bits_uop_exceptionVec_5 = uopq_uop_exceptionVec_5;
  assign io_out_bits_uop_exceptionVec_13 = uopq_uop_exceptionVec_13;
  assign io_out_bits_uop_exceptionVec_21 = uopq_uop_exceptionVec_21;
  assign io_out_bits_uop_preDecodeInfo_isRVC = uopq_uop_preDecodeInfo_isRVC;
  assign io_out_bits_uop_ftqPtr_flag = uopq_uop_ftqPtr_flag;
  assign io_out_bits_uop_ftqPtr_value = uopq_uop_ftqPtr_value;
  assign io_out_bits_uop_ftqOffset = uopq_uop_ftqOffset;
  assign io_out_bits_uop_fuType = uopq_uop_fuType;
  assign io_out_bits_uop_fuOpType = uopq_uop_fuOpType;
  assign io_out_bits_uop_rfWen = uopq_uop_rfWen;
  assign io_out_bits_uop_fpWen = uopq_uop_fpWen;
  assign io_out_bits_uop_imm = uopq_uop_imm;
  assign io_out_bits_uop_uopIdx = uopq_uop_uopIdx;
  assign io_out_bits_uop_lastUop = uopq_uop_lastUop;
  assign io_out_bits_uop_pdest = uopq_uop_pdest;
  assign io_out_bits_uop_robIdx_flag = uopq_uop_robIdx_flag;
  assign io_out_bits_uop_robIdx_value = uopq_uop_robIdx_value;
  assign io_out_bits_uop_storeSetHit = uopq_uop_storeSetHit;
  assign io_out_bits_uop_waitForRobIdx_flag = uopq_uop_waitForRobIdx_flag;
  assign io_out_bits_uop_waitForRobIdx_value = uopq_uop_waitForRobIdx_value;
  assign io_out_bits_uop_loadWaitBit = uopq_uop_loadWaitBit;
  assign io_out_bits_uop_loadWaitStrict = uopq_uop_loadWaitStrict;
  assign io_out_bits_uop_lqIdx_flag =
    io_out_bits_uop_lqIdx_reverse_flag ^ uopq_uop_lqIdx_flag;
  assign io_out_bits_uop_lqIdx_value =
    io_out_bits_uop_lqIdx_reverse_flag
      ? _io_out_bits_uop_lqIdx_diff_T_4[6:0]
      : io_out_bits_uop_lqIdx_new_value[6:0];
  assign io_out_bits_uop_sqIdx_flag = uopq_uop_sqIdx_flag;
  assign io_out_bits_uop_sqIdx_value = uopq_uop_sqIdx_value;
  assign io_out_bits_usSecondInv = usNoSplit;
  assign io_out_bits_mBIndex = uopq_mBIndex;
  assign io_out_bits_elemIdx = elemIdx;
  assign io_out_bits_elemIdxInsideVd = {3'h0, 5'(uopq_indexedSplitOffset + splitIdx)};
endmodule

