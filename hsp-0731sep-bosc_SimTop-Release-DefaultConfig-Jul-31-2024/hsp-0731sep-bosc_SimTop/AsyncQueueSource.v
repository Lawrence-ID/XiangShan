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
module AsyncQueueSource(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
  input  [8:0]  io_enq_bits_address,
  input  [31:0] io_enq_bits_data,
  output [2:0]  io_async_mem_0_opcode,
  output [8:0]  io_async_mem_0_address,
  output [31:0] io_async_mem_0_data,
  input         io_async_ridx,
  output        io_async_widx
);

  reg         ready_reg;
  wire        _ridx_ridx_gray_io_q;
  reg  [2:0]  mem_0_opcode;
  reg  [8:0]  mem_0_address;
  reg  [31:0] mem_0_data;
  wire        _widx_T_1 = ready_reg & io_enq_valid;
  reg         widx_widx_bin;
  reg         widx_gray;
  always @(posedge clock) begin
    if (_widx_T_1) begin
      mem_0_opcode <= io_enq_bits_opcode;
      mem_0_address <= io_enq_bits_address;
      mem_0_data <= io_enq_bits_data;
    end
  end // always @(posedge)
  wire        _widx_incremented_T = 1'(widx_widx_bin + _widx_T_1);
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      widx_widx_bin <= 1'h0;
      ready_reg <= 1'h0;
      widx_gray <= 1'h0;
    end
    else begin
      widx_widx_bin <= _widx_incremented_T;
      ready_reg <= _widx_incremented_T != ~_ridx_ridx_gray_io_q;
      widx_gray <= _widx_incremented_T;
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
        mem_0_opcode = _RANDOM[1'h0][2:0];
        mem_0_address = _RANDOM[1'h0][17:9];
        mem_0_data = {_RANDOM[1'h0][31:22], _RANDOM[1'h1][21:0]};
        widx_widx_bin = _RANDOM[1'h1][23];
        ready_reg = _RANDOM[1'h1][24];
        widx_gray = _RANDOM[1'h1][25];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        widx_widx_bin = 1'h0;
        ready_reg = 1'h0;
        widx_gray = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  AsyncResetSynchronizerShiftReg_w1_d3_i0 ridx_ridx_gray (
    .clock (clock),
    .reset (reset),
    .io_d  (io_async_ridx),
    .io_q  (_ridx_ridx_gray_io_q)
  );
  assign io_enq_ready = ready_reg;
  assign io_async_mem_0_opcode = mem_0_opcode;
  assign io_async_mem_0_address = mem_0_address;
  assign io_async_mem_0_data = mem_0_data;
  assign io_async_widx = widx_gray;
endmodule

