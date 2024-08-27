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
module PBestOffsetPrefetch(
  input         clock,
  input         reset,
  output        io_train_ready,
  input         io_train_valid,
  input  [20:0] io_train_bits_tag,
  input  [8:0]  io_train_bits_set,
  input         io_train_bits_needT,
  input  [6:0]  io_train_bits_source,
  output        io_req_valid,
  output [20:0] io_req_bits_tag,
  output [8:0]  io_req_bits_set,
  output [32:0] io_req_bits_vaddr,
  output        io_req_bits_needT,
  output [6:0]  io_req_bits_source,
  output        io_resp_ready
);

  wire        _scoreTable_io_req_ready;
  wire [6:0]  _scoreTable_io_prefetchOffset;
  wire        _scoreTable_io_prefetchDisable;
  wire        _scoreTable_io_test_req_valid;
  wire [35:0] _scoreTable_io_test_req_bits_addr;
  wire [6:0]  _scoreTable_io_test_req_bits_testOffset;
  wire [5:0]  _scoreTable_io_test_req_bits_ptr;
  wire        _rrTable_io_w_ready;
  wire        _rrTable_io_r_resp_valid;
  wire [5:0]  _rrTable_io_r_resp_bits_ptr;
  wire        _rrTable_io_r_resp_bits_hit;
  wire        _delayQueue_io_out_valid;
  wire [35:0] _delayQueue_io_out_bits;
  wire [35:0] _newAddr_T_5 =
    36'({io_train_bits_tag, io_train_bits_set, 6'h0}
        + {{23{_scoreTable_io_prefetchOffset[6]}}, _scoreTable_io_prefetchOffset, 6'h0});
  reg  [20:0] req_tag;
  reg  [8:0]  req_set;
  reg         req_needT;
  reg  [6:0]  req_source;
  reg         req_valid;
  wire        _GEN = _scoreTable_io_req_ready & io_train_valid;
  always @(posedge clock) begin
    if (_GEN) begin
      req_tag <= _newAddr_T_5[35:15];
      req_set <= _newAddr_T_5[14:6];
      req_needT <= io_train_bits_needT;
      req_source <= io_train_bits_source;
    end
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset)
      req_valid <= 1'h0;
    else
      req_valid <=
        _GEN & _newAddr_T_5[35:12] == {io_train_bits_tag, io_train_bits_set[8:6]}
        & ~_scoreTable_io_prefetchDisable;
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
        req_tag = _RANDOM[2'h0][20:0];
        req_set = _RANDOM[2'h0][29:21];
        req_needT = _RANDOM[2'h1][31];
        req_source = _RANDOM[2'h2][6:0];
        req_valid = _RANDOM[2'h2][11];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        req_valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  DelayQueue delayQueue (
    .clock        (clock),
    .reset        (reset),
    .io_in_valid  (io_train_valid),
    .io_in_bits   ({io_train_bits_tag, io_train_bits_set}),
    .io_out_ready (_rrTable_io_w_ready),
    .io_out_valid (_delayQueue_io_out_valid),
    .io_out_bits  (_delayQueue_io_out_bits)
  );
  RecentRequestTable rrTable (
    .clock                    (clock),
    .reset                    (reset),
    .io_w_ready               (_rrTable_io_w_ready),
    .io_w_valid               (_delayQueue_io_out_valid),
    .io_w_bits                (_delayQueue_io_out_bits),
    .io_r_req_valid           (_scoreTable_io_test_req_valid),
    .io_r_req_bits_addr       (_scoreTable_io_test_req_bits_addr),
    .io_r_req_bits_testOffset (_scoreTable_io_test_req_bits_testOffset),
    .io_r_req_bits_ptr        (_scoreTable_io_test_req_bits_ptr),
    .io_r_resp_valid          (_rrTable_io_r_resp_valid),
    .io_r_resp_bits_ptr       (_rrTable_io_r_resp_bits_ptr),
    .io_r_resp_bits_hit       (_rrTable_io_r_resp_bits_hit)
  );
  OffsetScoreTable scoreTable (
    .clock                       (clock),
    .reset                       (reset),
    .io_req_ready                (_scoreTable_io_req_ready),
    .io_req_valid                (io_train_valid),
    .io_req_bits                 ({io_train_bits_tag, io_train_bits_set, 6'h0}),
    .io_prefetchOffset           (_scoreTable_io_prefetchOffset),
    .io_prefetchDisable          (_scoreTable_io_prefetchDisable),
    .io_test_req_valid           (_scoreTable_io_test_req_valid),
    .io_test_req_bits_addr       (_scoreTable_io_test_req_bits_addr),
    .io_test_req_bits_testOffset (_scoreTable_io_test_req_bits_testOffset),
    .io_test_req_bits_ptr        (_scoreTable_io_test_req_bits_ptr),
    .io_test_resp_valid          (_rrTable_io_r_resp_valid),
    .io_test_resp_bits_ptr       (_rrTable_io_r_resp_bits_ptr),
    .io_test_resp_bits_hit       (_rrTable_io_r_resp_bits_hit)
  );
  assign io_train_ready = _scoreTable_io_req_ready;
  assign io_req_valid = req_valid;
  assign io_req_bits_tag = req_tag;
  assign io_req_bits_set = req_set;
  assign io_req_bits_vaddr = 33'h0;
  assign io_req_bits_needT = req_needT;
  assign io_req_bits_source = req_source;
  assign io_resp_ready = _rrTable_io_w_ready;
endmodule

