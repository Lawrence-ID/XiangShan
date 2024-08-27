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
module CSA4to2(
  input  [106:0] io_in_a,
  input  [106:0] io_in_b,
  input  [106:0] io_in_c,
  input  [106:0] io_in_d,
  output [106:0] io_out_sum,
  output [106:0] io_out_car
);

  wire cout_vec_0 = io_in_a[0] ^ io_in_b[0] ? io_in_c[0] : io_in_a[0];
  wire cout_vec_1 = io_in_a[1] ^ io_in_b[1] ? io_in_c[1] : io_in_a[1];
  wire cout_vec_2 = io_in_a[2] ^ io_in_b[2] ? io_in_c[2] : io_in_a[2];
  wire cout_vec_3 = io_in_a[3] ^ io_in_b[3] ? io_in_c[3] : io_in_a[3];
  wire cout_vec_4 = io_in_a[4] ^ io_in_b[4] ? io_in_c[4] : io_in_a[4];
  wire cout_vec_5 = io_in_a[5] ^ io_in_b[5] ? io_in_c[5] : io_in_a[5];
  wire cout_vec_6 = io_in_a[6] ^ io_in_b[6] ? io_in_c[6] : io_in_a[6];
  wire cout_vec_7 = io_in_a[7] ^ io_in_b[7] ? io_in_c[7] : io_in_a[7];
  wire cout_vec_8 = io_in_a[8] ^ io_in_b[8] ? io_in_c[8] : io_in_a[8];
  wire cout_vec_9 = io_in_a[9] ^ io_in_b[9] ? io_in_c[9] : io_in_a[9];
  wire cout_vec_10 = io_in_a[10] ^ io_in_b[10] ? io_in_c[10] : io_in_a[10];
  wire cout_vec_11 = io_in_a[11] ^ io_in_b[11] ? io_in_c[11] : io_in_a[11];
  wire cout_vec_12 = io_in_a[12] ^ io_in_b[12] ? io_in_c[12] : io_in_a[12];
  wire cout_vec_13 = io_in_a[13] ^ io_in_b[13] ? io_in_c[13] : io_in_a[13];
  wire cout_vec_14 = io_in_a[14] ^ io_in_b[14] ? io_in_c[14] : io_in_a[14];
  wire cout_vec_15 = io_in_a[15] ^ io_in_b[15] ? io_in_c[15] : io_in_a[15];
  wire cout_vec_16 = io_in_a[16] ^ io_in_b[16] ? io_in_c[16] : io_in_a[16];
  wire cout_vec_17 = io_in_a[17] ^ io_in_b[17] ? io_in_c[17] : io_in_a[17];
  wire cout_vec_18 = io_in_a[18] ^ io_in_b[18] ? io_in_c[18] : io_in_a[18];
  wire cout_vec_19 = io_in_a[19] ^ io_in_b[19] ? io_in_c[19] : io_in_a[19];
  wire cout_vec_20 = io_in_a[20] ^ io_in_b[20] ? io_in_c[20] : io_in_a[20];
  wire cout_vec_21 = io_in_a[21] ^ io_in_b[21] ? io_in_c[21] : io_in_a[21];
  wire cout_vec_22 = io_in_a[22] ^ io_in_b[22] ? io_in_c[22] : io_in_a[22];
  wire cout_vec_23 = io_in_a[23] ^ io_in_b[23] ? io_in_c[23] : io_in_a[23];
  wire cout_vec_24 = io_in_a[24] ^ io_in_b[24] ? io_in_c[24] : io_in_a[24];
  wire cout_vec_25 = io_in_a[25] ^ io_in_b[25] ? io_in_c[25] : io_in_a[25];
  wire cout_vec_26 = io_in_a[26] ^ io_in_b[26] ? io_in_c[26] : io_in_a[26];
  wire cout_vec_27 = io_in_a[27] ^ io_in_b[27] ? io_in_c[27] : io_in_a[27];
  wire cout_vec_28 = io_in_a[28] ^ io_in_b[28] ? io_in_c[28] : io_in_a[28];
  wire cout_vec_29 = io_in_a[29] ^ io_in_b[29] ? io_in_c[29] : io_in_a[29];
  wire cout_vec_30 = io_in_a[30] ^ io_in_b[30] ? io_in_c[30] : io_in_a[30];
  wire cout_vec_31 = io_in_a[31] ^ io_in_b[31] ? io_in_c[31] : io_in_a[31];
  wire cout_vec_32 = io_in_a[32] ^ io_in_b[32] ? io_in_c[32] : io_in_a[32];
  wire cout_vec_33 = io_in_a[33] ^ io_in_b[33] ? io_in_c[33] : io_in_a[33];
  wire cout_vec_34 = io_in_a[34] ^ io_in_b[34] ? io_in_c[34] : io_in_a[34];
  wire cout_vec_35 = io_in_a[35] ^ io_in_b[35] ? io_in_c[35] : io_in_a[35];
  wire cout_vec_36 = io_in_a[36] ^ io_in_b[36] ? io_in_c[36] : io_in_a[36];
  wire cout_vec_37 = io_in_a[37] ^ io_in_b[37] ? io_in_c[37] : io_in_a[37];
  wire cout_vec_38 = io_in_a[38] ^ io_in_b[38] ? io_in_c[38] : io_in_a[38];
  wire cout_vec_39 = io_in_a[39] ^ io_in_b[39] ? io_in_c[39] : io_in_a[39];
  wire cout_vec_40 = io_in_a[40] ^ io_in_b[40] ? io_in_c[40] : io_in_a[40];
  wire cout_vec_41 = io_in_a[41] ^ io_in_b[41] ? io_in_c[41] : io_in_a[41];
  wire cout_vec_42 = io_in_a[42] ^ io_in_b[42] ? io_in_c[42] : io_in_a[42];
  wire cout_vec_43 = io_in_a[43] ^ io_in_b[43] ? io_in_c[43] : io_in_a[43];
  wire cout_vec_44 = io_in_a[44] ^ io_in_b[44] ? io_in_c[44] : io_in_a[44];
  wire cout_vec_45 = io_in_a[45] ^ io_in_b[45] ? io_in_c[45] : io_in_a[45];
  wire cout_vec_46 = io_in_a[46] ^ io_in_b[46] ? io_in_c[46] : io_in_a[46];
  wire cout_vec_47 = io_in_a[47] ^ io_in_b[47] ? io_in_c[47] : io_in_a[47];
  wire cout_vec_48 = io_in_a[48] ^ io_in_b[48] ? io_in_c[48] : io_in_a[48];
  wire cout_vec_49 = io_in_a[49] ^ io_in_b[49] ? io_in_c[49] : io_in_a[49];
  wire cout_vec_50 = io_in_a[50] ^ io_in_b[50] ? io_in_c[50] : io_in_a[50];
  wire cout_vec_51 = io_in_a[51] ^ io_in_b[51] ? io_in_c[51] : io_in_a[51];
  wire cout_vec_52 = io_in_a[52] ^ io_in_b[52] ? io_in_c[52] : io_in_a[52];
  wire cout_vec_53 = io_in_a[53] ^ io_in_b[53] ? io_in_c[53] : io_in_a[53];
  wire cout_vec_54 = io_in_a[54] ^ io_in_b[54] ? io_in_c[54] : io_in_a[54];
  wire cout_vec_55 = io_in_a[55] ^ io_in_b[55] ? io_in_c[55] : io_in_a[55];
  wire cout_vec_56 = io_in_a[56] ^ io_in_b[56] ? io_in_c[56] : io_in_a[56];
  wire cout_vec_57 = io_in_a[57] ^ io_in_b[57] ? io_in_c[57] : io_in_a[57];
  wire cout_vec_58 = io_in_a[58] ^ io_in_b[58] ? io_in_c[58] : io_in_a[58];
  wire cout_vec_59 = io_in_a[59] ^ io_in_b[59] ? io_in_c[59] : io_in_a[59];
  wire cout_vec_60 = io_in_a[60] ^ io_in_b[60] ? io_in_c[60] : io_in_a[60];
  wire cout_vec_61 = io_in_a[61] ^ io_in_b[61] ? io_in_c[61] : io_in_a[61];
  wire cout_vec_62 = io_in_a[62] ^ io_in_b[62] ? io_in_c[62] : io_in_a[62];
  wire cout_vec_63 = io_in_a[63] ^ io_in_b[63] ? io_in_c[63] : io_in_a[63];
  wire cout_vec_64 = io_in_a[64] ^ io_in_b[64] ? io_in_c[64] : io_in_a[64];
  wire cout_vec_65 = io_in_a[65] ^ io_in_b[65] ? io_in_c[65] : io_in_a[65];
  wire cout_vec_66 = io_in_a[66] ^ io_in_b[66] ? io_in_c[66] : io_in_a[66];
  wire cout_vec_67 = io_in_a[67] ^ io_in_b[67] ? io_in_c[67] : io_in_a[67];
  wire cout_vec_68 = io_in_a[68] ^ io_in_b[68] ? io_in_c[68] : io_in_a[68];
  wire cout_vec_69 = io_in_a[69] ^ io_in_b[69] ? io_in_c[69] : io_in_a[69];
  wire cout_vec_70 = io_in_a[70] ^ io_in_b[70] ? io_in_c[70] : io_in_a[70];
  wire cout_vec_71 = io_in_a[71] ^ io_in_b[71] ? io_in_c[71] : io_in_a[71];
  wire cout_vec_72 = io_in_a[72] ^ io_in_b[72] ? io_in_c[72] : io_in_a[72];
  wire cout_vec_73 = io_in_a[73] ^ io_in_b[73] ? io_in_c[73] : io_in_a[73];
  wire cout_vec_74 = io_in_a[74] ^ io_in_b[74] ? io_in_c[74] : io_in_a[74];
  wire cout_vec_75 = io_in_a[75] ^ io_in_b[75] ? io_in_c[75] : io_in_a[75];
  wire cout_vec_76 = io_in_a[76] ^ io_in_b[76] ? io_in_c[76] : io_in_a[76];
  wire cout_vec_77 = io_in_a[77] ^ io_in_b[77] ? io_in_c[77] : io_in_a[77];
  wire cout_vec_78 = io_in_a[78] ^ io_in_b[78] ? io_in_c[78] : io_in_a[78];
  wire cout_vec_79 = io_in_a[79] ^ io_in_b[79] ? io_in_c[79] : io_in_a[79];
  wire cout_vec_80 = io_in_a[80] ^ io_in_b[80] ? io_in_c[80] : io_in_a[80];
  wire cout_vec_81 = io_in_a[81] ^ io_in_b[81] ? io_in_c[81] : io_in_a[81];
  wire cout_vec_82 = io_in_a[82] ^ io_in_b[82] ? io_in_c[82] : io_in_a[82];
  wire cout_vec_83 = io_in_a[83] ^ io_in_b[83] ? io_in_c[83] : io_in_a[83];
  wire cout_vec_84 = io_in_a[84] ^ io_in_b[84] ? io_in_c[84] : io_in_a[84];
  wire cout_vec_85 = io_in_a[85] ^ io_in_b[85] ? io_in_c[85] : io_in_a[85];
  wire cout_vec_86 = io_in_a[86] ^ io_in_b[86] ? io_in_c[86] : io_in_a[86];
  wire cout_vec_87 = io_in_a[87] ^ io_in_b[87] ? io_in_c[87] : io_in_a[87];
  wire cout_vec_88 = io_in_a[88] ^ io_in_b[88] ? io_in_c[88] : io_in_a[88];
  wire cout_vec_89 = io_in_a[89] ^ io_in_b[89] ? io_in_c[89] : io_in_a[89];
  wire cout_vec_90 = io_in_a[90] ^ io_in_b[90] ? io_in_c[90] : io_in_a[90];
  wire cout_vec_91 = io_in_a[91] ^ io_in_b[91] ? io_in_c[91] : io_in_a[91];
  wire cout_vec_92 = io_in_a[92] ^ io_in_b[92] ? io_in_c[92] : io_in_a[92];
  wire cout_vec_93 = io_in_a[93] ^ io_in_b[93] ? io_in_c[93] : io_in_a[93];
  wire cout_vec_94 = io_in_a[94] ^ io_in_b[94] ? io_in_c[94] : io_in_a[94];
  wire cout_vec_95 = io_in_a[95] ^ io_in_b[95] ? io_in_c[95] : io_in_a[95];
  wire cout_vec_96 = io_in_a[96] ^ io_in_b[96] ? io_in_c[96] : io_in_a[96];
  wire cout_vec_97 = io_in_a[97] ^ io_in_b[97] ? io_in_c[97] : io_in_a[97];
  wire cout_vec_98 = io_in_a[98] ^ io_in_b[98] ? io_in_c[98] : io_in_a[98];
  wire cout_vec_99 = io_in_a[99] ^ io_in_b[99] ? io_in_c[99] : io_in_a[99];
  wire cout_vec_100 = io_in_a[100] ^ io_in_b[100] ? io_in_c[100] : io_in_a[100];
  wire cout_vec_101 = io_in_a[101] ^ io_in_b[101] ? io_in_c[101] : io_in_a[101];
  wire cout_vec_102 = io_in_a[102] ^ io_in_b[102] ? io_in_c[102] : io_in_a[102];
  wire cout_vec_103 = io_in_a[103] ^ io_in_b[103] ? io_in_c[103] : io_in_a[103];
  wire cout_vec_104 = io_in_a[104] ^ io_in_b[104] ? io_in_c[104] : io_in_a[104];
  assign io_out_sum =
    {io_in_a[106] ^ io_in_b[106] ^ io_in_c[106] ^ io_in_d[106]
       ^ (io_in_a[105] ^ io_in_b[105] ? io_in_c[105] : io_in_a[105]),
     io_in_a[104] ^ io_in_b[104] ^ io_in_c[104] ^ io_in_d[104]
       ? cout_vec_103
       : io_in_d[104],
     io_in_a[104] ^ io_in_b[104] ^ io_in_c[104] ^ io_in_d[104] ^ cout_vec_103,
     io_in_a[102] ^ io_in_b[102] ^ io_in_c[102] ^ io_in_d[102]
       ? cout_vec_101
       : io_in_d[102],
     io_in_a[102] ^ io_in_b[102] ^ io_in_c[102] ^ io_in_d[102] ^ cout_vec_101,
     io_in_a[100] ^ io_in_b[100] ^ io_in_c[100] ^ io_in_d[100]
       ? cout_vec_99
       : io_in_d[100],
     io_in_a[100] ^ io_in_b[100] ^ io_in_c[100] ^ io_in_d[100] ^ cout_vec_99,
     io_in_a[98] ^ io_in_b[98] ^ io_in_c[98] ^ io_in_d[98] ? cout_vec_97 : io_in_d[98],
     io_in_a[98] ^ io_in_b[98] ^ io_in_c[98] ^ io_in_d[98] ^ cout_vec_97,
     io_in_a[96] ^ io_in_b[96] ^ io_in_c[96] ^ io_in_d[96] ? cout_vec_95 : io_in_d[96],
     io_in_a[96] ^ io_in_b[96] ^ io_in_c[96] ^ io_in_d[96] ^ cout_vec_95,
     io_in_a[94] ^ io_in_b[94] ^ io_in_c[94] ^ io_in_d[94] ? cout_vec_93 : io_in_d[94],
     io_in_a[94] ^ io_in_b[94] ^ io_in_c[94] ^ io_in_d[94] ^ cout_vec_93,
     io_in_a[92] ^ io_in_b[92] ^ io_in_c[92] ^ io_in_d[92] ? cout_vec_91 : io_in_d[92],
     io_in_a[92] ^ io_in_b[92] ^ io_in_c[92] ^ io_in_d[92] ^ cout_vec_91,
     io_in_a[90] ^ io_in_b[90] ^ io_in_c[90] ^ io_in_d[90] ? cout_vec_89 : io_in_d[90],
     io_in_a[90] ^ io_in_b[90] ^ io_in_c[90] ^ io_in_d[90] ^ cout_vec_89,
     io_in_a[88] ^ io_in_b[88] ^ io_in_c[88] ^ io_in_d[88] ? cout_vec_87 : io_in_d[88],
     io_in_a[88] ^ io_in_b[88] ^ io_in_c[88] ^ io_in_d[88] ^ cout_vec_87,
     io_in_a[86] ^ io_in_b[86] ^ io_in_c[86] ^ io_in_d[86] ? cout_vec_85 : io_in_d[86],
     io_in_a[86] ^ io_in_b[86] ^ io_in_c[86] ^ io_in_d[86] ^ cout_vec_85,
     io_in_a[84] ^ io_in_b[84] ^ io_in_c[84] ^ io_in_d[84] ? cout_vec_83 : io_in_d[84],
     io_in_a[84] ^ io_in_b[84] ^ io_in_c[84] ^ io_in_d[84] ^ cout_vec_83,
     io_in_a[82] ^ io_in_b[82] ^ io_in_c[82] ^ io_in_d[82] ? cout_vec_81 : io_in_d[82],
     io_in_a[82] ^ io_in_b[82] ^ io_in_c[82] ^ io_in_d[82] ^ cout_vec_81,
     io_in_a[80] ^ io_in_b[80] ^ io_in_c[80] ^ io_in_d[80] ? cout_vec_79 : io_in_d[80],
     io_in_a[80] ^ io_in_b[80] ^ io_in_c[80] ^ io_in_d[80] ^ cout_vec_79,
     io_in_a[78] ^ io_in_b[78] ^ io_in_c[78] ^ io_in_d[78] ? cout_vec_77 : io_in_d[78],
     io_in_a[78] ^ io_in_b[78] ^ io_in_c[78] ^ io_in_d[78] ^ cout_vec_77,
     io_in_a[76] ^ io_in_b[76] ^ io_in_c[76] ^ io_in_d[76] ? cout_vec_75 : io_in_d[76],
     io_in_a[76] ^ io_in_b[76] ^ io_in_c[76] ^ io_in_d[76] ^ cout_vec_75,
     io_in_a[74] ^ io_in_b[74] ^ io_in_c[74] ^ io_in_d[74] ? cout_vec_73 : io_in_d[74],
     io_in_a[74] ^ io_in_b[74] ^ io_in_c[74] ^ io_in_d[74] ^ cout_vec_73,
     io_in_a[72] ^ io_in_b[72] ^ io_in_c[72] ^ io_in_d[72] ? cout_vec_71 : io_in_d[72],
     io_in_a[72] ^ io_in_b[72] ^ io_in_c[72] ^ io_in_d[72] ^ cout_vec_71,
     io_in_a[70] ^ io_in_b[70] ^ io_in_c[70] ^ io_in_d[70] ? cout_vec_69 : io_in_d[70],
     io_in_a[70] ^ io_in_b[70] ^ io_in_c[70] ^ io_in_d[70] ^ cout_vec_69,
     io_in_a[68] ^ io_in_b[68] ^ io_in_c[68] ^ io_in_d[68] ? cout_vec_67 : io_in_d[68],
     io_in_a[68] ^ io_in_b[68] ^ io_in_c[68] ^ io_in_d[68] ^ cout_vec_67,
     io_in_a[66] ^ io_in_b[66] ^ io_in_c[66] ^ io_in_d[66] ? cout_vec_65 : io_in_d[66],
     io_in_a[66] ^ io_in_b[66] ^ io_in_c[66] ^ io_in_d[66] ^ cout_vec_65,
     io_in_a[64] ^ io_in_b[64] ^ io_in_c[64] ^ io_in_d[64] ? cout_vec_63 : io_in_d[64],
     io_in_a[64] ^ io_in_b[64] ^ io_in_c[64] ^ io_in_d[64] ^ cout_vec_63,
     io_in_a[62] ^ io_in_b[62] ^ io_in_c[62] ^ io_in_d[62] ? cout_vec_61 : io_in_d[62],
     io_in_a[62] ^ io_in_b[62] ^ io_in_c[62] ^ io_in_d[62] ^ cout_vec_61,
     io_in_a[60] ^ io_in_b[60] ^ io_in_c[60] ^ io_in_d[60] ? cout_vec_59 : io_in_d[60],
     io_in_a[60] ^ io_in_b[60] ^ io_in_c[60] ^ io_in_d[60] ^ cout_vec_59,
     io_in_a[58] ^ io_in_b[58] ^ io_in_c[58] ^ io_in_d[58] ? cout_vec_57 : io_in_d[58],
     io_in_a[58] ^ io_in_b[58] ^ io_in_c[58] ^ io_in_d[58] ^ cout_vec_57,
     io_in_a[56] ^ io_in_b[56] ^ io_in_c[56] ^ io_in_d[56] ? cout_vec_55 : io_in_d[56],
     io_in_a[56] ^ io_in_b[56] ^ io_in_c[56] ^ io_in_d[56] ^ cout_vec_55,
     io_in_a[54] ^ io_in_b[54] ^ io_in_c[54] ^ io_in_d[54] ? cout_vec_53 : io_in_d[54],
     io_in_a[54] ^ io_in_b[54] ^ io_in_c[54] ^ io_in_d[54] ^ cout_vec_53,
     io_in_a[52] ^ io_in_b[52] ^ io_in_c[52] ^ io_in_d[52] ? cout_vec_51 : io_in_d[52],
     io_in_a[52] ^ io_in_b[52] ^ io_in_c[52] ^ io_in_d[52] ^ cout_vec_51,
     io_in_a[50] ^ io_in_b[50] ^ io_in_c[50] ^ io_in_d[50] ? cout_vec_49 : io_in_d[50],
     io_in_a[50] ^ io_in_b[50] ^ io_in_c[50] ^ io_in_d[50] ^ cout_vec_49,
     io_in_a[48] ^ io_in_b[48] ^ io_in_c[48] ^ io_in_d[48] ? cout_vec_47 : io_in_d[48],
     io_in_a[48] ^ io_in_b[48] ^ io_in_c[48] ^ io_in_d[48] ^ cout_vec_47,
     io_in_a[46] ^ io_in_b[46] ^ io_in_c[46] ^ io_in_d[46] ? cout_vec_45 : io_in_d[46],
     io_in_a[46] ^ io_in_b[46] ^ io_in_c[46] ^ io_in_d[46] ^ cout_vec_45,
     io_in_a[44] ^ io_in_b[44] ^ io_in_c[44] ^ io_in_d[44] ? cout_vec_43 : io_in_d[44],
     io_in_a[44] ^ io_in_b[44] ^ io_in_c[44] ^ io_in_d[44] ^ cout_vec_43,
     io_in_a[42] ^ io_in_b[42] ^ io_in_c[42] ^ io_in_d[42] ? cout_vec_41 : io_in_d[42],
     io_in_a[42] ^ io_in_b[42] ^ io_in_c[42] ^ io_in_d[42] ^ cout_vec_41,
     io_in_a[40] ^ io_in_b[40] ^ io_in_c[40] ^ io_in_d[40] ? cout_vec_39 : io_in_d[40],
     io_in_a[40] ^ io_in_b[40] ^ io_in_c[40] ^ io_in_d[40] ^ cout_vec_39,
     io_in_a[38] ^ io_in_b[38] ^ io_in_c[38] ^ io_in_d[38] ? cout_vec_37 : io_in_d[38],
     io_in_a[38] ^ io_in_b[38] ^ io_in_c[38] ^ io_in_d[38] ^ cout_vec_37,
     io_in_a[36] ^ io_in_b[36] ^ io_in_c[36] ^ io_in_d[36] ? cout_vec_35 : io_in_d[36],
     io_in_a[36] ^ io_in_b[36] ^ io_in_c[36] ^ io_in_d[36] ^ cout_vec_35,
     io_in_a[34] ^ io_in_b[34] ^ io_in_c[34] ^ io_in_d[34] ? cout_vec_33 : io_in_d[34],
     io_in_a[34] ^ io_in_b[34] ^ io_in_c[34] ^ io_in_d[34] ^ cout_vec_33,
     io_in_a[32] ^ io_in_b[32] ^ io_in_c[32] ^ io_in_d[32] ? cout_vec_31 : io_in_d[32],
     io_in_a[32] ^ io_in_b[32] ^ io_in_c[32] ^ io_in_d[32] ^ cout_vec_31,
     io_in_a[30] ^ io_in_b[30] ^ io_in_c[30] ^ io_in_d[30] ? cout_vec_29 : io_in_d[30],
     io_in_a[30] ^ io_in_b[30] ^ io_in_c[30] ^ io_in_d[30] ^ cout_vec_29,
     io_in_a[28] ^ io_in_b[28] ^ io_in_c[28] ^ io_in_d[28] ? cout_vec_27 : io_in_d[28],
     io_in_a[28] ^ io_in_b[28] ^ io_in_c[28] ^ io_in_d[28] ^ cout_vec_27,
     io_in_a[26] ^ io_in_b[26] ^ io_in_c[26] ^ io_in_d[26] ? cout_vec_25 : io_in_d[26],
     io_in_a[26] ^ io_in_b[26] ^ io_in_c[26] ^ io_in_d[26] ^ cout_vec_25,
     io_in_a[24] ^ io_in_b[24] ^ io_in_c[24] ^ io_in_d[24] ? cout_vec_23 : io_in_d[24],
     io_in_a[24] ^ io_in_b[24] ^ io_in_c[24] ^ io_in_d[24] ^ cout_vec_23,
     io_in_a[22] ^ io_in_b[22] ^ io_in_c[22] ^ io_in_d[22] ? cout_vec_21 : io_in_d[22],
     io_in_a[22] ^ io_in_b[22] ^ io_in_c[22] ^ io_in_d[22] ^ cout_vec_21,
     io_in_a[20] ^ io_in_b[20] ^ io_in_c[20] ^ io_in_d[20] ? cout_vec_19 : io_in_d[20],
     io_in_a[20] ^ io_in_b[20] ^ io_in_c[20] ^ io_in_d[20] ^ cout_vec_19,
     io_in_a[18] ^ io_in_b[18] ^ io_in_c[18] ^ io_in_d[18] ? cout_vec_17 : io_in_d[18],
     io_in_a[18] ^ io_in_b[18] ^ io_in_c[18] ^ io_in_d[18] ^ cout_vec_17,
     io_in_a[16] ^ io_in_b[16] ^ io_in_c[16] ^ io_in_d[16] ? cout_vec_15 : io_in_d[16],
     io_in_a[16] ^ io_in_b[16] ^ io_in_c[16] ^ io_in_d[16] ^ cout_vec_15,
     io_in_a[14] ^ io_in_b[14] ^ io_in_c[14] ^ io_in_d[14] ? cout_vec_13 : io_in_d[14],
     io_in_a[14] ^ io_in_b[14] ^ io_in_c[14] ^ io_in_d[14] ^ cout_vec_13,
     io_in_a[12] ^ io_in_b[12] ^ io_in_c[12] ^ io_in_d[12] ? cout_vec_11 : io_in_d[12],
     io_in_a[12] ^ io_in_b[12] ^ io_in_c[12] ^ io_in_d[12] ^ cout_vec_11,
     io_in_a[10] ^ io_in_b[10] ^ io_in_c[10] ^ io_in_d[10] ? cout_vec_9 : io_in_d[10],
     io_in_a[10] ^ io_in_b[10] ^ io_in_c[10] ^ io_in_d[10] ^ cout_vec_9,
     io_in_a[8] ^ io_in_b[8] ^ io_in_c[8] ^ io_in_d[8] ? cout_vec_7 : io_in_d[8],
     io_in_a[8] ^ io_in_b[8] ^ io_in_c[8] ^ io_in_d[8] ^ cout_vec_7,
     io_in_a[6] ^ io_in_b[6] ^ io_in_c[6] ^ io_in_d[6] ? cout_vec_5 : io_in_d[6],
     io_in_a[6] ^ io_in_b[6] ^ io_in_c[6] ^ io_in_d[6] ^ cout_vec_5,
     io_in_a[4] ^ io_in_b[4] ^ io_in_c[4] ^ io_in_d[4] ? cout_vec_3 : io_in_d[4],
     io_in_a[4] ^ io_in_b[4] ^ io_in_c[4] ^ io_in_d[4] ^ cout_vec_3,
     io_in_a[2] ^ io_in_b[2] ^ io_in_c[2] ^ io_in_d[2] ? cout_vec_1 : io_in_d[2],
     io_in_a[2] ^ io_in_b[2] ^ io_in_c[2] ^ io_in_d[2] ^ cout_vec_1,
     (io_in_a[0] ^ io_in_b[0] ^ io_in_c[0] ^ ~(io_in_d[0])) & io_in_d[0],
     io_in_a[0] ^ io_in_b[0] ^ io_in_c[0] ^ io_in_d[0]};
  assign io_out_car =
    {io_in_a[105] ^ io_in_b[105] ^ io_in_c[105] ^ io_in_d[105]
       ? cout_vec_104
       : io_in_d[105],
     io_in_a[105] ^ io_in_b[105] ^ io_in_c[105] ^ io_in_d[105] ^ cout_vec_104,
     io_in_a[103] ^ io_in_b[103] ^ io_in_c[103] ^ io_in_d[103]
       ? cout_vec_102
       : io_in_d[103],
     io_in_a[103] ^ io_in_b[103] ^ io_in_c[103] ^ io_in_d[103] ^ cout_vec_102,
     io_in_a[101] ^ io_in_b[101] ^ io_in_c[101] ^ io_in_d[101]
       ? cout_vec_100
       : io_in_d[101],
     io_in_a[101] ^ io_in_b[101] ^ io_in_c[101] ^ io_in_d[101] ^ cout_vec_100,
     io_in_a[99] ^ io_in_b[99] ^ io_in_c[99] ^ io_in_d[99] ? cout_vec_98 : io_in_d[99],
     io_in_a[99] ^ io_in_b[99] ^ io_in_c[99] ^ io_in_d[99] ^ cout_vec_98,
     io_in_a[97] ^ io_in_b[97] ^ io_in_c[97] ^ io_in_d[97] ? cout_vec_96 : io_in_d[97],
     io_in_a[97] ^ io_in_b[97] ^ io_in_c[97] ^ io_in_d[97] ^ cout_vec_96,
     io_in_a[95] ^ io_in_b[95] ^ io_in_c[95] ^ io_in_d[95] ? cout_vec_94 : io_in_d[95],
     io_in_a[95] ^ io_in_b[95] ^ io_in_c[95] ^ io_in_d[95] ^ cout_vec_94,
     io_in_a[93] ^ io_in_b[93] ^ io_in_c[93] ^ io_in_d[93] ? cout_vec_92 : io_in_d[93],
     io_in_a[93] ^ io_in_b[93] ^ io_in_c[93] ^ io_in_d[93] ^ cout_vec_92,
     io_in_a[91] ^ io_in_b[91] ^ io_in_c[91] ^ io_in_d[91] ? cout_vec_90 : io_in_d[91],
     io_in_a[91] ^ io_in_b[91] ^ io_in_c[91] ^ io_in_d[91] ^ cout_vec_90,
     io_in_a[89] ^ io_in_b[89] ^ io_in_c[89] ^ io_in_d[89] ? cout_vec_88 : io_in_d[89],
     io_in_a[89] ^ io_in_b[89] ^ io_in_c[89] ^ io_in_d[89] ^ cout_vec_88,
     io_in_a[87] ^ io_in_b[87] ^ io_in_c[87] ^ io_in_d[87] ? cout_vec_86 : io_in_d[87],
     io_in_a[87] ^ io_in_b[87] ^ io_in_c[87] ^ io_in_d[87] ^ cout_vec_86,
     io_in_a[85] ^ io_in_b[85] ^ io_in_c[85] ^ io_in_d[85] ? cout_vec_84 : io_in_d[85],
     io_in_a[85] ^ io_in_b[85] ^ io_in_c[85] ^ io_in_d[85] ^ cout_vec_84,
     io_in_a[83] ^ io_in_b[83] ^ io_in_c[83] ^ io_in_d[83] ? cout_vec_82 : io_in_d[83],
     io_in_a[83] ^ io_in_b[83] ^ io_in_c[83] ^ io_in_d[83] ^ cout_vec_82,
     io_in_a[81] ^ io_in_b[81] ^ io_in_c[81] ^ io_in_d[81] ? cout_vec_80 : io_in_d[81],
     io_in_a[81] ^ io_in_b[81] ^ io_in_c[81] ^ io_in_d[81] ^ cout_vec_80,
     io_in_a[79] ^ io_in_b[79] ^ io_in_c[79] ^ io_in_d[79] ? cout_vec_78 : io_in_d[79],
     io_in_a[79] ^ io_in_b[79] ^ io_in_c[79] ^ io_in_d[79] ^ cout_vec_78,
     io_in_a[77] ^ io_in_b[77] ^ io_in_c[77] ^ io_in_d[77] ? cout_vec_76 : io_in_d[77],
     io_in_a[77] ^ io_in_b[77] ^ io_in_c[77] ^ io_in_d[77] ^ cout_vec_76,
     io_in_a[75] ^ io_in_b[75] ^ io_in_c[75] ^ io_in_d[75] ? cout_vec_74 : io_in_d[75],
     io_in_a[75] ^ io_in_b[75] ^ io_in_c[75] ^ io_in_d[75] ^ cout_vec_74,
     io_in_a[73] ^ io_in_b[73] ^ io_in_c[73] ^ io_in_d[73] ? cout_vec_72 : io_in_d[73],
     io_in_a[73] ^ io_in_b[73] ^ io_in_c[73] ^ io_in_d[73] ^ cout_vec_72,
     io_in_a[71] ^ io_in_b[71] ^ io_in_c[71] ^ io_in_d[71] ? cout_vec_70 : io_in_d[71],
     io_in_a[71] ^ io_in_b[71] ^ io_in_c[71] ^ io_in_d[71] ^ cout_vec_70,
     io_in_a[69] ^ io_in_b[69] ^ io_in_c[69] ^ io_in_d[69] ? cout_vec_68 : io_in_d[69],
     io_in_a[69] ^ io_in_b[69] ^ io_in_c[69] ^ io_in_d[69] ^ cout_vec_68,
     io_in_a[67] ^ io_in_b[67] ^ io_in_c[67] ^ io_in_d[67] ? cout_vec_66 : io_in_d[67],
     io_in_a[67] ^ io_in_b[67] ^ io_in_c[67] ^ io_in_d[67] ^ cout_vec_66,
     io_in_a[65] ^ io_in_b[65] ^ io_in_c[65] ^ io_in_d[65] ? cout_vec_64 : io_in_d[65],
     io_in_a[65] ^ io_in_b[65] ^ io_in_c[65] ^ io_in_d[65] ^ cout_vec_64,
     io_in_a[63] ^ io_in_b[63] ^ io_in_c[63] ^ io_in_d[63] ? cout_vec_62 : io_in_d[63],
     io_in_a[63] ^ io_in_b[63] ^ io_in_c[63] ^ io_in_d[63] ^ cout_vec_62,
     io_in_a[61] ^ io_in_b[61] ^ io_in_c[61] ^ io_in_d[61] ? cout_vec_60 : io_in_d[61],
     io_in_a[61] ^ io_in_b[61] ^ io_in_c[61] ^ io_in_d[61] ^ cout_vec_60,
     io_in_a[59] ^ io_in_b[59] ^ io_in_c[59] ^ io_in_d[59] ? cout_vec_58 : io_in_d[59],
     io_in_a[59] ^ io_in_b[59] ^ io_in_c[59] ^ io_in_d[59] ^ cout_vec_58,
     io_in_a[57] ^ io_in_b[57] ^ io_in_c[57] ^ io_in_d[57] ? cout_vec_56 : io_in_d[57],
     io_in_a[57] ^ io_in_b[57] ^ io_in_c[57] ^ io_in_d[57] ^ cout_vec_56,
     io_in_a[55] ^ io_in_b[55] ^ io_in_c[55] ^ io_in_d[55] ? cout_vec_54 : io_in_d[55],
     io_in_a[55] ^ io_in_b[55] ^ io_in_c[55] ^ io_in_d[55] ^ cout_vec_54,
     io_in_a[53] ^ io_in_b[53] ^ io_in_c[53] ^ io_in_d[53] ? cout_vec_52 : io_in_d[53],
     io_in_a[53] ^ io_in_b[53] ^ io_in_c[53] ^ io_in_d[53] ^ cout_vec_52,
     io_in_a[51] ^ io_in_b[51] ^ io_in_c[51] ^ io_in_d[51] ? cout_vec_50 : io_in_d[51],
     io_in_a[51] ^ io_in_b[51] ^ io_in_c[51] ^ io_in_d[51] ^ cout_vec_50,
     io_in_a[49] ^ io_in_b[49] ^ io_in_c[49] ^ io_in_d[49] ? cout_vec_48 : io_in_d[49],
     io_in_a[49] ^ io_in_b[49] ^ io_in_c[49] ^ io_in_d[49] ^ cout_vec_48,
     io_in_a[47] ^ io_in_b[47] ^ io_in_c[47] ^ io_in_d[47] ? cout_vec_46 : io_in_d[47],
     io_in_a[47] ^ io_in_b[47] ^ io_in_c[47] ^ io_in_d[47] ^ cout_vec_46,
     io_in_a[45] ^ io_in_b[45] ^ io_in_c[45] ^ io_in_d[45] ? cout_vec_44 : io_in_d[45],
     io_in_a[45] ^ io_in_b[45] ^ io_in_c[45] ^ io_in_d[45] ^ cout_vec_44,
     io_in_a[43] ^ io_in_b[43] ^ io_in_c[43] ^ io_in_d[43] ? cout_vec_42 : io_in_d[43],
     io_in_a[43] ^ io_in_b[43] ^ io_in_c[43] ^ io_in_d[43] ^ cout_vec_42,
     io_in_a[41] ^ io_in_b[41] ^ io_in_c[41] ^ io_in_d[41] ? cout_vec_40 : io_in_d[41],
     io_in_a[41] ^ io_in_b[41] ^ io_in_c[41] ^ io_in_d[41] ^ cout_vec_40,
     io_in_a[39] ^ io_in_b[39] ^ io_in_c[39] ^ io_in_d[39] ? cout_vec_38 : io_in_d[39],
     io_in_a[39] ^ io_in_b[39] ^ io_in_c[39] ^ io_in_d[39] ^ cout_vec_38,
     io_in_a[37] ^ io_in_b[37] ^ io_in_c[37] ^ io_in_d[37] ? cout_vec_36 : io_in_d[37],
     io_in_a[37] ^ io_in_b[37] ^ io_in_c[37] ^ io_in_d[37] ^ cout_vec_36,
     io_in_a[35] ^ io_in_b[35] ^ io_in_c[35] ^ io_in_d[35] ? cout_vec_34 : io_in_d[35],
     io_in_a[35] ^ io_in_b[35] ^ io_in_c[35] ^ io_in_d[35] ^ cout_vec_34,
     io_in_a[33] ^ io_in_b[33] ^ io_in_c[33] ^ io_in_d[33] ? cout_vec_32 : io_in_d[33],
     io_in_a[33] ^ io_in_b[33] ^ io_in_c[33] ^ io_in_d[33] ^ cout_vec_32,
     io_in_a[31] ^ io_in_b[31] ^ io_in_c[31] ^ io_in_d[31] ? cout_vec_30 : io_in_d[31],
     io_in_a[31] ^ io_in_b[31] ^ io_in_c[31] ^ io_in_d[31] ^ cout_vec_30,
     io_in_a[29] ^ io_in_b[29] ^ io_in_c[29] ^ io_in_d[29] ? cout_vec_28 : io_in_d[29],
     io_in_a[29] ^ io_in_b[29] ^ io_in_c[29] ^ io_in_d[29] ^ cout_vec_28,
     io_in_a[27] ^ io_in_b[27] ^ io_in_c[27] ^ io_in_d[27] ? cout_vec_26 : io_in_d[27],
     io_in_a[27] ^ io_in_b[27] ^ io_in_c[27] ^ io_in_d[27] ^ cout_vec_26,
     io_in_a[25] ^ io_in_b[25] ^ io_in_c[25] ^ io_in_d[25] ? cout_vec_24 : io_in_d[25],
     io_in_a[25] ^ io_in_b[25] ^ io_in_c[25] ^ io_in_d[25] ^ cout_vec_24,
     io_in_a[23] ^ io_in_b[23] ^ io_in_c[23] ^ io_in_d[23] ? cout_vec_22 : io_in_d[23],
     io_in_a[23] ^ io_in_b[23] ^ io_in_c[23] ^ io_in_d[23] ^ cout_vec_22,
     io_in_a[21] ^ io_in_b[21] ^ io_in_c[21] ^ io_in_d[21] ? cout_vec_20 : io_in_d[21],
     io_in_a[21] ^ io_in_b[21] ^ io_in_c[21] ^ io_in_d[21] ^ cout_vec_20,
     io_in_a[19] ^ io_in_b[19] ^ io_in_c[19] ^ io_in_d[19] ? cout_vec_18 : io_in_d[19],
     io_in_a[19] ^ io_in_b[19] ^ io_in_c[19] ^ io_in_d[19] ^ cout_vec_18,
     io_in_a[17] ^ io_in_b[17] ^ io_in_c[17] ^ io_in_d[17] ? cout_vec_16 : io_in_d[17],
     io_in_a[17] ^ io_in_b[17] ^ io_in_c[17] ^ io_in_d[17] ^ cout_vec_16,
     io_in_a[15] ^ io_in_b[15] ^ io_in_c[15] ^ io_in_d[15] ? cout_vec_14 : io_in_d[15],
     io_in_a[15] ^ io_in_b[15] ^ io_in_c[15] ^ io_in_d[15] ^ cout_vec_14,
     io_in_a[13] ^ io_in_b[13] ^ io_in_c[13] ^ io_in_d[13] ? cout_vec_12 : io_in_d[13],
     io_in_a[13] ^ io_in_b[13] ^ io_in_c[13] ^ io_in_d[13] ^ cout_vec_12,
     io_in_a[11] ^ io_in_b[11] ^ io_in_c[11] ^ io_in_d[11] ? cout_vec_10 : io_in_d[11],
     io_in_a[11] ^ io_in_b[11] ^ io_in_c[11] ^ io_in_d[11] ^ cout_vec_10,
     io_in_a[9] ^ io_in_b[9] ^ io_in_c[9] ^ io_in_d[9] ? cout_vec_8 : io_in_d[9],
     io_in_a[9] ^ io_in_b[9] ^ io_in_c[9] ^ io_in_d[9] ^ cout_vec_8,
     io_in_a[7] ^ io_in_b[7] ^ io_in_c[7] ^ io_in_d[7] ? cout_vec_6 : io_in_d[7],
     io_in_a[7] ^ io_in_b[7] ^ io_in_c[7] ^ io_in_d[7] ^ cout_vec_6,
     io_in_a[5] ^ io_in_b[5] ^ io_in_c[5] ^ io_in_d[5] ? cout_vec_4 : io_in_d[5],
     io_in_a[5] ^ io_in_b[5] ^ io_in_c[5] ^ io_in_d[5] ^ cout_vec_4,
     io_in_a[3] ^ io_in_b[3] ^ io_in_c[3] ^ io_in_d[3] ? cout_vec_2 : io_in_d[3],
     io_in_a[3] ^ io_in_b[3] ^ io_in_c[3] ^ io_in_d[3] ^ cout_vec_2,
     io_in_a[1] ^ io_in_b[1] ^ io_in_c[1] ^ io_in_d[1] ? cout_vec_0 : io_in_d[1],
     io_in_a[1] ^ io_in_b[1] ^ io_in_c[1] ^ io_in_d[1] ^ cout_vec_0,
     1'h0};
endmodule

