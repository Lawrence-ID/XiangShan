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
module Decoupled2LCredit_1(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [3:0]  io_in_bits_qos,
  input  [6:0]  io_in_bits_tgtID,
  input  [6:0]  io_in_bits_srcID,
  input  [7:0]  io_in_bits_txnID,
  input  [3:0]  io_in_bits_opcode,
  input  [1:0]  io_in_bits_respErr,
  input  [2:0]  io_in_bits_resp,
  input  [2:0]  io_in_bits_fwdState,
  input  [7:0]  io_in_bits_dbID,
  input  [3:0]  io_in_bits_pCrdType,
  input         io_in_bits_traceTag,
  output        io_out_flitv,
  output [50:0] io_out_flit,
  input         io_out_lcrdv,
  input  [1:0]  io_state_state
);

  reg  [3:0] lcreditPool;
  wire       io_in_ready_0 =
    (|lcreditPool) & ~(~(|io_state_state) | io_state_state == 2'h1);
  wire       io_out_flitv_0 =
    io_in_ready_0 & io_in_valid | ~io_in_valid & (&io_state_state) & (|lcreditPool);
  always @(posedge clock or posedge reset) begin
    if (reset)
      lcreditPool <= 4'h0;
    else if (io_out_lcrdv & (|io_state_state)) begin
      if (~io_out_flitv_0)
        lcreditPool <= 4'(lcreditPool + 4'h1);
    end
    else if (io_out_flitv_0)
      lcreditPool <= 4'(lcreditPool - 4'h1);
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
        lcreditPool = _RANDOM[/*Zero width*/ 1'b0][3:0];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        lcreditPool = 4'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = io_in_ready_0;
  assign io_out_flitv = io_out_flitv_0;
  assign io_out_flit =
    io_in_valid
      ? {io_in_bits_traceTag,
         io_in_bits_pCrdType,
         io_in_bits_dbID,
         io_in_bits_fwdState,
         io_in_bits_resp,
         io_in_bits_respErr,
         io_in_bits_opcode,
         io_in_bits_txnID,
         io_in_bits_srcID,
         io_in_bits_tgtID,
         io_in_bits_qos}
      : 51'h0;
endmodule

