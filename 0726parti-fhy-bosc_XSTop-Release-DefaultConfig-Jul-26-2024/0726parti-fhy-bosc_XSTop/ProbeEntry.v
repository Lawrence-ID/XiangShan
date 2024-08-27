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
module ProbeEntry(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [35:0] io_req_bits_addr,
  input  [40:0] io_req_bits_vaddr,
  input  [1:0]  io_req_bits_param,
  input         io_req_bits_needData,
  input         io_pipe_req_ready,
  output        io_pipe_req_valid,
  output [1:0]  io_pipe_req_bits_probe_param,
  output        io_pipe_req_bits_probe_need_data,
  output [40:0] io_pipe_req_bits_vaddr,
  output [35:0] io_pipe_req_bits_addr,
  output [5:0]  io_pipe_req_bits_id,
  input         io_pipe_resp_valid,
  input  [2:0]  io_pipe_resp_bits_id,
  input         io_lrsc_locked_block_valid,
  input  [35:0] io_lrsc_locked_block_bits,
  input  [2:0]  io_id,
  output        io_block_addr_valid
);

  reg  [1:0]  state;
  reg  [35:0] req_addr;
  reg  [40:0] req_vaddr;
  reg  [1:0]  req_param;
  reg         req_needData;
  wire        io_req_ready_0 = state == 2'h0;
  wire        _GEN = io_req_ready_0 & io_req_valid;
  reg         io_pipe_req_valid_REG;
  wire        io_pipe_req_valid_0 = state == 2'h1 & ~io_pipe_req_valid_REG;
  always @(posedge clock or posedge reset) begin
    if (reset)
      state <= 2'h0;
    else if (state == 2'h2 & io_pipe_resp_valid & io_pipe_resp_bits_id == io_id)
      state <= 2'h0;
    else if (io_pipe_req_ready & io_pipe_req_valid_0)
      state <= 2'h2;
    else if (_GEN)
      state <= 2'h1;
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_GEN) begin
      req_addr <= io_req_bits_addr;
      req_vaddr <= io_req_bits_vaddr;
      req_param <= io_req_bits_param;
      req_needData <= io_req_bits_needData;
    end
    io_pipe_req_valid_REG <=
      io_req_ready_0 & io_req_valid
        ? io_lrsc_locked_block_valid
          & io_lrsc_locked_block_bits[35:6] == io_req_bits_addr[35:6]
        : io_lrsc_locked_block_valid & io_lrsc_locked_block_bits[35:6] == req_addr[35:6];
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:2];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        state = _RANDOM[2'h0][1:0];
        req_addr = {_RANDOM[2'h0][31:11], _RANDOM[2'h1][14:0]};
        req_vaddr = {_RANDOM[2'h1][31:15], _RANDOM[2'h2][23:0]};
        req_param = _RANDOM[2'h2][25:24];
        req_needData = _RANDOM[2'h2][26];
        io_pipe_req_valid_REG = _RANDOM[2'h2][30];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        state = 2'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_req_ready = io_req_ready_0;
  assign io_pipe_req_valid = io_pipe_req_valid_0;
  assign io_pipe_req_bits_probe_param = req_param;
  assign io_pipe_req_bits_probe_need_data = req_needData;
  assign io_pipe_req_bits_vaddr = req_vaddr;
  assign io_pipe_req_bits_addr = req_addr;
  assign io_pipe_req_bits_id = {3'h0, io_id};
  assign io_block_addr_valid = |state;
endmodule

