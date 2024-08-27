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
module CustomL1Hint(
  input         clock,
  input         reset,
  input         io_s1_valid,
  input  [2:0]  io_s1_bits_channel,
  input         io_s1_bits_isKeyword,
  input  [2:0]  io_s1_bits_opcode,
  input  [6:0]  io_s1_bits_sourceId,
  input         io_s1_bits_mshrTask,
  input         io_s1_bits_mergeA,
  input         io_s1_bits_aMergeTask_isKeyword,
  input  [2:0]  io_s1_bits_aMergeTask_opcode,
  input  [6:0]  io_s1_bits_aMergeTask_sourceId,
  input         io_s3_task_valid,
  input  [2:0]  io_s3_task_bits_channel,
  input         io_s3_task_bits_isKeyword,
  input  [2:0]  io_s3_task_bits_opcode,
  input  [6:0]  io_s3_task_bits_sourceId,
  input         io_s3_task_bits_mshrTask,
  input         io_s3_need_mshr,
  input         io_l1Hint_ready,
  output        io_l1Hint_valid,
  output [31:0] io_l1Hint_bits_sourceId,
  output        io_l1Hint_bits_isKeyword
);

  wire       _hint_s1Queue_io_deq_valid;
  wire [6:0] _hint_s1Queue_io_deq_bits_source;
  wire [2:0] _hint_s1Queue_io_deq_bits_opcode;
  wire       _hint_s1Queue_io_deq_bits_isKeyword;
  wire       _hintQueue_io_enq_ready;
  wire       _hintQueue_io_deq_valid;
  wire [6:0] _hintQueue_io_deq_bits_source;
  wire [2:0] _hintQueue_io_deq_bits_opcode;
  wire       _mshr_Grant_s1_T = io_s1_valid & io_s1_bits_mshrTask;
  wire       mshr_GrantData_s1 =
    _mshr_Grant_s1_T
    & (io_s1_bits_channel[0] & io_s1_bits_opcode == 3'h5 | io_s1_bits_channel[0]
       & io_s1_bits_mergeA & io_s1_bits_aMergeTask_opcode == 3'h5);
  wire       mshr_Grant_s1 =
    _mshr_Grant_s1_T
    & (io_s1_bits_channel[0] & io_s1_bits_opcode == 3'h4 | io_s1_bits_channel[0]
       & io_s1_bits_mergeA & io_s1_bits_aMergeTask_opcode == 3'h4);
  wire       chn_Grant_s3 =
    io_s3_task_valid & ~io_s3_task_bits_mshrTask & ~io_s3_need_mshr
    & io_s3_task_bits_channel[0] & io_s3_task_bits_opcode == 3'h4;
  wire       enqValid_s3 =
    chn_Grant_s3 | io_s3_task_valid & ~io_s3_task_bits_mshrTask & ~io_s3_need_mshr
    & io_s3_task_bits_channel[0] & io_s3_task_bits_opcode == 3'h5;
  Queue16_HintQueueEntry hintQueue (
    .clock                 (clock),
    .reset                 (reset),
    .io_enq_ready          (_hintQueue_io_enq_ready),
    .io_enq_valid          (enqValid_s3 | _hint_s1Queue_io_deq_valid),
    .io_enq_bits_source
      (enqValid_s3 ? io_s3_task_bits_sourceId : _hint_s1Queue_io_deq_bits_source),
    .io_enq_bits_opcode
      (enqValid_s3 ? {2'h2, ~chn_Grant_s3} : _hint_s1Queue_io_deq_bits_opcode),
    .io_enq_bits_isKeyword
      (enqValid_s3 ? io_s3_task_bits_isKeyword : _hint_s1Queue_io_deq_bits_isKeyword),
    .io_deq_ready          (io_l1Hint_ready),
    .io_deq_valid          (_hintQueue_io_deq_valid),
    .io_deq_bits_source    (_hintQueue_io_deq_bits_source),
    .io_deq_bits_opcode    (_hintQueue_io_deq_bits_opcode),
    .io_deq_bits_isKeyword (io_l1Hint_bits_isKeyword)
  );
  Queue4_HintQueueEntry hint_s1Queue (
    .clock                 (clock),
    .reset                 (reset),
    .io_enq_valid
      (mshr_GrantData_s1 | mshr_Grant_s1 | io_s1_valid & ~io_s1_bits_mshrTask
       & io_s1_bits_channel[2] & (io_s1_bits_opcode == 3'h6 | (&io_s1_bits_opcode))),
    .io_enq_bits_source
      (io_s1_bits_mergeA ? io_s1_bits_aMergeTask_sourceId : io_s1_bits_sourceId),
    .io_enq_bits_opcode    (mshr_Grant_s1 ? 3'h4 : mshr_GrantData_s1 ? 3'h5 : 3'h6),
    .io_enq_bits_isKeyword
      (io_s1_bits_mergeA ? io_s1_bits_aMergeTask_isKeyword : io_s1_bits_isKeyword),
    .io_deq_ready          (_hintQueue_io_enq_ready & ~enqValid_s3),
    .io_deq_valid          (_hint_s1Queue_io_deq_valid),
    .io_deq_bits_source    (_hint_s1Queue_io_deq_bits_source),
    .io_deq_bits_opcode    (_hint_s1Queue_io_deq_bits_opcode),
    .io_deq_bits_isKeyword (_hint_s1Queue_io_deq_bits_isKeyword)
  );
  assign io_l1Hint_valid =
    _hintQueue_io_deq_valid & _hintQueue_io_deq_bits_opcode == 3'h5;
  assign io_l1Hint_bits_sourceId = {25'h0, _hintQueue_io_deq_bits_source};
endmodule

