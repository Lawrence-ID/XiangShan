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
module NewPipelineConnectPipe_28(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [34:0] io_in_bits_fuType,
  input  [8:0]  io_in_bits_fuOpType,
  input  [63:0] io_in_bits_src_0,
  input  [63:0] io_in_bits_src_1,
  input         io_in_bits_robIdx_flag,
  input  [7:0]  io_in_bits_robIdx_value,
  input  [7:0]  io_in_bits_pdest,
  input         io_in_bits_rfWen,
  output        io_out_valid,
  output [34:0] io_out_bits_fuType,
  output [8:0]  io_out_bits_fuOpType,
  output [63:0] io_out_bits_src_0,
  output [63:0] io_out_bits_src_1,
  output        io_out_bits_robIdx_flag,
  output [7:0]  io_out_bits_robIdx_value,
  output [7:0]  io_out_bits_pdest,
  output        io_out_bits_rfWen,
  input         io_rightOutFire,
  input         io_isFlush
);

  reg        valid;
  reg [34:0] data_fuType;
  reg [8:0]  data_fuOpType;
  reg [63:0] data_src_0;
  reg [63:0] data_src_1;
  reg        data_robIdx_flag;
  reg [7:0]  data_robIdx_value;
  reg [7:0]  data_pdest;
  reg        data_rfWen;
  always @(posedge clock or posedge reset) begin
    if (reset)
      valid <= 1'h0;
    else
      valid <= ~io_isFlush & (io_in_valid | ~io_rightOutFire & valid);
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_in_valid) begin
      data_fuType <= io_in_bits_fuType;
      data_fuOpType <= io_in_bits_fuOpType;
      data_src_0 <= io_in_bits_src_0;
      data_src_1 <= io_in_bits_src_1;
      data_robIdx_flag <= io_in_bits_robIdx_flag;
      data_robIdx_value <= io_in_bits_robIdx_value;
      data_pdest <= io_in_bits_pdest;
      data_rfWen <= io_in_bits_rfWen;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:7];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'h8; i += 4'h1) begin
          _RANDOM[i[2:0]] = `RANDOM;
        end
        valid = _RANDOM[3'h0][0];
        data_fuType = {_RANDOM[3'h0][31:1], _RANDOM[3'h1][3:0]};
        data_fuOpType = _RANDOM[3'h1][12:4];
        data_src_0 = {_RANDOM[3'h1][31:13], _RANDOM[3'h2], _RANDOM[3'h3][12:0]};
        data_src_1 = {_RANDOM[3'h3][31:13], _RANDOM[3'h4], _RANDOM[3'h5][12:0]};
        data_robIdx_flag = _RANDOM[3'h6][13];
        data_robIdx_value = _RANDOM[3'h6][21:14];
        data_pdest = {_RANDOM[3'h6][31:27], _RANDOM[3'h7][2:0]};
        data_rfWen = _RANDOM[3'h7][3];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_out_valid = valid;
  assign io_out_bits_fuType = data_fuType;
  assign io_out_bits_fuOpType = data_fuOpType;
  assign io_out_bits_src_0 = data_src_0;
  assign io_out_bits_src_1 = data_src_1;
  assign io_out_bits_robIdx_flag = data_robIdx_flag;
  assign io_out_bits_robIdx_value = data_robIdx_value;
  assign io_out_bits_pdest = data_pdest;
  assign io_out_bits_rfWen = data_rfWen;
endmodule

