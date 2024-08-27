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
module CounterFilter(
  input        clock,
  input        reset,
  input        io_ld_in_0_valid,
  input  [6:0] io_ld_in_0_bits_idx,
  input  [2:0] io_ld_in_0_bits_way,
  input        io_ld_in_1_valid,
  input  [6:0] io_ld_in_1_bits_idx,
  input  [2:0] io_ld_in_1_bits_way,
  input        io_ld_in_2_valid,
  input  [6:0] io_ld_in_2_bits_idx,
  input  [2:0] io_ld_in_2_bits_way,
  input        io_query_0_req_valid,
  input  [6:0] io_query_0_req_bits_idx,
  input  [2:0] io_query_0_req_bits_way,
  output       io_query_0_resp,
  input        io_query_1_req_valid,
  input  [6:0] io_query_1_req_bits_idx,
  input  [2:0] io_query_1_req_bits_way,
  output       io_query_1_resp,
  input        io_query_2_req_valid,
  input  [6:0] io_query_2_req_bits_idx,
  input  [2:0] io_query_2_req_bits_way,
  output       io_query_2_resp
);

  reg  [6:0]      entries_0_idx;
  reg  [2:0]      entries_0_way;
  reg  [6:0]      entries_1_idx;
  reg  [2:0]      entries_1_way;
  reg  [6:0]      entries_2_idx;
  reg  [2:0]      entries_2_way;
  reg  [6:0]      entries_3_idx;
  reg  [2:0]      entries_3_way;
  reg  [6:0]      entries_4_idx;
  reg  [2:0]      entries_4_way;
  reg  [6:0]      entries_5_idx;
  reg  [2:0]      entries_5_way;
  reg  [6:0]      entries_6_idx;
  reg  [2:0]      entries_6_way;
  reg  [6:0]      entries_7_idx;
  reg  [2:0]      entries_7_way;
  reg  [6:0]      entries_8_idx;
  reg  [2:0]      entries_8_way;
  reg  [6:0]      entries_9_idx;
  reg  [2:0]      entries_9_way;
  reg  [6:0]      entries_10_idx;
  reg  [2:0]      entries_10_way;
  reg  [6:0]      entries_11_idx;
  reg  [2:0]      entries_11_way;
  reg             valids_0;
  reg             valids_1;
  reg             valids_2;
  reg             valids_3;
  reg             valids_4;
  reg             valids_5;
  reg             valids_6;
  reg             valids_7;
  reg             valids_8;
  reg             valids_9;
  reg             valids_10;
  reg             valids_11;
  reg             enqPtrExt_0_flag;
  reg  [3:0]      enqPtrExt_0_value;
  reg             enqPtrExt_1_flag;
  reg  [3:0]      enqPtrExt_1_value;
  reg             enqPtrExt_2_flag;
  reg  [3:0]      enqPtrExt_2_value;
  reg             deqPtrExt_0_flag;
  reg  [3:0]      deqPtrExt_0_value;
  reg  [3:0]      deqPtrExt_1_value;
  reg  [3:0]      deqPtrExt_2_value;
  reg  [1:0]      last3CycleAlloc;
  wire            canAlloc_0 =
    io_ld_in_0_valid
    & (enqPtrExt_0_flag ^ deqPtrExt_0_flag ^ enqPtrExt_0_value >= deqPtrExt_0_value);
  wire [1:0]      _GEN = {1'h0, io_ld_in_0_valid};
  wire [3:0]      _GEN_0 =
    {{enqPtrExt_0_flag}, {enqPtrExt_2_flag}, {enqPtrExt_1_flag}, {enqPtrExt_0_flag}};
  wire [3:0][3:0] _GEN_1 =
    {{enqPtrExt_0_value}, {enqPtrExt_2_value}, {enqPtrExt_1_value}, {enqPtrExt_0_value}};
  wire            canAlloc_1 =
    io_ld_in_1_valid
    & (_GEN_0[_GEN] ^ deqPtrExt_0_flag ^ _GEN_1[_GEN] >= deqPtrExt_0_value);
  wire [1:0]      index = 2'(_GEN + {1'h0, io_ld_in_1_valid});
  wire            canAlloc_2 =
    io_ld_in_2_valid
    & (_GEN_0[index] ^ deqPtrExt_0_flag ^ _GEN_1[index] >= deqPtrExt_0_value);
  wire [1:0]      _allocNum_T_2 =
    2'({1'h0, canAlloc_0} + 2'({1'h0, canAlloc_1} + {1'h0, canAlloc_2}));
  reg  [1:0]      last3CycleAlloc_REG;
  reg  [1:0]      last3CycleAlloc_REG_1;
  wire            _GEN_2 = canAlloc_0 & enqPtrExt_0_value == 4'h0;
  wire            _GEN_3 = canAlloc_0 & enqPtrExt_0_value == 4'h1;
  wire            _GEN_4 = canAlloc_0 & enqPtrExt_0_value == 4'h2;
  wire            _GEN_5 = canAlloc_0 & enqPtrExt_0_value == 4'h3;
  wire            _GEN_6 = canAlloc_0 & enqPtrExt_0_value == 4'h4;
  wire            _GEN_7 = canAlloc_0 & enqPtrExt_0_value == 4'h5;
  wire            _GEN_8 = canAlloc_0 & enqPtrExt_0_value == 4'h6;
  wire            _GEN_9 = canAlloc_0 & enqPtrExt_0_value == 4'h7;
  wire            _GEN_10 = canAlloc_0 & enqPtrExt_0_value == 4'h8;
  wire            _GEN_11 = canAlloc_0 & enqPtrExt_0_value == 4'h9;
  wire            _GEN_12 = canAlloc_0 & enqPtrExt_0_value == 4'hA;
  wire            _GEN_13 = canAlloc_0 & enqPtrExt_0_value == 4'hB;
  wire            _GEN_14 = _GEN_1[_GEN] == 4'h0;
  wire            _GEN_15 = _GEN_1[_GEN] == 4'h1;
  wire            _GEN_16 = _GEN_1[_GEN] == 4'h2;
  wire            _GEN_17 = _GEN_1[_GEN] == 4'h3;
  wire            _GEN_18 = _GEN_1[_GEN] == 4'h4;
  wire            _GEN_19 = _GEN_1[_GEN] == 4'h5;
  wire            _GEN_20 = _GEN_1[_GEN] == 4'h6;
  wire            _GEN_21 = _GEN_1[_GEN] == 4'h7;
  wire            _GEN_22 = _GEN_1[_GEN] == 4'h8;
  wire            _GEN_23 = _GEN_1[_GEN] == 4'h9;
  wire            _GEN_24 = _GEN_1[_GEN] == 4'hA;
  wire            _GEN_25 = _GEN_1[_GEN] == 4'hB;
  wire            _GEN_26 = canAlloc_2 & _GEN_1[index] == 4'h0;
  wire            _GEN_27 =
    _GEN_26 | (canAlloc_1 ? _GEN_14 | _GEN_2 | valids_0 : _GEN_2 | valids_0);
  wire            _GEN_28 = canAlloc_2 & _GEN_1[index] == 4'h1;
  wire            _GEN_29 =
    _GEN_28 | (canAlloc_1 ? _GEN_15 | _GEN_3 | valids_1 : _GEN_3 | valids_1);
  wire            _GEN_30 = canAlloc_2 & _GEN_1[index] == 4'h2;
  wire            _GEN_31 =
    _GEN_30 | (canAlloc_1 ? _GEN_16 | _GEN_4 | valids_2 : _GEN_4 | valids_2);
  wire            _GEN_32 = canAlloc_2 & _GEN_1[index] == 4'h3;
  wire            _GEN_33 =
    _GEN_32 | (canAlloc_1 ? _GEN_17 | _GEN_5 | valids_3 : _GEN_5 | valids_3);
  wire            _GEN_34 = canAlloc_2 & _GEN_1[index] == 4'h4;
  wire            _GEN_35 =
    _GEN_34 | (canAlloc_1 ? _GEN_18 | _GEN_6 | valids_4 : _GEN_6 | valids_4);
  wire            _GEN_36 = canAlloc_2 & _GEN_1[index] == 4'h5;
  wire            _GEN_37 =
    _GEN_36 | (canAlloc_1 ? _GEN_19 | _GEN_7 | valids_5 : _GEN_7 | valids_5);
  wire            _GEN_38 = canAlloc_2 & _GEN_1[index] == 4'h6;
  wire            _GEN_39 =
    _GEN_38 | (canAlloc_1 ? _GEN_20 | _GEN_8 | valids_6 : _GEN_8 | valids_6);
  wire            _GEN_40 = canAlloc_2 & _GEN_1[index] == 4'h7;
  wire            _GEN_41 =
    _GEN_40 | (canAlloc_1 ? _GEN_21 | _GEN_9 | valids_7 : _GEN_9 | valids_7);
  wire            _GEN_42 = canAlloc_2 & _GEN_1[index] == 4'h8;
  wire            _GEN_43 =
    _GEN_42 | (canAlloc_1 ? _GEN_22 | _GEN_10 | valids_8 : _GEN_10 | valids_8);
  wire            _GEN_44 = canAlloc_2 & _GEN_1[index] == 4'h9;
  wire            _GEN_45 =
    _GEN_44 | (canAlloc_1 ? _GEN_23 | _GEN_11 | valids_9 : _GEN_11 | valids_9);
  wire            _GEN_46 = canAlloc_2 & _GEN_1[index] == 4'hA;
  wire            _GEN_47 =
    _GEN_46 | (canAlloc_1 ? _GEN_24 | _GEN_12 | valids_10 : _GEN_12 | valids_10);
  wire            _GEN_48 = canAlloc_2 & _GEN_1[index] == 4'hB;
  wire            _GEN_49 =
    _GEN_48 | (canAlloc_1 ? _GEN_25 | _GEN_13 | valids_11 : _GEN_13 | valids_11);
  wire [2:0]      _GEN_50 = {canAlloc_2, canAlloc_1, canAlloc_0};
  wire [4:0]      _GEN_51 = {3'h0, _allocNum_T_2};
  wire [4:0]      enqPtrExt_0_new_value = 5'({1'h0, enqPtrExt_0_value} + _GEN_51);
  wire [5:0]      _enqPtrExt_0_diff_T_4 = 6'({1'h0, enqPtrExt_0_new_value} - 6'hC);
  wire            enqPtrExt_0_reverse_flag = $signed(_enqPtrExt_0_diff_T_4) > -6'sh1;
  wire [4:0]      enqPtrExt_1_new_value = 5'({1'h0, enqPtrExt_1_value} + _GEN_51);
  wire [5:0]      _enqPtrExt_1_diff_T_4 = 6'({1'h0, enqPtrExt_1_new_value} - 6'hC);
  wire            enqPtrExt_1_reverse_flag = $signed(_enqPtrExt_1_diff_T_4) > -6'sh1;
  wire [4:0]      enqPtrExt_2_new_value = 5'({1'h0, enqPtrExt_2_value} + _GEN_51);
  wire [5:0]      _enqPtrExt_2_diff_T_4 = 6'({1'h0, enqPtrExt_2_new_value} - 6'hC);
  wire            enqPtrExt_2_reverse_flag = $signed(_enqPtrExt_2_diff_T_4) > -6'sh1;
  wire            _GEN_52 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h0;
  wire            _GEN_53 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h1;
  wire            _GEN_54 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h2;
  wire            _GEN_55 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h3;
  wire            _GEN_56 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h4;
  wire            _GEN_57 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h5;
  wire            _GEN_58 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h6;
  wire            _GEN_59 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h7;
  wire            _GEN_60 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h8;
  wire            _GEN_61 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'h9;
  wire            _GEN_62 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'hA;
  wire            _GEN_63 = (|last3CycleAlloc) & deqPtrExt_0_value == 4'hB;
  wire [4:0]      _GEN_64 = {3'h0, last3CycleAlloc};
  wire [4:0]      deqPtrExt_0_new_value = 5'({1'h0, deqPtrExt_0_value} + _GEN_64);
  wire [5:0]      _deqPtrExt_0_diff_T_4 = 6'({1'h0, deqPtrExt_0_new_value} - 6'hC);
  wire            deqPtrExt_0_reverse_flag = $signed(_deqPtrExt_0_diff_T_4) > -6'sh1;
  wire [4:0]      deqPtrExt_1_new_value = 5'({1'h0, deqPtrExt_1_value} + _GEN_64);
  wire [5:0]      _deqPtrExt_1_diff_T_4 = 6'({1'h0, deqPtrExt_1_new_value} - 6'hC);
  wire [4:0]      deqPtrExt_2_new_value = 5'({1'h0, deqPtrExt_2_value} + _GEN_64);
  wire [5:0]      _deqPtrExt_2_diff_T_4 = 6'({1'h0, deqPtrExt_2_new_value} - 6'hC);
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      entries_0_idx <= 7'h0;
      entries_0_way <= 3'h0;
      entries_1_idx <= 7'h0;
      entries_1_way <= 3'h0;
      entries_2_idx <= 7'h0;
      entries_2_way <= 3'h0;
      entries_3_idx <= 7'h0;
      entries_3_way <= 3'h0;
      entries_4_idx <= 7'h0;
      entries_4_way <= 3'h0;
      entries_5_idx <= 7'h0;
      entries_5_way <= 3'h0;
      entries_6_idx <= 7'h0;
      entries_6_way <= 3'h0;
      entries_7_idx <= 7'h0;
      entries_7_way <= 3'h0;
      entries_8_idx <= 7'h0;
      entries_8_way <= 3'h0;
      entries_9_idx <= 7'h0;
      entries_9_way <= 3'h0;
      entries_10_idx <= 7'h0;
      entries_10_way <= 3'h0;
      entries_11_idx <= 7'h0;
      entries_11_way <= 3'h0;
      valids_0 <= 1'h0;
      valids_1 <= 1'h0;
      valids_2 <= 1'h0;
      valids_3 <= 1'h0;
      valids_4 <= 1'h0;
      valids_5 <= 1'h0;
      valids_6 <= 1'h0;
      valids_7 <= 1'h0;
      valids_8 <= 1'h0;
      valids_9 <= 1'h0;
      valids_10 <= 1'h0;
      valids_11 <= 1'h0;
      enqPtrExt_0_flag <= 1'h0;
      enqPtrExt_0_value <= 4'h0;
      enqPtrExt_1_flag <= 1'h0;
      enqPtrExt_1_value <= 4'h1;
      enqPtrExt_2_flag <= 1'h0;
      enqPtrExt_2_value <= 4'h2;
      deqPtrExt_0_flag <= 1'h0;
      deqPtrExt_0_value <= 4'h0;
      deqPtrExt_1_value <= 4'h1;
      deqPtrExt_2_value <= 4'h2;
      last3CycleAlloc <= 2'h0;
    end
    else begin
      if (_GEN_26) begin
        entries_0_idx <= io_ld_in_2_bits_idx;
        entries_0_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_14) begin
        entries_0_idx <= io_ld_in_1_bits_idx;
        entries_0_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_2) begin
        entries_0_idx <= io_ld_in_0_bits_idx;
        entries_0_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_28) begin
        entries_1_idx <= io_ld_in_2_bits_idx;
        entries_1_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_15) begin
        entries_1_idx <= io_ld_in_1_bits_idx;
        entries_1_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_3) begin
        entries_1_idx <= io_ld_in_0_bits_idx;
        entries_1_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_30) begin
        entries_2_idx <= io_ld_in_2_bits_idx;
        entries_2_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_16) begin
        entries_2_idx <= io_ld_in_1_bits_idx;
        entries_2_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_4) begin
        entries_2_idx <= io_ld_in_0_bits_idx;
        entries_2_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_32) begin
        entries_3_idx <= io_ld_in_2_bits_idx;
        entries_3_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_17) begin
        entries_3_idx <= io_ld_in_1_bits_idx;
        entries_3_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_5) begin
        entries_3_idx <= io_ld_in_0_bits_idx;
        entries_3_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_34) begin
        entries_4_idx <= io_ld_in_2_bits_idx;
        entries_4_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_18) begin
        entries_4_idx <= io_ld_in_1_bits_idx;
        entries_4_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_6) begin
        entries_4_idx <= io_ld_in_0_bits_idx;
        entries_4_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_36) begin
        entries_5_idx <= io_ld_in_2_bits_idx;
        entries_5_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_19) begin
        entries_5_idx <= io_ld_in_1_bits_idx;
        entries_5_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_7) begin
        entries_5_idx <= io_ld_in_0_bits_idx;
        entries_5_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_38) begin
        entries_6_idx <= io_ld_in_2_bits_idx;
        entries_6_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_20) begin
        entries_6_idx <= io_ld_in_1_bits_idx;
        entries_6_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_8) begin
        entries_6_idx <= io_ld_in_0_bits_idx;
        entries_6_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_40) begin
        entries_7_idx <= io_ld_in_2_bits_idx;
        entries_7_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_21) begin
        entries_7_idx <= io_ld_in_1_bits_idx;
        entries_7_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_9) begin
        entries_7_idx <= io_ld_in_0_bits_idx;
        entries_7_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_42) begin
        entries_8_idx <= io_ld_in_2_bits_idx;
        entries_8_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_22) begin
        entries_8_idx <= io_ld_in_1_bits_idx;
        entries_8_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_10) begin
        entries_8_idx <= io_ld_in_0_bits_idx;
        entries_8_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_44) begin
        entries_9_idx <= io_ld_in_2_bits_idx;
        entries_9_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_23) begin
        entries_9_idx <= io_ld_in_1_bits_idx;
        entries_9_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_11) begin
        entries_9_idx <= io_ld_in_0_bits_idx;
        entries_9_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_46) begin
        entries_10_idx <= io_ld_in_2_bits_idx;
        entries_10_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_24) begin
        entries_10_idx <= io_ld_in_1_bits_idx;
        entries_10_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_12) begin
        entries_10_idx <= io_ld_in_0_bits_idx;
        entries_10_way <= io_ld_in_0_bits_way;
      end
      if (_GEN_48) begin
        entries_11_idx <= io_ld_in_2_bits_idx;
        entries_11_way <= io_ld_in_2_bits_way;
      end
      else if (canAlloc_1 & _GEN_25) begin
        entries_11_idx <= io_ld_in_1_bits_idx;
        entries_11_way <= io_ld_in_1_bits_way;
      end
      else if (_GEN_13) begin
        entries_11_idx <= io_ld_in_0_bits_idx;
        entries_11_way <= io_ld_in_0_bits_way;
      end
      valids_0 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h0)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h0 | _GEN_52) & _GEN_27
             : ~_GEN_52 & _GEN_27);
      valids_1 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h1)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h1 | _GEN_53) & _GEN_29
             : ~_GEN_53 & _GEN_29);
      valids_2 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h2)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h2 | _GEN_54) & _GEN_31
             : ~_GEN_54 & _GEN_31);
      valids_3 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h3)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h3 | _GEN_55) & _GEN_33
             : ~_GEN_55 & _GEN_33);
      valids_4 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h4)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h4 | _GEN_56) & _GEN_35
             : ~_GEN_56 & _GEN_35);
      valids_5 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h5)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h5 | _GEN_57) & _GEN_37
             : ~_GEN_57 & _GEN_37);
      valids_6 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h6)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h6 | _GEN_58) & _GEN_39
             : ~_GEN_58 & _GEN_39);
      valids_7 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h7)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h7 | _GEN_59) & _GEN_41
             : ~_GEN_59 & _GEN_41);
      valids_8 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h8)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h8 | _GEN_60) & _GEN_43
             : ~_GEN_60 & _GEN_43);
      valids_9 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'h9)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'h9 | _GEN_61) & _GEN_45
             : ~_GEN_61 & _GEN_45);
      valids_10 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'hA)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'hA | _GEN_62) & _GEN_47
             : ~_GEN_62 & _GEN_47);
      valids_11 <=
        ~((&last3CycleAlloc) & deqPtrExt_2_value == 4'hB)
        & (last3CycleAlloc[1]
             ? ~(deqPtrExt_1_value == 4'hB | _GEN_63) & _GEN_49
             : ~_GEN_63 & _GEN_49);
      enqPtrExt_0_flag <= (|_GEN_50) & enqPtrExt_0_reverse_flag ^ enqPtrExt_0_flag;
      if (|_GEN_50) begin
        enqPtrExt_0_value <=
          enqPtrExt_0_reverse_flag
            ? _enqPtrExt_0_diff_T_4[3:0]
            : enqPtrExt_0_new_value[3:0];
        enqPtrExt_1_value <=
          enqPtrExt_1_reverse_flag
            ? _enqPtrExt_1_diff_T_4[3:0]
            : enqPtrExt_1_new_value[3:0];
        enqPtrExt_2_value <=
          enqPtrExt_2_reverse_flag
            ? _enqPtrExt_2_diff_T_4[3:0]
            : enqPtrExt_2_new_value[3:0];
      end
      enqPtrExt_1_flag <= (|_GEN_50) & enqPtrExt_1_reverse_flag ^ enqPtrExt_1_flag;
      enqPtrExt_2_flag <= (|_GEN_50) & enqPtrExt_2_reverse_flag ^ enqPtrExt_2_flag;
      deqPtrExt_0_flag <= deqPtrExt_0_reverse_flag ^ deqPtrExt_0_flag;
      deqPtrExt_0_value <=
        deqPtrExt_0_reverse_flag
          ? _deqPtrExt_0_diff_T_4[3:0]
          : deqPtrExt_0_new_value[3:0];
      deqPtrExt_1_value <=
        $signed(_deqPtrExt_1_diff_T_4) > -6'sh1
          ? _deqPtrExt_1_diff_T_4[3:0]
          : deqPtrExt_1_new_value[3:0];
      deqPtrExt_2_value <=
        $signed(_deqPtrExt_2_diff_T_4) > -6'sh1
          ? _deqPtrExt_2_diff_T_4[3:0]
          : deqPtrExt_2_new_value[3:0];
      last3CycleAlloc <= last3CycleAlloc_REG_1;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    last3CycleAlloc_REG <= _allocNum_T_2;
    last3CycleAlloc_REG_1 <= last3CycleAlloc_REG;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:5];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h6; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        entries_0_idx = _RANDOM[3'h0][6:0];
        entries_0_way = _RANDOM[3'h0][9:7];
        entries_1_idx = _RANDOM[3'h0][16:10];
        entries_1_way = _RANDOM[3'h0][19:17];
        entries_2_idx = _RANDOM[3'h0][26:20];
        entries_2_way = _RANDOM[3'h0][29:27];
        entries_3_idx = {_RANDOM[3'h0][31:30], _RANDOM[3'h1][4:0]};
        entries_3_way = _RANDOM[3'h1][7:5];
        entries_4_idx = _RANDOM[3'h1][14:8];
        entries_4_way = _RANDOM[3'h1][17:15];
        entries_5_idx = _RANDOM[3'h1][24:18];
        entries_5_way = _RANDOM[3'h1][27:25];
        entries_6_idx = {_RANDOM[3'h1][31:28], _RANDOM[3'h2][2:0]};
        entries_6_way = _RANDOM[3'h2][5:3];
        entries_7_idx = _RANDOM[3'h2][12:6];
        entries_7_way = _RANDOM[3'h2][15:13];
        entries_8_idx = _RANDOM[3'h2][22:16];
        entries_8_way = _RANDOM[3'h2][25:23];
        entries_9_idx = {_RANDOM[3'h2][31:26], _RANDOM[3'h3][0]};
        entries_9_way = _RANDOM[3'h3][3:1];
        entries_10_idx = _RANDOM[3'h3][10:4];
        entries_10_way = _RANDOM[3'h3][13:11];
        entries_11_idx = _RANDOM[3'h3][20:14];
        entries_11_way = _RANDOM[3'h3][23:21];
        valids_0 = _RANDOM[3'h3][24];
        valids_1 = _RANDOM[3'h3][25];
        valids_2 = _RANDOM[3'h3][26];
        valids_3 = _RANDOM[3'h3][27];
        valids_4 = _RANDOM[3'h3][28];
        valids_5 = _RANDOM[3'h3][29];
        valids_6 = _RANDOM[3'h3][30];
        valids_7 = _RANDOM[3'h3][31];
        valids_8 = _RANDOM[3'h4][0];
        valids_9 = _RANDOM[3'h4][1];
        valids_10 = _RANDOM[3'h4][2];
        valids_11 = _RANDOM[3'h4][3];
        enqPtrExt_0_flag = _RANDOM[3'h4][4];
        enqPtrExt_0_value = _RANDOM[3'h4][8:5];
        enqPtrExt_1_flag = _RANDOM[3'h4][9];
        enqPtrExt_1_value = _RANDOM[3'h4][13:10];
        enqPtrExt_2_flag = _RANDOM[3'h4][14];
        enqPtrExt_2_value = _RANDOM[3'h4][18:15];
        deqPtrExt_0_flag = _RANDOM[3'h4][19];
        deqPtrExt_0_value = _RANDOM[3'h4][23:20];
        deqPtrExt_1_value = _RANDOM[3'h4][28:25];
        deqPtrExt_2_value = {_RANDOM[3'h4][31:30], _RANDOM[3'h5][1:0]};
        last3CycleAlloc = _RANDOM[3'h5][3:2];
        last3CycleAlloc_REG = _RANDOM[3'h5][5:4];
        last3CycleAlloc_REG_1 = _RANDOM[3'h5][7:6];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        entries_0_idx = 7'h0;
        entries_0_way = 3'h0;
        entries_1_idx = 7'h0;
        entries_1_way = 3'h0;
        entries_2_idx = 7'h0;
        entries_2_way = 3'h0;
        entries_3_idx = 7'h0;
        entries_3_way = 3'h0;
        entries_4_idx = 7'h0;
        entries_4_way = 3'h0;
        entries_5_idx = 7'h0;
        entries_5_way = 3'h0;
        entries_6_idx = 7'h0;
        entries_6_way = 3'h0;
        entries_7_idx = 7'h0;
        entries_7_way = 3'h0;
        entries_8_idx = 7'h0;
        entries_8_way = 3'h0;
        entries_9_idx = 7'h0;
        entries_9_way = 3'h0;
        entries_10_idx = 7'h0;
        entries_10_way = 3'h0;
        entries_11_idx = 7'h0;
        entries_11_way = 3'h0;
        valids_0 = 1'h0;
        valids_1 = 1'h0;
        valids_2 = 1'h0;
        valids_3 = 1'h0;
        valids_4 = 1'h0;
        valids_5 = 1'h0;
        valids_6 = 1'h0;
        valids_7 = 1'h0;
        valids_8 = 1'h0;
        valids_9 = 1'h0;
        valids_10 = 1'h0;
        valids_11 = 1'h0;
        enqPtrExt_0_flag = 1'h0;
        enqPtrExt_0_value = 4'h0;
        enqPtrExt_1_flag = 1'h0;
        enqPtrExt_1_value = 4'h1;
        enqPtrExt_2_flag = 1'h0;
        enqPtrExt_2_value = 4'h2;
        deqPtrExt_0_flag = 1'h0;
        deqPtrExt_0_value = 4'h0;
        deqPtrExt_1_value = 4'h1;
        deqPtrExt_2_value = 4'h2;
        last3CycleAlloc = 2'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_query_0_resp =
    io_query_0_req_valid
    & (|{valids_0 & io_query_0_req_bits_idx == entries_0_idx
           & io_query_0_req_bits_way == entries_0_way,
         valids_1 & io_query_0_req_bits_idx == entries_1_idx
           & io_query_0_req_bits_way == entries_1_way,
         valids_2 & io_query_0_req_bits_idx == entries_2_idx
           & io_query_0_req_bits_way == entries_2_way,
         valids_3 & io_query_0_req_bits_idx == entries_3_idx
           & io_query_0_req_bits_way == entries_3_way,
         valids_4 & io_query_0_req_bits_idx == entries_4_idx
           & io_query_0_req_bits_way == entries_4_way,
         valids_5 & io_query_0_req_bits_idx == entries_5_idx
           & io_query_0_req_bits_way == entries_5_way,
         valids_6 & io_query_0_req_bits_idx == entries_6_idx
           & io_query_0_req_bits_way == entries_6_way,
         valids_7 & io_query_0_req_bits_idx == entries_7_idx
           & io_query_0_req_bits_way == entries_7_way,
         valids_8 & io_query_0_req_bits_idx == entries_8_idx
           & io_query_0_req_bits_way == entries_8_way,
         valids_9 & io_query_0_req_bits_idx == entries_9_idx
           & io_query_0_req_bits_way == entries_9_way,
         valids_10 & io_query_0_req_bits_idx == entries_10_idx
           & io_query_0_req_bits_way == entries_10_way,
         valids_11 & io_query_0_req_bits_idx == entries_11_idx
           & io_query_0_req_bits_way == entries_11_way});
  assign io_query_1_resp =
    io_query_1_req_valid
    & (|{valids_0 & io_query_1_req_bits_idx == entries_0_idx
           & io_query_1_req_bits_way == entries_0_way,
         valids_1 & io_query_1_req_bits_idx == entries_1_idx
           & io_query_1_req_bits_way == entries_1_way,
         valids_2 & io_query_1_req_bits_idx == entries_2_idx
           & io_query_1_req_bits_way == entries_2_way,
         valids_3 & io_query_1_req_bits_idx == entries_3_idx
           & io_query_1_req_bits_way == entries_3_way,
         valids_4 & io_query_1_req_bits_idx == entries_4_idx
           & io_query_1_req_bits_way == entries_4_way,
         valids_5 & io_query_1_req_bits_idx == entries_5_idx
           & io_query_1_req_bits_way == entries_5_way,
         valids_6 & io_query_1_req_bits_idx == entries_6_idx
           & io_query_1_req_bits_way == entries_6_way,
         valids_7 & io_query_1_req_bits_idx == entries_7_idx
           & io_query_1_req_bits_way == entries_7_way,
         valids_8 & io_query_1_req_bits_idx == entries_8_idx
           & io_query_1_req_bits_way == entries_8_way,
         valids_9 & io_query_1_req_bits_idx == entries_9_idx
           & io_query_1_req_bits_way == entries_9_way,
         valids_10 & io_query_1_req_bits_idx == entries_10_idx
           & io_query_1_req_bits_way == entries_10_way,
         valids_11 & io_query_1_req_bits_idx == entries_11_idx
           & io_query_1_req_bits_way == entries_11_way});
  assign io_query_2_resp =
    io_query_2_req_valid
    & (|{valids_0 & io_query_2_req_bits_idx == entries_0_idx
           & io_query_2_req_bits_way == entries_0_way,
         valids_1 & io_query_2_req_bits_idx == entries_1_idx
           & io_query_2_req_bits_way == entries_1_way,
         valids_2 & io_query_2_req_bits_idx == entries_2_idx
           & io_query_2_req_bits_way == entries_2_way,
         valids_3 & io_query_2_req_bits_idx == entries_3_idx
           & io_query_2_req_bits_way == entries_3_way,
         valids_4 & io_query_2_req_bits_idx == entries_4_idx
           & io_query_2_req_bits_way == entries_4_way,
         valids_5 & io_query_2_req_bits_idx == entries_5_idx
           & io_query_2_req_bits_way == entries_5_way,
         valids_6 & io_query_2_req_bits_idx == entries_6_idx
           & io_query_2_req_bits_way == entries_6_way,
         valids_7 & io_query_2_req_bits_idx == entries_7_idx
           & io_query_2_req_bits_way == entries_7_way,
         valids_8 & io_query_2_req_bits_idx == entries_8_idx
           & io_query_2_req_bits_way == entries_8_way,
         valids_9 & io_query_2_req_bits_idx == entries_9_idx
           & io_query_2_req_bits_way == entries_9_way,
         valids_10 & io_query_2_req_bits_idx == entries_10_idx
           & io_query_2_req_bits_way == entries_10_way,
         valids_11 & io_query_2_req_bits_idx == entries_11_idx
           & io_query_2_req_bits_way == entries_11_way});
endmodule

