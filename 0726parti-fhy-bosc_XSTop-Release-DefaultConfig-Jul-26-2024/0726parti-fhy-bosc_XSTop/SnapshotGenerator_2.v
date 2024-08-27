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
module SnapshotGenerator_2(
  input        clock,
  input        reset,
  input        io_enq,
  input        io_enqData_illegal,
  input        io_enqData_vma,
  input        io_enqData_vta,
  input  [1:0] io_enqData_vsew,
  input  [2:0] io_enqData_vlmul,
  input        io_deq,
  input        io_redirect,
  input        io_flushVec_0,
  input        io_flushVec_1,
  input        io_flushVec_2,
  input        io_flushVec_3,
  output       io_snapshots_0_illegal,
  output       io_snapshots_0_vma,
  output       io_snapshots_0_vta,
  output [1:0] io_snapshots_0_vsew,
  output [2:0] io_snapshots_0_vlmul,
  output       io_snapshots_1_illegal,
  output       io_snapshots_1_vma,
  output       io_snapshots_1_vta,
  output [1:0] io_snapshots_1_vsew,
  output [2:0] io_snapshots_1_vlmul,
  output       io_snapshots_2_illegal,
  output       io_snapshots_2_vma,
  output       io_snapshots_2_vta,
  output [1:0] io_snapshots_2_vsew,
  output [2:0] io_snapshots_2_vlmul,
  output       io_snapshots_3_illegal,
  output       io_snapshots_3_vma,
  output       io_snapshots_3_vta,
  output [1:0] io_snapshots_3_vsew,
  output [2:0] io_snapshots_3_vlmul
);

  reg        snapshots_0_illegal;
  reg        snapshots_0_vma;
  reg        snapshots_0_vta;
  reg  [1:0] snapshots_0_vsew;
  reg  [2:0] snapshots_0_vlmul;
  reg        snapshots_1_illegal;
  reg        snapshots_1_vma;
  reg        snapshots_1_vta;
  reg  [1:0] snapshots_1_vsew;
  reg  [2:0] snapshots_1_vlmul;
  reg        snapshots_2_illegal;
  reg        snapshots_2_vma;
  reg        snapshots_2_vta;
  reg  [1:0] snapshots_2_vsew;
  reg  [2:0] snapshots_2_vlmul;
  reg        snapshots_3_illegal;
  reg        snapshots_3_vma;
  reg        snapshots_3_vta;
  reg  [1:0] snapshots_3_vsew;
  reg  [2:0] snapshots_3_vlmul;
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
      snapshots_0_illegal <= io_enqData_illegal;
      snapshots_0_vma <= io_enqData_vma;
      snapshots_0_vta <= io_enqData_vta;
      snapshots_0_vsew <= io_enqData_vsew;
      snapshots_0_vlmul <= io_enqData_vlmul;
    end
    if (_GEN_1) begin
      snapshots_1_illegal <= io_enqData_illegal;
      snapshots_1_vma <= io_enqData_vma;
      snapshots_1_vta <= io_enqData_vta;
      snapshots_1_vsew <= io_enqData_vsew;
      snapshots_1_vlmul <= io_enqData_vlmul;
    end
    if (_GEN_2) begin
      snapshots_2_illegal <= io_enqData_illegal;
      snapshots_2_vma <= io_enqData_vma;
      snapshots_2_vta <= io_enqData_vta;
      snapshots_2_vsew <= io_enqData_vsew;
      snapshots_2_vlmul <= io_enqData_vlmul;
    end
    if (_GEN_3) begin
      snapshots_3_illegal <= io_enqData_illegal;
      snapshots_3_vma <= io_enqData_vma;
      snapshots_3_vta <= io_enqData_vta;
      snapshots_3_vsew <= io_enqData_vsew;
      snapshots_3_vlmul <= io_enqData_vlmul;
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
    logic [31:0] _RANDOM[0:1];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        snapshots_0_illegal = _RANDOM[1'h0][0];
        snapshots_0_vma = _RANDOM[1'h0][1];
        snapshots_0_vta = _RANDOM[1'h0][2];
        snapshots_0_vsew = _RANDOM[1'h0][4:3];
        snapshots_0_vlmul = _RANDOM[1'h0][7:5];
        snapshots_1_illegal = _RANDOM[1'h0][8];
        snapshots_1_vma = _RANDOM[1'h0][9];
        snapshots_1_vta = _RANDOM[1'h0][10];
        snapshots_1_vsew = _RANDOM[1'h0][12:11];
        snapshots_1_vlmul = _RANDOM[1'h0][15:13];
        snapshots_2_illegal = _RANDOM[1'h0][16];
        snapshots_2_vma = _RANDOM[1'h0][17];
        snapshots_2_vta = _RANDOM[1'h0][18];
        snapshots_2_vsew = _RANDOM[1'h0][20:19];
        snapshots_2_vlmul = _RANDOM[1'h0][23:21];
        snapshots_3_illegal = _RANDOM[1'h0][24];
        snapshots_3_vma = _RANDOM[1'h0][25];
        snapshots_3_vta = _RANDOM[1'h0][26];
        snapshots_3_vsew = _RANDOM[1'h0][28:27];
        snapshots_3_vlmul = _RANDOM[1'h0][31:29];
        snptEnqPtr_flag = _RANDOM[1'h1][0];
        snptEnqPtr_value = _RANDOM[1'h1][2:1];
        snptDeqPtr_flag = _RANDOM[1'h1][3];
        snptDeqPtr_value = _RANDOM[1'h1][5:4];
        snptValids_0 = _RANDOM[1'h1][6];
        snptValids_1 = _RANDOM[1'h1][7];
        snptValids_2 = _RANDOM[1'h1][8];
        snptValids_3 = _RANDOM[1'h1][9];
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
  assign io_snapshots_0_illegal = snapshots_0_illegal;
  assign io_snapshots_0_vma = snapshots_0_vma;
  assign io_snapshots_0_vta = snapshots_0_vta;
  assign io_snapshots_0_vsew = snapshots_0_vsew;
  assign io_snapshots_0_vlmul = snapshots_0_vlmul;
  assign io_snapshots_1_illegal = snapshots_1_illegal;
  assign io_snapshots_1_vma = snapshots_1_vma;
  assign io_snapshots_1_vta = snapshots_1_vta;
  assign io_snapshots_1_vsew = snapshots_1_vsew;
  assign io_snapshots_1_vlmul = snapshots_1_vlmul;
  assign io_snapshots_2_illegal = snapshots_2_illegal;
  assign io_snapshots_2_vma = snapshots_2_vma;
  assign io_snapshots_2_vta = snapshots_2_vta;
  assign io_snapshots_2_vsew = snapshots_2_vsew;
  assign io_snapshots_2_vlmul = snapshots_2_vlmul;
  assign io_snapshots_3_illegal = snapshots_3_illegal;
  assign io_snapshots_3_vma = snapshots_3_vma;
  assign io_snapshots_3_vta = snapshots_3_vta;
  assign io_snapshots_3_vsew = snapshots_3_vsew;
  assign io_snapshots_3_vlmul = snapshots_3_vlmul;
endmodule

