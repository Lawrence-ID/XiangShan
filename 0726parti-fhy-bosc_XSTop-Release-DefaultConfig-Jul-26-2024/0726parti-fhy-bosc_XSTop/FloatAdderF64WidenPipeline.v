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
module FloatAdderF64WidenPipeline(
  input         clock,
  input         io_fire,
  input  [63:0] io_fp_a,
  input  [63:0] io_fp_b,
  input  [63:0] io_widen_a,
  input  [63:0] io_widen_b,
  output [63:0] io_fp_c,
  input         io_mask,
  input         io_is_sub,
  input  [2:0]  io_round_mode,
  output [4:0]  io_fflags,
  input         io_opb_widening,
  input         io_res_widening,
  input  [4:0]  io_op_code,
  input  [1:0]  io_maskForReduction,
  input         io_is_vfwredosum
);

  wire [63:0] _U_close_path_io_fp_c;
  wire [4:0]  _U_close_path_io_fflags;
  wire [53:0] _U_close_path_io_CS1;
  wire [63:0] _U_far_path_io_fp_c;
  wire [4:0]  _U_far_path_io_fflags;
  wire [10:0] _U_far_path_io_absEaSubEb;
  wire        _U_far_path_io_isEfp_bGreater;
  wire [63:0] fp_a_to64 = io_res_widening & ~io_opb_widening ? io_widen_a : io_fp_a;
  wire [63:0] fp_b_to64 = io_res_widening & ~io_is_vfwredosum ? io_widen_b : io_fp_b;
  reg         fp_a_is_zero_reg;
  reg         fp_b_is_zero_reg;
  reg         res_widening_reg;
  reg         is_far_path_reg;
  reg         r;
  reg         r_1;
  reg         r_2;
  reg         r_3;
  reg  [63:0] float_adder_result_r_1;
  wire        _GEN = res_widening_reg & fp_a_is_zero_reg;
  reg  [63:0] float_adder_result_r_2;
  reg  [63:0] float_adder_result_r_3;
  reg  [63:0] float_adder_result_r_4;
  reg         io_fp_c_r;
  reg  [63:0] io_fp_c_r_1;
  reg         io_fflags_r;
  reg  [4:0]  io_fflags_r_1;
  wire        EOP = fp_a_to64[63] ^ io_is_sub ^ fp_b_to64[63];
  wire        fp_a_is_f32 = io_res_widening & ~io_opb_widening;
  wire        fp_b_is_f32 = io_res_widening & ~io_is_vfwredosum;
  wire        Efp_a_is_zero =
    fp_a_to64[62:52] == 11'h0 | fp_a_is_f32 & fp_a_to64[62:52] == 11'h369;
  wire        Efp_b_is_zero =
    fp_b_to64[62:52] == 11'h0 | fp_b_is_f32 & fp_b_to64[62:52] == 11'h369;
  wire        Efp_a_is_all_one =
    (&(fp_a_to64[62:52])) | fp_a_is_f32 & fp_a_to64[62:52] == 11'h47F;
  wire        Efp_b_is_all_one =
    (&(fp_b_to64[62:52])) | fp_b_is_f32 & fp_b_to64[62:52] == 11'h47F;
  wire        _fp_a_is_NAN_T = Efp_a_is_all_one & (|(fp_a_to64[51:0]));
  wire        fp_a_is_SNAN = Efp_a_is_all_one & (|(fp_a_to64[51:0])) & ~(fp_a_to64[51]);
  wire        _fp_b_is_NAN_T = Efp_b_is_all_one & (|(fp_b_to64[51:0]));
  wire        fp_b_is_SNAN = Efp_b_is_all_one & (|(fp_b_to64[51:0])) & ~(fp_b_to64[51]);
  wire        fp_a_is_infinite = Efp_a_is_all_one & ~(|(fp_a_to64[51:0]));
  wire        fp_b_is_infinite = Efp_b_is_all_one & ~(|(fp_b_to64[51:0]));
  wire        fp_a_is_zero = Efp_a_is_zero & ~(|(fp_a_to64[51:0]));
  wire        fp_b_is_zero = Efp_b_is_zero & ~(|(fp_b_to64[51:0]));
  wire        _fflags_NV_stage0_T_4 = fp_a_is_SNAN | fp_b_is_SNAN;
  wire        _GEN_0 = EOP & fp_a_is_infinite & fp_b_is_infinite;
  wire        _fflags_NV_stage0_T_10 = _fp_a_is_NAN_T | _fp_b_is_NAN_T;
  wire        is_min = io_op_code == 5'h2;
  wire        is_max = io_op_code == 5'h3;
  wire        is_feq = io_op_code == 5'h9;
  wire        is_fne = io_op_code == 5'hA;
  wire        is_flt = io_op_code == 5'hB;
  wire        is_fle = io_op_code == 5'hC;
  wire        is_fgt = io_op_code == 5'hD;
  wire        is_fge = io_op_code == 5'hE;
  wire        is_fsum_ure = io_op_code == 5'h1A;
  wire        is_fmin_re = io_op_code == 5'h14;
  wire        is_fmax_re = io_op_code == 5'h15;
  wire        is_fsum_ore = io_op_code == 5'h16;
  wire        fp_b_exponent_is_equal = fp_a_to64[62:52] == fp_b_to64[62:52];
  wire        fp_b_significand_is_greater =
    ~(_U_close_path_io_CS1[53]) & fp_a_to64[51:0] != fp_b_to64[51:0];
  wire        fp_b_significand_is_equal = fp_a_to64[51:0] == fp_b_to64[51:0];
  wire        _fp_b_is_equal_T_2 = fp_b_is_zero & fp_a_is_zero;
  wire        fp_b_is_greater =
    ~(io_fp_b[63])
    & (io_fp_a[63] & ~_fp_b_is_equal_T_2 | _U_far_path_io_isEfp_bGreater
       | fp_b_exponent_is_equal & fp_b_significand_is_greater) | io_fp_b[63] & io_fp_a[63]
    & (~_U_far_path_io_isEfp_bGreater & ~fp_b_exponent_is_equal | fp_b_exponent_is_equal
       & ~fp_b_significand_is_greater & ~fp_b_significand_is_equal);
  wire        fp_b_is_equal =
    io_fp_a[63] == io_fp_b[63] & fp_b_exponent_is_equal & fp_b_significand_is_equal
    | _fp_b_is_equal_T_2;
  wire        fp_b_is_less = ~fp_b_is_greater & ~fp_b_is_equal;
  wire        _result_max_T_7 = _fp_a_is_NAN_T & _fp_b_is_NAN_T;
  wire        _GEN_1 = _fp_a_is_NAN_T | _fp_b_is_NAN_T;
  wire [63:0] _result_min_T_19 =
    (_GEN_1
       ? 64'h0
       : fp_b_is_less | io_fp_b[63] & fp_b_is_zero & fp_a_is_zero ? io_fp_b : io_fp_a)
    | (~_fp_a_is_NAN_T & _fp_b_is_NAN_T ? io_fp_a : 64'h0)
    | (_fp_a_is_NAN_T & ~_fp_b_is_NAN_T ? io_fp_b : 64'h0)
    | (_result_max_T_7 ? 64'h7FF8000000000000 : 64'h0);
  wire [63:0] _result_max_T_21 =
    (_GEN_1
       ? 64'h0
       : fp_b_is_greater | ~(io_fp_b[63]) & fp_b_is_zero & fp_a_is_zero
           ? io_fp_b
           : io_fp_a) | (~_fp_a_is_NAN_T & _fp_b_is_NAN_T ? io_fp_a : 64'h0)
    | (_fp_a_is_NAN_T & ~_fp_b_is_NAN_T ? io_fp_b : 64'h0)
    | (_result_max_T_7 ? 64'h7FF8000000000000 : 64'h0);
  wire        _result_feq_T_1 = ~_fflags_NV_stage0_T_10 & fp_b_is_equal;
  wire        _result_fclass_T_7 = io_fp_a[63] & Efp_a_is_zero;
  wire        is_fsum_ure_notmasked = is_fsum_ure & (&io_maskForReduction);
  wire        is_fsum_ore_notmasked = is_fsum_ore & io_maskForReduction[0];
  wire        _result_fmin_re_T = io_maskForReduction == 2'h0;
  wire [63:0] re_masked_one_out = io_maskForReduction[0] ? io_fp_a : io_fp_b;
  wire        _io_fflags_T = io_op_code == 5'h0 | io_op_code == 5'h1;
  always @(posedge clock) begin
    if (io_fire) begin
      fp_a_is_zero_reg <= fp_a_is_zero;
      fp_b_is_zero_reg <= fp_b_is_zero;
      res_widening_reg <= io_res_widening;
      is_far_path_reg <=
        ~EOP | (|(_U_far_path_io_absEaSubEb[10:1])) | _U_far_path_io_absEaSubEb == 11'h1
        & (Efp_a_is_zero ^ Efp_b_is_zero);
      r <= _fflags_NV_stage0_T_4 | _GEN_0;
      r_1 <= _fp_a_is_NAN_T | _fp_b_is_NAN_T | fp_a_is_infinite | fp_b_is_infinite;
      r_2 <= _fflags_NV_stage0_T_10 | _GEN_0;
      r_3 <= fp_a_is_infinite | fp_b_is_infinite;
      float_adder_result_r_1 <=
        {fp_a_is_infinite ? fp_a_to64[63] : io_is_sub ^ fp_b_to64[63],
         63'h7FF0000000000000};
      float_adder_result_r_2 <=
        {io_round_mode == 3'h2 & EOP | fp_a_to64[63] & ~EOP, 63'h0};
      float_adder_result_r_3 <= {io_is_sub ^ fp_b_to64[63], fp_b_to64[62:0]};
      float_adder_result_r_4 <= fp_a_to64;
      io_fp_c_r <= _io_fflags_T | is_fsum_ure_notmasked | is_fsum_ore_notmasked;
      io_fp_c_r_1 <=
        (is_min ? _result_min_T_19 : 64'h0) | (is_max ? _result_max_T_21 : 64'h0)
        | (is_feq ? {63'h0, _result_feq_T_1} : 64'h0)
        | (is_fne ? {63'h0, ~_result_feq_T_1} : 64'h0)
        | (is_flt ? {63'h0, ~_fflags_NV_stage0_T_10 & fp_b_is_greater} : 64'h0)
        | (is_fle
             ? {63'h0, ~_fflags_NV_stage0_T_10 & (fp_b_is_greater | fp_b_is_equal)}
             : 64'h0) | (is_fgt ? {63'h0, ~_fflags_NV_stage0_T_10 & fp_b_is_less} : 64'h0)
        | (is_fge
             ? {63'h0, ~_fflags_NV_stage0_T_10 & (fp_b_is_less | fp_b_is_equal)}
             : 64'h0) | (io_op_code == 5'h6 ? {io_fp_b[63], io_fp_a[62:0]} : 64'h0)
        | (io_op_code == 5'h7 ? {~(io_fp_b[63]), io_fp_a[62:0]} : 64'h0)
        | (io_op_code == 5'h8 ? {io_fp_b[63] ^ io_fp_a[63], io_fp_a[62:0]} : 64'h0)
        | (io_op_code == 5'hF
             ? {54'h0,
                _fp_a_is_NAN_T & ~fp_a_is_SNAN,
                fp_a_is_SNAN,
                ~(io_fp_a[63]) & fp_a_is_infinite,
                ~(io_fp_a[63]) & ~Efp_a_is_zero & ~Efp_a_is_all_one,
                ~(io_fp_a[63]) & Efp_a_is_zero & (|(fp_a_to64[51:0])),
                ~(io_fp_a[63]) & Efp_a_is_zero & ~(|(fp_a_to64[51:0])),
                _result_fclass_T_7 & ~(|(fp_a_to64[51:0])),
                _result_fclass_T_7 & (|(fp_a_to64[51:0])),
                io_fp_a[63] & ~Efp_a_is_zero & ~Efp_a_is_all_one,
                io_fp_a[63] & fp_a_is_infinite}
             : 64'h0) | (io_op_code == 5'h4 ? (io_mask ? io_fp_b : io_fp_a) : 64'h0)
        | (io_op_code == 5'h5 | io_op_code == 5'h11 | io_op_code == 5'h12
             ? io_fp_b
             : 64'h0)
        | (is_fsum_ure & ~(&io_maskForReduction)
             ? (_result_fmin_re_T
                  ? 64'h8000000000000000
                  : io_maskForReduction[0] ? io_fp_a : io_fp_b)
             : 64'h0)
        | (is_fmax_re
             ? (_result_fmin_re_T
                  ? 64'h7FF8000000000000
                  : (&io_maskForReduction) ? _result_max_T_21 : re_masked_one_out)
             : 64'h0)
        | (is_fmin_re
             ? (_result_fmin_re_T
                  ? 64'h7FF8000000000000
                  : (&io_maskForReduction) ? _result_min_T_19 : re_masked_one_out)
             : 64'h0)
        | (is_fsum_ore & ~(io_maskForReduction[0]) & ~(io_maskForReduction[0])
             ? io_fp_b
             : 64'h0);
      io_fflags_r <= _io_fflags_T | is_fsum_ure_notmasked | is_fsum_ore_notmasked;
      io_fflags_r_1 <=
        {(is_min | is_max) & _fflags_NV_stage0_T_4 | (is_feq | is_fne)
           & _fflags_NV_stage0_T_4 | (is_flt | is_fle | is_fgt | is_fge)
           & _fflags_NV_stage0_T_10 | (is_fmax_re | is_fmin_re) & io_maskForReduction[0]
           & fp_a_is_SNAN | io_maskForReduction[1] & fp_b_is_SNAN,
         4'h0};
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:12];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'hD; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        fp_a_is_zero_reg = _RANDOM[4'h0][0];
        fp_b_is_zero_reg = _RANDOM[4'h0][1];
        res_widening_reg = _RANDOM[4'h0][2];
        is_far_path_reg = _RANDOM[4'h0][3];
        r = _RANDOM[4'h0][4];
        r_1 = _RANDOM[4'h0][5];
        r_2 = _RANDOM[4'h0][6];
        r_3 = _RANDOM[4'h2][7];
        float_adder_result_r_1 = {_RANDOM[4'h2][31:8], _RANDOM[4'h3], _RANDOM[4'h4][7:0]};
        float_adder_result_r_2 = {_RANDOM[4'h4][31:8], _RANDOM[4'h5], _RANDOM[4'h6][7:0]};
        float_adder_result_r_3 = {_RANDOM[4'h6][31:8], _RANDOM[4'h7], _RANDOM[4'h8][7:0]};
        float_adder_result_r_4 = {_RANDOM[4'h8][31:8], _RANDOM[4'h9], _RANDOM[4'hA][7:0]};
        io_fp_c_r = _RANDOM[4'hA][8];
        io_fp_c_r_1 = {_RANDOM[4'hA][31:9], _RANDOM[4'hB], _RANDOM[4'hC][8:0]};
        io_fflags_r = _RANDOM[4'hC][9];
        io_fflags_r_1 = _RANDOM[4'hC][14:10];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  FarPathFloatAdderF64WidenPipeline U_far_path (
    .clock             (clock),
    .io_fire           (io_fire),
    .io_fp_a           (fp_a_to64),
    .io_fp_b           (fp_b_to64),
    .io_fp_c           (_U_far_path_io_fp_c),
    .io_is_sub         (io_is_sub),
    .io_round_mode     (io_round_mode),
    .io_fflags         (_U_far_path_io_fflags),
    .io_absEaSubEb     (_U_far_path_io_absEaSubEb),
    .io_isEfp_bGreater (_U_far_path_io_isEfp_bGreater)
  );
  ClosePathFloatAdderF64WidenPipeline U_close_path (
    .clock         (clock),
    .io_fire       (io_fire),
    .io_fp_a       (fp_a_to64),
    .io_fp_b       (fp_b_to64),
    .io_fp_c       (_U_close_path_io_fp_c),
    .io_round_mode (io_round_mode),
    .io_fflags     (_U_close_path_io_fflags),
    .io_CS1        (_U_close_path_io_CS1)
  );
  assign io_fp_c =
    io_fp_c_r
      ? (r_2
           ? 64'h7FF8000000000000
           : r_3
               ? float_adder_result_r_1
               : _GEN & fp_b_is_zero_reg
                   ? float_adder_result_r_2
                   : _GEN
                       ? float_adder_result_r_3
                       : res_widening_reg & fp_b_is_zero_reg
                           ? float_adder_result_r_4
                           : is_far_path_reg
                               ? _U_far_path_io_fp_c
                               : _U_close_path_io_fp_c)
      : io_fp_c_r_1;
  assign io_fflags =
    io_fflags_r
      ? (r
           ? 5'h10
           : r_1 | (fp_b_is_zero_reg | fp_a_is_zero_reg) & res_widening_reg
               ? 5'h0
               : is_far_path_reg ? _U_far_path_io_fflags : _U_close_path_io_fflags)
      : io_fflags_r_1;
endmodule

