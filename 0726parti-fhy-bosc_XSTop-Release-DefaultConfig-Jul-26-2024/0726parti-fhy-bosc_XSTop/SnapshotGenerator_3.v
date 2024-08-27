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
module SnapshotGenerator_3(
  input        clock,
  input        reset,
  input        io_enq,
  input        io_enqData_0_flag,
  input  [7:0] io_enqData_0_value,
  input        io_deq,
  input        io_redirect,
  input        io_flushVec_0,
  input        io_flushVec_1,
  input        io_flushVec_2,
  input        io_flushVec_3,
  output       io_snapshots_0_0_flag,
  output [7:0] io_snapshots_0_0_value,
  output       io_snapshots_1_0_flag,
  output [7:0] io_snapshots_1_0_value,
  output       io_snapshots_2_0_flag,
  output [7:0] io_snapshots_2_0_value,
  output       io_snapshots_3_0_flag,
  output [7:0] io_snapshots_3_0_value
);

  reg        snapshots_0_0_flag;
  reg  [7:0] snapshots_0_0_value;
  reg        snapshots_1_0_flag;
  reg  [7:0] snapshots_1_0_value;
  reg        snapshots_2_0_flag;
  reg  [7:0] snapshots_2_0_value;
  reg        snapshots_3_0_flag;
  reg  [7:0] snapshots_3_0_value;
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
      snapshots_0_0_flag <= io_enqData_0_flag;
      snapshots_0_0_value <= io_enqData_0_value;
    end
    if (_GEN_1) begin
      snapshots_1_0_flag <= io_enqData_0_flag;
      snapshots_1_0_value <= io_enqData_0_value;
    end
    if (_GEN_2) begin
      snapshots_2_0_flag <= io_enqData_0_flag;
      snapshots_2_0_value <= io_enqData_0_value;
    end
    if (_GEN_3) begin
      snapshots_3_0_flag <= io_enqData_0_flag;
      snapshots_3_0_value <= io_enqData_0_value;
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
    logic [31:0] _RANDOM[0:9];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'hA; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        snapshots_0_0_flag = _RANDOM[4'h0][0];
        snapshots_0_0_value = _RANDOM[4'h0][8:1];
        snapshots_1_0_flag = _RANDOM[4'h2][8];
        snapshots_1_0_value = _RANDOM[4'h2][16:9];
        snapshots_2_0_flag = _RANDOM[4'h4][16];
        snapshots_2_0_value = _RANDOM[4'h4][24:17];
        snapshots_3_0_flag = _RANDOM[4'h6][24];
        snapshots_3_0_value = {_RANDOM[4'h6][31:25], _RANDOM[4'h7][0]};
        snptEnqPtr_flag = _RANDOM[4'h9][0];
        snptEnqPtr_value = _RANDOM[4'h9][2:1];
        snptDeqPtr_flag = _RANDOM[4'h9][3];
        snptDeqPtr_value = _RANDOM[4'h9][5:4];
        snptValids_0 = _RANDOM[4'h9][6];
        snptValids_1 = _RANDOM[4'h9][7];
        snptValids_2 = _RANDOM[4'h9][8];
        snptValids_3 = _RANDOM[4'h9][9];
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
  assign io_snapshots_0_0_flag = snapshots_0_0_flag;
  assign io_snapshots_0_0_value = snapshots_0_0_value;
  assign io_snapshots_1_0_flag = snapshots_1_0_flag;
  assign io_snapshots_1_0_value = snapshots_1_0_value;
  assign io_snapshots_2_0_flag = snapshots_2_0_flag;
  assign io_snapshots_2_0_value = snapshots_2_0_value;
  assign io_snapshots_3_0_flag = snapshots_3_0_flag;
  assign io_snapshots_3_0_value = snapshots_3_0_value;
endmodule

