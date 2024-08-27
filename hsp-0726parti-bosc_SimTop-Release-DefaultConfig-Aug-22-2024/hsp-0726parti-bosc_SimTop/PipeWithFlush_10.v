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
module PipeWithFlush_10(
  input        clock,
  input        reset,
  input        io_enq_valid,
  input        io_enq_bits_robIdx_flag,
  input  [7:0] io_enq_bits_robIdx_value,
  input  [7:0] io_enq_bits_pdest,
  input        io_enq_bits_rfWen,
  input        io_enq_bits_fpWen,
  input  [1:0] io_enq_bits_loadDependency_0,
  input  [1:0] io_enq_bits_loadDependency_1,
  input  [1:0] io_enq_bits_loadDependency_2,
  output       io_deq_valid,
  output       io_deq_bits_robIdx_flag,
  output [7:0] io_deq_bits_robIdx_value,
  output [7:0] io_deq_bits_pdest,
  output       io_deq_bits_rfWen,
  output       io_deq_bits_fpWen,
  output [1:0] io_deq_bits_loadDependency_0,
  output [1:0] io_deq_bits_loadDependency_1,
  output [1:0] io_deq_bits_loadDependency_2
);

  reg       valids_1;
  reg       bits_1_robIdx_flag;
  reg [7:0] bits_1_robIdx_value;
  reg [7:0] bits_1_pdest;
  reg       bits_1_rfWen;
  reg       bits_1_fpWen;
  reg [1:0] bits_1_loadDependency_0;
  reg [1:0] bits_1_loadDependency_1;
  reg [1:0] bits_1_loadDependency_2;
  always @(posedge clock or posedge reset) begin
    if (reset)
      valids_1 <= 1'h0;
    else
      valids_1 <= io_enq_valid;
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_enq_valid) begin
      bits_1_robIdx_flag <= io_enq_bits_robIdx_flag;
      bits_1_robIdx_value <= io_enq_bits_robIdx_value;
      bits_1_pdest <= io_enq_bits_pdest;
      bits_1_rfWen <= io_enq_bits_rfWen;
      bits_1_fpWen <= io_enq_bits_fpWen;
      bits_1_loadDependency_0 <= io_enq_bits_loadDependency_0;
      bits_1_loadDependency_1 <= io_enq_bits_loadDependency_1;
      bits_1_loadDependency_2 <= io_enq_bits_loadDependency_2;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:19];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h14; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        valids_1 = _RANDOM[5'h0][0];
        bits_1_robIdx_flag = _RANDOM[5'h8][13];
        bits_1_robIdx_value = _RANDOM[5'h8][21:14];
        bits_1_pdest = {_RANDOM[5'h8][31:27], _RANDOM[5'h9][2:0]};
        bits_1_rfWen = _RANDOM[5'h9][3];
        bits_1_fpWen = _RANDOM[5'h9][4];
        bits_1_loadDependency_0 = _RANDOM[5'h13][4:3];
        bits_1_loadDependency_1 = _RANDOM[5'h13][6:5];
        bits_1_loadDependency_2 = _RANDOM[5'h13][8:7];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        valids_1 = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_deq_valid = valids_1;
  assign io_deq_bits_robIdx_flag = bits_1_robIdx_flag;
  assign io_deq_bits_robIdx_value = bits_1_robIdx_value;
  assign io_deq_bits_pdest = bits_1_pdest;
  assign io_deq_bits_rfWen = bits_1_rfWen;
  assign io_deq_bits_fpWen = bits_1_fpWen;
  assign io_deq_bits_loadDependency_0 = bits_1_loadDependency_0;
  assign io_deq_bits_loadDependency_1 = bits_1_loadDependency_1;
  assign io_deq_bits_loadDependency_2 = bits_1_loadDependency_2;
endmodule

