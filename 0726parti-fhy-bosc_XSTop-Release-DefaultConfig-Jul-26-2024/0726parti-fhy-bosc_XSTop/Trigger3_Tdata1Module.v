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
module Trigger3_Tdata1Module(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata,
  input         debugMode,
  input         chainable
);

  reg  [3:0]  reg_TYPE;
  reg         reg_DMODE;
  reg  [58:0] reg_DATA;
  wire        dmode = w_wdata[59] & debugMode;
  wire        _GEN = w_wdata[63:60] == 4'h2;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_TYPE <= 4'hF;
      reg_DMODE <= 1'h0;
      reg_DATA <= 59'h0;
    end
    else if (w_wen) begin
      reg_TYPE <= _GEN ? w_wdata[63:60] : 4'hF;
      reg_DMODE <= dmode;
      reg_DATA <=
        _GEN
          ? {39'h0,
             w_wdata[2] & w_wdata[19],
             3'h0,
             w_wdata[15:12] == 4'h0 | w_wdata[15:12] == 4'h1 & dmode
               ? w_wdata[15:12]
               : 4'h0,
             w_wdata[11] & chainable,
             {w_wdata[10:7] == 4'h3, w_wdata[10:7] == 4'h2, w_wdata[10:7] == 4'h0} == 3'h0
               ? 4'h0
               : w_wdata[10:7],
             w_wdata[6],
             1'h0,
             w_wdata[4:0]}
          : 59'h0;
    end
    else if (w_wen & _GEN)
      reg_TYPE <= w_wdata[63:60];
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:1];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        reg_TYPE = _RANDOM[1'h0][3:0];
        reg_DMODE = _RANDOM[1'h0][4];
        reg_DATA = {_RANDOM[1'h0][31:5], _RANDOM[1'h1]};
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_TYPE = 4'hF;
        reg_DMODE = 1'h0;
        reg_DATA = 59'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata = {reg_TYPE, reg_DMODE, reg_DATA};
endmodule

