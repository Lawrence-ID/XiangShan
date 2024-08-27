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
module Pipeline_2(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [20:0] io_in_bits_tag,
  input  [8:0]  io_in_bits_set,
  input         io_in_bits_needT,
  input  [6:0]  io_in_bits_source,
  input  [32:0] io_in_bits_vaddr,
  input         io_in_bits_hit,
  input         io_in_bits_prefetched,
  input  [2:0]  io_in_bits_pfsource,
  input  [3:0]  io_in_bits_reqsource,
  input         io_out_ready,
  output        io_out_valid,
  output [20:0] io_out_bits_tag,
  output [8:0]  io_out_bits_set,
  output        io_out_bits_needT,
  output [6:0]  io_out_bits_source,
  output [32:0] io_out_bits_vaddr,
  output [3:0]  io_out_bits_reqsource
);

  Queue1_PrefetchTrain stages_0 (
    .clock                  (clock),
    .reset                  (reset),
    .io_enq_valid           (io_in_valid),
    .io_enq_bits_tag        (io_in_bits_tag),
    .io_enq_bits_set        (io_in_bits_set),
    .io_enq_bits_needT      (io_in_bits_needT),
    .io_enq_bits_source     (io_in_bits_source),
    .io_enq_bits_vaddr      (io_in_bits_vaddr),
    .io_enq_bits_hit        (io_in_bits_hit),
    .io_enq_bits_prefetched (io_in_bits_prefetched),
    .io_enq_bits_pfsource   (io_in_bits_pfsource),
    .io_enq_bits_reqsource  (io_in_bits_reqsource),
    .io_deq_ready           (io_out_ready),
    .io_deq_valid           (io_out_valid),
    .io_deq_bits_tag        (io_out_bits_tag),
    .io_deq_bits_set        (io_out_bits_set),
    .io_deq_bits_needT      (io_out_bits_needT),
    .io_deq_bits_source     (io_out_bits_source),
    .io_deq_bits_vaddr      (io_out_bits_vaddr),
    .io_deq_bits_reqsource  (io_out_bits_reqsource)
  );
endmodule

