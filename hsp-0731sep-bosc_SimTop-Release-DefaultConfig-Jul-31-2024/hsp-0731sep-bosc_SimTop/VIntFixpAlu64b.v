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
module VIntFixpAlu64b(
  input         clock,
  input         io_fire,
  input  [5:0]  io_opcode_op,
  input         io_info_vm,
  input         io_info_ma,
  input  [5:0]  io_info_uopIdx,
  input  [1:0]  io_info_vxrm,
  input  [3:0]  io_srcType_0,
  input  [3:0]  io_srcType_1,
  input  [3:0]  io_vdType,
  input  [63:0] io_vs1,
  input  [63:0] io_vs2_adder,
  input  [63:0] io_vs2_misc,
  input  [7:0]  io_vmask,
  input  [7:0]  io_oldVd,
  input  [7:0]  io_narrow,
  input         io_isSub,
  input         io_isMisc,
  input         io_isFixp,
  input         io_widen,
  input         io_widen_vs2,
  output [63:0] io_vd,
  output [31:0] io_narrowVd,
  output [7:0]  io_cmpOut,
  output [7:0]  io_vxsat
);

  wire [63:0] _vFixPoint64b_io_vd;
  wire [31:0] _vFixPoint64b_io_narrowVd;
  wire [63:0] _vIntMisc64b_io_vd;
  wire [31:0] _vIntMisc64b_io_narrowVd;
  wire [63:0] _vIntMisc64b_io_toFixP_shiftOut;
  wire [7:0]  _vIntMisc64b_io_toFixP_rnd_high;
  wire [7:0]  _vIntMisc64b_io_toFixP_rnd_tail;
  wire [63:0] _vIntAdder64b_io_vd;
  wire [7:0]  _vIntAdder64b_io_cmpOut;
  wire        _vIntAdder64b_io_toFixP_cout_0;
  wire        _vIntAdder64b_io_toFixP_cout_1;
  wire        _vIntAdder64b_io_toFixP_cout_2;
  wire        _vIntAdder64b_io_toFixP_cout_3;
  wire        _vIntAdder64b_io_toFixP_cout_4;
  wire        _vIntAdder64b_io_toFixP_cout_5;
  wire        _vIntAdder64b_io_toFixP_cout_6;
  wire        _vIntAdder64b_io_toFixP_cout_7;
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_0;
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_1;
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_2;
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_3;
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_4;
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_5;
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_6;
  wire [7:0]  _vIntAdder64b_io_toFixP_vd_7;
  wire        _vIntAdder64b_io_toFixP_vs2H_0;
  wire        _vIntAdder64b_io_toFixP_vs2H_1;
  wire        _vIntAdder64b_io_toFixP_vs2H_2;
  wire        _vIntAdder64b_io_toFixP_vs2H_3;
  wire        _vIntAdder64b_io_toFixP_vs2H_4;
  wire        _vIntAdder64b_io_toFixP_vs2H_5;
  wire        _vIntAdder64b_io_toFixP_vs2H_6;
  wire        _vIntAdder64b_io_toFixP_vs2H_7;
  wire        _vIntAdder64b_io_toFixP_vs1H_0;
  wire        _vIntAdder64b_io_toFixP_vs1H_1;
  wire        _vIntAdder64b_io_toFixP_vs1H_2;
  wire        _vIntAdder64b_io_toFixP_vs1H_3;
  wire        _vIntAdder64b_io_toFixP_vs1H_4;
  wire        _vIntAdder64b_io_toFixP_vs1H_5;
  wire        _vIntAdder64b_io_toFixP_vs1H_6;
  wire        _vIntAdder64b_io_toFixP_vs1H_7;
  reg  [63:0] vdAdderS1;
  reg  [63:0] vdMiscS1;
  reg         isMiscS1;
  reg  [31:0] narrowVdMiscS1;
  reg  [7:0]  cmpOutS1;
  reg         isFixpS1;
  reg  [5:0]  vFixPoint64b_io_opcode_r_op;
  reg  [1:0]  vFixPoint64b_io_info_r_vxrm;
  reg  [3:0]  vFixPoint64b_io_sew_r_oneHot;
  reg         vFixPoint64b_io_isSub_r;
  reg         vFixPoint64b_io_isSigned_r;
  reg         vFixPoint64b_io_isNClip_r;
  reg         vFixPoint64b_io_fromAdder_r_cout_0;
  reg         vFixPoint64b_io_fromAdder_r_cout_1;
  reg         vFixPoint64b_io_fromAdder_r_cout_2;
  reg         vFixPoint64b_io_fromAdder_r_cout_3;
  reg         vFixPoint64b_io_fromAdder_r_cout_4;
  reg         vFixPoint64b_io_fromAdder_r_cout_5;
  reg         vFixPoint64b_io_fromAdder_r_cout_6;
  reg         vFixPoint64b_io_fromAdder_r_cout_7;
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_0;
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_1;
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_2;
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_3;
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_4;
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_5;
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_6;
  reg  [7:0]  vFixPoint64b_io_fromAdder_r_vd_7;
  reg         vFixPoint64b_io_fromAdder_r_vs2H_0;
  reg         vFixPoint64b_io_fromAdder_r_vs2H_1;
  reg         vFixPoint64b_io_fromAdder_r_vs2H_2;
  reg         vFixPoint64b_io_fromAdder_r_vs2H_3;
  reg         vFixPoint64b_io_fromAdder_r_vs2H_4;
  reg         vFixPoint64b_io_fromAdder_r_vs2H_5;
  reg         vFixPoint64b_io_fromAdder_r_vs2H_6;
  reg         vFixPoint64b_io_fromAdder_r_vs2H_7;
  reg         vFixPoint64b_io_fromAdder_r_vs1H_0;
  reg         vFixPoint64b_io_fromAdder_r_vs1H_1;
  reg         vFixPoint64b_io_fromAdder_r_vs1H_2;
  reg         vFixPoint64b_io_fromAdder_r_vs1H_3;
  reg         vFixPoint64b_io_fromAdder_r_vs1H_4;
  reg         vFixPoint64b_io_fromAdder_r_vs1H_5;
  reg         vFixPoint64b_io_fromAdder_r_vs1H_6;
  reg         vFixPoint64b_io_fromAdder_r_vs1H_7;
  reg  [63:0] vFixPoint64b_io_fromMisc_r_shiftOut;
  reg  [7:0]  vFixPoint64b_io_fromMisc_r_rnd_high;
  reg  [7:0]  vFixPoint64b_io_fromMisc_r_rnd_tail;
  always @(posedge clock) begin
    if (io_fire) begin
      vdAdderS1 <= _vIntAdder64b_io_vd;
      vdMiscS1 <= _vIntMisc64b_io_vd;
      isMiscS1 <= io_isMisc;
      narrowVdMiscS1 <= _vIntMisc64b_io_narrowVd;
      cmpOutS1 <= _vIntAdder64b_io_cmpOut;
      isFixpS1 <= io_isFixp;
      vFixPoint64b_io_opcode_r_op <= io_opcode_op;
      vFixPoint64b_io_info_r_vxrm <= io_info_vxrm;
      vFixPoint64b_io_sew_r_oneHot <=
        {&(io_vdType[1:0]),
         io_vdType[1:0] == 2'h2,
         io_vdType[1:0] == 2'h1,
         io_vdType[1:0] == 2'h0};
      vFixPoint64b_io_isSub_r <= io_isSub;
      vFixPoint64b_io_isSigned_r <= io_srcType_0[3:2] == 2'h1;
      vFixPoint64b_io_isNClip_r <=
        (io_opcode_op == 6'h1F | io_opcode_op == 6'h20)
        & io_vdType[1:0] != io_srcType_0[1:0];
      vFixPoint64b_io_fromAdder_r_cout_0 <= _vIntAdder64b_io_toFixP_cout_0;
      vFixPoint64b_io_fromAdder_r_cout_1 <= _vIntAdder64b_io_toFixP_cout_1;
      vFixPoint64b_io_fromAdder_r_cout_2 <= _vIntAdder64b_io_toFixP_cout_2;
      vFixPoint64b_io_fromAdder_r_cout_3 <= _vIntAdder64b_io_toFixP_cout_3;
      vFixPoint64b_io_fromAdder_r_cout_4 <= _vIntAdder64b_io_toFixP_cout_4;
      vFixPoint64b_io_fromAdder_r_cout_5 <= _vIntAdder64b_io_toFixP_cout_5;
      vFixPoint64b_io_fromAdder_r_cout_6 <= _vIntAdder64b_io_toFixP_cout_6;
      vFixPoint64b_io_fromAdder_r_cout_7 <= _vIntAdder64b_io_toFixP_cout_7;
      vFixPoint64b_io_fromAdder_r_vd_0 <= _vIntAdder64b_io_toFixP_vd_0;
      vFixPoint64b_io_fromAdder_r_vd_1 <= _vIntAdder64b_io_toFixP_vd_1;
      vFixPoint64b_io_fromAdder_r_vd_2 <= _vIntAdder64b_io_toFixP_vd_2;
      vFixPoint64b_io_fromAdder_r_vd_3 <= _vIntAdder64b_io_toFixP_vd_3;
      vFixPoint64b_io_fromAdder_r_vd_4 <= _vIntAdder64b_io_toFixP_vd_4;
      vFixPoint64b_io_fromAdder_r_vd_5 <= _vIntAdder64b_io_toFixP_vd_5;
      vFixPoint64b_io_fromAdder_r_vd_6 <= _vIntAdder64b_io_toFixP_vd_6;
      vFixPoint64b_io_fromAdder_r_vd_7 <= _vIntAdder64b_io_toFixP_vd_7;
      vFixPoint64b_io_fromAdder_r_vs2H_0 <= _vIntAdder64b_io_toFixP_vs2H_0;
      vFixPoint64b_io_fromAdder_r_vs2H_1 <= _vIntAdder64b_io_toFixP_vs2H_1;
      vFixPoint64b_io_fromAdder_r_vs2H_2 <= _vIntAdder64b_io_toFixP_vs2H_2;
      vFixPoint64b_io_fromAdder_r_vs2H_3 <= _vIntAdder64b_io_toFixP_vs2H_3;
      vFixPoint64b_io_fromAdder_r_vs2H_4 <= _vIntAdder64b_io_toFixP_vs2H_4;
      vFixPoint64b_io_fromAdder_r_vs2H_5 <= _vIntAdder64b_io_toFixP_vs2H_5;
      vFixPoint64b_io_fromAdder_r_vs2H_6 <= _vIntAdder64b_io_toFixP_vs2H_6;
      vFixPoint64b_io_fromAdder_r_vs2H_7 <= _vIntAdder64b_io_toFixP_vs2H_7;
      vFixPoint64b_io_fromAdder_r_vs1H_0 <= _vIntAdder64b_io_toFixP_vs1H_0;
      vFixPoint64b_io_fromAdder_r_vs1H_1 <= _vIntAdder64b_io_toFixP_vs1H_1;
      vFixPoint64b_io_fromAdder_r_vs1H_2 <= _vIntAdder64b_io_toFixP_vs1H_2;
      vFixPoint64b_io_fromAdder_r_vs1H_3 <= _vIntAdder64b_io_toFixP_vs1H_3;
      vFixPoint64b_io_fromAdder_r_vs1H_4 <= _vIntAdder64b_io_toFixP_vs1H_4;
      vFixPoint64b_io_fromAdder_r_vs1H_5 <= _vIntAdder64b_io_toFixP_vs1H_5;
      vFixPoint64b_io_fromAdder_r_vs1H_6 <= _vIntAdder64b_io_toFixP_vs1H_6;
      vFixPoint64b_io_fromAdder_r_vs1H_7 <= _vIntAdder64b_io_toFixP_vs1H_7;
      vFixPoint64b_io_fromMisc_r_shiftOut <= _vIntMisc64b_io_toFixP_shiftOut;
      vFixPoint64b_io_fromMisc_r_rnd_high <= _vIntMisc64b_io_toFixP_rnd_high;
      vFixPoint64b_io_fromMisc_r_rnd_tail <= _vIntMisc64b_io_toFixP_rnd_tail;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:11];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'hC; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        vdAdderS1 = {_RANDOM[4'h0], _RANDOM[4'h1]};
        vdMiscS1 = {_RANDOM[4'h2], _RANDOM[4'h3]};
        isMiscS1 = _RANDOM[4'h4][0];
        narrowVdMiscS1 = {_RANDOM[4'h4][31:1], _RANDOM[4'h5][0]};
        cmpOutS1 = _RANDOM[4'h5][8:1];
        isFixpS1 = _RANDOM[4'h5][9];
        vFixPoint64b_io_opcode_r_op = _RANDOM[4'h5][15:10];
        vFixPoint64b_io_info_r_vxrm = _RANDOM[4'h6][12:11];
        vFixPoint64b_io_sew_r_oneHot = _RANDOM[4'h6][16:13];
        vFixPoint64b_io_isSub_r = _RANDOM[4'h6][17];
        vFixPoint64b_io_isSigned_r = _RANDOM[4'h6][18];
        vFixPoint64b_io_isNClip_r = _RANDOM[4'h6][19];
        vFixPoint64b_io_fromAdder_r_cout_0 = _RANDOM[4'h6][20];
        vFixPoint64b_io_fromAdder_r_cout_1 = _RANDOM[4'h6][21];
        vFixPoint64b_io_fromAdder_r_cout_2 = _RANDOM[4'h6][22];
        vFixPoint64b_io_fromAdder_r_cout_3 = _RANDOM[4'h6][23];
        vFixPoint64b_io_fromAdder_r_cout_4 = _RANDOM[4'h6][24];
        vFixPoint64b_io_fromAdder_r_cout_5 = _RANDOM[4'h6][25];
        vFixPoint64b_io_fromAdder_r_cout_6 = _RANDOM[4'h6][26];
        vFixPoint64b_io_fromAdder_r_cout_7 = _RANDOM[4'h6][27];
        vFixPoint64b_io_fromAdder_r_vd_0 = {_RANDOM[4'h6][31:28], _RANDOM[4'h7][3:0]};
        vFixPoint64b_io_fromAdder_r_vd_1 = _RANDOM[4'h7][11:4];
        vFixPoint64b_io_fromAdder_r_vd_2 = _RANDOM[4'h7][19:12];
        vFixPoint64b_io_fromAdder_r_vd_3 = _RANDOM[4'h7][27:20];
        vFixPoint64b_io_fromAdder_r_vd_4 = {_RANDOM[4'h7][31:28], _RANDOM[4'h8][3:0]};
        vFixPoint64b_io_fromAdder_r_vd_5 = _RANDOM[4'h8][11:4];
        vFixPoint64b_io_fromAdder_r_vd_6 = _RANDOM[4'h8][19:12];
        vFixPoint64b_io_fromAdder_r_vd_7 = _RANDOM[4'h8][27:20];
        vFixPoint64b_io_fromAdder_r_vs2H_0 = _RANDOM[4'h8][28];
        vFixPoint64b_io_fromAdder_r_vs2H_1 = _RANDOM[4'h8][29];
        vFixPoint64b_io_fromAdder_r_vs2H_2 = _RANDOM[4'h8][30];
        vFixPoint64b_io_fromAdder_r_vs2H_3 = _RANDOM[4'h8][31];
        vFixPoint64b_io_fromAdder_r_vs2H_4 = _RANDOM[4'h9][0];
        vFixPoint64b_io_fromAdder_r_vs2H_5 = _RANDOM[4'h9][1];
        vFixPoint64b_io_fromAdder_r_vs2H_6 = _RANDOM[4'h9][2];
        vFixPoint64b_io_fromAdder_r_vs2H_7 = _RANDOM[4'h9][3];
        vFixPoint64b_io_fromAdder_r_vs1H_0 = _RANDOM[4'h9][4];
        vFixPoint64b_io_fromAdder_r_vs1H_1 = _RANDOM[4'h9][5];
        vFixPoint64b_io_fromAdder_r_vs1H_2 = _RANDOM[4'h9][6];
        vFixPoint64b_io_fromAdder_r_vs1H_3 = _RANDOM[4'h9][7];
        vFixPoint64b_io_fromAdder_r_vs1H_4 = _RANDOM[4'h9][8];
        vFixPoint64b_io_fromAdder_r_vs1H_5 = _RANDOM[4'h9][9];
        vFixPoint64b_io_fromAdder_r_vs1H_6 = _RANDOM[4'h9][10];
        vFixPoint64b_io_fromAdder_r_vs1H_7 = _RANDOM[4'h9][11];
        vFixPoint64b_io_fromMisc_r_shiftOut =
          {_RANDOM[4'h9][31:12], _RANDOM[4'hA], _RANDOM[4'hB][11:0]};
        vFixPoint64b_io_fromMisc_r_rnd_high = _RANDOM[4'hB][19:12];
        vFixPoint64b_io_fromMisc_r_rnd_tail = _RANDOM[4'hB][27:20];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  VIntAdder64b vIntAdder64b (
    .io_opcode_op     (io_opcode_op),
    .io_info_vm       (io_info_vm),
    .io_info_ma       (io_info_ma),
    .io_info_uopIdx   (io_info_uopIdx),
    .io_srcType_1     (io_srcType_1),
    .io_vdType        (io_vdType),
    .io_vs1           (io_vs1),
    .io_vs2           (io_vs2_adder),
    .io_vmask         (io_vmask),
    .io_oldVd         (io_oldVd),
    .io_isSub         (io_isSub),
    .io_widen         (io_widen),
    .io_widen_vs2     (io_widen_vs2),
    .io_vd            (_vIntAdder64b_io_vd),
    .io_cmpOut        (_vIntAdder64b_io_cmpOut),
    .io_toFixP_cout_0 (_vIntAdder64b_io_toFixP_cout_0),
    .io_toFixP_cout_1 (_vIntAdder64b_io_toFixP_cout_1),
    .io_toFixP_cout_2 (_vIntAdder64b_io_toFixP_cout_2),
    .io_toFixP_cout_3 (_vIntAdder64b_io_toFixP_cout_3),
    .io_toFixP_cout_4 (_vIntAdder64b_io_toFixP_cout_4),
    .io_toFixP_cout_5 (_vIntAdder64b_io_toFixP_cout_5),
    .io_toFixP_cout_6 (_vIntAdder64b_io_toFixP_cout_6),
    .io_toFixP_cout_7 (_vIntAdder64b_io_toFixP_cout_7),
    .io_toFixP_vd_0   (_vIntAdder64b_io_toFixP_vd_0),
    .io_toFixP_vd_1   (_vIntAdder64b_io_toFixP_vd_1),
    .io_toFixP_vd_2   (_vIntAdder64b_io_toFixP_vd_2),
    .io_toFixP_vd_3   (_vIntAdder64b_io_toFixP_vd_3),
    .io_toFixP_vd_4   (_vIntAdder64b_io_toFixP_vd_4),
    .io_toFixP_vd_5   (_vIntAdder64b_io_toFixP_vd_5),
    .io_toFixP_vd_6   (_vIntAdder64b_io_toFixP_vd_6),
    .io_toFixP_vd_7   (_vIntAdder64b_io_toFixP_vd_7),
    .io_toFixP_vs2H_0 (_vIntAdder64b_io_toFixP_vs2H_0),
    .io_toFixP_vs2H_1 (_vIntAdder64b_io_toFixP_vs2H_1),
    .io_toFixP_vs2H_2 (_vIntAdder64b_io_toFixP_vs2H_2),
    .io_toFixP_vs2H_3 (_vIntAdder64b_io_toFixP_vs2H_3),
    .io_toFixP_vs2H_4 (_vIntAdder64b_io_toFixP_vs2H_4),
    .io_toFixP_vs2H_5 (_vIntAdder64b_io_toFixP_vs2H_5),
    .io_toFixP_vs2H_6 (_vIntAdder64b_io_toFixP_vs2H_6),
    .io_toFixP_vs2H_7 (_vIntAdder64b_io_toFixP_vs2H_7),
    .io_toFixP_vs1H_0 (_vIntAdder64b_io_toFixP_vs1H_0),
    .io_toFixP_vs1H_1 (_vIntAdder64b_io_toFixP_vs1H_1),
    .io_toFixP_vs1H_2 (_vIntAdder64b_io_toFixP_vs1H_2),
    .io_toFixP_vs1H_3 (_vIntAdder64b_io_toFixP_vs1H_3),
    .io_toFixP_vs1H_4 (_vIntAdder64b_io_toFixP_vs1H_4),
    .io_toFixP_vs1H_5 (_vIntAdder64b_io_toFixP_vs1H_5),
    .io_toFixP_vs1H_6 (_vIntAdder64b_io_toFixP_vs1H_6),
    .io_toFixP_vs1H_7 (_vIntAdder64b_io_toFixP_vs1H_7)
  );
  VIntMisc64b vIntMisc64b (
    .io_opcode_op       (io_opcode_op),
    .io_info_vm         (io_info_vm),
    .io_info_uopIdx     (io_info_uopIdx),
    .io_srcType_0       (io_srcType_0),
    .io_vdType          (io_vdType),
    .io_vs1             (io_vs1),
    .io_vs2             (io_vs2_misc),
    .io_vmask           (io_vmask),
    .io_narrow          (io_narrow[0]),
    .io_vd              (_vIntMisc64b_io_vd),
    .io_narrowVd        (_vIntMisc64b_io_narrowVd),
    .io_toFixP_shiftOut (_vIntMisc64b_io_toFixP_shiftOut),
    .io_toFixP_rnd_high (_vIntMisc64b_io_toFixP_rnd_high),
    .io_toFixP_rnd_tail (_vIntMisc64b_io_toFixP_rnd_tail)
  );
  VFixPoint64b vFixPoint64b (
    .io_opcode_op         (vFixPoint64b_io_opcode_r_op),
    .io_info_vxrm         (vFixPoint64b_io_info_r_vxrm),
    .io_sew_oneHot        (vFixPoint64b_io_sew_r_oneHot),
    .io_isSub             (vFixPoint64b_io_isSub_r),
    .io_isSigned          (vFixPoint64b_io_isSigned_r),
    .io_isNClip           (vFixPoint64b_io_isNClip_r),
    .io_fromAdder_cout_0  (vFixPoint64b_io_fromAdder_r_cout_0),
    .io_fromAdder_cout_1  (vFixPoint64b_io_fromAdder_r_cout_1),
    .io_fromAdder_cout_2  (vFixPoint64b_io_fromAdder_r_cout_2),
    .io_fromAdder_cout_3  (vFixPoint64b_io_fromAdder_r_cout_3),
    .io_fromAdder_cout_4  (vFixPoint64b_io_fromAdder_r_cout_4),
    .io_fromAdder_cout_5  (vFixPoint64b_io_fromAdder_r_cout_5),
    .io_fromAdder_cout_6  (vFixPoint64b_io_fromAdder_r_cout_6),
    .io_fromAdder_cout_7  (vFixPoint64b_io_fromAdder_r_cout_7),
    .io_fromAdder_vd_0    (vFixPoint64b_io_fromAdder_r_vd_0),
    .io_fromAdder_vd_1    (vFixPoint64b_io_fromAdder_r_vd_1),
    .io_fromAdder_vd_2    (vFixPoint64b_io_fromAdder_r_vd_2),
    .io_fromAdder_vd_3    (vFixPoint64b_io_fromAdder_r_vd_3),
    .io_fromAdder_vd_4    (vFixPoint64b_io_fromAdder_r_vd_4),
    .io_fromAdder_vd_5    (vFixPoint64b_io_fromAdder_r_vd_5),
    .io_fromAdder_vd_6    (vFixPoint64b_io_fromAdder_r_vd_6),
    .io_fromAdder_vd_7    (vFixPoint64b_io_fromAdder_r_vd_7),
    .io_fromAdder_vs2H_0  (vFixPoint64b_io_fromAdder_r_vs2H_0),
    .io_fromAdder_vs2H_1  (vFixPoint64b_io_fromAdder_r_vs2H_1),
    .io_fromAdder_vs2H_2  (vFixPoint64b_io_fromAdder_r_vs2H_2),
    .io_fromAdder_vs2H_3  (vFixPoint64b_io_fromAdder_r_vs2H_3),
    .io_fromAdder_vs2H_4  (vFixPoint64b_io_fromAdder_r_vs2H_4),
    .io_fromAdder_vs2H_5  (vFixPoint64b_io_fromAdder_r_vs2H_5),
    .io_fromAdder_vs2H_6  (vFixPoint64b_io_fromAdder_r_vs2H_6),
    .io_fromAdder_vs2H_7  (vFixPoint64b_io_fromAdder_r_vs2H_7),
    .io_fromAdder_vs1H_0  (vFixPoint64b_io_fromAdder_r_vs1H_0),
    .io_fromAdder_vs1H_1  (vFixPoint64b_io_fromAdder_r_vs1H_1),
    .io_fromAdder_vs1H_2  (vFixPoint64b_io_fromAdder_r_vs1H_2),
    .io_fromAdder_vs1H_3  (vFixPoint64b_io_fromAdder_r_vs1H_3),
    .io_fromAdder_vs1H_4  (vFixPoint64b_io_fromAdder_r_vs1H_4),
    .io_fromAdder_vs1H_5  (vFixPoint64b_io_fromAdder_r_vs1H_5),
    .io_fromAdder_vs1H_6  (vFixPoint64b_io_fromAdder_r_vs1H_6),
    .io_fromAdder_vs1H_7  (vFixPoint64b_io_fromAdder_r_vs1H_7),
    .io_fromMisc_shiftOut (vFixPoint64b_io_fromMisc_r_shiftOut),
    .io_fromMisc_rnd_high (vFixPoint64b_io_fromMisc_r_rnd_high),
    .io_fromMisc_rnd_tail (vFixPoint64b_io_fromMisc_r_rnd_tail),
    .io_vd                (_vFixPoint64b_io_vd),
    .io_narrowVd          (_vFixPoint64b_io_narrowVd),
    .io_vxsat             (io_vxsat)
  );
  assign io_vd = isFixpS1 ? _vFixPoint64b_io_vd : isMiscS1 ? vdMiscS1 : vdAdderS1;
  assign io_narrowVd = isFixpS1 ? _vFixPoint64b_io_narrowVd : narrowVdMiscS1;
  assign io_cmpOut = cmpOutS1;
endmodule

