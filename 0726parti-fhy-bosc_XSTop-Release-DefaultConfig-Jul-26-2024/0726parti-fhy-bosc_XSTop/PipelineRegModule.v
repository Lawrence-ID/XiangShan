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
module PipelineRegModule(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [4:0]  io_in_bits_cmd,
  input  [35:0] io_in_bits_addr,
  input  [63:0] io_in_bits_data,
  input  [7:0]  io_in_bits_mask,
  input  [6:0]  io_in_bits_id,
  input         io_in_bits_atomic,
  input         io_out_ready,
  output        io_out_valid,
  output [4:0]  io_out_bits_cmd,
  output [35:0] io_out_bits_addr,
  output [63:0] io_out_bits_data,
  output [7:0]  io_out_bits_mask,
  output [6:0]  io_out_bits_id,
  output        io_out_bits_atomic
);

  wire        io_in_ready_0;
  reg         pipeline_reg_valid;
  wire        _io_out_bits_T = io_in_ready_0 & io_in_valid;
  assign io_in_ready_0 = ~pipeline_reg_valid | io_out_ready;
  reg  [4:0]  io_out_bits_r_cmd;
  reg  [35:0] io_out_bits_r_addr;
  reg  [63:0] io_out_bits_r_data;
  reg  [7:0]  io_out_bits_r_mask;
  reg  [6:0]  io_out_bits_r_id;
  reg         io_out_bits_r_atomic;
  always @(posedge clock or posedge reset) begin
    if (reset)
      pipeline_reg_valid <= 1'h0;
    else
      pipeline_reg_valid <=
        _io_out_bits_T | ~(io_out_ready & pipeline_reg_valid) & pipeline_reg_valid;
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_io_out_bits_T) begin
      io_out_bits_r_cmd <= io_in_bits_cmd;
      io_out_bits_r_addr <= io_in_bits_addr;
      io_out_bits_r_data <= io_in_bits_data;
      io_out_bits_r_mask <= io_in_bits_mask;
      io_out_bits_r_id <= io_in_bits_id;
      io_out_bits_r_atomic <= io_in_bits_atomic;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:3];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h4; i += 3'h1) begin
          _RANDOM[i[1:0]] = `RANDOM;
        end
        pipeline_reg_valid = _RANDOM[2'h0][0];
        io_out_bits_r_cmd = _RANDOM[2'h0][5:1];
        io_out_bits_r_addr = {_RANDOM[2'h0][31:6], _RANDOM[2'h1][9:0]};
        io_out_bits_r_data = {_RANDOM[2'h1][31:10], _RANDOM[2'h2], _RANDOM[2'h3][9:0]};
        io_out_bits_r_mask = _RANDOM[2'h3][17:10];
        io_out_bits_r_id = _RANDOM[2'h3][24:18];
        io_out_bits_r_atomic = _RANDOM[2'h3][29];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        pipeline_reg_valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = io_in_ready_0;
  assign io_out_valid = pipeline_reg_valid;
  assign io_out_bits_cmd = io_out_bits_r_cmd;
  assign io_out_bits_addr = io_out_bits_r_addr;
  assign io_out_bits_data = io_out_bits_r_data;
  assign io_out_bits_mask = io_out_bits_r_mask;
  assign io_out_bits_id = io_out_bits_r_id;
  assign io_out_bits_atomic = io_out_bits_r_atomic;
endmodule

