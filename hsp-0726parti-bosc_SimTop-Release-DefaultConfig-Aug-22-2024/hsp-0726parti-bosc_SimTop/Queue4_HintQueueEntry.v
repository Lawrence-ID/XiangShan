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
module Queue4_HintQueueEntry(
  input        clock,
  input        reset,
  input        io_enq_valid,
  input  [6:0] io_enq_bits_source,
  input  [2:0] io_enq_bits_opcode,
  input        io_enq_bits_isKeyword,
  input        io_deq_ready,
  output       io_deq_valid,
  output [6:0] io_deq_bits_source,
  output [2:0] io_deq_bits_opcode,
  output       io_deq_bits_isKeyword
);

  wire [10:0] _ram_ext_R0_data;
  reg  [1:0]  enq_ptr_value;
  reg  [1:0]  deq_ptr_value;
  reg         maybe_full;
  wire        ptr_match = enq_ptr_value == deq_ptr_value;
  wire        empty = ptr_match & ~maybe_full;
  wire        io_deq_valid_0 = io_enq_valid | ~empty;
  wire        do_deq = ~empty & io_deq_ready & io_deq_valid_0;
  wire        do_enq = ~(empty & io_deq_ready) & ~(ptr_match & maybe_full) & io_enq_valid;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      enq_ptr_value <= 2'h0;
      deq_ptr_value <= 2'h0;
      maybe_full <= 1'h0;
    end
    else begin
      if (do_enq)
        enq_ptr_value <= 2'(enq_ptr_value + 2'h1);
      if (do_deq)
        deq_ptr_value <= 2'(deq_ptr_value + 2'h1);
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
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
        enq_ptr_value = _RANDOM[/*Zero width*/ 1'b0][1:0];
        deq_ptr_value = _RANDOM[/*Zero width*/ 1'b0][3:2];
        maybe_full = _RANDOM[/*Zero width*/ 1'b0][4];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        enq_ptr_value = 2'h0;
        deq_ptr_value = 2'h0;
        maybe_full = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ram_4x11 ram_ext (
    .R0_addr (deq_ptr_value),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (enq_ptr_value),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_isKeyword, io_enq_bits_opcode, io_enq_bits_source})
  );
  assign io_deq_valid = io_deq_valid_0;
  assign io_deq_bits_source = empty ? io_enq_bits_source : _ram_ext_R0_data[6:0];
  assign io_deq_bits_opcode = empty ? io_enq_bits_opcode : _ram_ext_R0_data[9:7];
  assign io_deq_bits_isKeyword = empty ? io_enq_bits_isKeyword : _ram_ext_R0_data[10];
endmodule

