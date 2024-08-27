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
module Conversion(
  input  [4:0]  io_q_j_1,
  input  [15:0] io_pre_q_A,
  input  [15:0] io_pre_q_B,
  output [15:0] io_nxt_q_A,
  output [15:0] io_nxt_q_B
);

  wire [15:0] new_q_B_0 = {io_pre_q_A[13:0], 2'h1};
  wire [15:0] new_q_B_1 = {io_pre_q_A[13:0], 2'h0};
  wire [15:0] new_q_B_2 = {io_pre_q_B[13:0], 2'h3};
  wire [15:0] new_q_B_3 = {io_pre_q_B[13:0], 2'h2};
  assign io_nxt_q_A =
    (io_q_j_1[0] ? {io_pre_q_A[13:0], 2'h2} : 16'h0) | (io_q_j_1[1] ? new_q_B_0 : 16'h0)
    | (io_q_j_1[2] ? new_q_B_1 : 16'h0) | (io_q_j_1[3] ? new_q_B_2 : 16'h0)
    | (io_q_j_1[4] ? new_q_B_3 : 16'h0);
  assign io_nxt_q_B =
    (io_q_j_1[0] ? new_q_B_0 : 16'h0) | (io_q_j_1[1] ? new_q_B_1 : 16'h0)
    | (io_q_j_1[2] ? new_q_B_2 : 16'h0) | (io_q_j_1[3] ? new_q_B_3 : 16'h0)
    | (io_q_j_1[4] ? {io_pre_q_B[13:0], 2'h1} : 16'h0);
endmodule

