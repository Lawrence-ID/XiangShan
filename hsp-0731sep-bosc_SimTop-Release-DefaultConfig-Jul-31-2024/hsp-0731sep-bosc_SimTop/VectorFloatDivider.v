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
module VectorFloatDivider(
  input         clock,
  input         reset,
  input         io_start_valid_i,
  output        io_start_ready_o,
  input         io_flush_i,
  input  [1:0]  io_fp_format_i,
  input  [63:0] io_opa_i,
  input  [63:0] io_opb_i,
  input         io_is_sqrt_i,
  input  [2:0]  io_rm_i,
  output        io_finish_valid_o,
  input         io_finish_ready_i,
  output [63:0] io_fpdiv_res_o,
  output [19:0] io_fflags_o
);

  wire        _u_vector_float_divider_r64_io_start_ready_o;
  wire        _u_vector_float_divider_r64_io_finish_valid_o;
  wire [63:0] _u_vector_float_divider_r64_io_fpdiv_res_o;
  wire [19:0] _u_vector_float_divider_r64_io_fflags_o;
  wire        _u_vector_float_sqrt_r16_start_ready_o;
  wire        _u_vector_float_sqrt_r16_finish_valid_o;
  wire [63:0] _u_vector_float_sqrt_r16_fpsqrt_res_o;
  wire [19:0] _u_vector_float_sqrt_r16_fflags_o;
  fpsqrt_vector_r16 u_vector_float_sqrt_r16 (
    .clock          (clock),
    .reset          (reset),
    .start_valid_i  (io_is_sqrt_i & io_start_valid_i),
    .start_ready_o  (_u_vector_float_sqrt_r16_start_ready_o),
    .flush_i        (io_flush_i),
    .fp_format_i    (2'(io_fp_format_i - 2'h1)),
    .op_i           (io_opa_i),
    .rm_i           (io_rm_i),
    .finish_valid_o (_u_vector_float_sqrt_r16_finish_valid_o),
    .finish_ready_i (io_finish_ready_i),
    .fpsqrt_res_o   (_u_vector_float_sqrt_r16_fpsqrt_res_o),
    .fflags_o       (_u_vector_float_sqrt_r16_fflags_o)
  );
  VectorFloatDividerR64 u_vector_float_divider_r64 (
    .clock             (clock),
    .reset             (reset),
    .io_start_valid_i  (~io_is_sqrt_i & io_start_valid_i),
    .io_start_ready_o  (_u_vector_float_divider_r64_io_start_ready_o),
    .io_flush_i        (io_flush_i),
    .io_fp_format_i    (io_fp_format_i),
    .io_opa_i          (io_opa_i),
    .io_opb_i          (io_opb_i),
    .io_rm_i           (io_rm_i),
    .io_finish_valid_o (_u_vector_float_divider_r64_io_finish_valid_o),
    .io_finish_ready_i (io_finish_ready_i),
    .io_fpdiv_res_o    (_u_vector_float_divider_r64_io_fpdiv_res_o),
    .io_fflags_o       (_u_vector_float_divider_r64_io_fflags_o)
  );
  assign io_start_ready_o =
    _u_vector_float_divider_r64_io_start_ready_o & _u_vector_float_sqrt_r16_start_ready_o;
  assign io_finish_valid_o =
    _u_vector_float_divider_r64_io_finish_valid_o
    | _u_vector_float_sqrt_r16_finish_valid_o;
  assign io_fpdiv_res_o =
    (_u_vector_float_divider_r64_io_finish_valid_o
       ? _u_vector_float_divider_r64_io_fpdiv_res_o
       : 64'h0)
    | (_u_vector_float_sqrt_r16_finish_valid_o
         ? _u_vector_float_sqrt_r16_fpsqrt_res_o
         : 64'h0);
  assign io_fflags_o =
    (_u_vector_float_divider_r64_io_finish_valid_o
       ? _u_vector_float_divider_r64_io_fflags_o
       : 20'h0)
    | (_u_vector_float_sqrt_r16_finish_valid_o
         ? _u_vector_float_sqrt_r16_fflags_o
         : 20'h0);
endmodule

