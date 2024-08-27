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
module Queue1_RegMapperInput(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_read,
  input  [22:0] io_enq_bits_index,
  input  [63:0] io_enq_bits_data,
  input  [7:0]  io_enq_bits_mask,
  input  [5:0]  io_enq_bits_extra_tlrr_extra_source,
  input  [1:0]  io_enq_bits_extra_tlrr_extra_size,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_read,
  output [22:0] io_deq_bits_index,
  output [63:0] io_deq_bits_data,
  output [7:0]  io_deq_bits_mask,
  output [5:0]  io_deq_bits_extra_tlrr_extra_source,
  output [1:0]  io_deq_bits_extra_tlrr_extra_size
);

  reg  [103:0] ram;
  reg          full;
  wire         do_enq = ~full & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <=
        {io_enq_bits_extra_tlrr_extra_size,
         io_enq_bits_extra_tlrr_extra_source,
         io_enq_bits_mask,
         io_enq_bits_data,
         io_enq_bits_index,
         io_enq_bits_read};
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge, posedge)
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
        ram = {_RANDOM[2'h0][31:1], _RANDOM[2'h1], _RANDOM[2'h2], _RANDOM[2'h3][8:0]};
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
  assign io_deq_valid = full;
  assign io_deq_bits_read = ram[0];
  assign io_deq_bits_index = ram[23:1];
  assign io_deq_bits_data = ram[87:24];
  assign io_deq_bits_mask = ram[95:88];
  assign io_deq_bits_extra_tlrr_extra_source = ram[101:96];
  assign io_deq_bits_extra_tlrr_extra_size = ram[103:102];
endmodule

