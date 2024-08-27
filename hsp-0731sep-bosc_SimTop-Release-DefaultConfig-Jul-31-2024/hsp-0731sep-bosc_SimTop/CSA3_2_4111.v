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
module CSA3_2_4111(
  input  [37:0] io_in_0,
  input  [37:0] io_in_1,
  input  [37:0] io_in_2,
  output [37:0] io_out_0,
  output [37:0] io_out_1
);

  wire a_xor_b = io_in_0[0] ^ io_in_1[0];
  wire a_xor_b_1 = io_in_0[1] ^ io_in_1[1];
  wire a_xor_b_2 = io_in_0[2] ^ io_in_1[2];
  wire a_xor_b_3 = io_in_0[3] ^ io_in_1[3];
  wire a_xor_b_4 = io_in_0[4] ^ io_in_1[4];
  wire a_xor_b_5 = io_in_0[5] ^ io_in_1[5];
  wire a_xor_b_6 = io_in_0[6] ^ io_in_1[6];
  wire a_xor_b_7 = io_in_0[7] ^ io_in_1[7];
  wire a_xor_b_8 = io_in_0[8] ^ io_in_1[8];
  wire a_xor_b_9 = io_in_0[9] ^ io_in_1[9];
  wire a_xor_b_10 = io_in_0[10] ^ io_in_1[10];
  wire a_xor_b_11 = io_in_0[11] ^ io_in_1[11];
  wire a_xor_b_12 = io_in_0[12] ^ io_in_1[12];
  wire a_xor_b_13 = io_in_0[13] ^ io_in_1[13];
  wire a_xor_b_14 = io_in_0[14] ^ io_in_1[14];
  wire a_xor_b_15 = io_in_0[15] ^ io_in_1[15];
  wire a_xor_b_16 = io_in_0[16] ^ io_in_1[16];
  wire a_xor_b_17 = io_in_0[17] ^ io_in_1[17];
  wire a_xor_b_18 = io_in_0[18] ^ io_in_1[18];
  wire a_xor_b_19 = io_in_0[19] ^ io_in_1[19];
  wire a_xor_b_20 = io_in_0[20] ^ io_in_1[20];
  wire a_xor_b_21 = io_in_0[21] ^ io_in_1[21];
  wire a_xor_b_22 = io_in_0[22] ^ io_in_1[22];
  wire a_xor_b_23 = io_in_0[23] ^ io_in_1[23];
  wire a_xor_b_24 = io_in_0[24] ^ io_in_1[24];
  wire a_xor_b_25 = io_in_0[25] ^ io_in_1[25];
  wire a_xor_b_26 = io_in_0[26] ^ io_in_1[26];
  wire a_xor_b_27 = io_in_0[27] ^ io_in_1[27];
  wire a_xor_b_28 = io_in_0[28] ^ io_in_1[28];
  wire a_xor_b_29 = io_in_0[29] ^ io_in_1[29];
  wire a_xor_b_30 = io_in_0[30] ^ io_in_1[30];
  wire a_xor_b_31 = io_in_0[31] ^ io_in_1[31];
  wire a_xor_b_32 = io_in_0[32] ^ io_in_1[32];
  wire a_xor_b_33 = io_in_0[33] ^ io_in_1[33];
  wire a_xor_b_34 = io_in_0[34] ^ io_in_1[34];
  wire a_xor_b_35 = io_in_0[35] ^ io_in_1[35];
  wire a_xor_b_36 = io_in_0[36] ^ io_in_1[36];
  wire a_xor_b_37 = io_in_0[37] ^ io_in_1[37];
  assign io_out_0 =
    {a_xor_b_37 ^ io_in_2[37],
     a_xor_b_36 ^ io_in_2[36],
     a_xor_b_35 ^ io_in_2[35],
     a_xor_b_34 ^ io_in_2[34],
     a_xor_b_33 ^ io_in_2[33],
     a_xor_b_32 ^ io_in_2[32],
     a_xor_b_31 ^ io_in_2[31],
     a_xor_b_30 ^ io_in_2[30],
     a_xor_b_29 ^ io_in_2[29],
     a_xor_b_28 ^ io_in_2[28],
     a_xor_b_27 ^ io_in_2[27],
     a_xor_b_26 ^ io_in_2[26],
     a_xor_b_25 ^ io_in_2[25],
     a_xor_b_24 ^ io_in_2[24],
     a_xor_b_23 ^ io_in_2[23],
     a_xor_b_22 ^ io_in_2[22],
     a_xor_b_21 ^ io_in_2[21],
     a_xor_b_20 ^ io_in_2[20],
     a_xor_b_19 ^ io_in_2[19],
     a_xor_b_18 ^ io_in_2[18],
     a_xor_b_17 ^ io_in_2[17],
     a_xor_b_16 ^ io_in_2[16],
     a_xor_b_15 ^ io_in_2[15],
     a_xor_b_14 ^ io_in_2[14],
     a_xor_b_13 ^ io_in_2[13],
     a_xor_b_12 ^ io_in_2[12],
     a_xor_b_11 ^ io_in_2[11],
     a_xor_b_10 ^ io_in_2[10],
     a_xor_b_9 ^ io_in_2[9],
     a_xor_b_8 ^ io_in_2[8],
     a_xor_b_7 ^ io_in_2[7],
     a_xor_b_6 ^ io_in_2[6],
     a_xor_b_5 ^ io_in_2[5],
     a_xor_b_4 ^ io_in_2[4],
     a_xor_b_3 ^ io_in_2[3],
     a_xor_b_2 ^ io_in_2[2],
     a_xor_b_1 ^ io_in_2[1],
     a_xor_b ^ io_in_2[0]};
  assign io_out_1 =
    {io_in_0[37] & io_in_1[37] | a_xor_b_37 & io_in_2[37],
     io_in_0[36] & io_in_1[36] | a_xor_b_36 & io_in_2[36],
     io_in_0[35] & io_in_1[35] | a_xor_b_35 & io_in_2[35],
     io_in_0[34] & io_in_1[34] | a_xor_b_34 & io_in_2[34],
     io_in_0[33] & io_in_1[33] | a_xor_b_33 & io_in_2[33],
     io_in_0[32] & io_in_1[32] | a_xor_b_32 & io_in_2[32],
     io_in_0[31] & io_in_1[31] | a_xor_b_31 & io_in_2[31],
     io_in_0[30] & io_in_1[30] | a_xor_b_30 & io_in_2[30],
     io_in_0[29] & io_in_1[29] | a_xor_b_29 & io_in_2[29],
     io_in_0[28] & io_in_1[28] | a_xor_b_28 & io_in_2[28],
     io_in_0[27] & io_in_1[27] | a_xor_b_27 & io_in_2[27],
     io_in_0[26] & io_in_1[26] | a_xor_b_26 & io_in_2[26],
     io_in_0[25] & io_in_1[25] | a_xor_b_25 & io_in_2[25],
     io_in_0[24] & io_in_1[24] | a_xor_b_24 & io_in_2[24],
     io_in_0[23] & io_in_1[23] | a_xor_b_23 & io_in_2[23],
     io_in_0[22] & io_in_1[22] | a_xor_b_22 & io_in_2[22],
     io_in_0[21] & io_in_1[21] | a_xor_b_21 & io_in_2[21],
     io_in_0[20] & io_in_1[20] | a_xor_b_20 & io_in_2[20],
     io_in_0[19] & io_in_1[19] | a_xor_b_19 & io_in_2[19],
     io_in_0[18] & io_in_1[18] | a_xor_b_18 & io_in_2[18],
     io_in_0[17] & io_in_1[17] | a_xor_b_17 & io_in_2[17],
     io_in_0[16] & io_in_1[16] | a_xor_b_16 & io_in_2[16],
     io_in_0[15] & io_in_1[15] | a_xor_b_15 & io_in_2[15],
     io_in_0[14] & io_in_1[14] | a_xor_b_14 & io_in_2[14],
     io_in_0[13] & io_in_1[13] | a_xor_b_13 & io_in_2[13],
     io_in_0[12] & io_in_1[12] | a_xor_b_12 & io_in_2[12],
     io_in_0[11] & io_in_1[11] | a_xor_b_11 & io_in_2[11],
     io_in_0[10] & io_in_1[10] | a_xor_b_10 & io_in_2[10],
     io_in_0[9] & io_in_1[9] | a_xor_b_9 & io_in_2[9],
     io_in_0[8] & io_in_1[8] | a_xor_b_8 & io_in_2[8],
     io_in_0[7] & io_in_1[7] | a_xor_b_7 & io_in_2[7],
     io_in_0[6] & io_in_1[6] | a_xor_b_6 & io_in_2[6],
     io_in_0[5] & io_in_1[5] | a_xor_b_5 & io_in_2[5],
     io_in_0[4] & io_in_1[4] | a_xor_b_4 & io_in_2[4],
     io_in_0[3] & io_in_1[3] | a_xor_b_3 & io_in_2[3],
     io_in_0[2] & io_in_1[2] | a_xor_b_2 & io_in_2[2],
     io_in_0[1] & io_in_1[1] | a_xor_b_1 & io_in_2[1],
     io_in_0[0] & io_in_1[0] | a_xor_b & io_in_2[0]};
endmodule

