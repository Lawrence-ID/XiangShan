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
module Pmp7cfgModule(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [7:0]  rdata,
  output        regOut_R,
  output        regOut_W,
  output        regOut_X,
  output [1:0]  regOut_A,
  output        regOut_L
);

  reg       reg_R;
  reg       reg_W;
  reg       reg_X;
  reg [1:0] reg_A;
  reg       reg_L;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_R <= 1'h0;
      reg_W <= 1'h0;
      reg_X <= 1'h0;
      reg_A <= 2'h0;
      reg_L <= 1'h0;
    end
    else begin
      if (w_wen) begin
        reg_R <= w_wdata[0];
        reg_X <= w_wdata[2];
        reg_A <= w_wdata[4:3] == 2'h2 ? 2'h3 : w_wdata[4:3];
        reg_L <= w_wdata[7];
      end
      if (w_wen & ~(~(w_wdata[0]) & w_wdata[1]))
        reg_W <= w_wdata[1];
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
        reg_R = _RANDOM[/*Zero width*/ 1'b0][0];
        reg_W = _RANDOM[/*Zero width*/ 1'b0][1];
        reg_X = _RANDOM[/*Zero width*/ 1'b0][2];
        reg_A = _RANDOM[/*Zero width*/ 1'b0][4:3];
        reg_L = _RANDOM[/*Zero width*/ 1'b0][7];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_R = 1'h0;
        reg_W = 1'h0;
        reg_X = 1'h0;
        reg_A = 2'h0;
        reg_L = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata = {reg_L, 2'h0, reg_A, reg_X, reg_W, reg_R};
  assign regOut_R = reg_R;
  assign regOut_W = reg_W;
  assign regOut_X = reg_X;
  assign regOut_A = reg_A;
  assign regOut_L = reg_L;
endmodule

