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
module CLZ_5(
  input  [31:0] io_in,
  output [5:0]  io_out
);

  assign io_out =
    io_in[31]
      ? 6'h0
      : io_in[30]
          ? 6'h1
          : io_in[29]
              ? 6'h2
              : io_in[28]
                  ? 6'h3
                  : io_in[27]
                      ? 6'h4
                      : io_in[26]
                          ? 6'h5
                          : io_in[25]
                              ? 6'h6
                              : io_in[24]
                                  ? 6'h7
                                  : io_in[23]
                                      ? 6'h8
                                      : io_in[22]
                                          ? 6'h9
                                          : io_in[21]
                                              ? 6'hA
                                              : io_in[20]
                                                  ? 6'hB
                                                  : io_in[19]
                                                      ? 6'hC
                                                      : io_in[18]
                                                          ? 6'hD
                                                          : io_in[17]
                                                              ? 6'hE
                                                              : io_in[16]
                                                                  ? 6'hF
                                                                  : io_in[15]
                                                                      ? 6'h10
                                                                      : io_in[14]
                                                                          ? 6'h11
                                                                          : io_in[13]
                                                                              ? 6'h12
                                                                              : io_in[12]
                                                                                  ? 6'h13
                                                                                  : io_in[11]
                                                                                      ? 6'h14
                                                                                      : io_in[10]
                                                                                          ? 6'h15
                                                                                          : io_in[9]
                                                                                              ? 6'h16
                                                                                              : io_in[8]
                                                                                                  ? 6'h17
                                                                                                  : io_in[7]
                                                                                                      ? 6'h18
                                                                                                      : io_in[6]
                                                                                                          ? 6'h19
                                                                                                          : io_in[5]
                                                                                                              ? 6'h1A
                                                                                                              : io_in[4]
                                                                                                                  ? 6'h1B
                                                                                                                  : io_in[3]
                                                                                                                      ? 6'h1C
                                                                                                                      : io_in[2]
                                                                                                                          ? 6'h1D
                                                                                                                          : io_in[1]
                                                                                                                              ? 6'h1E
                                                                                                                              : io_in[0]
                                                                                                                                  ? 6'h1F
                                                                                                                                  : 6'h20;
endmodule

