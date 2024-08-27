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
module IntToFP_1(
  input  [63:0] io_int,
  input         io_sign,
  input         io_long,
  input  [2:0]  io_rm,
  output [63:0] io_result,
  output [4:0]  io_fflags
);

  wire [62:0] _pre_norm_io_out_norm_int;
  wire [5:0]  _pre_norm_io_out_lzc;
  wire        _pre_norm_io_out_is_zero;
  wire        _pre_norm_io_out_sign;
  IntToFP_prenorm pre_norm (
    .io_in_int       (io_int),
    .io_in_sign      (io_sign),
    .io_in_long      (io_long),
    .io_out_norm_int (_pre_norm_io_out_norm_int),
    .io_out_lzc      (_pre_norm_io_out_lzc),
    .io_out_is_zero  (_pre_norm_io_out_is_zero),
    .io_out_sign     (_pre_norm_io_out_sign)
  );
  IntToFP_postnorm_1 post_norm (
    .io_in_norm_int (_pre_norm_io_out_norm_int),
    .io_in_lzc      (_pre_norm_io_out_lzc),
    .io_in_is_zero  (_pre_norm_io_out_is_zero),
    .io_in_sign     (_pre_norm_io_out_sign),
    .io_rm          (io_rm),
    .io_result      (io_result),
    .io_fflags      (io_fflags)
  );
endmodule

