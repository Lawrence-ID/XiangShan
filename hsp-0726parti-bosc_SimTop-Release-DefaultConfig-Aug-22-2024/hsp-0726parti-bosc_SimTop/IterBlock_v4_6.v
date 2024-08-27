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
module IterBlock_v4_6(
  input  [7:0]  io_Sel_cons_0_0,
  input  [7:0]  io_Sel_cons_0_1,
  input  [7:0]  io_Sel_cons_0_2,
  input  [7:0]  io_Sel_cons_0_3,
  input  [7:0]  io_Sel_cons_1_0,
  input  [7:0]  io_Sel_cons_1_1,
  input  [7:0]  io_Sel_cons_1_2,
  input  [7:0]  io_Sel_cons_1_3,
  input  [7:0]  io_Sel_cons_2_0,
  input  [7:0]  io_Sel_cons_2_1,
  input  [7:0]  io_Sel_cons_2_2,
  input  [7:0]  io_Sel_cons_2_3,
  input  [7:0]  io_Sel_cons_3_0,
  input  [7:0]  io_Sel_cons_3_1,
  input  [7:0]  io_Sel_cons_3_2,
  input  [7:0]  io_Sel_cons_3_3,
  input  [7:0]  io_Sel_cons_4_0,
  input  [7:0]  io_Sel_cons_4_1,
  input  [7:0]  io_Sel_cons_4_2,
  input  [7:0]  io_Sel_cons_4_3,
  input  [8:0]  io_Spec_cons_0_0,
  input  [8:0]  io_Spec_cons_0_1,
  input  [8:0]  io_Spec_cons_0_2,
  input  [8:0]  io_Spec_cons_0_3,
  input  [8:0]  io_Spec_cons_1_0,
  input  [8:0]  io_Spec_cons_1_1,
  input  [8:0]  io_Spec_cons_1_2,
  input  [8:0]  io_Spec_cons_1_3,
  input  [8:0]  io_Spec_cons_2_0,
  input  [8:0]  io_Spec_cons_2_1,
  input  [8:0]  io_Spec_cons_2_2,
  input  [8:0]  io_Spec_cons_2_3,
  input  [8:0]  io_Spec_cons_3_0,
  input  [8:0]  io_Spec_cons_3_1,
  input  [8:0]  io_Spec_cons_3_2,
  input  [8:0]  io_Spec_cons_3_3,
  input  [8:0]  io_Spec_cons_4_0,
  input  [8:0]  io_Spec_cons_4_1,
  input  [8:0]  io_Spec_cons_4_2,
  input  [8:0]  io_Spec_cons_4_3,
  input  [69:0] io_iter_cons_0,
  input  [69:0] io_iter_cons_1,
  input  [69:0] io_iter_cons_3,
  input  [69:0] io_iter_cons_4,
  input  [8:0]  io_d_trunc_0,
  input  [8:0]  io_d_trunc_1,
  input  [8:0]  io_d_trunc_2,
  input  [8:0]  io_d_trunc_3,
  input  [10:0] io_spec_r2ud_0,
  input  [10:0] io_spec_r2ud_1,
  input  [10:0] io_spec_r2ud_3,
  input  [10:0] io_spec_r2ud_4,
  input  [63:0] io_pre_q_A,
  input  [63:0] io_pre_q_B,
  output [63:0] io_nxt_q_A,
  output [63:0] io_nxt_q_B,
  input  [7:0]  io_pre_sel_0_0,
  input  [7:0]  io_pre_sel_0_1,
  input  [7:0]  io_pre_sel_1_0,
  input  [7:0]  io_pre_sel_1_1,
  input  [7:0]  io_pre_sel_2_0,
  input  [7:0]  io_pre_sel_2_1,
  input  [7:0]  io_pre_sel_3_0,
  input  [7:0]  io_pre_sel_3_1,
  output [7:0]  io_nxt_sel_0_0,
  output [7:0]  io_nxt_sel_0_1,
  output [7:0]  io_nxt_sel_1_0,
  output [7:0]  io_nxt_sel_1_1,
  output [7:0]  io_nxt_sel_2_0,
  output [7:0]  io_nxt_sel_2_1,
  output [7:0]  io_nxt_sel_3_0,
  output [7:0]  io_nxt_sel_3_1,
  input  [8:0]  io_pre_spec_0_0_0,
  input  [8:0]  io_pre_spec_0_0_1,
  input  [8:0]  io_pre_spec_0_1_0,
  input  [8:0]  io_pre_spec_0_1_1,
  input  [8:0]  io_pre_spec_0_2_0,
  input  [8:0]  io_pre_spec_0_2_1,
  input  [8:0]  io_pre_spec_0_3_0,
  input  [8:0]  io_pre_spec_0_3_1,
  input  [8:0]  io_pre_spec_1_0_0,
  input  [8:0]  io_pre_spec_1_0_1,
  input  [8:0]  io_pre_spec_1_1_0,
  input  [8:0]  io_pre_spec_1_1_1,
  input  [8:0]  io_pre_spec_1_2_0,
  input  [8:0]  io_pre_spec_1_2_1,
  input  [8:0]  io_pre_spec_1_3_0,
  input  [8:0]  io_pre_spec_1_3_1,
  input  [8:0]  io_pre_spec_2_0_0,
  input  [8:0]  io_pre_spec_2_0_1,
  input  [8:0]  io_pre_spec_2_1_0,
  input  [8:0]  io_pre_spec_2_1_1,
  input  [8:0]  io_pre_spec_2_2_0,
  input  [8:0]  io_pre_spec_2_2_1,
  input  [8:0]  io_pre_spec_2_3_0,
  input  [8:0]  io_pre_spec_2_3_1,
  input  [8:0]  io_pre_spec_3_0_0,
  input  [8:0]  io_pre_spec_3_0_1,
  input  [8:0]  io_pre_spec_3_1_0,
  input  [8:0]  io_pre_spec_3_1_1,
  input  [8:0]  io_pre_spec_3_2_0,
  input  [8:0]  io_pre_spec_3_2_1,
  input  [8:0]  io_pre_spec_3_3_0,
  input  [8:0]  io_pre_spec_3_3_1,
  input  [8:0]  io_pre_spec_4_0_0,
  input  [8:0]  io_pre_spec_4_0_1,
  input  [8:0]  io_pre_spec_4_1_0,
  input  [8:0]  io_pre_spec_4_1_1,
  input  [8:0]  io_pre_spec_4_2_0,
  input  [8:0]  io_pre_spec_4_2_1,
  input  [8:0]  io_pre_spec_4_3_0,
  input  [8:0]  io_pre_spec_4_3_1,
  output [8:0]  io_nxt_spec_0_0_0,
  output [8:0]  io_nxt_spec_0_0_1,
  output [8:0]  io_nxt_spec_0_1_0,
  output [8:0]  io_nxt_spec_0_1_1,
  output [8:0]  io_nxt_spec_0_2_0,
  output [8:0]  io_nxt_spec_0_2_1,
  output [8:0]  io_nxt_spec_0_3_0,
  output [8:0]  io_nxt_spec_0_3_1,
  output [8:0]  io_nxt_spec_1_0_0,
  output [8:0]  io_nxt_spec_1_0_1,
  output [8:0]  io_nxt_spec_1_1_0,
  output [8:0]  io_nxt_spec_1_1_1,
  output [8:0]  io_nxt_spec_1_2_0,
  output [8:0]  io_nxt_spec_1_2_1,
  output [8:0]  io_nxt_spec_1_3_0,
  output [8:0]  io_nxt_spec_1_3_1,
  output [8:0]  io_nxt_spec_2_0_0,
  output [8:0]  io_nxt_spec_2_0_1,
  output [8:0]  io_nxt_spec_2_1_0,
  output [8:0]  io_nxt_spec_2_1_1,
  output [8:0]  io_nxt_spec_2_2_0,
  output [8:0]  io_nxt_spec_2_2_1,
  output [8:0]  io_nxt_spec_2_3_0,
  output [8:0]  io_nxt_spec_2_3_1,
  output [8:0]  io_nxt_spec_3_0_0,
  output [8:0]  io_nxt_spec_3_0_1,
  output [8:0]  io_nxt_spec_3_1_0,
  output [8:0]  io_nxt_spec_3_1_1,
  output [8:0]  io_nxt_spec_3_2_0,
  output [8:0]  io_nxt_spec_3_2_1,
  output [8:0]  io_nxt_spec_3_3_0,
  output [8:0]  io_nxt_spec_3_3_1,
  output [8:0]  io_nxt_spec_4_0_0,
  output [8:0]  io_nxt_spec_4_0_1,
  output [8:0]  io_nxt_spec_4_1_0,
  output [8:0]  io_nxt_spec_4_1_1,
  output [8:0]  io_nxt_spec_4_2_0,
  output [8:0]  io_nxt_spec_4_2_1,
  output [8:0]  io_nxt_spec_4_3_0,
  output [8:0]  io_nxt_spec_4_3_1,
  input  [69:0] io_pre_iterB_0,
  input  [69:0] io_pre_iterB_1,
  output [69:0] io_nxt_iterB_0,
  output [69:0] io_nxt_iterB_1
);

  wire [63:0] _iter_conv_io_nxt_q_A;
  wire [63:0] _iter_conv_io_nxt_q_B;
  wire [10:0] _csa_3_io_out_0;
  wire [10:0] _csa_3_io_out_1;
  wire [69:0] _csa_iter_2_io_out_0;
  wire [69:0] _csa_iter_2_io_out_1;
  wire [4:0]  _specB_io_q_j_2;
  wire [4:0]  _selB_io_q_j_1;
  wire [69:0] _csa_iter_1_io_out_0;
  wire [69:0] _csa_iter_1_io_out_1;
  CSA3_2_4173 csa_iter_1 (
    .io_in_0  ({_csa_iter_2_io_out_0[67:0], 2'h0}),
    .io_in_1  ({_csa_iter_2_io_out_1[66:0], 3'h0}),
    .io_in_2
      ((_specB_io_q_j_2[0] ? io_iter_cons_0 : 70'h0)
       | (_specB_io_q_j_2[1] ? io_iter_cons_1 : 70'h0)
       | (_specB_io_q_j_2[3] ? io_iter_cons_3 : 70'h0)
       | (_specB_io_q_j_2[4] ? io_iter_cons_4 : 70'h0)),
    .io_out_0 (_csa_iter_1_io_out_0),
    .io_out_1 (_csa_iter_1_io_out_1)
  );
  SelBlock_v4 selB (
    .io_q_j         (_specB_io_q_j_2),
    .io_q_j_1       (_selB_io_q_j_1),
    .io_cons_0_0    (io_Sel_cons_0_0),
    .io_cons_0_1    (io_Sel_cons_0_1),
    .io_cons_0_2    (io_Sel_cons_0_2),
    .io_cons_0_3    (io_Sel_cons_0_3),
    .io_cons_1_0    (io_Sel_cons_1_0),
    .io_cons_1_1    (io_Sel_cons_1_1),
    .io_cons_1_2    (io_Sel_cons_1_2),
    .io_cons_1_3    (io_Sel_cons_1_3),
    .io_cons_2_0    (io_Sel_cons_2_0),
    .io_cons_2_1    (io_Sel_cons_2_1),
    .io_cons_2_2    (io_Sel_cons_2_2),
    .io_cons_2_3    (io_Sel_cons_2_3),
    .io_cons_3_0    (io_Sel_cons_3_0),
    .io_cons_3_1    (io_Sel_cons_3_1),
    .io_cons_3_2    (io_Sel_cons_3_2),
    .io_cons_3_3    (io_Sel_cons_3_3),
    .io_cons_4_0    (io_Sel_cons_4_0),
    .io_cons_4_1    (io_Sel_cons_4_1),
    .io_cons_4_2    (io_Sel_cons_4_2),
    .io_cons_4_3    (io_Sel_cons_4_3),
    .io_rem_3_5_0   (_csa_3_io_out_0[10:3]),
    .io_rem_3_5_1   (_csa_3_io_out_1[9:2]),
    .io_pre_sel_0_0 (io_pre_sel_0_0),
    .io_pre_sel_0_1 (io_pre_sel_0_1),
    .io_pre_sel_1_0 (io_pre_sel_1_0),
    .io_pre_sel_1_1 (io_pre_sel_1_1),
    .io_pre_sel_2_0 (io_pre_sel_2_0),
    .io_pre_sel_2_1 (io_pre_sel_2_1),
    .io_pre_sel_3_0 (io_pre_sel_3_0),
    .io_pre_sel_3_1 (io_pre_sel_3_1),
    .io_nxt_sel_0_0 (io_nxt_sel_0_0),
    .io_nxt_sel_0_1 (io_nxt_sel_0_1),
    .io_nxt_sel_1_0 (io_nxt_sel_1_0),
    .io_nxt_sel_1_1 (io_nxt_sel_1_1),
    .io_nxt_sel_2_0 (io_nxt_sel_2_0),
    .io_nxt_sel_2_1 (io_nxt_sel_2_1),
    .io_nxt_sel_3_0 (io_nxt_sel_3_0),
    .io_nxt_sel_3_1 (io_nxt_sel_3_1)
  );
  SpecBlock_v4 specB (
    .io_q_j            (_specB_io_q_j_2),
    .io_cons_0_0       (io_Spec_cons_0_0),
    .io_cons_0_1       (io_Spec_cons_0_1),
    .io_cons_0_2       (io_Spec_cons_0_2),
    .io_cons_0_3       (io_Spec_cons_0_3),
    .io_cons_1_0       (io_Spec_cons_1_0),
    .io_cons_1_1       (io_Spec_cons_1_1),
    .io_cons_1_2       (io_Spec_cons_1_2),
    .io_cons_1_3       (io_Spec_cons_1_3),
    .io_cons_2_0       (io_Spec_cons_2_0),
    .io_cons_2_1       (io_Spec_cons_2_1),
    .io_cons_2_2       (io_Spec_cons_2_2),
    .io_cons_2_3       (io_Spec_cons_2_3),
    .io_cons_3_0       (io_Spec_cons_3_0),
    .io_cons_3_1       (io_Spec_cons_3_1),
    .io_cons_3_2       (io_Spec_cons_3_2),
    .io_cons_3_3       (io_Spec_cons_3_3),
    .io_cons_4_0       (io_Spec_cons_4_0),
    .io_cons_4_1       (io_Spec_cons_4_1),
    .io_cons_4_2       (io_Spec_cons_4_2),
    .io_cons_4_3       (io_Spec_cons_4_3),
    .io_d_trunc_0      (io_d_trunc_0),
    .io_d_trunc_1      (io_d_trunc_1),
    .io_d_trunc_2      (io_d_trunc_2),
    .io_d_trunc_3      (io_d_trunc_3),
    .io_q_j_1          (_selB_io_q_j_1),
    .io_rem_3_5_0      (_csa_3_io_out_0[8:0]),
    .io_rem_3_5_1      ({_csa_3_io_out_1[7:0], 1'h0}),
    .io_q_j_2          (_specB_io_q_j_2),
    .io_pre_spec_0_0_0 (io_pre_spec_0_0_0),
    .io_pre_spec_0_0_1 (io_pre_spec_0_0_1),
    .io_pre_spec_0_1_0 (io_pre_spec_0_1_0),
    .io_pre_spec_0_1_1 (io_pre_spec_0_1_1),
    .io_pre_spec_0_2_0 (io_pre_spec_0_2_0),
    .io_pre_spec_0_2_1 (io_pre_spec_0_2_1),
    .io_pre_spec_0_3_0 (io_pre_spec_0_3_0),
    .io_pre_spec_0_3_1 (io_pre_spec_0_3_1),
    .io_pre_spec_1_0_0 (io_pre_spec_1_0_0),
    .io_pre_spec_1_0_1 (io_pre_spec_1_0_1),
    .io_pre_spec_1_1_0 (io_pre_spec_1_1_0),
    .io_pre_spec_1_1_1 (io_pre_spec_1_1_1),
    .io_pre_spec_1_2_0 (io_pre_spec_1_2_0),
    .io_pre_spec_1_2_1 (io_pre_spec_1_2_1),
    .io_pre_spec_1_3_0 (io_pre_spec_1_3_0),
    .io_pre_spec_1_3_1 (io_pre_spec_1_3_1),
    .io_pre_spec_2_0_0 (io_pre_spec_2_0_0),
    .io_pre_spec_2_0_1 (io_pre_spec_2_0_1),
    .io_pre_spec_2_1_0 (io_pre_spec_2_1_0),
    .io_pre_spec_2_1_1 (io_pre_spec_2_1_1),
    .io_pre_spec_2_2_0 (io_pre_spec_2_2_0),
    .io_pre_spec_2_2_1 (io_pre_spec_2_2_1),
    .io_pre_spec_2_3_0 (io_pre_spec_2_3_0),
    .io_pre_spec_2_3_1 (io_pre_spec_2_3_1),
    .io_pre_spec_3_0_0 (io_pre_spec_3_0_0),
    .io_pre_spec_3_0_1 (io_pre_spec_3_0_1),
    .io_pre_spec_3_1_0 (io_pre_spec_3_1_0),
    .io_pre_spec_3_1_1 (io_pre_spec_3_1_1),
    .io_pre_spec_3_2_0 (io_pre_spec_3_2_0),
    .io_pre_spec_3_2_1 (io_pre_spec_3_2_1),
    .io_pre_spec_3_3_0 (io_pre_spec_3_3_0),
    .io_pre_spec_3_3_1 (io_pre_spec_3_3_1),
    .io_pre_spec_4_0_0 (io_pre_spec_4_0_0),
    .io_pre_spec_4_0_1 (io_pre_spec_4_0_1),
    .io_pre_spec_4_1_0 (io_pre_spec_4_1_0),
    .io_pre_spec_4_1_1 (io_pre_spec_4_1_1),
    .io_pre_spec_4_2_0 (io_pre_spec_4_2_0),
    .io_pre_spec_4_2_1 (io_pre_spec_4_2_1),
    .io_pre_spec_4_3_0 (io_pre_spec_4_3_0),
    .io_pre_spec_4_3_1 (io_pre_spec_4_3_1),
    .io_nxt_spec_0_0_0 (io_nxt_spec_0_0_0),
    .io_nxt_spec_0_0_1 (io_nxt_spec_0_0_1),
    .io_nxt_spec_0_1_0 (io_nxt_spec_0_1_0),
    .io_nxt_spec_0_1_1 (io_nxt_spec_0_1_1),
    .io_nxt_spec_0_2_0 (io_nxt_spec_0_2_0),
    .io_nxt_spec_0_2_1 (io_nxt_spec_0_2_1),
    .io_nxt_spec_0_3_0 (io_nxt_spec_0_3_0),
    .io_nxt_spec_0_3_1 (io_nxt_spec_0_3_1),
    .io_nxt_spec_1_0_0 (io_nxt_spec_1_0_0),
    .io_nxt_spec_1_0_1 (io_nxt_spec_1_0_1),
    .io_nxt_spec_1_1_0 (io_nxt_spec_1_1_0),
    .io_nxt_spec_1_1_1 (io_nxt_spec_1_1_1),
    .io_nxt_spec_1_2_0 (io_nxt_spec_1_2_0),
    .io_nxt_spec_1_2_1 (io_nxt_spec_1_2_1),
    .io_nxt_spec_1_3_0 (io_nxt_spec_1_3_0),
    .io_nxt_spec_1_3_1 (io_nxt_spec_1_3_1),
    .io_nxt_spec_2_0_0 (io_nxt_spec_2_0_0),
    .io_nxt_spec_2_0_1 (io_nxt_spec_2_0_1),
    .io_nxt_spec_2_1_0 (io_nxt_spec_2_1_0),
    .io_nxt_spec_2_1_1 (io_nxt_spec_2_1_1),
    .io_nxt_spec_2_2_0 (io_nxt_spec_2_2_0),
    .io_nxt_spec_2_2_1 (io_nxt_spec_2_2_1),
    .io_nxt_spec_2_3_0 (io_nxt_spec_2_3_0),
    .io_nxt_spec_2_3_1 (io_nxt_spec_2_3_1),
    .io_nxt_spec_3_0_0 (io_nxt_spec_3_0_0),
    .io_nxt_spec_3_0_1 (io_nxt_spec_3_0_1),
    .io_nxt_spec_3_1_0 (io_nxt_spec_3_1_0),
    .io_nxt_spec_3_1_1 (io_nxt_spec_3_1_1),
    .io_nxt_spec_3_2_0 (io_nxt_spec_3_2_0),
    .io_nxt_spec_3_2_1 (io_nxt_spec_3_2_1),
    .io_nxt_spec_3_3_0 (io_nxt_spec_3_3_0),
    .io_nxt_spec_3_3_1 (io_nxt_spec_3_3_1),
    .io_nxt_spec_4_0_0 (io_nxt_spec_4_0_0),
    .io_nxt_spec_4_0_1 (io_nxt_spec_4_0_1),
    .io_nxt_spec_4_1_0 (io_nxt_spec_4_1_0),
    .io_nxt_spec_4_1_1 (io_nxt_spec_4_1_1),
    .io_nxt_spec_4_2_0 (io_nxt_spec_4_2_0),
    .io_nxt_spec_4_2_1 (io_nxt_spec_4_2_1),
    .io_nxt_spec_4_3_0 (io_nxt_spec_4_3_0),
    .io_nxt_spec_4_3_1 (io_nxt_spec_4_3_1)
  );
  CSA3_2_4173 csa_iter_2 (
    .io_in_0  (io_pre_iterB_0),
    .io_in_1  (io_pre_iterB_1),
    .io_in_2
      ((_selB_io_q_j_1[0] ? io_iter_cons_0 : 70'h0)
       | (_selB_io_q_j_1[1] ? io_iter_cons_1 : 70'h0)
       | (_selB_io_q_j_1[3] ? io_iter_cons_3 : 70'h0)
       | (_selB_io_q_j_1[4] ? io_iter_cons_4 : 70'h0)),
    .io_out_0 (_csa_iter_2_io_out_0),
    .io_out_1 (_csa_iter_2_io_out_1)
  );
  CSA3_2_4017 csa_3 (
    .io_in_0  (io_pre_iterB_0[65:55]),
    .io_in_1  (io_pre_iterB_1[65:55]),
    .io_in_2
      ((_selB_io_q_j_1[0] ? io_spec_r2ud_0 : 11'h0)
       | (_selB_io_q_j_1[1] ? io_spec_r2ud_1 : 11'h0)
       | (_selB_io_q_j_1[3] ? io_spec_r2ud_3 : 11'h0)
       | (_selB_io_q_j_1[4] ? io_spec_r2ud_4 : 11'h0)),
    .io_out_0 (_csa_3_io_out_0),
    .io_out_1 (_csa_3_io_out_1)
  );
  Conversion_12 iter_conv (
    .io_q_j_1   (_selB_io_q_j_1),
    .io_pre_q_A (io_pre_q_A),
    .io_pre_q_B (io_pre_q_B),
    .io_nxt_q_A (_iter_conv_io_nxt_q_A),
    .io_nxt_q_B (_iter_conv_io_nxt_q_B)
  );
  Conversion_12 iter_conv_2 (
    .io_q_j_1   (_specB_io_q_j_2),
    .io_pre_q_A (_iter_conv_io_nxt_q_A),
    .io_pre_q_B (_iter_conv_io_nxt_q_B),
    .io_nxt_q_A (io_nxt_q_A),
    .io_nxt_q_B (io_nxt_q_B)
  );
  assign io_nxt_iterB_0 = {_csa_iter_1_io_out_0[67:0], 2'h0};
  assign io_nxt_iterB_1 = {_csa_iter_1_io_out_1[66:0], 3'h0};
endmodule

