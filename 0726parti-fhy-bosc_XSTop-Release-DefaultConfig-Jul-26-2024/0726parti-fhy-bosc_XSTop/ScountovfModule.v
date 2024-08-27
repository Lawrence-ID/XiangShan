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
module ScountovfModule(
  input         clock,
  input         reset,
  output [31:0] rdata,
  output [28:0] regOut_OFVEC,
  input  [28:0] ofVec,
  input  [1:0]  privState_PRVM,
  input         privState_V,
  input  [28:0] mcounteren_HPM,
  input  [28:0] hcounteren_HPM
);

  wire [28:0] _regOut_OFVEC_WIRE;
  reg  [28:0] reg_OFVEC;
  wire        v_PrvmIsM = &privState_PRVM;
  wire        isModeM = v_PrvmIsM;
  wire        PrvmIsS = privState_PRVM == 2'h1;
  wire        isModeHS = ~privState_V & PrvmIsS;
  wire        isModeVS = privState_V & PrvmIsS;
  assign _regOut_OFVEC_WIRE =
    (isModeM ? reg_OFVEC : 29'h0) | (isModeHS ? mcounteren_HPM & reg_OFVEC : 29'h0)
    | (isModeVS ? mcounteren_HPM & hcounteren_HPM & reg_OFVEC : 29'h0);
  always @(posedge clock or posedge reset) begin
    if (reset)
      reg_OFVEC <= 29'h0;
    else
      reg_OFVEC <= ofVec;
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
        reg_OFVEC = _RANDOM[/*Zero width*/ 1'b0][28:0];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        reg_OFVEC = 29'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata = {_regOut_OFVEC_WIRE, 3'h0};
  assign regOut_OFVEC = _regOut_OFVEC_WIRE;
endmodule

