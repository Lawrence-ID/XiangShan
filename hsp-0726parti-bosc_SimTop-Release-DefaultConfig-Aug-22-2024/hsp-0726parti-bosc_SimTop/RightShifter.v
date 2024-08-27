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
module RightShifter(
  input  [5:0]  io_shiftNum,
  input  [63:0] io_in,
  input         io_msb,
  output [63:0] io_out
);

  wire [63:0] s0 = io_shiftNum[0] ? {io_msb, io_in[63:1]} : io_in;
  wire [63:0] s1 = io_shiftNum[1] ? {{2{io_msb}}, s0[63:2]} : s0;
  wire [63:0] s2 = io_shiftNum[2] ? {{4{io_msb}}, s1[63:4]} : s1;
  wire [63:0] s3 = io_shiftNum[3] ? {{8{io_msb}}, s2[63:8]} : s2;
  wire [63:0] s4 = io_shiftNum[4] ? {{16{io_msb}}, s3[63:16]} : s3;
  assign io_out = io_shiftNum[5] ? {{32{io_msb}}, s4[63:32]} : s4;
endmodule

