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
module Arbiter3_PfGenReq(
  input         io_in_0_valid,
  input  [10:0] io_in_0_bits_region_tag,
  input  [30:0] io_in_0_bits_region_addr,
  input  [15:0] io_in_0_bits_region_bits,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [10:0] io_in_1_bits_region_tag,
  input  [30:0] io_in_1_bits_region_addr,
  input  [15:0] io_in_1_bits_region_bits,
  input         io_in_1_bits_paddr_valid,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [10:0] io_in_2_bits_region_tag,
  input  [30:0] io_in_2_bits_region_addr,
  input  [15:0] io_in_2_bits_region_bits,
  input         io_in_2_bits_paddr_valid,
  output        io_out_valid,
  output [10:0] io_out_bits_region_tag,
  output [30:0] io_out_bits_region_addr,
  output [15:0] io_out_bits_region_bits,
  output        io_out_bits_paddr_valid,
  output        io_out_bits_decr_mode
);

  wire _io_out_valid_T = io_in_0_valid | io_in_1_valid;
  assign io_in_1_ready = ~io_in_0_valid;
  assign io_in_2_ready = ~_io_out_valid_T;
  assign io_out_valid = _io_out_valid_T | io_in_2_valid;
  assign io_out_bits_region_tag =
    io_in_0_valid
      ? io_in_0_bits_region_tag
      : io_in_1_valid ? io_in_1_bits_region_tag : io_in_2_bits_region_tag;
  assign io_out_bits_region_addr =
    io_in_0_valid
      ? io_in_0_bits_region_addr
      : io_in_1_valid ? io_in_1_bits_region_addr : io_in_2_bits_region_addr;
  assign io_out_bits_region_bits =
    io_in_0_valid
      ? io_in_0_bits_region_bits
      : io_in_1_valid ? io_in_1_bits_region_bits : io_in_2_bits_region_bits;
  assign io_out_bits_paddr_valid =
    io_in_0_valid | (io_in_1_valid ? io_in_1_bits_paddr_valid : io_in_2_bits_paddr_valid);
  assign io_out_bits_decr_mode = ~io_in_0_valid & ~io_in_1_valid;
endmodule

