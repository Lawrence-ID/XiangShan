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
module Dispatcher_14(
  input          io_in_valid,
  input  [34:0]  io_in_bits_fuType,
  input  [8:0]   io_in_bits_fuOpType,
  input  [127:0] io_in_bits_src_0,
  input  [127:0] io_in_bits_src_1,
  input  [127:0] io_in_bits_src_2,
  input  [127:0] io_in_bits_src_3,
  input  [127:0] io_in_bits_src_4,
  input          io_in_bits_robIdx_flag,
  input  [7:0]   io_in_bits_robIdx_value,
  input  [6:0]   io_in_bits_pdest,
  input          io_in_bits_vecWen,
  input          io_in_bits_v0Wen,
  input          io_in_bits_fpu_wflags,
  input          io_in_bits_vpu_vma,
  input          io_in_bits_vpu_vta,
  input  [1:0]   io_in_bits_vpu_vsew,
  input  [2:0]   io_in_bits_vpu_vlmul,
  input          io_in_bits_vpu_vm,
  input  [7:0]   io_in_bits_vpu_vstart,
  input  [6:0]   io_in_bits_vpu_vuopIdx,
  input          io_in_bits_vpu_isExt,
  input          io_in_bits_vpu_isNarrow,
  input          io_in_bits_vpu_isDstMask,
  input          io_in_bits_vpu_isOpMask,
  output         io_out_0_valid,
  output [8:0]   io_out_0_bits_fuOpType,
  output [127:0] io_out_0_bits_src_0,
  output [127:0] io_out_0_bits_src_1,
  output [127:0] io_out_0_bits_src_2,
  output [127:0] io_out_0_bits_src_3,
  output [127:0] io_out_0_bits_src_4,
  output         io_out_0_bits_robIdx_flag,
  output [7:0]   io_out_0_bits_robIdx_value,
  output [6:0]   io_out_0_bits_pdest,
  output         io_out_0_bits_vecWen,
  output         io_out_0_bits_v0Wen,
  output         io_out_0_bits_fpu_wflags,
  output         io_out_0_bits_vpu_vma,
  output         io_out_0_bits_vpu_vta,
  output [1:0]   io_out_0_bits_vpu_vsew,
  output [2:0]   io_out_0_bits_vpu_vlmul,
  output         io_out_0_bits_vpu_vm,
  output [7:0]   io_out_0_bits_vpu_vstart,
  output [6:0]   io_out_0_bits_vpu_vuopIdx,
  output         io_out_0_bits_vpu_isNarrow,
  output         io_out_0_bits_vpu_isDstMask,
  output         io_out_1_valid,
  output [8:0]   io_out_1_bits_fuOpType,
  output [127:0] io_out_1_bits_src_0,
  output [127:0] io_out_1_bits_src_1,
  output [127:0] io_out_1_bits_src_2,
  output [127:0] io_out_1_bits_src_3,
  output [127:0] io_out_1_bits_src_4,
  output         io_out_1_bits_robIdx_flag,
  output [7:0]   io_out_1_bits_robIdx_value,
  output [6:0]   io_out_1_bits_pdest,
  output         io_out_1_bits_vecWen,
  output         io_out_1_bits_v0Wen,
  output         io_out_1_bits_vpu_vma,
  output         io_out_1_bits_vpu_vta,
  output [1:0]   io_out_1_bits_vpu_vsew,
  output         io_out_1_bits_vpu_vm,
  output [7:0]   io_out_1_bits_vpu_vstart,
  output [6:0]   io_out_1_bits_vpu_vuopIdx,
  output         io_out_1_bits_vpu_isExt,
  output         io_out_1_bits_vpu_isNarrow,
  output         io_out_1_bits_vpu_isDstMask,
  output         io_out_1_bits_vpu_isOpMask,
  output         io_out_2_valid,
  output [8:0]   io_out_2_bits_fuOpType,
  output [127:0] io_out_2_bits_src_0,
  output [127:0] io_out_2_bits_src_1,
  output [127:0] io_out_2_bits_src_2,
  output [127:0] io_out_2_bits_src_3,
  output [127:0] io_out_2_bits_src_4,
  output         io_out_2_bits_robIdx_flag,
  output [7:0]   io_out_2_bits_robIdx_value,
  output [6:0]   io_out_2_bits_pdest,
  output         io_out_2_bits_vecWen,
  output         io_out_2_bits_v0Wen,
  output         io_out_2_bits_vpu_vma,
  output         io_out_2_bits_vpu_vta,
  output [1:0]   io_out_2_bits_vpu_vsew,
  output         io_out_2_bits_vpu_vm,
  output [7:0]   io_out_2_bits_vpu_vstart,
  output [6:0]   io_out_2_bits_vpu_vuopIdx,
  output         io_out_3_valid,
  output [8:0]   io_out_3_bits_fuOpType,
  output [127:0] io_out_3_bits_src_0,
  output [127:0] io_out_3_bits_src_1,
  output [127:0] io_out_3_bits_src_2,
  output [127:0] io_out_3_bits_src_3,
  output [127:0] io_out_3_bits_src_4,
  output         io_out_3_bits_robIdx_flag,
  output [7:0]   io_out_3_bits_robIdx_value,
  output [6:0]   io_out_3_bits_pdest,
  output         io_out_3_bits_vecWen,
  output         io_out_3_bits_v0Wen,
  output         io_out_3_bits_vpu_vma,
  output         io_out_3_bits_vpu_vta,
  output [1:0]   io_out_3_bits_vpu_vsew,
  output [2:0]   io_out_3_bits_vpu_vlmul,
  output         io_out_3_bits_vpu_vm,
  output [7:0]   io_out_3_bits_vpu_vstart,
  output [6:0]   io_out_3_bits_vpu_vuopIdx
);

  assign io_out_0_valid = io_in_bits_fuType == 35'h2000000 & io_in_valid;
  assign io_out_0_bits_fuOpType = io_in_bits_fuOpType;
  assign io_out_0_bits_src_0 = io_in_bits_src_0;
  assign io_out_0_bits_src_1 = io_in_bits_src_1;
  assign io_out_0_bits_src_2 = io_in_bits_src_2;
  assign io_out_0_bits_src_3 = io_in_bits_src_3;
  assign io_out_0_bits_src_4 = io_in_bits_src_4;
  assign io_out_0_bits_robIdx_flag = io_in_bits_robIdx_flag;
  assign io_out_0_bits_robIdx_value = io_in_bits_robIdx_value;
  assign io_out_0_bits_pdest = io_in_bits_pdest;
  assign io_out_0_bits_vecWen = io_in_bits_vecWen;
  assign io_out_0_bits_v0Wen = io_in_bits_v0Wen;
  assign io_out_0_bits_fpu_wflags = io_in_bits_fpu_wflags;
  assign io_out_0_bits_vpu_vma = io_in_bits_vpu_vma;
  assign io_out_0_bits_vpu_vta = io_in_bits_vpu_vta;
  assign io_out_0_bits_vpu_vsew = io_in_bits_vpu_vsew;
  assign io_out_0_bits_vpu_vlmul = io_in_bits_vpu_vlmul;
  assign io_out_0_bits_vpu_vm = io_in_bits_vpu_vm;
  assign io_out_0_bits_vpu_vstart = io_in_bits_vpu_vstart;
  assign io_out_0_bits_vpu_vuopIdx = io_in_bits_vpu_vuopIdx;
  assign io_out_0_bits_vpu_isNarrow = io_in_bits_vpu_isNarrow;
  assign io_out_0_bits_vpu_isDstMask = io_in_bits_vpu_isDstMask;
  assign io_out_1_valid = io_in_bits_fuType == 35'h80000 & io_in_valid;
  assign io_out_1_bits_fuOpType = io_in_bits_fuOpType;
  assign io_out_1_bits_src_0 = io_in_bits_src_0;
  assign io_out_1_bits_src_1 = io_in_bits_src_1;
  assign io_out_1_bits_src_2 = io_in_bits_src_2;
  assign io_out_1_bits_src_3 = io_in_bits_src_3;
  assign io_out_1_bits_src_4 = io_in_bits_src_4;
  assign io_out_1_bits_robIdx_flag = io_in_bits_robIdx_flag;
  assign io_out_1_bits_robIdx_value = io_in_bits_robIdx_value;
  assign io_out_1_bits_pdest = io_in_bits_pdest;
  assign io_out_1_bits_vecWen = io_in_bits_vecWen;
  assign io_out_1_bits_v0Wen = io_in_bits_v0Wen;
  assign io_out_1_bits_vpu_vma = io_in_bits_vpu_vma;
  assign io_out_1_bits_vpu_vta = io_in_bits_vpu_vta;
  assign io_out_1_bits_vpu_vsew = io_in_bits_vpu_vsew;
  assign io_out_1_bits_vpu_vm = io_in_bits_vpu_vm;
  assign io_out_1_bits_vpu_vstart = io_in_bits_vpu_vstart;
  assign io_out_1_bits_vpu_vuopIdx = io_in_bits_vpu_vuopIdx;
  assign io_out_1_bits_vpu_isExt = io_in_bits_vpu_isExt;
  assign io_out_1_bits_vpu_isNarrow = io_in_bits_vpu_isNarrow;
  assign io_out_1_bits_vpu_isDstMask = io_in_bits_vpu_isDstMask;
  assign io_out_1_bits_vpu_isOpMask = io_in_bits_vpu_isOpMask;
  assign io_out_2_valid = io_in_bits_fuType == 35'h200000 & io_in_valid;
  assign io_out_2_bits_fuOpType = io_in_bits_fuOpType;
  assign io_out_2_bits_src_0 = io_in_bits_src_0;
  assign io_out_2_bits_src_1 = io_in_bits_src_1;
  assign io_out_2_bits_src_2 = io_in_bits_src_2;
  assign io_out_2_bits_src_3 = io_in_bits_src_3;
  assign io_out_2_bits_src_4 = io_in_bits_src_4;
  assign io_out_2_bits_robIdx_flag = io_in_bits_robIdx_flag;
  assign io_out_2_bits_robIdx_value = io_in_bits_robIdx_value;
  assign io_out_2_bits_pdest = io_in_bits_pdest;
  assign io_out_2_bits_vecWen = io_in_bits_vecWen;
  assign io_out_2_bits_v0Wen = io_in_bits_v0Wen;
  assign io_out_2_bits_vpu_vma = io_in_bits_vpu_vma;
  assign io_out_2_bits_vpu_vta = io_in_bits_vpu_vta;
  assign io_out_2_bits_vpu_vsew = io_in_bits_vpu_vsew;
  assign io_out_2_bits_vpu_vm = io_in_bits_vpu_vm;
  assign io_out_2_bits_vpu_vstart = io_in_bits_vpu_vstart;
  assign io_out_2_bits_vpu_vuopIdx = io_in_bits_vpu_vuopIdx;
  assign io_out_3_valid = io_in_bits_fuType == 35'h100000 & io_in_valid;
  assign io_out_3_bits_fuOpType = io_in_bits_fuOpType;
  assign io_out_3_bits_src_0 = io_in_bits_src_0;
  assign io_out_3_bits_src_1 = io_in_bits_src_1;
  assign io_out_3_bits_src_2 = io_in_bits_src_2;
  assign io_out_3_bits_src_3 = io_in_bits_src_3;
  assign io_out_3_bits_src_4 = io_in_bits_src_4;
  assign io_out_3_bits_robIdx_flag = io_in_bits_robIdx_flag;
  assign io_out_3_bits_robIdx_value = io_in_bits_robIdx_value;
  assign io_out_3_bits_pdest = io_in_bits_pdest;
  assign io_out_3_bits_vecWen = io_in_bits_vecWen;
  assign io_out_3_bits_v0Wen = io_in_bits_v0Wen;
  assign io_out_3_bits_vpu_vma = io_in_bits_vpu_vma;
  assign io_out_3_bits_vpu_vta = io_in_bits_vpu_vta;
  assign io_out_3_bits_vpu_vsew = io_in_bits_vpu_vsew;
  assign io_out_3_bits_vpu_vlmul = io_in_bits_vpu_vlmul;
  assign io_out_3_bits_vpu_vm = io_in_bits_vpu_vm;
  assign io_out_3_bits_vpu_vstart = io_in_bits_vpu_vstart;
  assign io_out_3_bits_vpu_vuopIdx = io_in_bits_vpu_vuopIdx;
endmodule

