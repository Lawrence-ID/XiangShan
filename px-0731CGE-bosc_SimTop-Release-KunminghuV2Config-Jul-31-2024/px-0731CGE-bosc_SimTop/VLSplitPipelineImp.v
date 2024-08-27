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
module VLSplitPipelineImp(
  input          clock,
  input          reset,
  input          io_redirect_valid,
  input          io_redirect_bits_robIdx_flag,
  input  [7:0]   io_redirect_bits_robIdx_value,
  input          io_redirect_bits_level,
  output         io_in_ready,
  input          io_in_valid,
  input          io_in_bits_uop_ftqPtr_flag,
  input  [5:0]   io_in_bits_uop_ftqPtr_value,
  input  [3:0]   io_in_bits_uop_ftqOffset,
  input  [34:0]  io_in_bits_uop_fuType,
  input  [8:0]   io_in_bits_uop_fuOpType,
  input          io_in_bits_uop_vecWen,
  input          io_in_bits_uop_v0Wen,
  input  [31:0]  io_in_bits_uop_imm,
  input          io_in_bits_uop_vpu_vma,
  input          io_in_bits_uop_vpu_vta,
  input  [1:0]   io_in_bits_uop_vpu_vsew,
  input  [2:0]   io_in_bits_uop_vpu_vlmul,
  input          io_in_bits_uop_vpu_vm,
  input  [7:0]   io_in_bits_uop_vpu_vstart,
  input  [6:0]   io_in_bits_uop_vpu_vuopIdx,
  input  [2:0]   io_in_bits_uop_vpu_nf,
  input  [1:0]   io_in_bits_uop_vpu_veew,
  input  [7:0]   io_in_bits_uop_pdest,
  input          io_in_bits_uop_robIdx_flag,
  input  [7:0]   io_in_bits_uop_robIdx_value,
  input          io_in_bits_uop_lqIdx_flag,
  input  [6:0]   io_in_bits_uop_lqIdx_value,
  input          io_in_bits_uop_sqIdx_flag,
  input  [5:0]   io_in_bits_uop_sqIdx_value,
  input  [127:0] io_in_bits_src_0,
  input  [127:0] io_in_bits_src_1,
  input  [127:0] io_in_bits_src_2,
  input  [127:0] io_in_bits_src_3,
  input  [127:0] io_in_bits_src_4,
  input  [4:0]   io_in_bits_flowNum,
  input          io_toMergeBuffer_req_ready,
  output         io_toMergeBuffer_req_valid,
  output [15:0]  io_toMergeBuffer_req_bits_mask,
  output [4:0]   io_toMergeBuffer_req_bits_flowNum,
  output [8:0]   io_toMergeBuffer_req_bits_uop_fuOpType,
  output         io_toMergeBuffer_req_bits_uop_vecWen,
  output         io_toMergeBuffer_req_bits_uop_v0Wen,
  output         io_toMergeBuffer_req_bits_uop_vpu_vma,
  output         io_toMergeBuffer_req_bits_uop_vpu_vta,
  output [1:0]   io_toMergeBuffer_req_bits_uop_vpu_vsew,
  output         io_toMergeBuffer_req_bits_uop_vpu_vm,
  output [7:0]   io_toMergeBuffer_req_bits_uop_vpu_vl,
  output [1:0]   io_toMergeBuffer_req_bits_uop_vpu_veew,
  output [6:0]   io_toMergeBuffer_req_bits_uop_uopIdx,
  output [7:0]   io_toMergeBuffer_req_bits_uop_pdest,
  output         io_toMergeBuffer_req_bits_uop_robIdx_flag,
  output [7:0]   io_toMergeBuffer_req_bits_uop_robIdx_value,
  output [127:0] io_toMergeBuffer_req_bits_data,
  output [2:0]   io_toMergeBuffer_req_bits_vdIdx,
  output         io_toMergeBuffer_req_bits_fof,
  output [7:0]   io_toMergeBuffer_req_bits_vlmax,
  input          io_toMergeBuffer_resp_valid,
  input  [3:0]   io_toMergeBuffer_resp_bits_mBIndex,
  input          io_out_ready,
  output         io_out_valid,
  output [15:0]  io_out_bits_flowMask,
  output [40:0]  io_out_bits_baseAddr,
  output [127:0] io_out_bits_stride,
  output [4:0]   io_out_bits_flowNum,
  output [1:0]   io_out_bits_eew,
  output [2:0]   io_out_bits_sew,
  output [2:0]   io_out_bits_emul,
  output [2:0]   io_out_bits_lmul,
  output [2:0]   io_out_bits_instType,
  output [4:0]   io_out_bits_indexedSplitOffset,
  output         io_out_bits_uop_ftqPtr_flag,
  output [5:0]   io_out_bits_uop_ftqPtr_value,
  output [3:0]   io_out_bits_uop_ftqOffset,
  output [34:0]  io_out_bits_uop_fuType,
  output [8:0]   io_out_bits_uop_fuOpType,
  output [31:0]  io_out_bits_uop_imm,
  output [6:0]   io_out_bits_uop_vpu_vuopIdx,
  output [6:0]   io_out_bits_uop_uopIdx,
  output         io_out_bits_uop_lastUop,
  output [7:0]   io_out_bits_uop_pdest,
  output         io_out_bits_uop_robIdx_flag,
  output [7:0]   io_out_bits_uop_robIdx_value,
  output         io_out_bits_uop_lqIdx_flag,
  output [6:0]   io_out_bits_uop_lqIdx_value,
  output         io_out_bits_uop_sqIdx_flag,
  output [5:0]   io_out_bits_uop_sqIdx_value,
  output [127:0] io_out_bits_uopOffset,
  output         io_out_bits_preIsSplit,
  output [3:0]   io_out_bits_mBIndex,
  output [2:0]   io_out_bits_alignedType,
  output [7:0]   io_out_bits_indexVlMaxInVd,
  output [3:0]   io_out_bits_usLowBitsAddr,
  output         io_out_bits_usAligned128,
  output [31:0]  io_out_bits_usMask
);

  wire          s1_kill;
  wire          s1_ready;
  wire          _s0_valid_T;
  wire [8:0]    _s1_kill_flushItself_T_2 =
    {io_redirect_bits_robIdx_flag, io_redirect_bits_robIdx_value};
  wire          s0_fire = io_in_valid & _s0_valid_T & s1_ready;
  assign _s0_valid_T =
    ~(io_redirect_valid
      & (io_redirect_bits_level
         & {io_in_bits_uop_robIdx_flag,
            io_in_bits_uop_robIdx_value} == _s1_kill_flushItself_T_2
         | io_in_bits_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
         ^ io_in_bits_uop_robIdx_value > io_redirect_bits_robIdx_value));
  reg           s1_valid;
  wire          s1_can_go = io_out_ready & io_toMergeBuffer_req_ready;
  assign s1_ready = s1_kill | ~s1_valid | s1_can_go;
  reg  [15:0]   s1_in_r_flowMask;
  reg  [15:0]   s1_in_r_byteMask;
  reg  [127:0]  s1_in_r_data;
  reg  [40:0]   s1_in_r_baseAddr;
  reg  [127:0]  s1_in_r_stride;
  reg  [4:0]    s1_in_r_flowNum;
  reg  [3:0]    s1_in_r_nfields;
  reg  [1:0]    s1_in_r_eew;
  reg  [2:0]    s1_in_r_sew;
  reg  [2:0]    s1_in_r_emul;
  reg  [2:0]    s1_in_r_lmul;
  reg  [7:0]    s1_in_r_vlmax;
  reg  [2:0]    s1_in_r_instType;
  reg  [15:0]   s1_in_r_indexedSrcMask;
  reg  [4:0]    s1_in_r_indexedSplitOffset;
  reg           s1_in_r_uop_ftqPtr_flag;
  reg  [5:0]    s1_in_r_uop_ftqPtr_value;
  reg  [3:0]    s1_in_r_uop_ftqOffset;
  reg  [34:0]   s1_in_r_uop_fuType;
  reg  [8:0]    s1_in_r_uop_fuOpType;
  reg           s1_in_r_uop_vecWen;
  reg           s1_in_r_uop_v0Wen;
  reg  [31:0]   s1_in_r_uop_imm;
  reg           s1_in_r_uop_vpu_vma;
  reg           s1_in_r_uop_vpu_vta;
  reg  [1:0]    s1_in_r_uop_vpu_vsew;
  reg           s1_in_r_uop_vpu_vm;
  reg  [6:0]    s1_in_r_uop_vpu_vuopIdx;
  reg  [7:0]    s1_in_r_uop_vpu_vl;
  reg  [2:0]    s1_in_r_uop_vpu_nf;
  reg  [1:0]    s1_in_r_uop_vpu_veew;
  reg  [6:0]    s1_in_r_uop_uopIdx;
  reg           s1_in_r_uop_lastUop;
  reg  [7:0]    s1_in_r_uop_pdest;
  reg           s1_in_r_uop_robIdx_flag;
  reg  [7:0]    s1_in_r_uop_robIdx_value;
  reg           s1_in_r_uop_lqIdx_flag;
  reg  [6:0]    s1_in_r_uop_lqIdx_value;
  reg           s1_in_r_uop_sqIdx_flag;
  reg  [5:0]    s1_in_r_uop_sqIdx_value;
  reg           s1_in_r_fof;
  reg  [2:0]    s1_in_r_vdIdxInField;
  reg           s1_in_r_preIsSplit;
  reg  [2:0]    s1_in_r_alignedType;
  reg  [7:0]    s1_in_r_indexVlMaxInVd;
  wire [127:0]  stride =
    s1_in_r_instType[0]
      ? s1_in_r_stride
      : {64'h0,
         s1_in_r_instType[1:0] == 2'h2
           ? s1_in_r_stride[63:0]
           : {57'h0, {3'h0, s1_in_r_nfields} << s1_in_r_eew}};
  wire [6:0]    uopOffset_uopInsidefield = s1_in_r_uop_vpu_vuopIdx >> s1_in_r_uop_vpu_nf;
  wire [128:0]  _uopOffset_otherVUopOffset_T_59 = {stride, 1'h0};
  wire [128:0]  _GEN = {stride, 1'h0};
  wire [128:0]  _GEN_0 = {1'h0, stride};
  wire [129:0]  _uopOffset_otherVUopOffset_T_58 = {stride, 2'h0};
  wire [129:0]  _GEN_1 = {stride, 2'h0};
  wire [129:0]  _GEN_2 = {2'h0, stride};
  wire [129:0]  _GEN_3 = {1'h0, stride, 1'h0};
  wire          _uopOffset_otherVUopOffset_T_65 = uopOffset_uopInsidefield == 7'h1;
  wire          _uopOffset_otherVUopOffset_T_66 = uopOffset_uopInsidefield == 7'h2;
  wire          _uopOffset_otherVUopOffset_T_67 = uopOffset_uopInsidefield == 7'h3;
  wire          _uopOffset_otherVUopOffset_T_68 = uopOffset_uopInsidefield == 7'h4;
  wire          _uopOffset_otherVUopOffset_T_69 = uopOffset_uopInsidefield == 7'h5;
  wire          _uopOffset_otherVUopOffset_T_70 = uopOffset_uopInsidefield == 7'h6;
  wire          _uopOffset_otherVUopOffset_T_71 = uopOffset_uopInsidefield == 7'h7;
  wire [136:0]  _GEN_4 = {134'h0, 3'(3'h4 - {1'h0, s1_in_r_eew})};
  wire [136:0]  _uopOffset_fofVUopOffset_T_43 =
    {7'h0,
     {1'h0,
      {1'h0, _uopOffset_otherVUopOffset_T_65 ? stride : 128'h0}
        | (_uopOffset_otherVUopOffset_T_66 ? _uopOffset_otherVUopOffset_T_59 : 129'h0)
        | (_uopOffset_otherVUopOffset_T_67 ? 129'(_GEN + _GEN_0) : 129'h0)}
       | (_uopOffset_otherVUopOffset_T_68 ? _uopOffset_otherVUopOffset_T_58 : 130'h0)
       | (_uopOffset_otherVUopOffset_T_69 ? 130'(_GEN_1 + _GEN_2) : 130'h0)
       | (_uopOffset_otherVUopOffset_T_70 ? 130'(_GEN_1 + _GEN_3) : 130'h0)
       | (_uopOffset_otherVUopOffset_T_71
            ? 130'(_GEN_1 + 130'(_GEN_3 + _GEN_2))
            : 130'h0)} << _GEN_4;
  wire [136:0]  _uopOffset_fofVUopOffset_T_87 =
    {7'h0,
     {1'h0,
      {1'h0, _uopOffset_otherVUopOffset_T_65 ? stride : 128'h0}
        | (_uopOffset_otherVUopOffset_T_66 ? _uopOffset_otherVUopOffset_T_59 : 129'h0)
        | (_uopOffset_otherVUopOffset_T_67 ? 129'(_GEN + _GEN_0) : 129'h0)}
       | (_uopOffset_otherVUopOffset_T_68 ? _uopOffset_otherVUopOffset_T_58 : 130'h0)
       | (_uopOffset_otherVUopOffset_T_69 ? 130'(_GEN_1 + _GEN_2) : 130'h0)
       | (_uopOffset_otherVUopOffset_T_70 ? 130'(_GEN_1 + _GEN_3) : 130'h0)
       | (_uopOffset_otherVUopOffset_T_71
            ? 130'(_GEN_1 + 130'(_GEN_3 + _GEN_2))
            : 130'h0)} << _GEN_4;
  wire          _uopOffset_otherVUopOffset_T_90 = s1_in_r_instType == 3'h0;
  wire          _uopOffset_otherVUopOffset_T_94 = s1_in_r_instType == 3'h4;
  wire [13:0]   _uopOffset_otherVUopOffset_T_45 =
    {7'h0, uopOffset_uopInsidefield} << s1_in_r_alignedType;
  wire [136:0]  _uopOffset_otherVUopOffset_T_44 =
    {7'h0,
     {1'h0,
      {1'h0, _uopOffset_otherVUopOffset_T_65 ? stride : 128'h0}
        | (_uopOffset_otherVUopOffset_T_66 ? _uopOffset_otherVUopOffset_T_59 : 129'h0)
        | (_uopOffset_otherVUopOffset_T_67 ? 129'(_GEN + _GEN_0) : 129'h0)}
       | (_uopOffset_otherVUopOffset_T_68 ? _uopOffset_otherVUopOffset_T_58 : 130'h0)
       | (_uopOffset_otherVUopOffset_T_69 ? 130'(_GEN_1 + _GEN_2) : 130'h0)
       | (_uopOffset_otherVUopOffset_T_70 ? 130'(_GEN_1 + _GEN_3) : 130'h0)
       | (_uopOffset_otherVUopOffset_T_71
            ? 130'(_GEN_1 + 130'(_GEN_3 + _GEN_2))
            : 130'h0)} << _GEN_4;
  wire [136:0]  _uopOffset_otherVUopOffset_T_89 =
    {7'h0,
     {1'h0,
      {1'h0, _uopOffset_otherVUopOffset_T_65 ? stride : 128'h0}
        | (_uopOffset_otherVUopOffset_T_66 ? _uopOffset_otherVUopOffset_T_59 : 129'h0)
        | (_uopOffset_otherVUopOffset_T_67 ? 129'(_GEN + _GEN_0) : 129'h0)}
       | (_uopOffset_otherVUopOffset_T_68 ? _uopOffset_otherVUopOffset_T_58 : 130'h0)
       | (_uopOffset_otherVUopOffset_T_69 ? 130'(_GEN_1 + _GEN_2) : 130'h0)
       | (_uopOffset_otherVUopOffset_T_70 ? 130'(_GEN_1 + _GEN_3) : 130'h0)
       | (_uopOffset_otherVUopOffset_T_71
            ? 130'(_GEN_1 + 130'(_GEN_3 + _GEN_2))
            : 130'h0)} << _GEN_4;
  wire [127:0]  _uopOffset_otherVUopOffset_T_108 =
    {114'h0, _uopOffset_otherVUopOffset_T_90 ? _uopOffset_otherVUopOffset_T_45 : 14'h0}
    | (s1_in_r_instType == 3'h2 ? _uopOffset_otherVUopOffset_T_44[127:0] : 128'h0);
  wire [127:0]  uopOffset =
    s1_in_r_fof
      ? (_uopOffset_otherVUopOffset_T_90 ? _uopOffset_fofVUopOffset_T_43[127:0] : 128'h0)
        | (_uopOffset_otherVUopOffset_T_94
             ? _uopOffset_fofVUopOffset_T_87[127:0]
             : 128'h0)
      : {_uopOffset_otherVUopOffset_T_108[127:14],
         _uopOffset_otherVUopOffset_T_108[13:0]
           | (_uopOffset_otherVUopOffset_T_94 ? _uopOffset_otherVUopOffset_T_45 : 14'h0)}
        | (s1_in_r_instType == 3'h6 ? _uopOffset_otherVUopOffset_T_89[127:0] : 128'h0);
  wire [4:0]    activeNum =
    s1_in_r_preIsSplit
      ? 5'({1'h0,
            4'({1'h0,
                3'({1'h0, 2'({1'h0, s1_in_r_flowMask[0]} + {1'h0, s1_in_r_flowMask[1]})}
                   + {1'h0,
                      2'({1'h0, s1_in_r_flowMask[2]} + {1'h0, s1_in_r_flowMask[3]})})}
               + {1'h0,
                  3'({1'h0, 2'({1'h0, s1_in_r_flowMask[4]} + {1'h0, s1_in_r_flowMask[5]})}
                     + {1'h0,
                        2'({1'h0, s1_in_r_flowMask[6]} + {1'h0, s1_in_r_flowMask[7]})})})}
           + {1'h0,
              4'({1'h0,
                  3'({1'h0, 2'({1'h0, s1_in_r_flowMask[8]} + {1'h0, s1_in_r_flowMask[9]})}
                     + {1'h0,
                        2'({1'h0, s1_in_r_flowMask[10]} + {1'h0, s1_in_r_flowMask[11]})})}
                 + {1'h0,
                    3'({1'h0,
                        2'({1'h0, s1_in_r_flowMask[12]} + {1'h0, s1_in_r_flowMask[13]})}
                       + {1'h0,
                          2'({1'h0, s1_in_r_flowMask[14]}
                             + {1'h0, s1_in_r_flowMask[15]})})})})
      : s1_in_r_flowNum;
  wire [3:0]    _usLowBitsAddr_T_2 = 4'(s1_in_r_baseAddr[3:0] + uopOffset[3:0]);
  wire [46:0]   usMask = {31'h0, s1_in_r_byteMask} << _usLowBitsAddr_T_2;
  assign s1_kill =
    io_redirect_valid
    & (io_redirect_bits_level
       & {s1_in_r_uop_robIdx_flag, s1_in_r_uop_robIdx_value} == _s1_kill_flushItself_T_2
       | s1_in_r_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
       ^ s1_in_r_uop_robIdx_value > io_redirect_bits_robIdx_value);
  always @(posedge clock or posedge reset) begin
    if (reset)
      s1_valid <= 1'h0;
    else
      s1_valid <= s0_fire | ~(s1_valid & ~s1_kill & s1_can_go | s1_kill) & s1_valid;
  end // always @(posedge, posedge)
  wire          _isSegment_T_1 = io_in_bits_uop_fuOpType == 9'h88;
  wire [2:0]    s0_nf = _isSegment_T_1 ? 3'h0 : io_in_bits_uop_vpu_nf;
  wire          _isMaskReg_T_2 = io_in_bits_uop_fuOpType == 9'h8B;
  wire [2:0]    _GEN_5 = {1'h0, io_in_bits_uop_vpu_veew};
  wire [2:0]    _GEN_6 = {1'h0, io_in_bits_uop_vpu_vsew};
  wire [2:0]    s0_emul =
    _isSegment_T_1
      ? {1'h0, io_in_bits_uop_vpu_nf == 3'h3, io_in_bits_uop_vpu_nf == 3'h1}
        | ((&io_in_bits_uop_vpu_nf) ? 3'h3 : 3'h0)
      : _isMaskReg_T_2 ? 3'h0 : 3'(3'(_GEN_5 - _GEN_6) + io_in_bits_uop_vpu_vlmul);
  wire          _s0_out_fof_T_2 = io_in_bits_uop_fuOpType == 9'h90;
  wire          _s0_preIsSplit_T_4 =
    ~(|(io_in_bits_uop_fuOpType[6:5])) & ~_s0_out_fof_T_2;
  wire [3:0]    s0_nfield = 4'({1'h0, s0_nf} + 4'h1);
  wire          isUsWholeReg = ~(|(io_in_bits_uop_fuOpType[6:5])) & _isSegment_T_1;
  wire [2:0]    instType = {(|s0_nf) & ~_isSegment_T_1, io_in_bits_uop_fuOpType[6:5]};
  wire [2:0]    uopIdxInField_mulInField =
    io_in_bits_uop_fuOpType[5] & $signed(io_in_bits_uop_vpu_vlmul) > $signed(s0_emul)
      ? io_in_bits_uop_vpu_vlmul
      : s0_emul;
  wire [2:0]    uopIdxInField =
    {1'h0,
     {1'h0, uopIdxInField_mulInField == 3'h1 & io_in_bits_uop_vpu_vuopIdx[0]}
       | (uopIdxInField_mulInField == 3'h2 ? io_in_bits_uop_vpu_vuopIdx[1:0] : 2'h0)}
    | (uopIdxInField_mulInField == 3'h3 ? io_in_bits_uop_vpu_vuopIdx[2:0] : 3'h0);
  wire [2:0]    _vdIdxInField_multiple_T = 3'(s0_emul - io_in_bits_uop_vpu_vlmul);
  wire [2:0]    _vdIdxInField_vdIdx_T_7 =
    _vdIdxInField_multiple_T == 3'h0 ? uopIdxInField : 3'h0;
  wire [1:0]    _GEN_7 =
    _vdIdxInField_vdIdx_T_7[1:0]
    | (_vdIdxInField_multiple_T == 3'h1 ? uopIdxInField[2:1] : 2'h0);
  wire [2:0]    vdIdxInField =
    io_in_bits_uop_fuOpType[6:5] == 2'h0 | io_in_bits_uop_fuOpType[6:5] == 2'h2
    | $signed(io_in_bits_uop_vpu_vlmul) > $signed(s0_emul)
      ? uopIdxInField
      : {_vdIdxInField_vdIdx_T_7[2],
         _GEN_7[1],
         _GEN_7[0] | _vdIdxInField_multiple_T == 3'h2 & uopIdxInField[2]};
  wire [10:0]   _GEN_8 = {7'h0, s0_nfield};
  wire [3:0]    _evl_T = 4'({1'h0, io_in_bits_uop_vpu_nf} + 4'h1);
  wire [7:0]    _evl_T_9 = io_in_bits_uop_vpu_veew == 2'h0 ? {_evl_T, 4'h0} : 8'h0;
  wire [6:0]    _GEN_9 =
    _evl_T_9[6:0] | (io_in_bits_uop_vpu_veew == 2'h1 ? {_evl_T, 3'h0} : 7'h0);
  wire [5:0]    _GEN_10 =
    _GEN_9[5:0] | (io_in_bits_uop_vpu_veew == 2'h2 ? {_evl_T, 2'h0} : 6'h0);
  wire [7:0]    _evl_T_15 =
    {_evl_T_9[7],
     _GEN_9[6],
     _GEN_10[5],
     _GEN_10[4:0] | ((&io_in_bits_uop_vpu_veew) ? {_evl_T, 1'h0} : 5'h0)};
  wire [7:0]    evl =
    isUsWholeReg
      ? _evl_T_15
      : ~(|(io_in_bits_uop_fuOpType[6:5])) & _isMaskReg_T_2
          ? (io_in_bits_src_4[2:0] == 3'h0
               ? {3'h0, io_in_bits_src_4[7:3]}
               : {2'h0, 6'({1'h0, io_in_bits_src_4[7:3]} + 6'h1)})
          : io_in_bits_src_4[7:0];
  wire [1:0]    alignedType =
    io_in_bits_uop_fuOpType[5] ? io_in_bits_uop_vpu_vsew : io_in_bits_uop_vpu_veew;
  wire [2:0]    _flowsLog2_eewRealFlowLog2_T_2 =
    3'(3'(($signed(s0_emul) > -3'sh1 ? 3'h0 : s0_emul) - 3'h4) - _GEN_5);
  wire [2:0]    _flowsLog2_sewRealFlowLog2_T_3 =
    3'(3'(($signed(io_in_bits_uop_vpu_vlmul) > -3'sh1 ? 3'h0 : io_in_bits_uop_vpu_vlmul)
          - 3'h4) - _GEN_6);
  wire [2:0]    flowsLog2_segmentIndexFlowLog2 =
    $signed(s0_emul) > $signed(io_in_bits_uop_vpu_vlmul)
      ? _flowsLog2_eewRealFlowLog2_T_2
      : _flowsLog2_sewRealFlowLog2_T_3;
  wire [2:0]    flowsLog2 =
    (instType == 3'h0 | instType == 3'h2 ? _flowsLog2_eewRealFlowLog2_T_2 : 3'h0)
    | (instType == 3'h1
         ? ($signed(s0_emul) > $signed(io_in_bits_uop_vpu_vlmul)
              ? _flowsLog2_eewRealFlowLog2_T_2
              : _flowsLog2_sewRealFlowLog2_T_3)
         : 3'h0)
    | (instType == 3'h3
         ? ($signed(s0_emul) > $signed(io_in_bits_uop_vpu_vlmul)
              ? _flowsLog2_eewRealFlowLog2_T_2
              : _flowsLog2_sewRealFlowLog2_T_3)
         : 3'h0) | (instType == 3'h4 ? _flowsLog2_eewRealFlowLog2_T_2 : 3'h0)
    | (instType == 3'h6 ? _flowsLog2_eewRealFlowLog2_T_2 : 3'h0)
    | (instType == 3'h5 ? flowsLog2_segmentIndexFlowLog2 : 3'h0)
    | ((&instType) ? flowsLog2_segmentIndexFlowLog2 : 3'h0);
  wire [9:0]    flowsPrevThisUop = {7'h0, uopIdxInField} << flowsLog2;
  wire [9:0]    flowsPrevThisVd =
    {7'h0, vdIdxInField}
    << (io_in_bits_uop_fuOpType[5] ? 3'(3'h4 - _GEN_6) : 3'(3'h4 - _GEN_5));
  wire          isSpecialIndexed =
    io_in_bits_uop_fuOpType[5] & $signed(s0_emul) > $signed(io_in_bits_uop_vpu_vlmul);
  wire [255:0]  _srcMask_vlMask_T = 256'h1 << evl;
  wire [255:0]  _srcMask_startMask_T = 256'h1 << io_in_bits_uop_vpu_vstart;
  wire [127:0]  srcMask =
    (io_in_bits_uop_vpu_vm ? 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF : io_in_bits_src_3)
    & 128'(_srcMask_vlMask_T[127:0] - 128'h1)
    & ~(128'(_srcMask_startMask_T[127:0] - 128'h1));
  wire [1023:0] _flowMask_T_5 = 1024'h1 << flowsPrevThisUop;
  wire [2047:0] _flowMask_T =
    2048'h1 << ({7'h0, 4'({1'h0, uopIdxInField} + 4'h1)} << flowsLog2);
  wire [128:0]  _flowMask_T_11 =
    {1'h0,
     128'(_flowMask_T[127:0] - 128'h1) & srcMask & ~(128'(_flowMask_T_5[127:0] - 128'h1))}
    >> (isSpecialIndexed ? flowsPrevThisUop : flowsPrevThisVd);
  wire [127:0]  indexedSrcMask = srcMask >> flowsPrevThisVd;
  always @(posedge clock) begin
    if (s0_fire) begin
      s1_in_r_flowMask <= _flowMask_T_11[15:0];
      s1_in_r_byteMask <=
        (alignedType == 2'h0 ? _flowMask_T_11[15:0] : 16'h0)
        | (alignedType == 2'h1
             ? {{2{_flowMask_T_11[7]}},
                {2{_flowMask_T_11[6]}},
                {2{_flowMask_T_11[5]}},
                {2{_flowMask_T_11[4]}},
                {2{_flowMask_T_11[3]}},
                {2{_flowMask_T_11[2]}},
                {2{_flowMask_T_11[1]}},
                {2{_flowMask_T_11[0]}}}
             : 16'h0)
        | (alignedType == 2'h2
             ? {{4{_flowMask_T_11[3]}},
                {4{_flowMask_T_11[2]}},
                {4{_flowMask_T_11[1]}},
                {4{_flowMask_T_11[0]}}}
             : 16'h0)
        | ((&alignedType) ? {{8{_flowMask_T_11[1]}}, {8{_flowMask_T_11[0]}}} : 16'h0);
      s1_in_r_data <= io_in_bits_src_2;
      s1_in_r_baseAddr <= io_in_bits_src_0[40:0];
      s1_in_r_stride <= io_in_bits_src_1;
      s1_in_r_flowNum <= io_in_bits_flowNum;
      s1_in_r_nfields <= s0_nfield;
      s1_in_r_eew <= io_in_bits_uop_vpu_veew;
      s1_in_r_sew <= {1'h0, io_in_bits_uop_vpu_vsew};
      s1_in_r_emul <= s0_emul;
      s1_in_r_lmul <= io_in_bits_uop_vpu_vlmul;
      s1_in_r_vlmax <=
        isUsWholeReg
          ? _evl_T_15
          : 8'h1 << 3'(3'(io_in_bits_uop_vpu_vlmul - 3'h4) - _GEN_6);
      s1_in_r_instType <= instType;
      s1_in_r_indexedSrcMask <= indexedSrcMask[15:0];
      s1_in_r_indexedSplitOffset <=
        isSpecialIndexed ? 5'(flowsPrevThisUop[4:0] - flowsPrevThisVd[4:0]) : 5'h0;
      s1_in_r_uop_ftqPtr_flag <= io_in_bits_uop_ftqPtr_flag;
      s1_in_r_uop_ftqPtr_value <= io_in_bits_uop_ftqPtr_value;
      s1_in_r_uop_ftqOffset <= io_in_bits_uop_ftqOffset;
      s1_in_r_uop_fuType <= io_in_bits_uop_fuType;
      s1_in_r_uop_fuOpType <= io_in_bits_uop_fuOpType;
      s1_in_r_uop_vecWen <= io_in_bits_uop_vecWen;
      s1_in_r_uop_v0Wen <= io_in_bits_uop_v0Wen;
      s1_in_r_uop_imm <= io_in_bits_uop_imm;
      s1_in_r_uop_vpu_vma <= io_in_bits_uop_vpu_vma;
      s1_in_r_uop_vpu_vta <= io_in_bits_uop_vpu_vta;
      s1_in_r_uop_vpu_vsew <= io_in_bits_uop_vpu_vsew;
      s1_in_r_uop_vpu_vm <= io_in_bits_uop_vpu_vm;
      s1_in_r_uop_vpu_vuopIdx <= io_in_bits_uop_vpu_vuopIdx;
      s1_in_r_uop_vpu_vl <= evl;
      s1_in_r_uop_vpu_nf <= s0_nf;
      s1_in_r_uop_vpu_veew <= io_in_bits_uop_vpu_veew;
      s1_in_r_uop_uopIdx <= io_in_bits_uop_vpu_vuopIdx;
      s1_in_r_uop_lastUop <=
        {3'h0,
         8'({1'h0, io_in_bits_uop_vpu_vuopIdx}
            + 8'h1)} == (io_in_bits_uop_fuOpType[5]
                         & $signed(io_in_bits_uop_vpu_vlmul) > $signed(s0_emul)
                           ? _GEN_8
                             << ($signed(io_in_bits_uop_vpu_vlmul) < 3'sh0
                                   ? 3'h0
                                   : io_in_bits_uop_vpu_vlmul)
                           : _GEN_8 << ($signed(s0_emul) < 3'sh0 ? 3'h0 : s0_emul));
      s1_in_r_uop_pdest <= io_in_bits_uop_pdest;
      s1_in_r_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag;
      s1_in_r_uop_robIdx_value <= io_in_bits_uop_robIdx_value;
      s1_in_r_uop_lqIdx_flag <= io_in_bits_uop_lqIdx_flag;
      s1_in_r_uop_lqIdx_value <= io_in_bits_uop_lqIdx_value;
      s1_in_r_uop_sqIdx_flag <= io_in_bits_uop_sqIdx_flag;
      s1_in_r_uop_sqIdx_value <= io_in_bits_uop_sqIdx_value;
      s1_in_r_fof <= ~(|(io_in_bits_uop_fuOpType[6:5])) & _s0_out_fof_T_2;
      s1_in_r_vdIdxInField <= vdIdxInField;
      s1_in_r_preIsSplit <= ~_s0_preIsSplit_T_4;
      s1_in_r_alignedType <= _s0_preIsSplit_T_4 ? 3'h4 : {1'h0, alignedType};
      s1_in_r_indexVlMaxInVd <=
        8'((8'h1 << 3'(3'(($signed(s0_emul) > 3'sh0 ? 3'h0 : s0_emul) - 3'h4) - _GEN_5))
           - 8'h1);
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:55];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [5:0] i = 6'h0; i < 6'h38; i += 6'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        s1_valid = _RANDOM[6'h0][3];
        s1_in_r_flowMask = _RANDOM[6'h0][19:4];
        s1_in_r_byteMask = {_RANDOM[6'h0][31:20], _RANDOM[6'h1][3:0]};
        s1_in_r_data =
          {_RANDOM[6'h1][31:4],
           _RANDOM[6'h2],
           _RANDOM[6'h3],
           _RANDOM[6'h4],
           _RANDOM[6'h5][3:0]};
        s1_in_r_baseAddr = {_RANDOM[6'h5][31:12], _RANDOM[6'h6][20:0]};
        s1_in_r_stride =
          {_RANDOM[6'h6][31:21],
           _RANDOM[6'h7],
           _RANDOM[6'h8],
           _RANDOM[6'h9],
           _RANDOM[6'hA][20:0]};
        s1_in_r_flowNum = _RANDOM[6'hA][25:21];
        s1_in_r_nfields = _RANDOM[6'hA][29:26];
        s1_in_r_eew = _RANDOM[6'hB][2:1];
        s1_in_r_sew = _RANDOM[6'hB][5:3];
        s1_in_r_emul = _RANDOM[6'hB][8:6];
        s1_in_r_lmul = _RANDOM[6'hB][11:9];
        s1_in_r_vlmax = _RANDOM[6'hB][19:12];
        s1_in_r_instType = _RANDOM[6'hB][22:20];
        s1_in_r_indexedSrcMask = {_RANDOM[6'hB][31:25], _RANDOM[6'hC][8:0]};
        s1_in_r_indexedSplitOffset = _RANDOM[6'hC][13:9];
        s1_in_r_uop_ftqPtr_flag = _RANDOM[6'h10][18];
        s1_in_r_uop_ftqPtr_value = _RANDOM[6'h10][24:19];
        s1_in_r_uop_ftqOffset = _RANDOM[6'h10][28:25];
        s1_in_r_uop_fuType = {_RANDOM[6'h11][31:23], _RANDOM[6'h12][25:0]};
        s1_in_r_uop_fuOpType = {_RANDOM[6'h12][31:26], _RANDOM[6'h13][2:0]};
        s1_in_r_uop_vecWen = _RANDOM[6'h13][5];
        s1_in_r_uop_v0Wen = _RANDOM[6'h13][6];
        s1_in_r_uop_imm = {_RANDOM[6'h13][31:17], _RANDOM[6'h14][16:0]};
        s1_in_r_uop_vpu_vma = _RANDOM[6'h15][5];
        s1_in_r_uop_vpu_vta = _RANDOM[6'h15][6];
        s1_in_r_uop_vpu_vsew = _RANDOM[6'h15][8:7];
        s1_in_r_uop_vpu_vm = _RANDOM[6'h15][20];
        s1_in_r_uop_vpu_vuopIdx = _RANDOM[6'h16][15:9];
        s1_in_r_uop_vpu_vl = _RANDOM[6'h1A][24:17];
        s1_in_r_uop_vpu_nf = _RANDOM[6'h1A][27:25];
        s1_in_r_uop_vpu_veew = _RANDOM[6'h1A][29:28];
        s1_in_r_uop_uopIdx = _RANDOM[6'h1B][15:9];
        s1_in_r_uop_lastUop = _RANDOM[6'h1B][18];
        s1_in_r_uop_pdest = _RANDOM[6'h1E][22:15];
        s1_in_r_uop_robIdx_flag = _RANDOM[6'h1E][23];
        s1_in_r_uop_robIdx_value = _RANDOM[6'h1E][31:24];
        s1_in_r_uop_lqIdx_flag = _RANDOM[6'h31][25];
        s1_in_r_uop_lqIdx_value = {_RANDOM[6'h31][31:26], _RANDOM[6'h32][0]};
        s1_in_r_uop_sqIdx_flag = _RANDOM[6'h32][1];
        s1_in_r_uop_sqIdx_value = _RANDOM[6'h32][7:2];
        s1_in_r_fof = _RANDOM[6'h32][15];
        s1_in_r_vdIdxInField = _RANDOM[6'h32][18:16];
        s1_in_r_preIsSplit = _RANDOM[6'h36][19];
        s1_in_r_alignedType = _RANDOM[6'h36][26:24];
        s1_in_r_indexVlMaxInVd = {_RANDOM[6'h36][31:27], _RANDOM[6'h37][2:0]};
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        s1_valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = s1_ready;
  assign io_toMergeBuffer_req_valid = io_out_ready & s1_valid;
  assign io_toMergeBuffer_req_bits_mask =
    s1_in_r_instType[0] & $signed(s1_in_r_emul) > $signed(s1_in_r_lmul)
      ? s1_in_r_indexedSrcMask
      : s1_in_r_flowMask;
  assign io_toMergeBuffer_req_bits_flowNum = activeNum;
  assign io_toMergeBuffer_req_bits_uop_fuOpType = s1_in_r_uop_fuOpType;
  assign io_toMergeBuffer_req_bits_uop_vecWen = s1_in_r_uop_vecWen;
  assign io_toMergeBuffer_req_bits_uop_v0Wen = s1_in_r_uop_v0Wen;
  assign io_toMergeBuffer_req_bits_uop_vpu_vma = s1_in_r_uop_vpu_vma;
  assign io_toMergeBuffer_req_bits_uop_vpu_vta = s1_in_r_uop_vpu_vta;
  assign io_toMergeBuffer_req_bits_uop_vpu_vsew = s1_in_r_uop_vpu_vsew;
  assign io_toMergeBuffer_req_bits_uop_vpu_vm = s1_in_r_uop_vpu_vm;
  assign io_toMergeBuffer_req_bits_uop_vpu_vl = s1_in_r_uop_vpu_vl;
  assign io_toMergeBuffer_req_bits_uop_vpu_veew = s1_in_r_uop_vpu_veew;
  assign io_toMergeBuffer_req_bits_uop_uopIdx = s1_in_r_uop_uopIdx;
  assign io_toMergeBuffer_req_bits_uop_pdest = s1_in_r_uop_pdest;
  assign io_toMergeBuffer_req_bits_uop_robIdx_flag = s1_in_r_uop_robIdx_flag;
  assign io_toMergeBuffer_req_bits_uop_robIdx_value = s1_in_r_uop_robIdx_value;
  assign io_toMergeBuffer_req_bits_data = s1_in_r_data;
  assign io_toMergeBuffer_req_bits_vdIdx = s1_in_r_vdIdxInField;
  assign io_toMergeBuffer_req_bits_fof = s1_in_r_fof;
  assign io_toMergeBuffer_req_bits_vlmax = s1_in_r_vlmax;
  assign io_out_valid = s1_valid & io_toMergeBuffer_resp_valid & (|activeNum);
  assign io_out_bits_flowMask = s1_in_r_flowMask;
  assign io_out_bits_baseAddr = s1_in_r_baseAddr;
  assign io_out_bits_stride = stride;
  assign io_out_bits_flowNum = s1_in_r_flowNum;
  assign io_out_bits_eew = s1_in_r_eew;
  assign io_out_bits_sew = s1_in_r_sew;
  assign io_out_bits_emul = s1_in_r_emul;
  assign io_out_bits_lmul = s1_in_r_lmul;
  assign io_out_bits_instType = s1_in_r_instType;
  assign io_out_bits_indexedSplitOffset = s1_in_r_indexedSplitOffset;
  assign io_out_bits_uop_ftqPtr_flag = s1_in_r_uop_ftqPtr_flag;
  assign io_out_bits_uop_ftqPtr_value = s1_in_r_uop_ftqPtr_value;
  assign io_out_bits_uop_ftqOffset = s1_in_r_uop_ftqOffset;
  assign io_out_bits_uop_fuType = s1_in_r_uop_fuType;
  assign io_out_bits_uop_fuOpType = s1_in_r_uop_fuOpType;
  assign io_out_bits_uop_imm = s1_in_r_uop_imm;
  assign io_out_bits_uop_vpu_vuopIdx = s1_in_r_uop_vpu_vuopIdx;
  assign io_out_bits_uop_uopIdx = s1_in_r_uop_uopIdx;
  assign io_out_bits_uop_lastUop = s1_in_r_uop_lastUop;
  assign io_out_bits_uop_pdest = s1_in_r_uop_pdest;
  assign io_out_bits_uop_robIdx_flag = s1_in_r_uop_robIdx_flag;
  assign io_out_bits_uop_robIdx_value = s1_in_r_uop_robIdx_value;
  assign io_out_bits_uop_lqIdx_flag = s1_in_r_uop_lqIdx_flag;
  assign io_out_bits_uop_lqIdx_value = s1_in_r_uop_lqIdx_value;
  assign io_out_bits_uop_sqIdx_flag = s1_in_r_uop_sqIdx_flag;
  assign io_out_bits_uop_sqIdx_value = s1_in_r_uop_sqIdx_value;
  assign io_out_bits_uopOffset = uopOffset;
  assign io_out_bits_preIsSplit = s1_in_r_preIsSplit;
  assign io_out_bits_mBIndex = io_toMergeBuffer_resp_bits_mBIndex;
  assign io_out_bits_alignedType = s1_in_r_alignedType;
  assign io_out_bits_indexVlMaxInVd = s1_in_r_indexVlMaxInVd;
  assign io_out_bits_usLowBitsAddr = _usLowBitsAddr_T_2;
  assign io_out_bits_usAligned128 = _usLowBitsAddr_T_2 == 4'h0;
  assign io_out_bits_usMask = usMask[31:0];
endmodule

