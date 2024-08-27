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
module JtagTapController(
  input        clock,
  input        io_jtag_TMS,
  input        io_jtag_TDI,
  output       io_jtag_TDO_data,
  output       io_jtag_TDO_driven,
  input        io_control_jtag_reset,
  output [4:0] io_output_instruction,
  output       io_output_tapIsInTestLogicReset,
  output       io_dataChainOut_shift,
  output       io_dataChainOut_data,
  output       io_dataChainOut_capture,
  output       io_dataChainOut_update,
  input        io_dataChainIn_data
);

  wire       _irChain_io_chainOut_data;
  wire [4:0] _irChain_io_update_bits;
  wire [3:0] _stateMachine_io_currState;
  wire       clock_falling = ~clock;
  reg        tdoReg;
  reg        tdoeReg;
  wire       irChain_io_chainIn_shift = _stateMachine_io_currState == 4'hA;
  wire       irChain_io_chainIn_update = _stateMachine_io_currState == 4'hD;
  reg  [4:0] activeInstruction;
  wire       io_dataChainOut_shift_0 = _stateMachine_io_currState == 4'h2;
  always @(posedge clock_falling or posedge io_control_jtag_reset) begin
    if (io_control_jtag_reset) begin
      tdoReg <= 1'h0;
      tdoeReg <= 1'h0;
      activeInstruction <= 5'h1;
    end
    else begin
      tdoReg <= io_dataChainOut_shift_0 ? io_dataChainIn_data : _irChain_io_chainOut_data;
      tdoeReg <= io_dataChainOut_shift_0 | irChain_io_chainIn_shift;
      if (&_stateMachine_io_currState)
        activeInstruction <= 5'h1;
      else if (irChain_io_chainIn_update)
        activeInstruction <= _irChain_io_update_bits;
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
        tdoReg = _RANDOM[/*Zero width*/ 1'b0][0];
        tdoeReg = _RANDOM[/*Zero width*/ 1'b0][1];
        activeInstruction = _RANDOM[/*Zero width*/ 1'b0][6:2];
      `endif // RANDOMIZE_REG_INIT
      if (io_control_jtag_reset) begin
        tdoReg = 1'h0;
        tdoeReg = 1'h0;
        activeInstruction = 5'h1;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  JtagStateMachine stateMachine (
    .clock        (clock),
    .reset        (io_control_jtag_reset),
    .io_tms       (io_jtag_TMS),
    .io_currState (_stateMachine_io_currState)
  );
  CaptureUpdateChain_2 irChain (
    .clock              (clock),
    .io_chainIn_shift   (irChain_io_chainIn_shift),
    .io_chainIn_data    (io_jtag_TDI),
    .io_chainIn_capture (_stateMachine_io_currState == 4'hE),
    .io_chainIn_update  (irChain_io_chainIn_update),
    .io_chainOut_data   (_irChain_io_chainOut_data),
    .io_update_bits     (_irChain_io_update_bits)
  );
  assign io_jtag_TDO_data = tdoReg;
  assign io_jtag_TDO_driven = tdoeReg;
  assign io_output_instruction = activeInstruction;
  assign io_output_tapIsInTestLogicReset = &_stateMachine_io_currState;
  assign io_dataChainOut_shift = io_dataChainOut_shift_0;
  assign io_dataChainOut_data = io_jtag_TDI;
  assign io_dataChainOut_capture = _stateMachine_io_currState == 4'h6;
  assign io_dataChainOut_update = _stateMachine_io_currState == 4'h5;
endmodule

