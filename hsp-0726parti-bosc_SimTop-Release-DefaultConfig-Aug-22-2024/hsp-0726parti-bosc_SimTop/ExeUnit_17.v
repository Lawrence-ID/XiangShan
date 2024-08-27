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
module ExeUnit_17(
  input          clock,
  input          reset,
  input          io_flush_valid,
  input          io_flush_bits_robIdx_flag,
  input  [7:0]   io_flush_bits_robIdx_value,
  input          io_flush_bits_level,
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
  input  [7:0]   io_in_bits_pdest,
  input          io_in_bits_fpWen,
  input          io_in_bits_vecWen,
  input          io_in_bits_v0Wen,
  input          io_in_bits_fpu_wflags,
  input          io_in_bits_vpu_vma,
  input          io_in_bits_vpu_vta,
  input  [1:0]   io_in_bits_vpu_vsew,
  input  [2:0]   io_in_bits_vpu_vlmul,
  input          io_in_bits_vpu_vm,
  input  [7:0]   io_in_bits_vpu_vstart,
  input          io_in_bits_vpu_fpu_isFoldTo1_2,
  input          io_in_bits_vpu_fpu_isFoldTo1_4,
  input          io_in_bits_vpu_fpu_isFoldTo1_8,
  input  [6:0]   io_in_bits_vpu_vuopIdx,
  input          io_in_bits_vpu_lastUop,
  input          io_in_bits_vpu_isNarrow,
  input          io_in_bits_vpu_isDstMask,
  output         io_out_valid,
  output [127:0] io_out_bits_data_1,
  output [127:0] io_out_bits_data_2,
  output [127:0] io_out_bits_data_3,
  output [7:0]   io_out_bits_pdest,
  output         io_out_bits_robIdx_flag,
  output [7:0]   io_out_bits_robIdx_value,
  output         io_out_bits_fpWen,
  output         io_out_bits_vecWen,
  output         io_out_bits_v0Wen,
  output [4:0]   io_out_bits_fflags,
  output         io_out_bits_wflags,
  input  [2:0]   io_frm
);

  wire         _in1ToN_io_out_0_valid;
  wire [8:0]   _in1ToN_io_out_0_bits_fuOpType;
  wire [127:0] _in1ToN_io_out_0_bits_src_0;
  wire [127:0] _in1ToN_io_out_0_bits_src_1;
  wire [127:0] _in1ToN_io_out_0_bits_src_2;
  wire [127:0] _in1ToN_io_out_0_bits_src_3;
  wire [127:0] _in1ToN_io_out_0_bits_src_4;
  wire         _in1ToN_io_out_0_bits_robIdx_flag;
  wire [7:0]   _in1ToN_io_out_0_bits_robIdx_value;
  wire [7:0]   _in1ToN_io_out_0_bits_pdest;
  wire         _in1ToN_io_out_0_bits_fpWen;
  wire         _in1ToN_io_out_0_bits_vecWen;
  wire         _in1ToN_io_out_0_bits_v0Wen;
  wire         _in1ToN_io_out_0_bits_fpu_wflags;
  wire         _in1ToN_io_out_0_bits_vpu_vma;
  wire         _in1ToN_io_out_0_bits_vpu_vta;
  wire [1:0]   _in1ToN_io_out_0_bits_vpu_vsew;
  wire [2:0]   _in1ToN_io_out_0_bits_vpu_vlmul;
  wire         _in1ToN_io_out_0_bits_vpu_vm;
  wire [7:0]   _in1ToN_io_out_0_bits_vpu_vstart;
  wire         _in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_2;
  wire         _in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_4;
  wire         _in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_8;
  wire [6:0]   _in1ToN_io_out_0_bits_vpu_vuopIdx;
  wire         _in1ToN_io_out_0_bits_vpu_lastUop;
  wire         _in1ToN_io_out_0_bits_vpu_isNarrow;
  wire         _in1ToN_io_out_0_bits_vpu_isDstMask;
  wire         _in1ToN_io_out_1_valid;
  wire [8:0]   _in1ToN_io_out_1_bits_fuOpType;
  wire [127:0] _in1ToN_io_out_1_bits_src_1;
  wire [127:0] _in1ToN_io_out_1_bits_src_2;
  wire [127:0] _in1ToN_io_out_1_bits_src_3;
  wire [127:0] _in1ToN_io_out_1_bits_src_4;
  wire         _in1ToN_io_out_1_bits_robIdx_flag;
  wire [7:0]   _in1ToN_io_out_1_bits_robIdx_value;
  wire [7:0]   _in1ToN_io_out_1_bits_pdest;
  wire         _in1ToN_io_out_1_bits_vecWen;
  wire         _in1ToN_io_out_1_bits_v0Wen;
  wire         _in1ToN_io_out_1_bits_fpu_wflags;
  wire         _in1ToN_io_out_1_bits_vpu_vma;
  wire         _in1ToN_io_out_1_bits_vpu_vta;
  wire [1:0]   _in1ToN_io_out_1_bits_vpu_vsew;
  wire [2:0]   _in1ToN_io_out_1_bits_vpu_vlmul;
  wire         _in1ToN_io_out_1_bits_vpu_vm;
  wire [7:0]   _in1ToN_io_out_1_bits_vpu_vstart;
  wire [6:0]   _in1ToN_io_out_1_bits_vpu_vuopIdx;
  wire         _in1ToN_io_out_1_bits_vpu_isDstMask;
  wire         _ClockGate_1_Q;
  wire         _ClockGate_Q;
  wire         _Vfcvt_io_out_valid;
  wire         _Vfcvt_io_out_bits_ctrl_robIdx_flag;
  wire [7:0]   _Vfcvt_io_out_bits_ctrl_robIdx_value;
  wire [7:0]   _Vfcvt_io_out_bits_ctrl_pdest;
  wire         _Vfcvt_io_out_bits_ctrl_vecWen;
  wire         _Vfcvt_io_out_bits_ctrl_v0Wen;
  wire         _Vfcvt_io_out_bits_ctrl_fpu_wflags;
  wire [127:0] _Vfcvt_io_out_bits_res_data;
  wire [4:0]   _Vfcvt_io_out_bits_res_fflags;
  wire         _Vfalu_io_out_valid;
  wire         _Vfalu_io_out_bits_ctrl_robIdx_flag;
  wire [7:0]   _Vfalu_io_out_bits_ctrl_robIdx_value;
  wire [7:0]   _Vfalu_io_out_bits_ctrl_pdest;
  wire         _Vfalu_io_out_bits_ctrl_fpWen;
  wire         _Vfalu_io_out_bits_ctrl_vecWen;
  wire         _Vfalu_io_out_bits_ctrl_v0Wen;
  wire         _Vfalu_io_out_bits_ctrl_fpu_wflags;
  wire [127:0] _Vfalu_io_out_bits_res_data;
  wire [4:0]   _Vfalu_io_out_bits_res_fflags;
  reg          fuVld_en_reg;
  reg          fuVldVec_1;
  wire         fuVld_en = io_in_valid | fuVldVec_1;
  reg          fuVld_en_reg_1;
  reg          fuVldVec_1_1;
  reg          fuVldVec_2;
  wire         fuVld_en_1 = io_in_valid | fuVldVec_1_1 | fuVldVec_2;
  wire [127:0] io_out_bits_data_3_0 =
    (_Vfalu_io_out_valid ? _Vfalu_io_out_bits_res_data : 128'h0)
    | (_Vfcvt_io_out_valid ? _Vfcvt_io_out_bits_res_data : 128'h0);
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      fuVld_en_reg <= 1'h0;
      fuVldVec_1 <= 1'h0;
      fuVld_en_reg_1 <= 1'h0;
      fuVldVec_1_1 <= 1'h0;
      fuVldVec_2 <= 1'h0;
    end
    else begin
      fuVld_en_reg <= fuVld_en;
      fuVldVec_1 <= io_in_valid;
      fuVld_en_reg_1 <= fuVld_en_1;
      fuVldVec_1_1 <= io_in_valid;
      fuVldVec_2 <= fuVldVec_1_1;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        fuVld_en_reg = _RANDOM[/*Zero width*/ 1'b0][0];
        fuVldVec_1 = _RANDOM[/*Zero width*/ 1'b0][2];
        fuVld_en_reg_1 = _RANDOM[/*Zero width*/ 1'b0][3];
        fuVldVec_1_1 = _RANDOM[/*Zero width*/ 1'b0][5];
        fuVldVec_2 = _RANDOM[/*Zero width*/ 1'b0][6];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        fuVld_en_reg = 1'h0;
        fuVldVec_1 = 1'h0;
        fuVld_en_reg_1 = 1'h0;
        fuVldVec_1_1 = 1'h0;
        fuVldVec_2 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  VFAlu Vfalu (
    .clock                               (_ClockGate_Q),
    .reset                               (reset),
    .io_flush_valid                      (io_flush_valid),
    .io_flush_bits_robIdx_flag           (io_flush_bits_robIdx_flag),
    .io_flush_bits_robIdx_value          (io_flush_bits_robIdx_value),
    .io_flush_bits_level                 (io_flush_bits_level),
    .io_in_valid                         (_in1ToN_io_out_0_valid),
    .io_in_bits_ctrl_fuOpType            (_in1ToN_io_out_0_bits_fuOpType),
    .io_in_bits_ctrl_robIdx_flag         (_in1ToN_io_out_0_bits_robIdx_flag),
    .io_in_bits_ctrl_robIdx_value        (_in1ToN_io_out_0_bits_robIdx_value),
    .io_in_bits_ctrl_pdest               (_in1ToN_io_out_0_bits_pdest),
    .io_in_bits_ctrl_fpWen               (_in1ToN_io_out_0_bits_fpWen),
    .io_in_bits_ctrl_vecWen              (_in1ToN_io_out_0_bits_vecWen),
    .io_in_bits_ctrl_v0Wen               (_in1ToN_io_out_0_bits_v0Wen),
    .io_in_bits_ctrl_fpu_wflags          (_in1ToN_io_out_0_bits_fpu_wflags),
    .io_in_bits_ctrl_vpu_vma             (_in1ToN_io_out_0_bits_vpu_vma),
    .io_in_bits_ctrl_vpu_vta             (_in1ToN_io_out_0_bits_vpu_vta),
    .io_in_bits_ctrl_vpu_vsew            (_in1ToN_io_out_0_bits_vpu_vsew),
    .io_in_bits_ctrl_vpu_vlmul           (_in1ToN_io_out_0_bits_vpu_vlmul),
    .io_in_bits_ctrl_vpu_vm              (_in1ToN_io_out_0_bits_vpu_vm),
    .io_in_bits_ctrl_vpu_vstart          (_in1ToN_io_out_0_bits_vpu_vstart),
    .io_in_bits_ctrl_vpu_fpu_isFoldTo1_2 (_in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_2),
    .io_in_bits_ctrl_vpu_fpu_isFoldTo1_4 (_in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_4),
    .io_in_bits_ctrl_vpu_fpu_isFoldTo1_8 (_in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_8),
    .io_in_bits_ctrl_vpu_vuopIdx         (_in1ToN_io_out_0_bits_vpu_vuopIdx),
    .io_in_bits_ctrl_vpu_lastUop         (_in1ToN_io_out_0_bits_vpu_lastUop),
    .io_in_bits_ctrl_vpu_isNarrow        (_in1ToN_io_out_0_bits_vpu_isNarrow),
    .io_in_bits_ctrl_vpu_isDstMask       (_in1ToN_io_out_0_bits_vpu_isDstMask),
    .io_in_bits_data_src_4               (_in1ToN_io_out_0_bits_src_4[7:0]),
    .io_in_bits_data_src_3               (_in1ToN_io_out_0_bits_src_3),
    .io_in_bits_data_src_2               (_in1ToN_io_out_0_bits_src_2),
    .io_in_bits_data_src_1               (_in1ToN_io_out_0_bits_src_1),
    .io_in_bits_data_src_0               (_in1ToN_io_out_0_bits_src_0),
    .io_out_valid                        (_Vfalu_io_out_valid),
    .io_out_bits_ctrl_robIdx_flag        (_Vfalu_io_out_bits_ctrl_robIdx_flag),
    .io_out_bits_ctrl_robIdx_value       (_Vfalu_io_out_bits_ctrl_robIdx_value),
    .io_out_bits_ctrl_pdest              (_Vfalu_io_out_bits_ctrl_pdest),
    .io_out_bits_ctrl_fpWen              (_Vfalu_io_out_bits_ctrl_fpWen),
    .io_out_bits_ctrl_vecWen             (_Vfalu_io_out_bits_ctrl_vecWen),
    .io_out_bits_ctrl_v0Wen              (_Vfalu_io_out_bits_ctrl_v0Wen),
    .io_out_bits_ctrl_fpu_wflags         (_Vfalu_io_out_bits_ctrl_fpu_wflags),
    .io_out_bits_res_data                (_Vfalu_io_out_bits_res_data),
    .io_out_bits_res_fflags              (_Vfalu_io_out_bits_res_fflags),
    .io_frm                              (io_frm)
  );
  VCVT_12 Vfcvt (
    .clock                         (_ClockGate_1_Q),
    .reset                         (reset),
    .io_flush_valid                (io_flush_valid),
    .io_flush_bits_robIdx_flag     (io_flush_bits_robIdx_flag),
    .io_flush_bits_robIdx_value    (io_flush_bits_robIdx_value),
    .io_flush_bits_level           (io_flush_bits_level),
    .io_in_valid                   (_in1ToN_io_out_1_valid),
    .io_in_bits_ctrl_fuOpType      (_in1ToN_io_out_1_bits_fuOpType),
    .io_in_bits_ctrl_robIdx_flag   (_in1ToN_io_out_1_bits_robIdx_flag),
    .io_in_bits_ctrl_robIdx_value  (_in1ToN_io_out_1_bits_robIdx_value),
    .io_in_bits_ctrl_pdest         (_in1ToN_io_out_1_bits_pdest),
    .io_in_bits_ctrl_vecWen        (_in1ToN_io_out_1_bits_vecWen),
    .io_in_bits_ctrl_v0Wen         (_in1ToN_io_out_1_bits_v0Wen),
    .io_in_bits_ctrl_fpu_wflags    (_in1ToN_io_out_1_bits_fpu_wflags),
    .io_in_bits_ctrl_vpu_vma       (_in1ToN_io_out_1_bits_vpu_vma),
    .io_in_bits_ctrl_vpu_vta       (_in1ToN_io_out_1_bits_vpu_vta),
    .io_in_bits_ctrl_vpu_vsew      (_in1ToN_io_out_1_bits_vpu_vsew),
    .io_in_bits_ctrl_vpu_vlmul     (_in1ToN_io_out_1_bits_vpu_vlmul),
    .io_in_bits_ctrl_vpu_vm        (_in1ToN_io_out_1_bits_vpu_vm),
    .io_in_bits_ctrl_vpu_vstart    (_in1ToN_io_out_1_bits_vpu_vstart),
    .io_in_bits_ctrl_vpu_vuopIdx   (_in1ToN_io_out_1_bits_vpu_vuopIdx),
    .io_in_bits_ctrl_vpu_isDstMask (_in1ToN_io_out_1_bits_vpu_isDstMask),
    .io_in_bits_data_src_4         (_in1ToN_io_out_1_bits_src_4[7:0]),
    .io_in_bits_data_src_3         (_in1ToN_io_out_1_bits_src_3),
    .io_in_bits_data_src_2         (_in1ToN_io_out_1_bits_src_2),
    .io_in_bits_data_src_1         (_in1ToN_io_out_1_bits_src_1),
    .io_out_valid                  (_Vfcvt_io_out_valid),
    .io_out_bits_ctrl_robIdx_flag  (_Vfcvt_io_out_bits_ctrl_robIdx_flag),
    .io_out_bits_ctrl_robIdx_value (_Vfcvt_io_out_bits_ctrl_robIdx_value),
    .io_out_bits_ctrl_pdest        (_Vfcvt_io_out_bits_ctrl_pdest),
    .io_out_bits_ctrl_vecWen       (_Vfcvt_io_out_bits_ctrl_vecWen),
    .io_out_bits_ctrl_v0Wen        (_Vfcvt_io_out_bits_ctrl_v0Wen),
    .io_out_bits_ctrl_fpu_wflags   (_Vfcvt_io_out_bits_ctrl_fpu_wflags),
    .io_out_bits_res_data          (_Vfcvt_io_out_bits_res_data),
    .io_out_bits_res_fflags        (_Vfcvt_io_out_bits_res_fflags),
    .io_frm                        (io_frm)
  );
  ClockGate ClockGate (
    .TE (1'h0),
    .E  (fuVld_en | fuVld_en_reg),
    .CK (clock),
    .Q  (_ClockGate_Q)
  );
  ClockGate ClockGate_1 (
    .TE (1'h0),
    .E  (fuVld_en_1 | fuVld_en_reg_1),
    .CK (clock),
    .Q  (_ClockGate_1_Q)
  );
  Dispatcher_17 in1ToN (
    .io_in_valid                       (io_in_valid),
    .io_in_bits_fuType                 (io_in_bits_fuType),
    .io_in_bits_fuOpType               (io_in_bits_fuOpType),
    .io_in_bits_src_0                  (io_in_bits_src_0),
    .io_in_bits_src_1                  (io_in_bits_src_1),
    .io_in_bits_src_2                  (io_in_bits_src_2),
    .io_in_bits_src_3                  (io_in_bits_src_3),
    .io_in_bits_src_4                  (io_in_bits_src_4),
    .io_in_bits_robIdx_flag            (io_in_bits_robIdx_flag),
    .io_in_bits_robIdx_value           (io_in_bits_robIdx_value),
    .io_in_bits_pdest                  (io_in_bits_pdest),
    .io_in_bits_fpWen                  (io_in_bits_fpWen),
    .io_in_bits_vecWen                 (io_in_bits_vecWen),
    .io_in_bits_v0Wen                  (io_in_bits_v0Wen),
    .io_in_bits_fpu_wflags             (io_in_bits_fpu_wflags),
    .io_in_bits_vpu_vma                (io_in_bits_vpu_vma),
    .io_in_bits_vpu_vta                (io_in_bits_vpu_vta),
    .io_in_bits_vpu_vsew               (io_in_bits_vpu_vsew),
    .io_in_bits_vpu_vlmul              (io_in_bits_vpu_vlmul),
    .io_in_bits_vpu_vm                 (io_in_bits_vpu_vm),
    .io_in_bits_vpu_vstart             (io_in_bits_vpu_vstart),
    .io_in_bits_vpu_fpu_isFoldTo1_2    (io_in_bits_vpu_fpu_isFoldTo1_2),
    .io_in_bits_vpu_fpu_isFoldTo1_4    (io_in_bits_vpu_fpu_isFoldTo1_4),
    .io_in_bits_vpu_fpu_isFoldTo1_8    (io_in_bits_vpu_fpu_isFoldTo1_8),
    .io_in_bits_vpu_vuopIdx            (io_in_bits_vpu_vuopIdx),
    .io_in_bits_vpu_lastUop            (io_in_bits_vpu_lastUop),
    .io_in_bits_vpu_isNarrow           (io_in_bits_vpu_isNarrow),
    .io_in_bits_vpu_isDstMask          (io_in_bits_vpu_isDstMask),
    .io_out_0_valid                    (_in1ToN_io_out_0_valid),
    .io_out_0_bits_fuOpType            (_in1ToN_io_out_0_bits_fuOpType),
    .io_out_0_bits_src_0               (_in1ToN_io_out_0_bits_src_0),
    .io_out_0_bits_src_1               (_in1ToN_io_out_0_bits_src_1),
    .io_out_0_bits_src_2               (_in1ToN_io_out_0_bits_src_2),
    .io_out_0_bits_src_3               (_in1ToN_io_out_0_bits_src_3),
    .io_out_0_bits_src_4               (_in1ToN_io_out_0_bits_src_4),
    .io_out_0_bits_robIdx_flag         (_in1ToN_io_out_0_bits_robIdx_flag),
    .io_out_0_bits_robIdx_value        (_in1ToN_io_out_0_bits_robIdx_value),
    .io_out_0_bits_pdest               (_in1ToN_io_out_0_bits_pdest),
    .io_out_0_bits_fpWen               (_in1ToN_io_out_0_bits_fpWen),
    .io_out_0_bits_vecWen              (_in1ToN_io_out_0_bits_vecWen),
    .io_out_0_bits_v0Wen               (_in1ToN_io_out_0_bits_v0Wen),
    .io_out_0_bits_fpu_wflags          (_in1ToN_io_out_0_bits_fpu_wflags),
    .io_out_0_bits_vpu_vma             (_in1ToN_io_out_0_bits_vpu_vma),
    .io_out_0_bits_vpu_vta             (_in1ToN_io_out_0_bits_vpu_vta),
    .io_out_0_bits_vpu_vsew            (_in1ToN_io_out_0_bits_vpu_vsew),
    .io_out_0_bits_vpu_vlmul           (_in1ToN_io_out_0_bits_vpu_vlmul),
    .io_out_0_bits_vpu_vm              (_in1ToN_io_out_0_bits_vpu_vm),
    .io_out_0_bits_vpu_vstart          (_in1ToN_io_out_0_bits_vpu_vstart),
    .io_out_0_bits_vpu_fpu_isFoldTo1_2 (_in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_2),
    .io_out_0_bits_vpu_fpu_isFoldTo1_4 (_in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_4),
    .io_out_0_bits_vpu_fpu_isFoldTo1_8 (_in1ToN_io_out_0_bits_vpu_fpu_isFoldTo1_8),
    .io_out_0_bits_vpu_vuopIdx         (_in1ToN_io_out_0_bits_vpu_vuopIdx),
    .io_out_0_bits_vpu_lastUop         (_in1ToN_io_out_0_bits_vpu_lastUop),
    .io_out_0_bits_vpu_isNarrow        (_in1ToN_io_out_0_bits_vpu_isNarrow),
    .io_out_0_bits_vpu_isDstMask       (_in1ToN_io_out_0_bits_vpu_isDstMask),
    .io_out_1_valid                    (_in1ToN_io_out_1_valid),
    .io_out_1_bits_fuOpType            (_in1ToN_io_out_1_bits_fuOpType),
    .io_out_1_bits_src_1               (_in1ToN_io_out_1_bits_src_1),
    .io_out_1_bits_src_2               (_in1ToN_io_out_1_bits_src_2),
    .io_out_1_bits_src_3               (_in1ToN_io_out_1_bits_src_3),
    .io_out_1_bits_src_4               (_in1ToN_io_out_1_bits_src_4),
    .io_out_1_bits_robIdx_flag         (_in1ToN_io_out_1_bits_robIdx_flag),
    .io_out_1_bits_robIdx_value        (_in1ToN_io_out_1_bits_robIdx_value),
    .io_out_1_bits_pdest               (_in1ToN_io_out_1_bits_pdest),
    .io_out_1_bits_vecWen              (_in1ToN_io_out_1_bits_vecWen),
    .io_out_1_bits_v0Wen               (_in1ToN_io_out_1_bits_v0Wen),
    .io_out_1_bits_fpu_wflags          (_in1ToN_io_out_1_bits_fpu_wflags),
    .io_out_1_bits_vpu_vma             (_in1ToN_io_out_1_bits_vpu_vma),
    .io_out_1_bits_vpu_vta             (_in1ToN_io_out_1_bits_vpu_vta),
    .io_out_1_bits_vpu_vsew            (_in1ToN_io_out_1_bits_vpu_vsew),
    .io_out_1_bits_vpu_vlmul           (_in1ToN_io_out_1_bits_vpu_vlmul),
    .io_out_1_bits_vpu_vm              (_in1ToN_io_out_1_bits_vpu_vm),
    .io_out_1_bits_vpu_vstart          (_in1ToN_io_out_1_bits_vpu_vstart),
    .io_out_1_bits_vpu_vuopIdx         (_in1ToN_io_out_1_bits_vpu_vuopIdx),
    .io_out_1_bits_vpu_isDstMask       (_in1ToN_io_out_1_bits_vpu_isDstMask)
  );
  assign io_out_valid = |{_Vfalu_io_out_valid, _Vfcvt_io_out_valid};
  assign io_out_bits_data_1 = _Vfalu_io_out_bits_res_data;
  assign io_out_bits_data_2 = io_out_bits_data_3_0;
  assign io_out_bits_data_3 = io_out_bits_data_3_0;
  assign io_out_bits_pdest =
    (_Vfalu_io_out_valid ? _Vfalu_io_out_bits_ctrl_pdest : 8'h0)
    | (_Vfcvt_io_out_valid ? _Vfcvt_io_out_bits_ctrl_pdest : 8'h0);
  assign io_out_bits_robIdx_flag =
    _Vfalu_io_out_valid & _Vfalu_io_out_bits_ctrl_robIdx_flag | _Vfcvt_io_out_valid
    & _Vfcvt_io_out_bits_ctrl_robIdx_flag;
  assign io_out_bits_robIdx_value =
    (_Vfalu_io_out_valid ? _Vfalu_io_out_bits_ctrl_robIdx_value : 8'h0)
    | (_Vfcvt_io_out_valid ? _Vfcvt_io_out_bits_ctrl_robIdx_value : 8'h0);
  assign io_out_bits_fpWen = _Vfalu_io_out_valid & _Vfalu_io_out_bits_ctrl_fpWen;
  assign io_out_bits_vecWen =
    _Vfalu_io_out_valid & _Vfalu_io_out_bits_ctrl_vecWen | _Vfcvt_io_out_valid
    & _Vfcvt_io_out_bits_ctrl_vecWen;
  assign io_out_bits_v0Wen =
    _Vfalu_io_out_valid & _Vfalu_io_out_bits_ctrl_v0Wen | _Vfcvt_io_out_valid
    & _Vfcvt_io_out_bits_ctrl_v0Wen;
  assign io_out_bits_fflags =
    (_Vfalu_io_out_valid ? _Vfalu_io_out_bits_res_fflags : 5'h0)
    | (_Vfcvt_io_out_valid ? _Vfcvt_io_out_bits_res_fflags : 5'h0);
  assign io_out_bits_wflags =
    _Vfalu_io_out_valid & _Vfalu_io_out_bits_ctrl_fpu_wflags | _Vfcvt_io_out_valid
    & _Vfcvt_io_out_bits_ctrl_fpu_wflags;
endmodule

