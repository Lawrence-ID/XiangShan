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
module SRAMTemplate_141(
  input         clock,
  input         reset,
  input         io_r_req_valid,
  input  [8:0]  io_r_req_bits_setIdx,
  output [15:0] io_r_resp_data_0,
  input         io_w_req_valid,
  input  [8:0]  io_w_req_bits_setIdx,
  input  [15:0] io_w_req_bits_data_0
);

  wire [8:0] setIdx;
  wire       realRen;
  wire       wen;
  reg        _resetState;
  reg  [8:0] _resetSet;
  assign wen = io_w_req_valid | _resetState;
  assign realRen = io_r_req_valid & ~wen;
  assign setIdx = _resetState ? _resetSet : io_w_req_bits_setIdx;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _resetState <= 1'h1;
      _resetSet <= 9'h0;
    end
    else begin
      _resetState <= ~(_resetState & (&_resetSet)) & _resetState;
      if (_resetState)
        _resetSet <= 9'(_resetSet + 9'h1);
    end
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
        _resetState = _RANDOM[/*Zero width*/ 1'b0][0];
        _resetSet = _RANDOM[/*Zero width*/ 1'b0][9:1];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        _resetState = 1'h1;
        _resetSet = 9'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  array_0_3 array_0 (
    .RW0_addr  (wen ? setIdx : io_r_req_bits_setIdx),
    .RW0_en    (realRen | wen),
    .RW0_clk   (clock),
    .RW0_wmode (wen),
    .RW0_wdata (_resetState ? 16'h0 : io_w_req_bits_data_0),
    .RW0_rdata (io_r_resp_data_0)
  );
endmodule

