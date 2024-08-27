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
module Queue1_AXI4BundleARW(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [4:0]  io_enq_bits_id,
  input  [30:0] io_enq_bits_addr,
  input  [7:0]  io_enq_bits_len,
  input  [2:0]  io_enq_bits_size,
  input  [3:0]  io_enq_bits_cache,
  input  [2:0]  io_enq_bits_prot,
  input  [3:0]  io_enq_bits_echo_tl_state_size,
  input  [5:0]  io_enq_bits_echo_tl_state_source,
  input         io_enq_bits_wen,
  input         io_deq_ready,
  output        io_deq_valid,
  output [4:0]  io_deq_bits_id,
  output [30:0] io_deq_bits_addr,
  output [7:0]  io_deq_bits_len,
  output [2:0]  io_deq_bits_size,
  output [1:0]  io_deq_bits_burst,
  output        io_deq_bits_lock,
  output [3:0]  io_deq_bits_cache,
  output [2:0]  io_deq_bits_prot,
  output [3:0]  io_deq_bits_qos,
  output [3:0]  io_deq_bits_echo_tl_state_size,
  output [5:0]  io_deq_bits_echo_tl_state_source,
  output        io_deq_bits_wen
);

  reg  [71:0] ram;
  reg         full;
  wire        io_deq_valid_0 = io_enq_valid | full;
  wire        do_enq = ~(~full & io_deq_ready) & ~full & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <=
        {io_enq_bits_wen,
         io_enq_bits_echo_tl_state_source,
         io_enq_bits_echo_tl_state_size,
         4'h0,
         io_enq_bits_prot,
         io_enq_bits_cache,
         3'h1,
         io_enq_bits_size,
         io_enq_bits_len,
         io_enq_bits_addr,
         io_enq_bits_id};
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (full & io_deq_ready & io_deq_valid_0)))
      full <= do_enq;
  end // always @(posedge, posedge)
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
        ram = {_RANDOM[2'h0][31:1], _RANDOM[2'h1], _RANDOM[2'h2][8:0]};
        full = _RANDOM[2'h0][0];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        full = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_enq_ready = ~full;
  assign io_deq_valid = io_deq_valid_0;
  assign io_deq_bits_id = full ? ram[4:0] : io_enq_bits_id;
  assign io_deq_bits_addr = full ? ram[35:5] : io_enq_bits_addr;
  assign io_deq_bits_len = full ? ram[43:36] : io_enq_bits_len;
  assign io_deq_bits_size = full ? ram[46:44] : io_enq_bits_size;
  assign io_deq_bits_burst = full ? ram[48:47] : 2'h1;
  assign io_deq_bits_lock = full & ram[49];
  assign io_deq_bits_cache = full ? ram[53:50] : io_enq_bits_cache;
  assign io_deq_bits_prot = full ? ram[56:54] : io_enq_bits_prot;
  assign io_deq_bits_qos = full ? ram[60:57] : 4'h0;
  assign io_deq_bits_echo_tl_state_size =
    full ? ram[64:61] : io_enq_bits_echo_tl_state_size;
  assign io_deq_bits_echo_tl_state_source =
    full ? ram[70:65] : io_enq_bits_echo_tl_state_source;
  assign io_deq_bits_wen = full ? ram[71] : io_enq_bits_wen;
endmodule

