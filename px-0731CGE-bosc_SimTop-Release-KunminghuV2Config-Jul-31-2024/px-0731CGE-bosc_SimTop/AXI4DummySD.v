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
module AXI4DummySD(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [1:0]  auto_in_aw_bits_id,
  input  [30:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [1:0]  auto_in_aw_bits_burst,
  input         auto_in_aw_bits_lock,
  input  [3:0]  auto_in_aw_bits_cache,
  input  [2:0]  auto_in_aw_bits_prot,
  input  [3:0]  auto_in_aw_bits_qos,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [1:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [1:0]  auto_in_ar_bits_id,
  input  [30:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input         auto_in_ar_bits_lock,
  input  [3:0]  auto_in_ar_bits_cache,
  input  [2:0]  auto_in_ar_bits_prot,
  input  [3:0]  auto_in_ar_bits_qos,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [1:0]  auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last
);

  reg  [1:0]  state;
  wire [31:0] _DifftestSDCard_io_data;
  wire        nodeIn_aw_valid = auto_in_aw_valid;
  wire [1:0]  nodeIn_aw_bits_id = auto_in_aw_bits_id;
  wire [30:0] nodeIn_aw_bits_addr = auto_in_aw_bits_addr;
  wire [7:0]  nodeIn_aw_bits_len = auto_in_aw_bits_len;
  wire [2:0]  nodeIn_aw_bits_size = auto_in_aw_bits_size;
  wire [1:0]  nodeIn_aw_bits_burst = auto_in_aw_bits_burst;
  wire        nodeIn_aw_bits_lock = auto_in_aw_bits_lock;
  wire [3:0]  nodeIn_aw_bits_cache = auto_in_aw_bits_cache;
  wire [2:0]  nodeIn_aw_bits_prot = auto_in_aw_bits_prot;
  wire [3:0]  nodeIn_aw_bits_qos = auto_in_aw_bits_qos;
  wire        nodeIn_w_valid = auto_in_w_valid;
  wire [63:0] nodeIn_w_bits_data = auto_in_w_bits_data;
  wire [7:0]  nodeIn_w_bits_strb = auto_in_w_bits_strb;
  wire        nodeIn_w_bits_last = auto_in_w_bits_last;
  wire        nodeIn_b_ready = auto_in_b_ready;
  wire        nodeIn_ar_valid = auto_in_ar_valid;
  wire [1:0]  nodeIn_ar_bits_id = auto_in_ar_bits_id;
  wire [30:0] nodeIn_ar_bits_addr = auto_in_ar_bits_addr;
  wire [7:0]  nodeIn_ar_bits_len = auto_in_ar_bits_len;
  wire [2:0]  nodeIn_ar_bits_size = auto_in_ar_bits_size;
  wire [1:0]  nodeIn_ar_bits_burst = auto_in_ar_bits_burst;
  wire        nodeIn_ar_bits_lock = auto_in_ar_bits_lock;
  wire [3:0]  nodeIn_ar_bits_cache = auto_in_ar_bits_cache;
  wire [2:0]  nodeIn_ar_bits_prot = auto_in_ar_bits_prot;
  wire [3:0]  nodeIn_ar_bits_qos = auto_in_ar_bits_qos;
  wire        nodeIn_r_ready = auto_in_r_ready;
  wire [1:0]  nodeIn_b_bits_resp = 2'h0;
  wire [1:0]  nodeIn_r_bits_resp = 2'h0;
  wire        nodeIn_ar_ready = ~(|state);
  wire        _nodeIn_r_bits_user_T = nodeIn_ar_ready & nodeIn_ar_valid;
  wire        nodeIn_aw_ready;
  wire        _nodeIn_b_bits_user_T = nodeIn_aw_ready & nodeIn_aw_valid;
  wire        nodeIn_w_ready;
  wire        _GEN = nodeIn_w_ready & nodeIn_w_valid;
  reg  [7:0]  readBeatCnt;
  reg  [7:0]  len_hold_data;
  reg  [30:0] raddr_hold_data;
  wire [12:0] raddr =
    _nodeIn_r_bits_user_T ? nodeIn_ar_bits_addr[12:0] : raddr_hold_data[12:0];
  wire        nodeIn_r_bits_last =
    readBeatCnt == (_nodeIn_r_bits_user_T ? nodeIn_ar_bits_len : len_hold_data);
  wire        nodeIn_r_valid = state == 2'h1;
  reg  [30:0] waddr_hold_data;
  wire [12:0] waddr =
    _nodeIn_b_bits_user_T ? nodeIn_aw_bits_addr[12:0] : waddr_hold_data[12:0];
  assign nodeIn_aw_ready = ~(|state) & ~nodeIn_ar_valid;
  assign nodeIn_w_ready = state == 2'h2;
  wire        nodeIn_b_valid = &state;
  reg  [1:0]  nodeIn_b_bits_id_r;
  wire [1:0]  nodeIn_b_bits_id = nodeIn_b_bits_id_r;
  reg  [1:0]  nodeIn_r_bits_id_r;
  wire [1:0]  nodeIn_r_bits_id = nodeIn_r_bits_id_r;
  reg  [31:0] regs_0;
  reg  [31:0] regs_1;
  reg  [31:0] regs_4;
  reg  [31:0] regs_5;
  reg  [31:0] regs_6;
  reg  [31:0] regs_7;
  reg  [31:0] regs_8;
  reg  [31:0] regs_15;
  reg  [31:0] regs_20;
  wire [3:0]  strb = waddr[2] ? nodeIn_w_bits_strb[7:4] : nodeIn_w_bits_strb[3:0];
  wire [31:0] _GEN_0 = {{8{strb[3]}}, {8{strb[2]}}, {8{strb[1]}}, {8{strb[0]}}};
  wire        _GEN_1 = _GEN & waddr == 13'h0;
  wire [31:0] _regs_0_T_3 = nodeIn_w_bits_data[31:0] & _GEN_0 | regs_0 & ~_GEN_0;
  wire        _regs_0_T_4 = _regs_0_T_3[5:0] == 6'h1;
  wire        _regs_0_T_5 = _regs_0_T_3[5:0] == 6'h2;
  wire        _regs_0_T_6 = _regs_0_T_3[5:0] == 6'h9;
  wire        _regs_0_T_7 = _regs_0_T_3[5:0] == 6'hD;
  wire [63:0] nodeIn_r_bits_data =
    {2{(raddr == 13'h0 ? regs_0 : 32'h0) | (raddr == 13'h38 ? regs_15 : 32'h0)
         | (raddr == 13'h18 ? regs_6 : 32'h0) | {24'h0, raddr == 13'h34, 7'h0}
         | (raddr == 13'h14 ? regs_5 : 32'h0) | (raddr == 13'h1C ? regs_7 : 32'h0)
         | (raddr == 13'h50 ? regs_20 : 32'h0) | (raddr == 13'h10 ? regs_4 : 32'h0)
         | (raddr == 13'h4 ? regs_1 : 32'h0) | (raddr == 13'h20 ? regs_8 : 32'h0)
         | (raddr == 13'h40 ? _DifftestSDCard_io_data : 32'h0)}};
  wire        _GEN_2 = nodeIn_r_ready & nodeIn_r_valid;
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
      readBeatCnt <= 8'h0;
      regs_0 <= 32'h0;
      regs_1 <= 32'h0;
      regs_4 <= 32'h0;
      regs_5 <= 32'h0;
      regs_6 <= 32'h0;
      regs_7 <= 32'h0;
      regs_8 <= 32'h0;
      regs_15 <= 32'h0;
      regs_20 <= 32'h0;
    end
    else begin
      if (|state) begin
        if (state == 2'h1) begin
          if (_GEN_2 & nodeIn_r_bits_last)
            state <= 2'h0;
        end
        else if (state == 2'h2) begin
          if (_GEN & nodeIn_w_bits_last)
            state <= 2'h3;
        end
        else if ((&state) & nodeIn_b_ready & nodeIn_b_valid)
          state <= 2'h0;
      end
      else if (_nodeIn_b_bits_user_T)
        state <= 2'h2;
      else if (_nodeIn_r_bits_user_T)
        state <= 2'h1;
      if (_GEN_2) begin
        if (nodeIn_r_bits_last)
          readBeatCnt <= 8'h0;
        else
          readBeatCnt <= 8'(readBeatCnt + 8'h1);
      end
      if (_GEN_1) begin
        regs_0 <= _regs_0_T_3;
        if (_regs_0_T_4)
          regs_4 <= 32'h80FF8000;
        else if (_regs_0_T_5)
          regs_4 <= 32'h1;
        else if (_regs_0_T_6)
          regs_4 <= 32'h92404001;
        else if (_regs_0_T_7)
          regs_4 <= 32'h0;
      end
      if (_GEN & waddr == 13'h4)
        regs_1 <= nodeIn_w_bits_data[31:0] & _GEN_0 | regs_1 & ~_GEN_0;
      if (~_GEN_1 | _regs_0_T_4) begin
      end
      else if (_regs_0_T_5) begin
        regs_5 <= 32'h0;
        regs_6 <= 32'h0;
        regs_7 <= 32'h15000000;
      end
      else if (_regs_0_T_6) begin
        regs_5 <= 32'hD24B97E3;
        regs_6 <= 32'hF5F803F;
        regs_7 <= 32'h8C26012A;
      end
      else if (_regs_0_T_7) begin
        regs_5 <= 32'h0;
        regs_6 <= 32'h0;
        regs_7 <= 32'h0;
      end
      if (_GEN & waddr == 13'h20)
        regs_8 <= nodeIn_w_bits_data[31:0] & _GEN_0 | regs_8 & ~_GEN_0;
      if (_GEN & waddr == 13'h38)
        regs_15 <= nodeIn_w_bits_data[31:0] & _GEN_0 | regs_15 & ~_GEN_0;
      if (_GEN & waddr == 13'h50)
        regs_20 <= nodeIn_w_bits_data[31:0] & _GEN_0 | regs_20 & ~_GEN_0;
    end
    if (_nodeIn_r_bits_user_T) begin
      len_hold_data <= nodeIn_ar_bits_len;
      raddr_hold_data <= nodeIn_ar_bits_addr;
      nodeIn_r_bits_id_r <= nodeIn_ar_bits_id;
    end
    if (_nodeIn_b_bits_user_T) begin
      waddr_hold_data <= nodeIn_aw_bits_addr;
      nodeIn_b_bits_id_r <= nodeIn_aw_bits_id;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:23];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h18; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        state = _RANDOM[5'h0][1:0];
        readBeatCnt = _RANDOM[5'h0][9:2];
        len_hold_data = _RANDOM[5'h0][17:10];
        raddr_hold_data = {_RANDOM[5'h0][31:18], _RANDOM[5'h1][16:0]};
        waddr_hold_data = {_RANDOM[5'h1][31:25], _RANDOM[5'h2][23:0]};
        nodeIn_b_bits_id_r = _RANDOM[5'h2][25:24];
        nodeIn_r_bits_id_r = _RANDOM[5'h2][27:26];
        regs_0 = {_RANDOM[5'h2][31:28], _RANDOM[5'h3][27:0]};
        regs_1 = {_RANDOM[5'h3][31:28], _RANDOM[5'h4][27:0]};
        regs_4 = {_RANDOM[5'h6][31:28], _RANDOM[5'h7][27:0]};
        regs_5 = {_RANDOM[5'h7][31:28], _RANDOM[5'h8][27:0]};
        regs_6 = {_RANDOM[5'h8][31:28], _RANDOM[5'h9][27:0]};
        regs_7 = {_RANDOM[5'h9][31:28], _RANDOM[5'hA][27:0]};
        regs_8 = {_RANDOM[5'hA][31:28], _RANDOM[5'hB][27:0]};
        regs_15 = {_RANDOM[5'h11][31:28], _RANDOM[5'h12][27:0]};
        regs_20 = {_RANDOM[5'h16][31:28], _RANDOM[5'h17][27:0]};
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  DifftestSDCard DifftestSDCard (
    .clock      (clock),
    .io_setAddr
      (_GEN_1 & ~(_regs_0_T_4 | _regs_0_T_5 | _regs_0_T_6 | _regs_0_T_7)
       & _regs_0_T_3[5:0] == 6'h12),
    .io_addr    (regs_1),
    .io_ren     (raddr == 13'h40 & _nodeIn_r_bits_user_T),
    .io_data    (_DifftestSDCard_io_data)
  );
  assign auto_in_aw_ready = nodeIn_aw_ready;
  assign auto_in_w_ready = nodeIn_w_ready;
  assign auto_in_b_valid = nodeIn_b_valid;
  assign auto_in_b_bits_id = nodeIn_b_bits_id;
  assign auto_in_b_bits_resp = nodeIn_b_bits_resp;
  assign auto_in_ar_ready = nodeIn_ar_ready;
  assign auto_in_r_valid = nodeIn_r_valid;
  assign auto_in_r_bits_id = nodeIn_r_bits_id;
  assign auto_in_r_bits_data = nodeIn_r_bits_data;
  assign auto_in_r_bits_resp = nodeIn_r_bits_resp;
  assign auto_in_r_bits_last = nodeIn_r_bits_last;
endmodule

