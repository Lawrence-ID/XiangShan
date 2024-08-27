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
module Queue2_AXI4BundleR_19(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [4:0]  io_enq_bits_id,
  input  [63:0] io_enq_bits_data,
  input  [1:0]  io_enq_bits_resp,
  input         io_enq_bits_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [4:0]  io_deq_bits_id,
  output [63:0] io_deq_bits_data,
  output [1:0]  io_deq_bits_resp,
  output        io_deq_bits_last
);

  wire [71:0] _ram_ext_R0_data;
  reg         wrap;
  reg         wrap_1;
  reg         maybe_full;
  wire        ptr_match = wrap == wrap_1;
  wire        empty = ptr_match & ~maybe_full;
  wire        full = ptr_match & maybe_full;
  wire        do_enq = ~full & io_enq_valid;
  wire        do_deq = io_deq_ready & ~empty;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wrap <= 1'h0;
      wrap_1 <= 1'h0;
      maybe_full <= 1'h0;
    end
    else begin
      if (do_enq)
        wrap <= 1'(wrap - 1'h1);
      if (do_deq)
        wrap_1 <= 1'(wrap_1 - 1'h1);
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
        wrap = _RANDOM[/*Zero width*/ 1'b0][0];
        wrap_1 = _RANDOM[/*Zero width*/ 1'b0][1];
        maybe_full = _RANDOM[/*Zero width*/ 1'b0][2];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        wrap = 1'h0;
        wrap_1 = 1'h0;
        maybe_full = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ram_2x72 ram_ext (
    .R0_addr (wrap_1),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (wrap),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_last, io_enq_bits_resp, io_enq_bits_data, io_enq_bits_id})
  );
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_id = _ram_ext_R0_data[4:0];
  assign io_deq_bits_data = _ram_ext_R0_data[68:5];
  assign io_deq_bits_resp = _ram_ext_R0_data[70:69];
  assign io_deq_bits_last = _ram_ext_R0_data[71];
endmodule

