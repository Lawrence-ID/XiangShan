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
module V0RFWBCollideChecker(
  input  clock,
  input  reset,
  output io_in_20_0_ready,
  input  io_in_20_0_valid,
  output io_in_19_0_ready,
  input  io_in_19_0_valid,
  output io_in_18_0_ready,
  input  io_in_18_0_valid,
  output io_in_17_0_ready,
  input  io_in_17_0_valid,
  output io_in_16_0_ready,
  input  io_in_16_0_valid,
  output io_in_15_0_ready,
  input  io_in_15_0_valid,
  output io_in_14_0_ready,
  input  io_in_14_0_valid,
  output io_in_13_0_ready,
  input  io_in_13_0_valid,
  output io_in_12_0_ready,
  input  io_in_12_0_valid,
  output io_in_11_0_ready,
  input  io_in_11_0_valid,
  output io_in_10_1_ready,
  input  io_in_10_1_valid,
  output io_in_10_0_ready,
  input  io_in_10_0_valid,
  output io_in_9_1_ready,
  input  io_in_9_1_valid,
  output io_in_9_0_ready,
  input  io_in_9_0_valid,
  output io_in_8_1_ready,
  input  io_in_8_1_valid,
  output io_in_8_0_ready,
  input  io_in_8_0_valid,
  output io_in_7_0_ready,
  input  io_in_7_0_valid,
  output io_in_6_0_ready,
  input  io_in_6_0_valid,
  output io_in_5_0_ready,
  input  io_in_5_0_valid,
  output io_in_4_0_ready,
  input  io_in_4_0_valid,
  output io_in_3_1_ready,
  input  io_in_3_1_valid,
  output io_in_3_0_ready,
  input  io_in_3_0_valid,
  output io_in_2_1_ready,
  input  io_in_2_1_valid,
  output io_in_2_0_ready,
  input  io_in_2_0_valid,
  output io_in_1_1_ready,
  input  io_in_1_1_valid,
  output io_in_1_0_ready,
  input  io_in_1_0_valid,
  output io_in_0_1_ready,
  input  io_in_0_1_valid,
  output io_in_0_0_ready,
  input  io_in_0_0_valid,
  output io_out_0_valid,
  output io_out_1_valid,
  output io_out_2_valid,
  output io_out_3_valid,
  output io_out_4_valid,
  output io_out_5_valid
);

  WBArbiter_2 arbiters_0 (
    .clock         (clock),
    .reset         (reset),
    .io_in_0_ready (io_in_9_0_ready),
    .io_in_0_valid (io_in_9_0_valid),
    .io_in_1_ready (io_in_9_1_ready),
    .io_in_1_valid (io_in_9_1_valid),
    .io_out_valid  (io_out_0_valid)
  );
  WBArbiter_5 arbiters_1 (
    .clock         (clock),
    .reset         (reset),
    .io_in_0_ready (io_in_10_0_ready),
    .io_in_0_valid (io_in_10_0_valid),
    .io_out_valid  (io_out_1_valid)
  );
  WBArbiter_2 arbiters_2 (
    .clock         (clock),
    .reset         (reset),
    .io_in_0_ready (io_in_2_1_ready),
    .io_in_0_valid (io_in_2_1_valid),
    .io_in_1_ready (io_in_10_1_ready),
    .io_in_1_valid (io_in_10_1_valid),
    .io_out_valid  (io_out_2_valid)
  );
  WBArbiter_2 arbiters_3 (
    .clock         (clock),
    .reset         (reset),
    .io_in_0_ready (io_in_4_0_ready),
    .io_in_0_valid (io_in_4_0_valid),
    .io_in_1_ready (io_in_11_0_ready),
    .io_in_1_valid (io_in_11_0_valid),
    .io_out_valid  (io_out_3_valid)
  );
  WBArbiter_5 arbiters_4 (
    .clock         (clock),
    .reset         (reset),
    .io_in_0_ready (io_in_17_0_ready),
    .io_in_0_valid (io_in_17_0_valid),
    .io_out_valid  (io_out_4_valid)
  );
  WBArbiter_5 arbiters_5 (
    .clock         (clock),
    .reset         (reset),
    .io_in_0_ready (io_in_18_0_ready),
    .io_in_0_valid (io_in_18_0_valid),
    .io_out_valid  (io_out_5_valid)
  );
  assign io_in_20_0_ready = 1'h1;
  assign io_in_19_0_ready = 1'h1;
  assign io_in_16_0_ready = 1'h1;
  assign io_in_15_0_ready = 1'h1;
  assign io_in_14_0_ready = 1'h1;
  assign io_in_13_0_ready = 1'h1;
  assign io_in_12_0_ready = 1'h1;
  assign io_in_8_1_ready = 1'h1;
  assign io_in_8_0_ready = 1'h1;
  assign io_in_7_0_ready = 1'h1;
  assign io_in_6_0_ready = 1'h1;
  assign io_in_5_0_ready = 1'h1;
  assign io_in_3_1_ready = 1'h1;
  assign io_in_3_0_ready = 1'h1;
  assign io_in_2_0_ready = 1'h1;
  assign io_in_1_1_ready = 1'h1;
  assign io_in_1_0_ready = 1'h1;
  assign io_in_0_1_ready = 1'h1;
  assign io_in_0_0_ready = 1'h1;
endmodule

