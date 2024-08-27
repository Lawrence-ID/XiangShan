// Generated by CIRCT firtool-1.74.0
module FloatAdderWidenFormat(
  input  [63:0] io_widen_a,
  input  [63:0] io_widen_b,
  input         io_uop_idx,
  output [31:0] io_widen_a_f32_0,
  output [31:0] io_widen_b_f32_0,
  output [31:0] io_widen_a_f32_1,
  output [31:0] io_widen_b_f32_1,
  output [63:0] io_widen_a_f64,
  output [63:0] io_widen_b_f64
);

  wire [22:0] _io_widen_b_f64_U_fp_a_is_denormal_to_widen_2_io_lshift_result;
  wire [10:0] _io_widen_b_f64_U_fp_a_is_denormal_to_widen_2_io_exp_result;
  wire [22:0] _io_widen_b_f64_U_fp_a_is_denormal_to_widen_1_io_lshift_result;
  wire [10:0] _io_widen_b_f64_U_fp_a_is_denormal_to_widen_1_io_exp_result;
  wire [22:0] _io_widen_a_f64_U_fp_a_is_denormal_to_widen_1_io_lshift_result;
  wire [10:0] _io_widen_a_f64_U_fp_a_is_denormal_to_widen_1_io_exp_result;
  wire [22:0] _io_widen_a_f64_U_fp_a_is_denormal_to_widen_io_lshift_result;
  wire [10:0] _io_widen_a_f64_U_fp_a_is_denormal_to_widen_io_exp_result;
  wire [9:0]  _io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_2_io_lshift_result;
  wire [7:0]  _io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_2_io_exp_result;
  wire [9:0]  _io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_1_io_lshift_result;
  wire [7:0]  _io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_1_io_exp_result;
  wire [9:0]  _io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_1_io_lshift_result;
  wire [7:0]  _io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_1_io_exp_result;
  wire [9:0]  _io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_io_lshift_result;
  wire [7:0]  _io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_io_exp_result;
  wire [9:0]  _io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_2_io_lshift_result;
  wire [7:0]  _io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_2_io_exp_result;
  wire [9:0]  _io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_1_io_lshift_result;
  wire [7:0]  _io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_1_io_exp_result;
  wire [9:0]  _io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_1_io_lshift_result;
  wire [7:0]  _io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_1_io_exp_result;
  wire [9:0]  _io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_io_lshift_result;
  wire [7:0]  _io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_io_exp_result;
  wire        io_widen_a_f32_0_fp_a_is_denormal = io_widen_a[46:42] == 5'h0;
  wire        io_widen_a_f32_0_fp_a_is_denormal_1 = io_widen_a[14:10] == 5'h0;
  wire        io_widen_b_f32_0_fp_a_is_denormal_1 = io_widen_b[46:42] == 5'h0;
  wire        io_widen_b_f32_0_fp_a_is_denormal_2 = io_widen_b[14:10] == 5'h0;
  wire        io_widen_a_f32_1_fp_a_is_denormal = io_widen_a[62:58] == 5'h0;
  wire        io_widen_a_f32_1_fp_a_is_denormal_1 = io_widen_a[30:26] == 5'h0;
  wire        io_widen_b_f32_1_fp_a_is_denormal_1 = io_widen_b[62:58] == 5'h0;
  wire        io_widen_b_f32_1_fp_a_is_denormal_2 = io_widen_b[30:26] == 5'h0;
  wire        io_widen_a_f64_fp_a_is_denormal = io_widen_a[62:55] == 8'h0;
  wire        io_widen_a_f64_fp_a_is_denormal_1 = io_widen_a[30:23] == 8'h0;
  wire        io_widen_b_f64_fp_a_is_denormal_1 = io_widen_b[62:55] == 8'h0;
  wire        io_widen_b_f64_fp_a_is_denormal_2 = io_widen_b[30:23] == 8'h0;
  ShiftLeftPriorityWithF32EXPResult io_widen_a_f32_0_U_fp_a_is_denormal_to_widen (
    .io_src                 (io_widen_a[41:32]),
    .io_priority_shiftValue (io_widen_a[41:32]),
    .io_lshift_result
      (_io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_io_lshift_result),
    .io_exp_result          (_io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_io_exp_result)
  );
  ShiftLeftPriorityWithF32EXPResult io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_1 (
    .io_src                 (io_widen_a[9:0]),
    .io_priority_shiftValue (io_widen_a[9:0]),
    .io_lshift_result
      (_io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_1_io_lshift_result),
    .io_exp_result
      (_io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_1_io_exp_result)
  );
  ShiftLeftPriorityWithF32EXPResult io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_1 (
    .io_src                 (io_widen_b[41:32]),
    .io_priority_shiftValue (io_widen_b[41:32]),
    .io_lshift_result
      (_io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_1_io_lshift_result),
    .io_exp_result
      (_io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_1_io_exp_result)
  );
  ShiftLeftPriorityWithF32EXPResult io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_2 (
    .io_src                 (io_widen_b[9:0]),
    .io_priority_shiftValue (io_widen_b[9:0]),
    .io_lshift_result
      (_io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_2_io_lshift_result),
    .io_exp_result
      (_io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_2_io_exp_result)
  );
  ShiftLeftPriorityWithF32EXPResult io_widen_a_f32_1_U_fp_a_is_denormal_to_widen (
    .io_src                 (io_widen_a[57:48]),
    .io_priority_shiftValue (io_widen_a[57:48]),
    .io_lshift_result
      (_io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_io_lshift_result),
    .io_exp_result          (_io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_io_exp_result)
  );
  ShiftLeftPriorityWithF32EXPResult io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_1 (
    .io_src                 (io_widen_a[25:16]),
    .io_priority_shiftValue (io_widen_a[25:16]),
    .io_lshift_result
      (_io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_1_io_lshift_result),
    .io_exp_result
      (_io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_1_io_exp_result)
  );
  ShiftLeftPriorityWithF32EXPResult io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_1 (
    .io_src                 (io_widen_b[57:48]),
    .io_priority_shiftValue (io_widen_b[57:48]),
    .io_lshift_result
      (_io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_1_io_lshift_result),
    .io_exp_result
      (_io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_1_io_exp_result)
  );
  ShiftLeftPriorityWithF32EXPResult io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_2 (
    .io_src                 (io_widen_b[25:16]),
    .io_priority_shiftValue (io_widen_b[25:16]),
    .io_lshift_result
      (_io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_2_io_lshift_result),
    .io_exp_result
      (_io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_2_io_exp_result)
  );
  ShiftLeftPriorityWithF64EXPResult io_widen_a_f64_U_fp_a_is_denormal_to_widen (
    .io_src                 (io_widen_a[54:32]),
    .io_priority_shiftValue (io_widen_a[54:32]),
    .io_lshift_result
      (_io_widen_a_f64_U_fp_a_is_denormal_to_widen_io_lshift_result),
    .io_exp_result          (_io_widen_a_f64_U_fp_a_is_denormal_to_widen_io_exp_result)
  );
  ShiftLeftPriorityWithF64EXPResult io_widen_a_f64_U_fp_a_is_denormal_to_widen_1 (
    .io_src                 (io_widen_a[22:0]),
    .io_priority_shiftValue (io_widen_a[22:0]),
    .io_lshift_result
      (_io_widen_a_f64_U_fp_a_is_denormal_to_widen_1_io_lshift_result),
    .io_exp_result          (_io_widen_a_f64_U_fp_a_is_denormal_to_widen_1_io_exp_result)
  );
  ShiftLeftPriorityWithF64EXPResult io_widen_b_f64_U_fp_a_is_denormal_to_widen_1 (
    .io_src                 (io_widen_b[54:32]),
    .io_priority_shiftValue (io_widen_b[54:32]),
    .io_lshift_result
      (_io_widen_b_f64_U_fp_a_is_denormal_to_widen_1_io_lshift_result),
    .io_exp_result          (_io_widen_b_f64_U_fp_a_is_denormal_to_widen_1_io_exp_result)
  );
  ShiftLeftPriorityWithF64EXPResult io_widen_b_f64_U_fp_a_is_denormal_to_widen_2 (
    .io_src                 (io_widen_b[22:0]),
    .io_priority_shiftValue (io_widen_b[22:0]),
    .io_lshift_result
      (_io_widen_b_f64_U_fp_a_is_denormal_to_widen_2_io_lshift_result),
    .io_exp_result          (_io_widen_b_f64_U_fp_a_is_denormal_to_widen_2_io_exp_result)
  );
  assign io_widen_a_f32_0 =
    {io_uop_idx
       ? {io_widen_a[47],
          io_widen_a_f32_0_fp_a_is_denormal
            ? _io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_io_exp_result
            : {io_widen_a[46] ? 4'h8 : 4'h7, io_widen_a[45:42]},
          io_widen_a_f32_0_fp_a_is_denormal
            ? {_io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_io_lshift_result[8:0], 1'h0}
            : io_widen_a[41:32]}
       : {io_widen_a[15],
          io_widen_a_f32_0_fp_a_is_denormal_1
            ? _io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_1_io_exp_result
            : {io_widen_a[14] ? 4'h8 : 4'h7, io_widen_a[13:10]},
          io_widen_a_f32_0_fp_a_is_denormal_1
            ? {_io_widen_a_f32_0_U_fp_a_is_denormal_to_widen_1_io_lshift_result[8:0],
               1'h0}
            : io_widen_a[9:0]},
     13'h0};
  assign io_widen_b_f32_0 =
    {io_uop_idx
       ? {io_widen_b[47],
          io_widen_b_f32_0_fp_a_is_denormal_1
            ? _io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_1_io_exp_result
            : {io_widen_b[46] ? 4'h8 : 4'h7, io_widen_b[45:42]},
          io_widen_b_f32_0_fp_a_is_denormal_1
            ? {_io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_1_io_lshift_result[8:0],
               1'h0}
            : io_widen_b[41:32]}
       : {io_widen_b[15],
          io_widen_b_f32_0_fp_a_is_denormal_2
            ? _io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_2_io_exp_result
            : {io_widen_b[14] ? 4'h8 : 4'h7, io_widen_b[13:10]},
          io_widen_b_f32_0_fp_a_is_denormal_2
            ? {_io_widen_b_f32_0_U_fp_a_is_denormal_to_widen_2_io_lshift_result[8:0],
               1'h0}
            : io_widen_b[9:0]},
     13'h0};
  assign io_widen_a_f32_1 =
    {io_uop_idx
       ? {io_widen_a[63],
          io_widen_a_f32_1_fp_a_is_denormal
            ? _io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_io_exp_result
            : {io_widen_a[62] ? 4'h8 : 4'h7, io_widen_a[61:58]},
          io_widen_a_f32_1_fp_a_is_denormal
            ? {_io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_io_lshift_result[8:0], 1'h0}
            : io_widen_a[57:48]}
       : {io_widen_a[31],
          io_widen_a_f32_1_fp_a_is_denormal_1
            ? _io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_1_io_exp_result
            : {io_widen_a[30] ? 4'h8 : 4'h7, io_widen_a[29:26]},
          io_widen_a_f32_1_fp_a_is_denormal_1
            ? {_io_widen_a_f32_1_U_fp_a_is_denormal_to_widen_1_io_lshift_result[8:0],
               1'h0}
            : io_widen_a[25:16]},
     13'h0};
  assign io_widen_b_f32_1 =
    {io_uop_idx
       ? {io_widen_b[63],
          io_widen_b_f32_1_fp_a_is_denormal_1
            ? _io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_1_io_exp_result
            : {io_widen_b[62] ? 4'h8 : 4'h7, io_widen_b[61:58]},
          io_widen_b_f32_1_fp_a_is_denormal_1
            ? {_io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_1_io_lshift_result[8:0],
               1'h0}
            : io_widen_b[57:48]}
       : {io_widen_b[31],
          io_widen_b_f32_1_fp_a_is_denormal_2
            ? _io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_2_io_exp_result
            : {io_widen_b[30] ? 4'h8 : 4'h7, io_widen_b[29:26]},
          io_widen_b_f32_1_fp_a_is_denormal_2
            ? {_io_widen_b_f32_1_U_fp_a_is_denormal_to_widen_2_io_lshift_result[8:0],
               1'h0}
            : io_widen_b[25:16]},
     13'h0};
  assign io_widen_a_f64 =
    {io_uop_idx
       ? {io_widen_a[63],
          io_widen_a_f64_fp_a_is_denormal
            ? _io_widen_a_f64_U_fp_a_is_denormal_to_widen_io_exp_result
            : {io_widen_a[62] ? 4'h8 : 4'h7, io_widen_a[61:55]},
          io_widen_a_f64_fp_a_is_denormal
            ? {_io_widen_a_f64_U_fp_a_is_denormal_to_widen_io_lshift_result[21:0], 1'h0}
            : io_widen_a[54:32]}
       : {io_widen_a[31],
          io_widen_a_f64_fp_a_is_denormal_1
            ? _io_widen_a_f64_U_fp_a_is_denormal_to_widen_1_io_exp_result
            : {io_widen_a[30] ? 4'h8 : 4'h7, io_widen_a[29:23]},
          io_widen_a_f64_fp_a_is_denormal_1
            ? {_io_widen_a_f64_U_fp_a_is_denormal_to_widen_1_io_lshift_result[21:0], 1'h0}
            : io_widen_a[22:0]},
     29'h0};
  assign io_widen_b_f64 =
    {io_uop_idx
       ? {io_widen_b[63],
          io_widen_b_f64_fp_a_is_denormal_1
            ? _io_widen_b_f64_U_fp_a_is_denormal_to_widen_1_io_exp_result
            : {io_widen_b[62] ? 4'h8 : 4'h7, io_widen_b[61:55]},
          io_widen_b_f64_fp_a_is_denormal_1
            ? {_io_widen_b_f64_U_fp_a_is_denormal_to_widen_1_io_lshift_result[21:0], 1'h0}
            : io_widen_b[54:32]}
       : {io_widen_b[31],
          io_widen_b_f64_fp_a_is_denormal_2
            ? _io_widen_b_f64_U_fp_a_is_denormal_to_widen_2_io_exp_result
            : {io_widen_b[30] ? 4'h8 : 4'h7, io_widen_b[29:23]},
          io_widen_b_f64_fp_a_is_denormal_2
            ? {_io_widen_b_f64_U_fp_a_is_denormal_to_widen_2_io_lshift_result[21:0], 1'h0}
            : io_widen_b[22:0]},
     29'h0};
endmodule

