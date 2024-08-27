// Generated by CIRCT firtool-1.74.0
module Mgu(
  input  [127:0] io_in_vd,
  input  [127:0] io_in_oldVd,
  input  [127:0] io_in_mask,
  input          io_in_info_ta,
  input          io_in_info_ma,
  input  [7:0]   io_in_info_vl,
  input  [7:0]   io_in_info_vstart,
  input  [1:0]   io_in_info_eew,
  input  [2:0]   io_in_info_vdIdx,
  input          io_in_info_narrow,
  input          io_in_info_dstMask,
  output [127:0] io_out_vd,
  output [15:0]  io_out_active
);

  wire [15:0]       _maskTailGen_io_out_activeEn;
  wire [15:0]       _maskTailGen_io_out_agnosticEn;
  wire [2:0]        vdIdx =
    io_in_info_narrow ? {1'h0, io_in_info_vdIdx[2:1]} : io_in_info_vdIdx;
  wire              _maskBits_sew_oneHot_T_1 = io_in_info_eew == 2'h1;
  wire              _maskBits_sew_oneHot_T_2 = io_in_info_eew == 2'h2;
  wire              _maskDataVec_maskDataVec_7_T_2 = io_in_info_eew == 2'h1;
  wire              _maskDataVec_maskDataVec_7_T_4 = io_in_info_eew == 2'h2;
  wire [15:0]       _maskDataVec_maskDataVec_0_T_8 =
    (|io_in_info_eew) ? 16'h0 : io_in_mask[15:0];
  wire [7:0]        _GEN =
    _maskDataVec_maskDataVec_0_T_8[7:0]
    | (_maskDataVec_maskDataVec_7_T_2 ? io_in_mask[7:0] : 8'h0);
  wire [3:0]        _GEN_0 =
    _GEN[3:0] | (_maskDataVec_maskDataVec_7_T_4 ? io_in_mask[3:0] : 4'h0);
  wire [15:0]       _maskDataVec_maskDataVec_1_T_8 =
    (|io_in_info_eew) ? 16'h0 : io_in_mask[31:16];
  wire [7:0]        _GEN_1 =
    _maskDataVec_maskDataVec_1_T_8[7:0]
    | (_maskDataVec_maskDataVec_7_T_2 ? io_in_mask[15:8] : 8'h0);
  wire [3:0]        _GEN_2 =
    _GEN_1[3:0] | (_maskDataVec_maskDataVec_7_T_4 ? io_in_mask[7:4] : 4'h0);
  wire [15:0]       _maskDataVec_maskDataVec_2_T_8 =
    (|io_in_info_eew) ? 16'h0 : io_in_mask[47:32];
  wire [7:0]        _GEN_3 =
    _maskDataVec_maskDataVec_2_T_8[7:0]
    | (_maskDataVec_maskDataVec_7_T_2 ? io_in_mask[23:16] : 8'h0);
  wire [3:0]        _GEN_4 =
    _GEN_3[3:0] | (_maskDataVec_maskDataVec_7_T_4 ? io_in_mask[11:8] : 4'h0);
  wire [15:0]       _maskDataVec_maskDataVec_3_T_8 =
    (|io_in_info_eew) ? 16'h0 : io_in_mask[63:48];
  wire [7:0]        _GEN_5 =
    _maskDataVec_maskDataVec_3_T_8[7:0]
    | (_maskDataVec_maskDataVec_7_T_2 ? io_in_mask[31:24] : 8'h0);
  wire [3:0]        _GEN_6 =
    _GEN_5[3:0] | (_maskDataVec_maskDataVec_7_T_4 ? io_in_mask[15:12] : 4'h0);
  wire [15:0]       _maskDataVec_maskDataVec_4_T_8 =
    (|io_in_info_eew) ? 16'h0 : io_in_mask[79:64];
  wire [7:0]        _GEN_7 =
    _maskDataVec_maskDataVec_4_T_8[7:0]
    | (_maskDataVec_maskDataVec_7_T_2 ? io_in_mask[39:32] : 8'h0);
  wire [3:0]        _GEN_8 =
    _GEN_7[3:0] | (_maskDataVec_maskDataVec_7_T_4 ? io_in_mask[19:16] : 4'h0);
  wire [15:0]       _maskDataVec_maskDataVec_5_T_8 =
    (|io_in_info_eew) ? 16'h0 : io_in_mask[95:80];
  wire [7:0]        _GEN_9 =
    _maskDataVec_maskDataVec_5_T_8[7:0]
    | (_maskDataVec_maskDataVec_7_T_2 ? io_in_mask[47:40] : 8'h0);
  wire [3:0]        _GEN_10 =
    _GEN_9[3:0] | (_maskDataVec_maskDataVec_7_T_4 ? io_in_mask[23:20] : 4'h0);
  wire [15:0]       _maskDataVec_maskDataVec_6_T_8 =
    (|io_in_info_eew) ? 16'h0 : io_in_mask[111:96];
  wire [7:0]        _GEN_11 =
    _maskDataVec_maskDataVec_6_T_8[7:0]
    | (_maskDataVec_maskDataVec_7_T_2 ? io_in_mask[55:48] : 8'h0);
  wire [3:0]        _GEN_12 =
    _GEN_11[3:0] | (_maskDataVec_maskDataVec_7_T_4 ? io_in_mask[27:24] : 4'h0);
  wire [15:0]       _maskDataVec_maskDataVec_7_T_8 =
    (|io_in_info_eew) ? 16'h0 : io_in_mask[127:112];
  wire [7:0]        _GEN_13 =
    _maskDataVec_maskDataVec_7_T_8[7:0]
    | (_maskDataVec_maskDataVec_7_T_2 ? io_in_mask[63:56] : 8'h0);
  wire [3:0]        _GEN_14 =
    _GEN_13[3:0] | (_maskDataVec_maskDataVec_7_T_4 ? io_in_mask[31:28] : 4'h0);
  wire [7:0][15:0]  _GEN_15 =
    {{{_maskDataVec_maskDataVec_7_T_8[15:8],
       _GEN_13[7:4],
       _GEN_14[3:2],
       _GEN_14[1:0] | ((&io_in_info_eew) ? io_in_mask[15:14] : 2'h0)}},
     {{_maskDataVec_maskDataVec_6_T_8[15:8],
       _GEN_11[7:4],
       _GEN_12[3:2],
       _GEN_12[1:0] | ((&io_in_info_eew) ? io_in_mask[13:12] : 2'h0)}},
     {{_maskDataVec_maskDataVec_5_T_8[15:8],
       _GEN_9[7:4],
       _GEN_10[3:2],
       _GEN_10[1:0] | ((&io_in_info_eew) ? io_in_mask[11:10] : 2'h0)}},
     {{_maskDataVec_maskDataVec_4_T_8[15:8],
       _GEN_7[7:4],
       _GEN_8[3:2],
       _GEN_8[1:0] | ((&io_in_info_eew) ? io_in_mask[9:8] : 2'h0)}},
     {{_maskDataVec_maskDataVec_3_T_8[15:8],
       _GEN_5[7:4],
       _GEN_6[3:2],
       _GEN_6[1:0] | ((&io_in_info_eew) ? io_in_mask[7:6] : 2'h0)}},
     {{_maskDataVec_maskDataVec_2_T_8[15:8],
       _GEN_3[7:4],
       _GEN_4[3:2],
       _GEN_4[1:0] | ((&io_in_info_eew) ? io_in_mask[5:4] : 2'h0)}},
     {{_maskDataVec_maskDataVec_1_T_8[15:8],
       _GEN_1[7:4],
       _GEN_2[3:2],
       _GEN_2[1:0] | ((&io_in_info_eew) ? io_in_mask[3:2] : 2'h0)}},
     {{_maskDataVec_maskDataVec_0_T_8[15:8],
       _GEN[7:4],
       _GEN_0[3:2],
       _GEN_0[1:0] | ((&io_in_info_eew) ? io_in_mask[1:0] : 2'h0)}}};
  wire [7:0][15:0]  _GEN_16 =
    {{((|io_in_info_eew) ? 16'h0 : io_in_mask[127:112])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_mask[63:56]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_mask[31:28]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_mask[15:14]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_mask[111:96])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_mask[55:48]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_mask[27:24]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_mask[13:12]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_mask[95:80])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_mask[47:40]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_mask[23:20]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_mask[11:10]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_mask[79:64])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_mask[39:32]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_mask[19:16]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_mask[9:8]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_mask[63:48])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_mask[31:24]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_mask[15:12]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_mask[7:6]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_mask[47:32])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_mask[23:16]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_mask[11:8]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_mask[5:4]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_mask[31:16])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_mask[15:8]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_mask[7:4]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_mask[3:2]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_mask[15:0])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_mask[7:0]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_mask[3:0]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_mask[1:0]} : 16'h0)}};
  wire [7:0][15:0]  _GEN_17 =
    {{((|io_in_info_eew) ? 16'h0 : io_in_oldVd[127:112])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_oldVd[63:56]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_oldVd[31:28]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_oldVd[15:14]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_oldVd[111:96])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_oldVd[55:48]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_oldVd[27:24]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_oldVd[13:12]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_oldVd[95:80])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_oldVd[47:40]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_oldVd[23:20]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_oldVd[11:10]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_oldVd[79:64])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_oldVd[39:32]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_oldVd[19:16]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_oldVd[9:8]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_oldVd[63:48])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_oldVd[31:24]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_oldVd[15:12]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_oldVd[7:6]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_oldVd[47:32])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_oldVd[23:16]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_oldVd[11:8]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_oldVd[5:4]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_oldVd[31:16])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_oldVd[15:8]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_oldVd[7:4]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_oldVd[3:2]} : 16'h0)},
     {((|io_in_info_eew) ? 16'h0 : io_in_oldVd[15:0])
        | (_maskBits_sew_oneHot_T_1 ? {8'h0, io_in_oldVd[7:0]} : 16'h0)
        | (_maskBits_sew_oneHot_T_2 ? {12'h0, io_in_oldVd[3:0]} : 16'h0)
        | ((&io_in_info_eew) ? {14'h0, io_in_oldVd[1:0]} : 16'h0)}};
  wire              maskVecByte_0 =
    _GEN_16[vdIdx][0] ? io_in_vd[0] : io_in_info_ma | _GEN_17[vdIdx][0];
  wire              maskVecByte_1 =
    _GEN_16[vdIdx][1] ? io_in_vd[1] : io_in_info_ma | _GEN_17[vdIdx][1];
  wire              maskVecByte_2 =
    _GEN_16[vdIdx][2] ? io_in_vd[2] : io_in_info_ma | _GEN_17[vdIdx][2];
  wire              maskVecByte_3 =
    _GEN_16[vdIdx][3] ? io_in_vd[3] : io_in_info_ma | _GEN_17[vdIdx][3];
  wire              maskVecByte_4 =
    _GEN_16[vdIdx][4] ? io_in_vd[4] : io_in_info_ma | _GEN_17[vdIdx][4];
  wire              maskVecByte_5 =
    _GEN_16[vdIdx][5] ? io_in_vd[5] : io_in_info_ma | _GEN_17[vdIdx][5];
  wire              maskVecByte_6 =
    _GEN_16[vdIdx][6] ? io_in_vd[6] : io_in_info_ma | _GEN_17[vdIdx][6];
  wire              maskVecByte_7 =
    _GEN_16[vdIdx][7] ? io_in_vd[7] : io_in_info_ma | _GEN_17[vdIdx][7];
  wire              maskVecByte_8 =
    _GEN_16[vdIdx][8] ? io_in_vd[8] : io_in_info_ma | _GEN_17[vdIdx][8];
  wire              maskVecByte_9 =
    _GEN_16[vdIdx][9] ? io_in_vd[9] : io_in_info_ma | _GEN_17[vdIdx][9];
  wire              maskVecByte_10 =
    _GEN_16[vdIdx][10] ? io_in_vd[10] : io_in_info_ma | _GEN_17[vdIdx][10];
  wire              maskVecByte_11 =
    _GEN_16[vdIdx][11] ? io_in_vd[11] : io_in_info_ma | _GEN_17[vdIdx][11];
  wire              maskVecByte_12 =
    _GEN_16[vdIdx][12] ? io_in_vd[12] : io_in_info_ma | _GEN_17[vdIdx][12];
  wire              maskVecByte_13 =
    _GEN_16[vdIdx][13] ? io_in_vd[13] : io_in_info_ma | _GEN_17[vdIdx][13];
  wire              maskVecByte_14 =
    _GEN_16[vdIdx][14] ? io_in_vd[14] : io_in_info_ma | _GEN_17[vdIdx][14];
  wire              maskVecByte_15 =
    _GEN_16[vdIdx][15] ? io_in_vd[15] : io_in_info_ma | _GEN_17[vdIdx][15];
  wire [3:0][127:0] _GEN_18 =
    {{{io_in_oldVd[127:2], maskVecByte_1, maskVecByte_0}},
     {{io_in_oldVd[127:4], maskVecByte_3, maskVecByte_2, maskVecByte_1, maskVecByte_0}},
     {{io_in_oldVd[127:8],
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0}},
     {{io_in_oldVd[127:16],
       maskVecByte_15,
       maskVecByte_14,
       maskVecByte_13,
       maskVecByte_12,
       maskVecByte_11,
       maskVecByte_10,
       maskVecByte_9,
       maskVecByte_8,
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0}}};
  wire [3:0][127:0] _GEN_19 =
    {{{io_in_oldVd[127:4], maskVecByte_1, maskVecByte_0, io_in_oldVd[1:0]}},
     {{io_in_oldVd[127:8],
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[3:0]}},
     {{io_in_oldVd[127:16],
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[7:0]}},
     {{io_in_oldVd[127:32],
       maskVecByte_15,
       maskVecByte_14,
       maskVecByte_13,
       maskVecByte_12,
       maskVecByte_11,
       maskVecByte_10,
       maskVecByte_9,
       maskVecByte_8,
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[15:0]}}};
  wire [3:0][127:0] _GEN_20 =
    {{{io_in_oldVd[127:6], maskVecByte_1, maskVecByte_0, io_in_oldVd[3:0]}},
     {{io_in_oldVd[127:12],
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[7:0]}},
     {{io_in_oldVd[127:24],
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[15:0]}},
     {{io_in_oldVd[127:48],
       maskVecByte_15,
       maskVecByte_14,
       maskVecByte_13,
       maskVecByte_12,
       maskVecByte_11,
       maskVecByte_10,
       maskVecByte_9,
       maskVecByte_8,
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[31:0]}}};
  wire [3:0][127:0] _GEN_21 =
    {{{io_in_oldVd[127:8], maskVecByte_1, maskVecByte_0, io_in_oldVd[5:0]}},
     {{io_in_oldVd[127:16],
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[11:0]}},
     {{io_in_oldVd[127:32],
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[23:0]}},
     {{io_in_oldVd[127:64],
       maskVecByte_15,
       maskVecByte_14,
       maskVecByte_13,
       maskVecByte_12,
       maskVecByte_11,
       maskVecByte_10,
       maskVecByte_9,
       maskVecByte_8,
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[47:0]}}};
  wire [3:0][127:0] _GEN_22 =
    {{{io_in_oldVd[127:10], maskVecByte_1, maskVecByte_0, io_in_oldVd[7:0]}},
     {{io_in_oldVd[127:20],
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[15:0]}},
     {{io_in_oldVd[127:40],
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[31:0]}},
     {{io_in_oldVd[127:80],
       maskVecByte_15,
       maskVecByte_14,
       maskVecByte_13,
       maskVecByte_12,
       maskVecByte_11,
       maskVecByte_10,
       maskVecByte_9,
       maskVecByte_8,
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[63:0]}}};
  wire [3:0][127:0] _GEN_23 =
    {{{io_in_oldVd[127:12], maskVecByte_1, maskVecByte_0, io_in_oldVd[9:0]}},
     {{io_in_oldVd[127:24],
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[19:0]}},
     {{io_in_oldVd[127:48],
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[39:0]}},
     {{io_in_oldVd[127:96],
       maskVecByte_15,
       maskVecByte_14,
       maskVecByte_13,
       maskVecByte_12,
       maskVecByte_11,
       maskVecByte_10,
       maskVecByte_9,
       maskVecByte_8,
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[79:0]}}};
  wire [3:0][127:0] _GEN_24 =
    {{{io_in_oldVd[127:14], maskVecByte_1, maskVecByte_0, io_in_oldVd[11:0]}},
     {{io_in_oldVd[127:28],
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[23:0]}},
     {{io_in_oldVd[127:56],
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[47:0]}},
     {{io_in_oldVd[127:112],
       maskVecByte_15,
       maskVecByte_14,
       maskVecByte_13,
       maskVecByte_12,
       maskVecByte_11,
       maskVecByte_10,
       maskVecByte_9,
       maskVecByte_8,
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[95:0]}}};
  wire [3:0][127:0] _GEN_25 =
    {{{io_in_oldVd[127:16], maskVecByte_1, maskVecByte_0, io_in_oldVd[13:0]}},
     {{io_in_oldVd[127:32],
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[27:0]}},
     {{io_in_oldVd[127:64],
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[55:0]}},
     {{maskVecByte_15,
       maskVecByte_14,
       maskVecByte_13,
       maskVecByte_12,
       maskVecByte_11,
       maskVecByte_10,
       maskVecByte_9,
       maskVecByte_8,
       maskVecByte_7,
       maskVecByte_6,
       maskVecByte_5,
       maskVecByte_4,
       maskVecByte_3,
       maskVecByte_2,
       maskVecByte_1,
       maskVecByte_0,
       io_in_oldVd[111:0]}}};
  wire [7:0][127:0] _GEN_26 =
    {{_GEN_25[io_in_info_eew]},
     {_GEN_24[io_in_info_eew]},
     {_GEN_23[io_in_info_eew]},
     {_GEN_22[io_in_info_eew]},
     {_GEN_21[io_in_info_eew]},
     {_GEN_20[io_in_info_eew]},
     {_GEN_19[io_in_info_eew]},
     {_GEN_18[io_in_info_eew]}};
  ByteMaskTailGen maskTailGen (
    .io_in_begin       (io_in_info_vstart),
    .io_in_end         (io_in_info_vl),
    .io_in_vma         (io_in_info_ma),
    .io_in_vta         (io_in_info_ta),
    .io_in_vsew        (io_in_info_eew),
    .io_in_maskUsed    (_GEN_15[vdIdx]),
    .io_in_vdIdx       (vdIdx),
    .io_out_activeEn   (_maskTailGen_io_out_activeEn),
    .io_out_agnosticEn (_maskTailGen_io_out_agnosticEn)
  );
  assign io_out_vd =
    io_in_info_dstMask
      ? _GEN_26[vdIdx]
      : {_maskTailGen_io_out_activeEn[15]
           ? io_in_vd[127:120]
           : _maskTailGen_io_out_agnosticEn[15] ? 8'hFF : io_in_oldVd[127:120],
         _maskTailGen_io_out_activeEn[14]
           ? io_in_vd[119:112]
           : _maskTailGen_io_out_agnosticEn[14] ? 8'hFF : io_in_oldVd[119:112],
         _maskTailGen_io_out_activeEn[13]
           ? io_in_vd[111:104]
           : _maskTailGen_io_out_agnosticEn[13] ? 8'hFF : io_in_oldVd[111:104],
         _maskTailGen_io_out_activeEn[12]
           ? io_in_vd[103:96]
           : _maskTailGen_io_out_agnosticEn[12] ? 8'hFF : io_in_oldVd[103:96],
         _maskTailGen_io_out_activeEn[11]
           ? io_in_vd[95:88]
           : _maskTailGen_io_out_agnosticEn[11] ? 8'hFF : io_in_oldVd[95:88],
         _maskTailGen_io_out_activeEn[10]
           ? io_in_vd[87:80]
           : _maskTailGen_io_out_agnosticEn[10] ? 8'hFF : io_in_oldVd[87:80],
         _maskTailGen_io_out_activeEn[9]
           ? io_in_vd[79:72]
           : _maskTailGen_io_out_agnosticEn[9] ? 8'hFF : io_in_oldVd[79:72],
         _maskTailGen_io_out_activeEn[8]
           ? io_in_vd[71:64]
           : _maskTailGen_io_out_agnosticEn[8] ? 8'hFF : io_in_oldVd[71:64],
         _maskTailGen_io_out_activeEn[7]
           ? io_in_vd[63:56]
           : _maskTailGen_io_out_agnosticEn[7] ? 8'hFF : io_in_oldVd[63:56],
         _maskTailGen_io_out_activeEn[6]
           ? io_in_vd[55:48]
           : _maskTailGen_io_out_agnosticEn[6] ? 8'hFF : io_in_oldVd[55:48],
         _maskTailGen_io_out_activeEn[5]
           ? io_in_vd[47:40]
           : _maskTailGen_io_out_agnosticEn[5] ? 8'hFF : io_in_oldVd[47:40],
         _maskTailGen_io_out_activeEn[4]
           ? io_in_vd[39:32]
           : _maskTailGen_io_out_agnosticEn[4] ? 8'hFF : io_in_oldVd[39:32],
         _maskTailGen_io_out_activeEn[3]
           ? io_in_vd[31:24]
           : _maskTailGen_io_out_agnosticEn[3] ? 8'hFF : io_in_oldVd[31:24],
         _maskTailGen_io_out_activeEn[2]
           ? io_in_vd[23:16]
           : _maskTailGen_io_out_agnosticEn[2] ? 8'hFF : io_in_oldVd[23:16],
         _maskTailGen_io_out_activeEn[1]
           ? io_in_vd[15:8]
           : _maskTailGen_io_out_agnosticEn[1] ? 8'hFF : io_in_oldVd[15:8],
         _maskTailGen_io_out_activeEn[0]
           ? io_in_vd[7:0]
           : _maskTailGen_io_out_agnosticEn[0] ? 8'hFF : io_in_oldVd[7:0]};
  assign io_out_active = _maskTailGen_io_out_activeEn;
endmodule

