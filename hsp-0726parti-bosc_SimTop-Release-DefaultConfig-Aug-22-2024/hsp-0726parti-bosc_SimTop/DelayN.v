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
module DelayN(
  input  clock,
  input  io_in_ubtb_enable,
  input  io_in_btb_enable,
  input  io_in_tage_enable,
  input  io_in_sc_enable,
  input  io_in_ras_enable,
  output io_out_ubtb_enable,
  output io_out_btb_enable,
  output io_out_tage_enable,
  output io_out_sc_enable,
  output io_out_ras_enable
);

  reg REG_ubtb_enable;
  reg REG_btb_enable;
  reg REG_tage_enable;
  reg REG_sc_enable;
  reg REG_ras_enable;
  always @(posedge clock) begin
    REG_ubtb_enable <= io_in_ubtb_enable;
    REG_btb_enable <= io_in_btb_enable;
    REG_tage_enable <= io_in_tage_enable;
    REG_sc_enable <= io_in_sc_enable;
    REG_ras_enable <= io_in_ras_enable;
  end // always @(posedge)
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
        REG_ubtb_enable = _RANDOM[/*Zero width*/ 1'b0][0];
        REG_btb_enable = _RANDOM[/*Zero width*/ 1'b0][1];
        REG_tage_enable = _RANDOM[/*Zero width*/ 1'b0][3];
        REG_sc_enable = _RANDOM[/*Zero width*/ 1'b0][4];
        REG_ras_enable = _RANDOM[/*Zero width*/ 1'b0][5];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_out_ubtb_enable = REG_ubtb_enable;
  assign io_out_btb_enable = REG_btb_enable;
  assign io_out_tage_enable = REG_tage_enable;
  assign io_out_sc_enable = REG_sc_enable;
  assign io_out_ras_enable = REG_ras_enable;
endmodule

