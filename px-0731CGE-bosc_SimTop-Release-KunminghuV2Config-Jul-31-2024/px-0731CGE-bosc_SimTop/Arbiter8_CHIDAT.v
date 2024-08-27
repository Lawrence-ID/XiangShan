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
module Arbiter8_CHIDAT(
  output         io_in_0_ready,
  input          io_in_0_valid,
  input  [6:0]   io_in_0_bits_tgtID,
  input  [7:0]   io_in_0_bits_txnID,
  input  [1:0]   io_in_0_bits_ccID,
  input  [1:0]   io_in_0_bits_dataID,
  input  [31:0]  io_in_0_bits_be,
  input  [255:0] io_in_0_bits_data,
  output         io_in_1_ready,
  input          io_in_1_valid,
  input  [6:0]   io_in_1_bits_tgtID,
  input  [7:0]   io_in_1_bits_txnID,
  input  [1:0]   io_in_1_bits_ccID,
  input  [1:0]   io_in_1_bits_dataID,
  input  [31:0]  io_in_1_bits_be,
  input  [255:0] io_in_1_bits_data,
  output         io_in_2_ready,
  input          io_in_2_valid,
  input  [6:0]   io_in_2_bits_tgtID,
  input  [7:0]   io_in_2_bits_txnID,
  input  [1:0]   io_in_2_bits_ccID,
  input  [1:0]   io_in_2_bits_dataID,
  input  [31:0]  io_in_2_bits_be,
  input  [255:0] io_in_2_bits_data,
  output         io_in_3_ready,
  input          io_in_3_valid,
  input  [6:0]   io_in_3_bits_tgtID,
  input  [7:0]   io_in_3_bits_txnID,
  input  [1:0]   io_in_3_bits_ccID,
  input  [1:0]   io_in_3_bits_dataID,
  input  [31:0]  io_in_3_bits_be,
  input  [255:0] io_in_3_bits_data,
  output         io_in_4_ready,
  input          io_in_4_valid,
  input  [6:0]   io_in_4_bits_tgtID,
  input  [7:0]   io_in_4_bits_txnID,
  input  [1:0]   io_in_4_bits_ccID,
  input  [1:0]   io_in_4_bits_dataID,
  input  [31:0]  io_in_4_bits_be,
  input  [255:0] io_in_4_bits_data,
  output         io_in_5_ready,
  input          io_in_5_valid,
  input  [6:0]   io_in_5_bits_tgtID,
  input  [7:0]   io_in_5_bits_txnID,
  input  [1:0]   io_in_5_bits_ccID,
  input  [1:0]   io_in_5_bits_dataID,
  input  [31:0]  io_in_5_bits_be,
  input  [255:0] io_in_5_bits_data,
  output         io_in_6_ready,
  input          io_in_6_valid,
  input  [6:0]   io_in_6_bits_tgtID,
  input  [7:0]   io_in_6_bits_txnID,
  input  [1:0]   io_in_6_bits_ccID,
  input  [1:0]   io_in_6_bits_dataID,
  input  [31:0]  io_in_6_bits_be,
  input  [255:0] io_in_6_bits_data,
  output         io_in_7_ready,
  input          io_in_7_valid,
  input  [6:0]   io_in_7_bits_tgtID,
  input  [7:0]   io_in_7_bits_txnID,
  input  [1:0]   io_in_7_bits_ccID,
  input  [1:0]   io_in_7_bits_dataID,
  input  [31:0]  io_in_7_bits_be,
  input  [255:0] io_in_7_bits_data,
  input          io_out_ready,
  output         io_out_valid,
  output [6:0]   io_out_bits_tgtID,
  output [7:0]   io_out_bits_txnID,
  output [1:0]   io_out_bits_ccID,
  output [1:0]   io_out_bits_dataID,
  output [31:0]  io_out_bits_be,
  output [255:0] io_out_bits_data
);

  wire _grant_T = io_in_0_valid | io_in_1_valid;
  wire _grant_T_1 = _grant_T | io_in_2_valid;
  wire _grant_T_2 = _grant_T_1 | io_in_3_valid;
  wire _grant_T_3 = _grant_T_2 | io_in_4_valid;
  wire _grant_T_4 = _grant_T_3 | io_in_5_valid;
  wire _io_out_valid_T = _grant_T_4 | io_in_6_valid;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_in_2_ready = ~_grant_T & io_out_ready;
  assign io_in_3_ready = ~_grant_T_1 & io_out_ready;
  assign io_in_4_ready = ~_grant_T_2 & io_out_ready;
  assign io_in_5_ready = ~_grant_T_3 & io_out_ready;
  assign io_in_6_ready = ~_grant_T_4 & io_out_ready;
  assign io_in_7_ready = ~_io_out_valid_T & io_out_ready;
  assign io_out_valid = _io_out_valid_T | io_in_7_valid;
  assign io_out_bits_tgtID =
    io_in_0_valid
      ? io_in_0_bits_tgtID
      : io_in_1_valid
          ? io_in_1_bits_tgtID
          : io_in_2_valid
              ? io_in_2_bits_tgtID
              : io_in_3_valid
                  ? io_in_3_bits_tgtID
                  : io_in_4_valid
                      ? io_in_4_bits_tgtID
                      : io_in_5_valid
                          ? io_in_5_bits_tgtID
                          : io_in_6_valid ? io_in_6_bits_tgtID : io_in_7_bits_tgtID;
  assign io_out_bits_txnID =
    io_in_0_valid
      ? io_in_0_bits_txnID
      : io_in_1_valid
          ? io_in_1_bits_txnID
          : io_in_2_valid
              ? io_in_2_bits_txnID
              : io_in_3_valid
                  ? io_in_3_bits_txnID
                  : io_in_4_valid
                      ? io_in_4_bits_txnID
                      : io_in_5_valid
                          ? io_in_5_bits_txnID
                          : io_in_6_valid ? io_in_6_bits_txnID : io_in_7_bits_txnID;
  assign io_out_bits_ccID =
    io_in_0_valid
      ? io_in_0_bits_ccID
      : io_in_1_valid
          ? io_in_1_bits_ccID
          : io_in_2_valid
              ? io_in_2_bits_ccID
              : io_in_3_valid
                  ? io_in_3_bits_ccID
                  : io_in_4_valid
                      ? io_in_4_bits_ccID
                      : io_in_5_valid
                          ? io_in_5_bits_ccID
                          : io_in_6_valid ? io_in_6_bits_ccID : io_in_7_bits_ccID;
  assign io_out_bits_dataID =
    io_in_0_valid
      ? io_in_0_bits_dataID
      : io_in_1_valid
          ? io_in_1_bits_dataID
          : io_in_2_valid
              ? io_in_2_bits_dataID
              : io_in_3_valid
                  ? io_in_3_bits_dataID
                  : io_in_4_valid
                      ? io_in_4_bits_dataID
                      : io_in_5_valid
                          ? io_in_5_bits_dataID
                          : io_in_6_valid ? io_in_6_bits_dataID : io_in_7_bits_dataID;
  assign io_out_bits_be =
    io_in_0_valid
      ? io_in_0_bits_be
      : io_in_1_valid
          ? io_in_1_bits_be
          : io_in_2_valid
              ? io_in_2_bits_be
              : io_in_3_valid
                  ? io_in_3_bits_be
                  : io_in_4_valid
                      ? io_in_4_bits_be
                      : io_in_5_valid
                          ? io_in_5_bits_be
                          : io_in_6_valid ? io_in_6_bits_be : io_in_7_bits_be;
  assign io_out_bits_data =
    io_in_0_valid
      ? io_in_0_bits_data
      : io_in_1_valid
          ? io_in_1_bits_data
          : io_in_2_valid
              ? io_in_2_bits_data
              : io_in_3_valid
                  ? io_in_3_bits_data
                  : io_in_4_valid
                      ? io_in_4_bits_data
                      : io_in_5_valid
                          ? io_in_5_bits_data
                          : io_in_6_valid ? io_in_6_bits_data : io_in_7_bits_data;
endmodule

