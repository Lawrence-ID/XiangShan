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
module FuBusyTableRead(
  input  [2:0]  io_in_fuBusyTable,
  input  [34:0] io_in_fuTypeRegVec_0,
  input  [34:0] io_in_fuTypeRegVec_1,
  input  [34:0] io_in_fuTypeRegVec_2,
  input  [34:0] io_in_fuTypeRegVec_3,
  input  [34:0] io_in_fuTypeRegVec_4,
  input  [34:0] io_in_fuTypeRegVec_5,
  input  [34:0] io_in_fuTypeRegVec_6,
  input  [34:0] io_in_fuTypeRegVec_7,
  input  [34:0] io_in_fuTypeRegVec_8,
  input  [34:0] io_in_fuTypeRegVec_9,
  input  [34:0] io_in_fuTypeRegVec_10,
  input  [34:0] io_in_fuTypeRegVec_11,
  input  [34:0] io_in_fuTypeRegVec_12,
  input  [34:0] io_in_fuTypeRegVec_13,
  input  [34:0] io_in_fuTypeRegVec_14,
  input  [34:0] io_in_fuTypeRegVec_15,
  input  [34:0] io_in_fuTypeRegVec_16,
  input  [34:0] io_in_fuTypeRegVec_17,
  input  [34:0] io_in_fuTypeRegVec_18,
  input  [34:0] io_in_fuTypeRegVec_19,
  input  [34:0] io_in_fuTypeRegVec_20,
  input  [34:0] io_in_fuTypeRegVec_21,
  input  [34:0] io_in_fuTypeRegVec_22,
  input  [34:0] io_in_fuTypeRegVec_23,
  output [23:0] io_out_fuBusyTableMask
);

  assign io_out_fuBusyTableMask =
    (io_in_fuBusyTable[0]
       ? {io_in_fuTypeRegVec_23[6],
          io_in_fuTypeRegVec_22[6],
          io_in_fuTypeRegVec_21[6],
          io_in_fuTypeRegVec_20[6],
          io_in_fuTypeRegVec_19[6],
          io_in_fuTypeRegVec_18[6],
          io_in_fuTypeRegVec_17[6],
          io_in_fuTypeRegVec_16[6],
          io_in_fuTypeRegVec_15[6],
          io_in_fuTypeRegVec_14[6],
          io_in_fuTypeRegVec_13[6],
          io_in_fuTypeRegVec_12[6],
          io_in_fuTypeRegVec_11[6],
          io_in_fuTypeRegVec_10[6],
          io_in_fuTypeRegVec_9[6],
          io_in_fuTypeRegVec_8[6],
          io_in_fuTypeRegVec_7[6],
          io_in_fuTypeRegVec_6[6],
          io_in_fuTypeRegVec_5[6],
          io_in_fuTypeRegVec_4[6],
          io_in_fuTypeRegVec_3[6],
          io_in_fuTypeRegVec_2[6],
          io_in_fuTypeRegVec_1[6],
          io_in_fuTypeRegVec_0[6]}
       : 24'h0)
    | (io_in_fuBusyTable[2]
         ? {io_in_fuTypeRegVec_23[7] | io_in_fuTypeRegVec_23[10],
            io_in_fuTypeRegVec_22[7] | io_in_fuTypeRegVec_22[10],
            io_in_fuTypeRegVec_21[7] | io_in_fuTypeRegVec_21[10],
            io_in_fuTypeRegVec_20[7] | io_in_fuTypeRegVec_20[10],
            io_in_fuTypeRegVec_19[7] | io_in_fuTypeRegVec_19[10],
            io_in_fuTypeRegVec_18[7] | io_in_fuTypeRegVec_18[10],
            io_in_fuTypeRegVec_17[7] | io_in_fuTypeRegVec_17[10],
            io_in_fuTypeRegVec_16[7] | io_in_fuTypeRegVec_16[10],
            io_in_fuTypeRegVec_15[7] | io_in_fuTypeRegVec_15[10],
            io_in_fuTypeRegVec_14[7] | io_in_fuTypeRegVec_14[10],
            io_in_fuTypeRegVec_13[7] | io_in_fuTypeRegVec_13[10],
            io_in_fuTypeRegVec_12[7] | io_in_fuTypeRegVec_12[10],
            io_in_fuTypeRegVec_11[7] | io_in_fuTypeRegVec_11[10],
            io_in_fuTypeRegVec_10[7] | io_in_fuTypeRegVec_10[10],
            io_in_fuTypeRegVec_9[7] | io_in_fuTypeRegVec_9[10],
            io_in_fuTypeRegVec_8[7] | io_in_fuTypeRegVec_8[10],
            io_in_fuTypeRegVec_7[7] | io_in_fuTypeRegVec_7[10],
            io_in_fuTypeRegVec_6[7] | io_in_fuTypeRegVec_6[10],
            io_in_fuTypeRegVec_5[7] | io_in_fuTypeRegVec_5[10],
            io_in_fuTypeRegVec_4[7] | io_in_fuTypeRegVec_4[10],
            io_in_fuTypeRegVec_3[7] | io_in_fuTypeRegVec_3[10],
            io_in_fuTypeRegVec_2[7] | io_in_fuTypeRegVec_2[10],
            io_in_fuTypeRegVec_1[7] | io_in_fuTypeRegVec_1[10],
            io_in_fuTypeRegVec_0[7] | io_in_fuTypeRegVec_0[10]}
         : 24'h0);
endmodule

