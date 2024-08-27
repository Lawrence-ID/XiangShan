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
module Iprio2Module(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata
);

  reg [7:0] reg_PrioSEI;
  reg [7:0] reg_PrioVSEI;
  reg [7:0] reg_PrioMEI;
  reg [7:0] reg_PrioSGEI;
  reg [7:0] reg_PrioCOI;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_PrioSEI <= 8'h0;
      reg_PrioVSEI <= 8'h0;
      reg_PrioMEI <= 8'h0;
      reg_PrioSGEI <= 8'h0;
      reg_PrioCOI <= 8'h0;
    end
    else if (w_wen) begin
      reg_PrioSEI <= w_wdata[15:8];
      reg_PrioVSEI <= w_wdata[23:16];
      reg_PrioMEI <= w_wdata[31:24];
      reg_PrioSGEI <= w_wdata[39:32];
      reg_PrioCOI <= w_wdata[47:40];
    end
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
        reg_PrioSEI = _RANDOM[1'h0][7:0];
        reg_PrioVSEI = _RANDOM[1'h0][15:8];
        reg_PrioMEI = _RANDOM[1'h0][23:16];
        reg_PrioSGEI = _RANDOM[1'h0][31:24];
        reg_PrioCOI = _RANDOM[1'h1][7:0];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_PrioSEI = 8'h0;
        reg_PrioVSEI = 8'h0;
        reg_PrioMEI = 8'h0;
        reg_PrioSGEI = 8'h0;
        reg_PrioCOI = 8'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata =
    {16'h0, reg_PrioCOI, reg_PrioSGEI, reg_PrioMEI, reg_PrioVSEI, reg_PrioSEI, 8'h0};
endmodule

