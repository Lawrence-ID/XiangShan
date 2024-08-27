// Generated by CIRCT firtool-1.74.0
// Include register initializers in init blocks unless synthesis is set
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS
// Standard header to adapt well known macros for register randomization.
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
module FuBusyTableWrite_75(
  input         clock,
  input         reset,
  input         io_in_deqResp_valid,
  input  [34:0] io_in_deqResp_bits_fuType,
  input         io_in_og0Resp_valid,
  input  [34:0] io_in_og0Resp_bits_fuType,
  input         io_in_og1Resp_valid,
  input  [1:0]  io_in_og1Resp_bits_resp,
  input  [34:0] io_in_og1Resp_bits_fuType,
  output [3:0]  io_out_fuBusyTable
);

  reg [3:0] fuBusyTable;
  always @(posedge clock or posedge reset) begin
    if (reset)
      fuBusyTable <= 4'h0;
    else
      fuBusyTable <=
        {1'h0,
         ~(io_in_og1Resp_valid & io_in_og1Resp_bits_resp == 2'h0
             ? {2'h0, |{io_in_og1Resp_bits_fuType[18], io_in_og1Resp_bits_fuType[27]}}
             : 3'h0)
           & ~(io_in_og0Resp_valid
                 ? {1'h0,
                    |{io_in_og0Resp_bits_fuType[18], io_in_og0Resp_bits_fuType[27]},
                    io_in_og0Resp_bits_fuType[24]}
                 : 3'h0) & fuBusyTable[3:1]}
        | (io_in_deqResp_valid
             ? {1'h0,
                |{io_in_deqResp_bits_fuType[18], io_in_deqResp_bits_fuType[27]},
                io_in_deqResp_bits_fuType[24],
                io_in_deqResp_bits_fuType[30]}
             : 4'h0);
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        fuBusyTable = _RANDOM[/*Zero width*/ 1'b0][3:0];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        fuBusyTable = 4'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_out_fuBusyTable = fuBusyTable;
endmodule

