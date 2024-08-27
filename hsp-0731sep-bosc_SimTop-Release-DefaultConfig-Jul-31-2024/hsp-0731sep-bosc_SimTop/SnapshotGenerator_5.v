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
module SnapshotGenerator_5(
  input        clock,
  input        reset,
  input        io_enq,
  input  [7:0] io_enqData_0,
  input  [7:0] io_enqData_1,
  input  [7:0] io_enqData_2,
  input  [7:0] io_enqData_3,
  input  [7:0] io_enqData_4,
  input  [7:0] io_enqData_5,
  input  [7:0] io_enqData_6,
  input  [7:0] io_enqData_7,
  input  [7:0] io_enqData_8,
  input  [7:0] io_enqData_9,
  input  [7:0] io_enqData_10,
  input  [7:0] io_enqData_11,
  input  [7:0] io_enqData_12,
  input  [7:0] io_enqData_13,
  input  [7:0] io_enqData_14,
  input  [7:0] io_enqData_15,
  input  [7:0] io_enqData_16,
  input  [7:0] io_enqData_17,
  input  [7:0] io_enqData_18,
  input  [7:0] io_enqData_19,
  input  [7:0] io_enqData_20,
  input  [7:0] io_enqData_21,
  input  [7:0] io_enqData_22,
  input  [7:0] io_enqData_23,
  input  [7:0] io_enqData_24,
  input  [7:0] io_enqData_25,
  input  [7:0] io_enqData_26,
  input  [7:0] io_enqData_27,
  input  [7:0] io_enqData_28,
  input  [7:0] io_enqData_29,
  input  [7:0] io_enqData_30,
  input  [7:0] io_enqData_31,
  input  [7:0] io_enqData_32,
  input  [7:0] io_enqData_33,
  input        io_deq,
  input        io_redirect,
  input        io_flushVec_0,
  input        io_flushVec_1,
  input        io_flushVec_2,
  input        io_flushVec_3,
  output [7:0] io_snapshots_0_0,
  output [7:0] io_snapshots_0_1,
  output [7:0] io_snapshots_0_2,
  output [7:0] io_snapshots_0_3,
  output [7:0] io_snapshots_0_4,
  output [7:0] io_snapshots_0_5,
  output [7:0] io_snapshots_0_6,
  output [7:0] io_snapshots_0_7,
  output [7:0] io_snapshots_0_8,
  output [7:0] io_snapshots_0_9,
  output [7:0] io_snapshots_0_10,
  output [7:0] io_snapshots_0_11,
  output [7:0] io_snapshots_0_12,
  output [7:0] io_snapshots_0_13,
  output [7:0] io_snapshots_0_14,
  output [7:0] io_snapshots_0_15,
  output [7:0] io_snapshots_0_16,
  output [7:0] io_snapshots_0_17,
  output [7:0] io_snapshots_0_18,
  output [7:0] io_snapshots_0_19,
  output [7:0] io_snapshots_0_20,
  output [7:0] io_snapshots_0_21,
  output [7:0] io_snapshots_0_22,
  output [7:0] io_snapshots_0_23,
  output [7:0] io_snapshots_0_24,
  output [7:0] io_snapshots_0_25,
  output [7:0] io_snapshots_0_26,
  output [7:0] io_snapshots_0_27,
  output [7:0] io_snapshots_0_28,
  output [7:0] io_snapshots_0_29,
  output [7:0] io_snapshots_0_30,
  output [7:0] io_snapshots_0_31,
  output [7:0] io_snapshots_0_32,
  output [7:0] io_snapshots_0_33,
  output [7:0] io_snapshots_1_0,
  output [7:0] io_snapshots_1_1,
  output [7:0] io_snapshots_1_2,
  output [7:0] io_snapshots_1_3,
  output [7:0] io_snapshots_1_4,
  output [7:0] io_snapshots_1_5,
  output [7:0] io_snapshots_1_6,
  output [7:0] io_snapshots_1_7,
  output [7:0] io_snapshots_1_8,
  output [7:0] io_snapshots_1_9,
  output [7:0] io_snapshots_1_10,
  output [7:0] io_snapshots_1_11,
  output [7:0] io_snapshots_1_12,
  output [7:0] io_snapshots_1_13,
  output [7:0] io_snapshots_1_14,
  output [7:0] io_snapshots_1_15,
  output [7:0] io_snapshots_1_16,
  output [7:0] io_snapshots_1_17,
  output [7:0] io_snapshots_1_18,
  output [7:0] io_snapshots_1_19,
  output [7:0] io_snapshots_1_20,
  output [7:0] io_snapshots_1_21,
  output [7:0] io_snapshots_1_22,
  output [7:0] io_snapshots_1_23,
  output [7:0] io_snapshots_1_24,
  output [7:0] io_snapshots_1_25,
  output [7:0] io_snapshots_1_26,
  output [7:0] io_snapshots_1_27,
  output [7:0] io_snapshots_1_28,
  output [7:0] io_snapshots_1_29,
  output [7:0] io_snapshots_1_30,
  output [7:0] io_snapshots_1_31,
  output [7:0] io_snapshots_1_32,
  output [7:0] io_snapshots_1_33,
  output [7:0] io_snapshots_2_0,
  output [7:0] io_snapshots_2_1,
  output [7:0] io_snapshots_2_2,
  output [7:0] io_snapshots_2_3,
  output [7:0] io_snapshots_2_4,
  output [7:0] io_snapshots_2_5,
  output [7:0] io_snapshots_2_6,
  output [7:0] io_snapshots_2_7,
  output [7:0] io_snapshots_2_8,
  output [7:0] io_snapshots_2_9,
  output [7:0] io_snapshots_2_10,
  output [7:0] io_snapshots_2_11,
  output [7:0] io_snapshots_2_12,
  output [7:0] io_snapshots_2_13,
  output [7:0] io_snapshots_2_14,
  output [7:0] io_snapshots_2_15,
  output [7:0] io_snapshots_2_16,
  output [7:0] io_snapshots_2_17,
  output [7:0] io_snapshots_2_18,
  output [7:0] io_snapshots_2_19,
  output [7:0] io_snapshots_2_20,
  output [7:0] io_snapshots_2_21,
  output [7:0] io_snapshots_2_22,
  output [7:0] io_snapshots_2_23,
  output [7:0] io_snapshots_2_24,
  output [7:0] io_snapshots_2_25,
  output [7:0] io_snapshots_2_26,
  output [7:0] io_snapshots_2_27,
  output [7:0] io_snapshots_2_28,
  output [7:0] io_snapshots_2_29,
  output [7:0] io_snapshots_2_30,
  output [7:0] io_snapshots_2_31,
  output [7:0] io_snapshots_2_32,
  output [7:0] io_snapshots_2_33,
  output [7:0] io_snapshots_3_0,
  output [7:0] io_snapshots_3_1,
  output [7:0] io_snapshots_3_2,
  output [7:0] io_snapshots_3_3,
  output [7:0] io_snapshots_3_4,
  output [7:0] io_snapshots_3_5,
  output [7:0] io_snapshots_3_6,
  output [7:0] io_snapshots_3_7,
  output [7:0] io_snapshots_3_8,
  output [7:0] io_snapshots_3_9,
  output [7:0] io_snapshots_3_10,
  output [7:0] io_snapshots_3_11,
  output [7:0] io_snapshots_3_12,
  output [7:0] io_snapshots_3_13,
  output [7:0] io_snapshots_3_14,
  output [7:0] io_snapshots_3_15,
  output [7:0] io_snapshots_3_16,
  output [7:0] io_snapshots_3_17,
  output [7:0] io_snapshots_3_18,
  output [7:0] io_snapshots_3_19,
  output [7:0] io_snapshots_3_20,
  output [7:0] io_snapshots_3_21,
  output [7:0] io_snapshots_3_22,
  output [7:0] io_snapshots_3_23,
  output [7:0] io_snapshots_3_24,
  output [7:0] io_snapshots_3_25,
  output [7:0] io_snapshots_3_26,
  output [7:0] io_snapshots_3_27,
  output [7:0] io_snapshots_3_28,
  output [7:0] io_snapshots_3_29,
  output [7:0] io_snapshots_3_30,
  output [7:0] io_snapshots_3_31,
  output [7:0] io_snapshots_3_32,
  output [7:0] io_snapshots_3_33
);

  reg  [7:0] snapshots_0_0;
  reg  [7:0] snapshots_0_1;
  reg  [7:0] snapshots_0_2;
  reg  [7:0] snapshots_0_3;
  reg  [7:0] snapshots_0_4;
  reg  [7:0] snapshots_0_5;
  reg  [7:0] snapshots_0_6;
  reg  [7:0] snapshots_0_7;
  reg  [7:0] snapshots_0_8;
  reg  [7:0] snapshots_0_9;
  reg  [7:0] snapshots_0_10;
  reg  [7:0] snapshots_0_11;
  reg  [7:0] snapshots_0_12;
  reg  [7:0] snapshots_0_13;
  reg  [7:0] snapshots_0_14;
  reg  [7:0] snapshots_0_15;
  reg  [7:0] snapshots_0_16;
  reg  [7:0] snapshots_0_17;
  reg  [7:0] snapshots_0_18;
  reg  [7:0] snapshots_0_19;
  reg  [7:0] snapshots_0_20;
  reg  [7:0] snapshots_0_21;
  reg  [7:0] snapshots_0_22;
  reg  [7:0] snapshots_0_23;
  reg  [7:0] snapshots_0_24;
  reg  [7:0] snapshots_0_25;
  reg  [7:0] snapshots_0_26;
  reg  [7:0] snapshots_0_27;
  reg  [7:0] snapshots_0_28;
  reg  [7:0] snapshots_0_29;
  reg  [7:0] snapshots_0_30;
  reg  [7:0] snapshots_0_31;
  reg  [7:0] snapshots_0_32;
  reg  [7:0] snapshots_0_33;
  reg  [7:0] snapshots_1_0;
  reg  [7:0] snapshots_1_1;
  reg  [7:0] snapshots_1_2;
  reg  [7:0] snapshots_1_3;
  reg  [7:0] snapshots_1_4;
  reg  [7:0] snapshots_1_5;
  reg  [7:0] snapshots_1_6;
  reg  [7:0] snapshots_1_7;
  reg  [7:0] snapshots_1_8;
  reg  [7:0] snapshots_1_9;
  reg  [7:0] snapshots_1_10;
  reg  [7:0] snapshots_1_11;
  reg  [7:0] snapshots_1_12;
  reg  [7:0] snapshots_1_13;
  reg  [7:0] snapshots_1_14;
  reg  [7:0] snapshots_1_15;
  reg  [7:0] snapshots_1_16;
  reg  [7:0] snapshots_1_17;
  reg  [7:0] snapshots_1_18;
  reg  [7:0] snapshots_1_19;
  reg  [7:0] snapshots_1_20;
  reg  [7:0] snapshots_1_21;
  reg  [7:0] snapshots_1_22;
  reg  [7:0] snapshots_1_23;
  reg  [7:0] snapshots_1_24;
  reg  [7:0] snapshots_1_25;
  reg  [7:0] snapshots_1_26;
  reg  [7:0] snapshots_1_27;
  reg  [7:0] snapshots_1_28;
  reg  [7:0] snapshots_1_29;
  reg  [7:0] snapshots_1_30;
  reg  [7:0] snapshots_1_31;
  reg  [7:0] snapshots_1_32;
  reg  [7:0] snapshots_1_33;
  reg  [7:0] snapshots_2_0;
  reg  [7:0] snapshots_2_1;
  reg  [7:0] snapshots_2_2;
  reg  [7:0] snapshots_2_3;
  reg  [7:0] snapshots_2_4;
  reg  [7:0] snapshots_2_5;
  reg  [7:0] snapshots_2_6;
  reg  [7:0] snapshots_2_7;
  reg  [7:0] snapshots_2_8;
  reg  [7:0] snapshots_2_9;
  reg  [7:0] snapshots_2_10;
  reg  [7:0] snapshots_2_11;
  reg  [7:0] snapshots_2_12;
  reg  [7:0] snapshots_2_13;
  reg  [7:0] snapshots_2_14;
  reg  [7:0] snapshots_2_15;
  reg  [7:0] snapshots_2_16;
  reg  [7:0] snapshots_2_17;
  reg  [7:0] snapshots_2_18;
  reg  [7:0] snapshots_2_19;
  reg  [7:0] snapshots_2_20;
  reg  [7:0] snapshots_2_21;
  reg  [7:0] snapshots_2_22;
  reg  [7:0] snapshots_2_23;
  reg  [7:0] snapshots_2_24;
  reg  [7:0] snapshots_2_25;
  reg  [7:0] snapshots_2_26;
  reg  [7:0] snapshots_2_27;
  reg  [7:0] snapshots_2_28;
  reg  [7:0] snapshots_2_29;
  reg  [7:0] snapshots_2_30;
  reg  [7:0] snapshots_2_31;
  reg  [7:0] snapshots_2_32;
  reg  [7:0] snapshots_2_33;
  reg  [7:0] snapshots_3_0;
  reg  [7:0] snapshots_3_1;
  reg  [7:0] snapshots_3_2;
  reg  [7:0] snapshots_3_3;
  reg  [7:0] snapshots_3_4;
  reg  [7:0] snapshots_3_5;
  reg  [7:0] snapshots_3_6;
  reg  [7:0] snapshots_3_7;
  reg  [7:0] snapshots_3_8;
  reg  [7:0] snapshots_3_9;
  reg  [7:0] snapshots_3_10;
  reg  [7:0] snapshots_3_11;
  reg  [7:0] snapshots_3_12;
  reg  [7:0] snapshots_3_13;
  reg  [7:0] snapshots_3_14;
  reg  [7:0] snapshots_3_15;
  reg  [7:0] snapshots_3_16;
  reg  [7:0] snapshots_3_17;
  reg  [7:0] snapshots_3_18;
  reg  [7:0] snapshots_3_19;
  reg  [7:0] snapshots_3_20;
  reg  [7:0] snapshots_3_21;
  reg  [7:0] snapshots_3_22;
  reg  [7:0] snapshots_3_23;
  reg  [7:0] snapshots_3_24;
  reg  [7:0] snapshots_3_25;
  reg  [7:0] snapshots_3_26;
  reg  [7:0] snapshots_3_27;
  reg  [7:0] snapshots_3_28;
  reg  [7:0] snapshots_3_29;
  reg  [7:0] snapshots_3_30;
  reg  [7:0] snapshots_3_31;
  reg  [7:0] snapshots_3_32;
  reg  [7:0] snapshots_3_33;
  reg        snptEnqPtr_flag;
  reg  [1:0] snptEnqPtr_value;
  reg        snptDeqPtr_flag;
  reg  [1:0] snptDeqPtr_value;
  reg        snptValids_0;
  reg        snptValids_1;
  reg        snptValids_2;
  reg        snptValids_3;
  wire       _GEN =
    ~io_redirect
    & ~(snptEnqPtr_flag != snptDeqPtr_flag & snptEnqPtr_value == snptDeqPtr_value)
    & io_enq;
  wire       _GEN_0 = _GEN & snptEnqPtr_value == 2'h0;
  wire       _GEN_1 = _GEN & snptEnqPtr_value == 2'h1;
  wire       _GEN_2 = _GEN & snptEnqPtr_value == 2'h2;
  wire       _GEN_3 = _GEN & (&snptEnqPtr_value);
  always @(posedge clock) begin
    if (_GEN_0) begin
      snapshots_0_0 <= io_enqData_0;
      snapshots_0_1 <= io_enqData_1;
      snapshots_0_2 <= io_enqData_2;
      snapshots_0_3 <= io_enqData_3;
      snapshots_0_4 <= io_enqData_4;
      snapshots_0_5 <= io_enqData_5;
      snapshots_0_6 <= io_enqData_6;
      snapshots_0_7 <= io_enqData_7;
      snapshots_0_8 <= io_enqData_8;
      snapshots_0_9 <= io_enqData_9;
      snapshots_0_10 <= io_enqData_10;
      snapshots_0_11 <= io_enqData_11;
      snapshots_0_12 <= io_enqData_12;
      snapshots_0_13 <= io_enqData_13;
      snapshots_0_14 <= io_enqData_14;
      snapshots_0_15 <= io_enqData_15;
      snapshots_0_16 <= io_enqData_16;
      snapshots_0_17 <= io_enqData_17;
      snapshots_0_18 <= io_enqData_18;
      snapshots_0_19 <= io_enqData_19;
      snapshots_0_20 <= io_enqData_20;
      snapshots_0_21 <= io_enqData_21;
      snapshots_0_22 <= io_enqData_22;
      snapshots_0_23 <= io_enqData_23;
      snapshots_0_24 <= io_enqData_24;
      snapshots_0_25 <= io_enqData_25;
      snapshots_0_26 <= io_enqData_26;
      snapshots_0_27 <= io_enqData_27;
      snapshots_0_28 <= io_enqData_28;
      snapshots_0_29 <= io_enqData_29;
      snapshots_0_30 <= io_enqData_30;
      snapshots_0_31 <= io_enqData_31;
      snapshots_0_32 <= io_enqData_32;
      snapshots_0_33 <= io_enqData_33;
    end
    if (_GEN_1) begin
      snapshots_1_0 <= io_enqData_0;
      snapshots_1_1 <= io_enqData_1;
      snapshots_1_2 <= io_enqData_2;
      snapshots_1_3 <= io_enqData_3;
      snapshots_1_4 <= io_enqData_4;
      snapshots_1_5 <= io_enqData_5;
      snapshots_1_6 <= io_enqData_6;
      snapshots_1_7 <= io_enqData_7;
      snapshots_1_8 <= io_enqData_8;
      snapshots_1_9 <= io_enqData_9;
      snapshots_1_10 <= io_enqData_10;
      snapshots_1_11 <= io_enqData_11;
      snapshots_1_12 <= io_enqData_12;
      snapshots_1_13 <= io_enqData_13;
      snapshots_1_14 <= io_enqData_14;
      snapshots_1_15 <= io_enqData_15;
      snapshots_1_16 <= io_enqData_16;
      snapshots_1_17 <= io_enqData_17;
      snapshots_1_18 <= io_enqData_18;
      snapshots_1_19 <= io_enqData_19;
      snapshots_1_20 <= io_enqData_20;
      snapshots_1_21 <= io_enqData_21;
      snapshots_1_22 <= io_enqData_22;
      snapshots_1_23 <= io_enqData_23;
      snapshots_1_24 <= io_enqData_24;
      snapshots_1_25 <= io_enqData_25;
      snapshots_1_26 <= io_enqData_26;
      snapshots_1_27 <= io_enqData_27;
      snapshots_1_28 <= io_enqData_28;
      snapshots_1_29 <= io_enqData_29;
      snapshots_1_30 <= io_enqData_30;
      snapshots_1_31 <= io_enqData_31;
      snapshots_1_32 <= io_enqData_32;
      snapshots_1_33 <= io_enqData_33;
    end
    if (_GEN_2) begin
      snapshots_2_0 <= io_enqData_0;
      snapshots_2_1 <= io_enqData_1;
      snapshots_2_2 <= io_enqData_2;
      snapshots_2_3 <= io_enqData_3;
      snapshots_2_4 <= io_enqData_4;
      snapshots_2_5 <= io_enqData_5;
      snapshots_2_6 <= io_enqData_6;
      snapshots_2_7 <= io_enqData_7;
      snapshots_2_8 <= io_enqData_8;
      snapshots_2_9 <= io_enqData_9;
      snapshots_2_10 <= io_enqData_10;
      snapshots_2_11 <= io_enqData_11;
      snapshots_2_12 <= io_enqData_12;
      snapshots_2_13 <= io_enqData_13;
      snapshots_2_14 <= io_enqData_14;
      snapshots_2_15 <= io_enqData_15;
      snapshots_2_16 <= io_enqData_16;
      snapshots_2_17 <= io_enqData_17;
      snapshots_2_18 <= io_enqData_18;
      snapshots_2_19 <= io_enqData_19;
      snapshots_2_20 <= io_enqData_20;
      snapshots_2_21 <= io_enqData_21;
      snapshots_2_22 <= io_enqData_22;
      snapshots_2_23 <= io_enqData_23;
      snapshots_2_24 <= io_enqData_24;
      snapshots_2_25 <= io_enqData_25;
      snapshots_2_26 <= io_enqData_26;
      snapshots_2_27 <= io_enqData_27;
      snapshots_2_28 <= io_enqData_28;
      snapshots_2_29 <= io_enqData_29;
      snapshots_2_30 <= io_enqData_30;
      snapshots_2_31 <= io_enqData_31;
      snapshots_2_32 <= io_enqData_32;
      snapshots_2_33 <= io_enqData_33;
    end
    if (_GEN_3) begin
      snapshots_3_0 <= io_enqData_0;
      snapshots_3_1 <= io_enqData_1;
      snapshots_3_2 <= io_enqData_2;
      snapshots_3_3 <= io_enqData_3;
      snapshots_3_4 <= io_enqData_4;
      snapshots_3_5 <= io_enqData_5;
      snapshots_3_6 <= io_enqData_6;
      snapshots_3_7 <= io_enqData_7;
      snapshots_3_8 <= io_enqData_8;
      snapshots_3_9 <= io_enqData_9;
      snapshots_3_10 <= io_enqData_10;
      snapshots_3_11 <= io_enqData_11;
      snapshots_3_12 <= io_enqData_12;
      snapshots_3_13 <= io_enqData_13;
      snapshots_3_14 <= io_enqData_14;
      snapshots_3_15 <= io_enqData_15;
      snapshots_3_16 <= io_enqData_16;
      snapshots_3_17 <= io_enqData_17;
      snapshots_3_18 <= io_enqData_18;
      snapshots_3_19 <= io_enqData_19;
      snapshots_3_20 <= io_enqData_20;
      snapshots_3_21 <= io_enqData_21;
      snapshots_3_22 <= io_enqData_22;
      snapshots_3_23 <= io_enqData_23;
      snapshots_3_24 <= io_enqData_24;
      snapshots_3_25 <= io_enqData_25;
      snapshots_3_26 <= io_enqData_26;
      snapshots_3_27 <= io_enqData_27;
      snapshots_3_28 <= io_enqData_28;
      snapshots_3_29 <= io_enqData_29;
      snapshots_3_30 <= io_enqData_30;
      snapshots_3_31 <= io_enqData_31;
      snapshots_3_32 <= io_enqData_32;
      snapshots_3_33 <= io_enqData_33;
    end
  end // always @(posedge)
  wire [3:0] _GEN_4 = {{snptValids_3}, {snptValids_2}, {snptValids_1}, {snptValids_0}};
  wire [3:0] _GEN_5 =
    {{io_flushVec_3}, {io_flushVec_2}, {io_flushVec_1}, {io_flushVec_0}};
  wire       newEnqPtrQualified_0 = ~_GEN_4[snptDeqPtr_value] | _GEN_5[snptDeqPtr_value];
  wire [2:0] _snptEnqPtr_new_ptr_T_1 = 3'({snptEnqPtr_flag, snptEnqPtr_value} + 3'h1);
  wire       _GEN_6 = ~io_redirect & io_deq;
  wire [2:0] _GEN_7 = {snptDeqPtr_flag, snptDeqPtr_value};
  wire [2:0] _newEnqPtrCandidate_new_ptr_T_6 = 3'(_GEN_7 + 3'h1);
  wire [2:0] _newEnqPtrCandidate_new_ptr_T_11 = 3'(_GEN_7 + 3'h2);
  wire [2:0] _newEnqPtrCandidate_new_ptr_T_16 = 3'(_GEN_7 + 3'h3);
  wire       _GEN_8 = _GEN_4[_newEnqPtrCandidate_new_ptr_T_6[1:0]];
  wire       newEnqPtrQualified_1 =
    _GEN_8 & (~_GEN_8 | _GEN_5[_newEnqPtrCandidate_new_ptr_T_6[1:0]]);
  wire       _GEN_9 = _GEN_4[_newEnqPtrCandidate_new_ptr_T_11[1:0]];
  wire       newEnqPtrQualified_2 =
    _GEN_9 & (~_GEN_9 | _GEN_5[_newEnqPtrCandidate_new_ptr_T_11[1:0]]);
  wire [2:0] _snptDeqPtr_new_ptr_T_1 = 3'(_GEN_7 + 3'h1);
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      snptEnqPtr_flag <= 1'h0;
      snptEnqPtr_value <= 2'h0;
      snptDeqPtr_flag <= 1'h0;
      snptDeqPtr_value <= 2'h0;
      snptValids_0 <= 1'h0;
      snptValids_1 <= 1'h0;
      snptValids_2 <= 1'h0;
      snptValids_3 <= 1'h0;
    end
    else begin
      if (|({io_flushVec_0, io_flushVec_1, io_flushVec_2, io_flushVec_3}
            & {snptValids_0, snptValids_1, snptValids_2, snptValids_3})) begin
        snptEnqPtr_flag <=
          newEnqPtrQualified_0
            ? snptDeqPtr_flag
            : newEnqPtrQualified_1
                ? _newEnqPtrCandidate_new_ptr_T_6[2]
                : newEnqPtrQualified_2
                    ? _newEnqPtrCandidate_new_ptr_T_11[2]
                    : _newEnqPtrCandidate_new_ptr_T_16[2];
        snptEnqPtr_value <=
          newEnqPtrQualified_0
            ? snptDeqPtr_value
            : newEnqPtrQualified_1
                ? _newEnqPtrCandidate_new_ptr_T_6[1:0]
                : newEnqPtrQualified_2
                    ? _newEnqPtrCandidate_new_ptr_T_11[1:0]
                    : _newEnqPtrCandidate_new_ptr_T_16[1:0];
      end
      else if (_GEN) begin
        snptEnqPtr_flag <= _snptEnqPtr_new_ptr_T_1[2];
        snptEnqPtr_value <= _snptEnqPtr_new_ptr_T_1[1:0];
      end
      if (_GEN_6) begin
        snptDeqPtr_flag <= _snptDeqPtr_new_ptr_T_1[2];
        snptDeqPtr_value <= _snptDeqPtr_new_ptr_T_1[1:0];
      end
      snptValids_0 <=
        ~(io_flushVec_0 | _GEN_6 & snptDeqPtr_value == 2'h0) & (_GEN_0 | snptValids_0);
      snptValids_1 <=
        ~(io_flushVec_1 | _GEN_6 & snptDeqPtr_value == 2'h1) & (_GEN_1 | snptValids_1);
      snptValids_2 <=
        ~(io_flushVec_2 | _GEN_6 & snptDeqPtr_value == 2'h2) & (_GEN_2 | snptValids_2);
      snptValids_3 <=
        ~(io_flushVec_3 | _GEN_6 & (&snptDeqPtr_value)) & (_GEN_3 | snptValids_3);
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:34];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [5:0] i = 6'h0; i < 6'h23; i += 6'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        snapshots_0_0 = _RANDOM[6'h0][7:0];
        snapshots_0_1 = _RANDOM[6'h0][15:8];
        snapshots_0_2 = _RANDOM[6'h0][23:16];
        snapshots_0_3 = _RANDOM[6'h0][31:24];
        snapshots_0_4 = _RANDOM[6'h1][7:0];
        snapshots_0_5 = _RANDOM[6'h1][15:8];
        snapshots_0_6 = _RANDOM[6'h1][23:16];
        snapshots_0_7 = _RANDOM[6'h1][31:24];
        snapshots_0_8 = _RANDOM[6'h2][7:0];
        snapshots_0_9 = _RANDOM[6'h2][15:8];
        snapshots_0_10 = _RANDOM[6'h2][23:16];
        snapshots_0_11 = _RANDOM[6'h2][31:24];
        snapshots_0_12 = _RANDOM[6'h3][7:0];
        snapshots_0_13 = _RANDOM[6'h3][15:8];
        snapshots_0_14 = _RANDOM[6'h3][23:16];
        snapshots_0_15 = _RANDOM[6'h3][31:24];
        snapshots_0_16 = _RANDOM[6'h4][7:0];
        snapshots_0_17 = _RANDOM[6'h4][15:8];
        snapshots_0_18 = _RANDOM[6'h4][23:16];
        snapshots_0_19 = _RANDOM[6'h4][31:24];
        snapshots_0_20 = _RANDOM[6'h5][7:0];
        snapshots_0_21 = _RANDOM[6'h5][15:8];
        snapshots_0_22 = _RANDOM[6'h5][23:16];
        snapshots_0_23 = _RANDOM[6'h5][31:24];
        snapshots_0_24 = _RANDOM[6'h6][7:0];
        snapshots_0_25 = _RANDOM[6'h6][15:8];
        snapshots_0_26 = _RANDOM[6'h6][23:16];
        snapshots_0_27 = _RANDOM[6'h6][31:24];
        snapshots_0_28 = _RANDOM[6'h7][7:0];
        snapshots_0_29 = _RANDOM[6'h7][15:8];
        snapshots_0_30 = _RANDOM[6'h7][23:16];
        snapshots_0_31 = _RANDOM[6'h7][31:24];
        snapshots_0_32 = _RANDOM[6'h8][7:0];
        snapshots_0_33 = _RANDOM[6'h8][15:8];
        snapshots_1_0 = _RANDOM[6'h8][23:16];
        snapshots_1_1 = _RANDOM[6'h8][31:24];
        snapshots_1_2 = _RANDOM[6'h9][7:0];
        snapshots_1_3 = _RANDOM[6'h9][15:8];
        snapshots_1_4 = _RANDOM[6'h9][23:16];
        snapshots_1_5 = _RANDOM[6'h9][31:24];
        snapshots_1_6 = _RANDOM[6'hA][7:0];
        snapshots_1_7 = _RANDOM[6'hA][15:8];
        snapshots_1_8 = _RANDOM[6'hA][23:16];
        snapshots_1_9 = _RANDOM[6'hA][31:24];
        snapshots_1_10 = _RANDOM[6'hB][7:0];
        snapshots_1_11 = _RANDOM[6'hB][15:8];
        snapshots_1_12 = _RANDOM[6'hB][23:16];
        snapshots_1_13 = _RANDOM[6'hB][31:24];
        snapshots_1_14 = _RANDOM[6'hC][7:0];
        snapshots_1_15 = _RANDOM[6'hC][15:8];
        snapshots_1_16 = _RANDOM[6'hC][23:16];
        snapshots_1_17 = _RANDOM[6'hC][31:24];
        snapshots_1_18 = _RANDOM[6'hD][7:0];
        snapshots_1_19 = _RANDOM[6'hD][15:8];
        snapshots_1_20 = _RANDOM[6'hD][23:16];
        snapshots_1_21 = _RANDOM[6'hD][31:24];
        snapshots_1_22 = _RANDOM[6'hE][7:0];
        snapshots_1_23 = _RANDOM[6'hE][15:8];
        snapshots_1_24 = _RANDOM[6'hE][23:16];
        snapshots_1_25 = _RANDOM[6'hE][31:24];
        snapshots_1_26 = _RANDOM[6'hF][7:0];
        snapshots_1_27 = _RANDOM[6'hF][15:8];
        snapshots_1_28 = _RANDOM[6'hF][23:16];
        snapshots_1_29 = _RANDOM[6'hF][31:24];
        snapshots_1_30 = _RANDOM[6'h10][7:0];
        snapshots_1_31 = _RANDOM[6'h10][15:8];
        snapshots_1_32 = _RANDOM[6'h10][23:16];
        snapshots_1_33 = _RANDOM[6'h10][31:24];
        snapshots_2_0 = _RANDOM[6'h11][7:0];
        snapshots_2_1 = _RANDOM[6'h11][15:8];
        snapshots_2_2 = _RANDOM[6'h11][23:16];
        snapshots_2_3 = _RANDOM[6'h11][31:24];
        snapshots_2_4 = _RANDOM[6'h12][7:0];
        snapshots_2_5 = _RANDOM[6'h12][15:8];
        snapshots_2_6 = _RANDOM[6'h12][23:16];
        snapshots_2_7 = _RANDOM[6'h12][31:24];
        snapshots_2_8 = _RANDOM[6'h13][7:0];
        snapshots_2_9 = _RANDOM[6'h13][15:8];
        snapshots_2_10 = _RANDOM[6'h13][23:16];
        snapshots_2_11 = _RANDOM[6'h13][31:24];
        snapshots_2_12 = _RANDOM[6'h14][7:0];
        snapshots_2_13 = _RANDOM[6'h14][15:8];
        snapshots_2_14 = _RANDOM[6'h14][23:16];
        snapshots_2_15 = _RANDOM[6'h14][31:24];
        snapshots_2_16 = _RANDOM[6'h15][7:0];
        snapshots_2_17 = _RANDOM[6'h15][15:8];
        snapshots_2_18 = _RANDOM[6'h15][23:16];
        snapshots_2_19 = _RANDOM[6'h15][31:24];
        snapshots_2_20 = _RANDOM[6'h16][7:0];
        snapshots_2_21 = _RANDOM[6'h16][15:8];
        snapshots_2_22 = _RANDOM[6'h16][23:16];
        snapshots_2_23 = _RANDOM[6'h16][31:24];
        snapshots_2_24 = _RANDOM[6'h17][7:0];
        snapshots_2_25 = _RANDOM[6'h17][15:8];
        snapshots_2_26 = _RANDOM[6'h17][23:16];
        snapshots_2_27 = _RANDOM[6'h17][31:24];
        snapshots_2_28 = _RANDOM[6'h18][7:0];
        snapshots_2_29 = _RANDOM[6'h18][15:8];
        snapshots_2_30 = _RANDOM[6'h18][23:16];
        snapshots_2_31 = _RANDOM[6'h18][31:24];
        snapshots_2_32 = _RANDOM[6'h19][7:0];
        snapshots_2_33 = _RANDOM[6'h19][15:8];
        snapshots_3_0 = _RANDOM[6'h19][23:16];
        snapshots_3_1 = _RANDOM[6'h19][31:24];
        snapshots_3_2 = _RANDOM[6'h1A][7:0];
        snapshots_3_3 = _RANDOM[6'h1A][15:8];
        snapshots_3_4 = _RANDOM[6'h1A][23:16];
        snapshots_3_5 = _RANDOM[6'h1A][31:24];
        snapshots_3_6 = _RANDOM[6'h1B][7:0];
        snapshots_3_7 = _RANDOM[6'h1B][15:8];
        snapshots_3_8 = _RANDOM[6'h1B][23:16];
        snapshots_3_9 = _RANDOM[6'h1B][31:24];
        snapshots_3_10 = _RANDOM[6'h1C][7:0];
        snapshots_3_11 = _RANDOM[6'h1C][15:8];
        snapshots_3_12 = _RANDOM[6'h1C][23:16];
        snapshots_3_13 = _RANDOM[6'h1C][31:24];
        snapshots_3_14 = _RANDOM[6'h1D][7:0];
        snapshots_3_15 = _RANDOM[6'h1D][15:8];
        snapshots_3_16 = _RANDOM[6'h1D][23:16];
        snapshots_3_17 = _RANDOM[6'h1D][31:24];
        snapshots_3_18 = _RANDOM[6'h1E][7:0];
        snapshots_3_19 = _RANDOM[6'h1E][15:8];
        snapshots_3_20 = _RANDOM[6'h1E][23:16];
        snapshots_3_21 = _RANDOM[6'h1E][31:24];
        snapshots_3_22 = _RANDOM[6'h1F][7:0];
        snapshots_3_23 = _RANDOM[6'h1F][15:8];
        snapshots_3_24 = _RANDOM[6'h1F][23:16];
        snapshots_3_25 = _RANDOM[6'h1F][31:24];
        snapshots_3_26 = _RANDOM[6'h20][7:0];
        snapshots_3_27 = _RANDOM[6'h20][15:8];
        snapshots_3_28 = _RANDOM[6'h20][23:16];
        snapshots_3_29 = _RANDOM[6'h20][31:24];
        snapshots_3_30 = _RANDOM[6'h21][7:0];
        snapshots_3_31 = _RANDOM[6'h21][15:8];
        snapshots_3_32 = _RANDOM[6'h21][23:16];
        snapshots_3_33 = _RANDOM[6'h21][31:24];
        snptEnqPtr_flag = _RANDOM[6'h22][0];
        snptEnqPtr_value = _RANDOM[6'h22][2:1];
        snptDeqPtr_flag = _RANDOM[6'h22][3];
        snptDeqPtr_value = _RANDOM[6'h22][5:4];
        snptValids_0 = _RANDOM[6'h22][6];
        snptValids_1 = _RANDOM[6'h22][7];
        snptValids_2 = _RANDOM[6'h22][8];
        snptValids_3 = _RANDOM[6'h22][9];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        snptEnqPtr_flag = 1'h0;
        snptEnqPtr_value = 2'h0;
        snptDeqPtr_flag = 1'h0;
        snptDeqPtr_value = 2'h0;
        snptValids_0 = 1'h0;
        snptValids_1 = 1'h0;
        snptValids_2 = 1'h0;
        snptValids_3 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_snapshots_0_0 = snapshots_0_0;
  assign io_snapshots_0_1 = snapshots_0_1;
  assign io_snapshots_0_2 = snapshots_0_2;
  assign io_snapshots_0_3 = snapshots_0_3;
  assign io_snapshots_0_4 = snapshots_0_4;
  assign io_snapshots_0_5 = snapshots_0_5;
  assign io_snapshots_0_6 = snapshots_0_6;
  assign io_snapshots_0_7 = snapshots_0_7;
  assign io_snapshots_0_8 = snapshots_0_8;
  assign io_snapshots_0_9 = snapshots_0_9;
  assign io_snapshots_0_10 = snapshots_0_10;
  assign io_snapshots_0_11 = snapshots_0_11;
  assign io_snapshots_0_12 = snapshots_0_12;
  assign io_snapshots_0_13 = snapshots_0_13;
  assign io_snapshots_0_14 = snapshots_0_14;
  assign io_snapshots_0_15 = snapshots_0_15;
  assign io_snapshots_0_16 = snapshots_0_16;
  assign io_snapshots_0_17 = snapshots_0_17;
  assign io_snapshots_0_18 = snapshots_0_18;
  assign io_snapshots_0_19 = snapshots_0_19;
  assign io_snapshots_0_20 = snapshots_0_20;
  assign io_snapshots_0_21 = snapshots_0_21;
  assign io_snapshots_0_22 = snapshots_0_22;
  assign io_snapshots_0_23 = snapshots_0_23;
  assign io_snapshots_0_24 = snapshots_0_24;
  assign io_snapshots_0_25 = snapshots_0_25;
  assign io_snapshots_0_26 = snapshots_0_26;
  assign io_snapshots_0_27 = snapshots_0_27;
  assign io_snapshots_0_28 = snapshots_0_28;
  assign io_snapshots_0_29 = snapshots_0_29;
  assign io_snapshots_0_30 = snapshots_0_30;
  assign io_snapshots_0_31 = snapshots_0_31;
  assign io_snapshots_0_32 = snapshots_0_32;
  assign io_snapshots_0_33 = snapshots_0_33;
  assign io_snapshots_1_0 = snapshots_1_0;
  assign io_snapshots_1_1 = snapshots_1_1;
  assign io_snapshots_1_2 = snapshots_1_2;
  assign io_snapshots_1_3 = snapshots_1_3;
  assign io_snapshots_1_4 = snapshots_1_4;
  assign io_snapshots_1_5 = snapshots_1_5;
  assign io_snapshots_1_6 = snapshots_1_6;
  assign io_snapshots_1_7 = snapshots_1_7;
  assign io_snapshots_1_8 = snapshots_1_8;
  assign io_snapshots_1_9 = snapshots_1_9;
  assign io_snapshots_1_10 = snapshots_1_10;
  assign io_snapshots_1_11 = snapshots_1_11;
  assign io_snapshots_1_12 = snapshots_1_12;
  assign io_snapshots_1_13 = snapshots_1_13;
  assign io_snapshots_1_14 = snapshots_1_14;
  assign io_snapshots_1_15 = snapshots_1_15;
  assign io_snapshots_1_16 = snapshots_1_16;
  assign io_snapshots_1_17 = snapshots_1_17;
  assign io_snapshots_1_18 = snapshots_1_18;
  assign io_snapshots_1_19 = snapshots_1_19;
  assign io_snapshots_1_20 = snapshots_1_20;
  assign io_snapshots_1_21 = snapshots_1_21;
  assign io_snapshots_1_22 = snapshots_1_22;
  assign io_snapshots_1_23 = snapshots_1_23;
  assign io_snapshots_1_24 = snapshots_1_24;
  assign io_snapshots_1_25 = snapshots_1_25;
  assign io_snapshots_1_26 = snapshots_1_26;
  assign io_snapshots_1_27 = snapshots_1_27;
  assign io_snapshots_1_28 = snapshots_1_28;
  assign io_snapshots_1_29 = snapshots_1_29;
  assign io_snapshots_1_30 = snapshots_1_30;
  assign io_snapshots_1_31 = snapshots_1_31;
  assign io_snapshots_1_32 = snapshots_1_32;
  assign io_snapshots_1_33 = snapshots_1_33;
  assign io_snapshots_2_0 = snapshots_2_0;
  assign io_snapshots_2_1 = snapshots_2_1;
  assign io_snapshots_2_2 = snapshots_2_2;
  assign io_snapshots_2_3 = snapshots_2_3;
  assign io_snapshots_2_4 = snapshots_2_4;
  assign io_snapshots_2_5 = snapshots_2_5;
  assign io_snapshots_2_6 = snapshots_2_6;
  assign io_snapshots_2_7 = snapshots_2_7;
  assign io_snapshots_2_8 = snapshots_2_8;
  assign io_snapshots_2_9 = snapshots_2_9;
  assign io_snapshots_2_10 = snapshots_2_10;
  assign io_snapshots_2_11 = snapshots_2_11;
  assign io_snapshots_2_12 = snapshots_2_12;
  assign io_snapshots_2_13 = snapshots_2_13;
  assign io_snapshots_2_14 = snapshots_2_14;
  assign io_snapshots_2_15 = snapshots_2_15;
  assign io_snapshots_2_16 = snapshots_2_16;
  assign io_snapshots_2_17 = snapshots_2_17;
  assign io_snapshots_2_18 = snapshots_2_18;
  assign io_snapshots_2_19 = snapshots_2_19;
  assign io_snapshots_2_20 = snapshots_2_20;
  assign io_snapshots_2_21 = snapshots_2_21;
  assign io_snapshots_2_22 = snapshots_2_22;
  assign io_snapshots_2_23 = snapshots_2_23;
  assign io_snapshots_2_24 = snapshots_2_24;
  assign io_snapshots_2_25 = snapshots_2_25;
  assign io_snapshots_2_26 = snapshots_2_26;
  assign io_snapshots_2_27 = snapshots_2_27;
  assign io_snapshots_2_28 = snapshots_2_28;
  assign io_snapshots_2_29 = snapshots_2_29;
  assign io_snapshots_2_30 = snapshots_2_30;
  assign io_snapshots_2_31 = snapshots_2_31;
  assign io_snapshots_2_32 = snapshots_2_32;
  assign io_snapshots_2_33 = snapshots_2_33;
  assign io_snapshots_3_0 = snapshots_3_0;
  assign io_snapshots_3_1 = snapshots_3_1;
  assign io_snapshots_3_2 = snapshots_3_2;
  assign io_snapshots_3_3 = snapshots_3_3;
  assign io_snapshots_3_4 = snapshots_3_4;
  assign io_snapshots_3_5 = snapshots_3_5;
  assign io_snapshots_3_6 = snapshots_3_6;
  assign io_snapshots_3_7 = snapshots_3_7;
  assign io_snapshots_3_8 = snapshots_3_8;
  assign io_snapshots_3_9 = snapshots_3_9;
  assign io_snapshots_3_10 = snapshots_3_10;
  assign io_snapshots_3_11 = snapshots_3_11;
  assign io_snapshots_3_12 = snapshots_3_12;
  assign io_snapshots_3_13 = snapshots_3_13;
  assign io_snapshots_3_14 = snapshots_3_14;
  assign io_snapshots_3_15 = snapshots_3_15;
  assign io_snapshots_3_16 = snapshots_3_16;
  assign io_snapshots_3_17 = snapshots_3_17;
  assign io_snapshots_3_18 = snapshots_3_18;
  assign io_snapshots_3_19 = snapshots_3_19;
  assign io_snapshots_3_20 = snapshots_3_20;
  assign io_snapshots_3_21 = snapshots_3_21;
  assign io_snapshots_3_22 = snapshots_3_22;
  assign io_snapshots_3_23 = snapshots_3_23;
  assign io_snapshots_3_24 = snapshots_3_24;
  assign io_snapshots_3_25 = snapshots_3_25;
  assign io_snapshots_3_26 = snapshots_3_26;
  assign io_snapshots_3_27 = snapshots_3_27;
  assign io_snapshots_3_28 = snapshots_3_28;
  assign io_snapshots_3_29 = snapshots_3_29;
  assign io_snapshots_3_30 = snapshots_3_30;
  assign io_snapshots_3_31 = snapshots_3_31;
  assign io_snapshots_3_32 = snapshots_3_32;
  assign io_snapshots_3_33 = snapshots_3_33;
endmodule

