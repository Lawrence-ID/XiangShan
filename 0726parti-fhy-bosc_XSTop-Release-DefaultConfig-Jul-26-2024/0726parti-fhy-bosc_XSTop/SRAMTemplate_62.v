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
module SRAMTemplate_62(
  input          clock,
  input          reset,
  input          io_r_req_valid,
  input  [6:0]   io_r_req_bits_setIdx,
  output         io_r_resp_data_0_valid,
  output [8:0]   io_r_resp_data_0_tag,
  output [1:0]   io_r_resp_data_0_ctr,
  output [40:0]  io_r_resp_data_0_target,
  output         io_r_resp_data_0_useful,
  output         io_r_resp_data_1_valid,
  output [8:0]   io_r_resp_data_1_tag,
  output [1:0]   io_r_resp_data_1_ctr,
  output [40:0]  io_r_resp_data_1_target,
  output         io_r_resp_data_1_useful,
  output         io_r_resp_data_2_valid,
  output [8:0]   io_r_resp_data_2_tag,
  output [1:0]   io_r_resp_data_2_ctr,
  output [40:0]  io_r_resp_data_2_target,
  output         io_r_resp_data_2_useful,
  output         io_r_resp_data_3_valid,
  output [8:0]   io_r_resp_data_3_tag,
  output [1:0]   io_r_resp_data_3_ctr,
  output [40:0]  io_r_resp_data_3_target,
  output         io_r_resp_data_3_useful,
  input          io_w_req_valid,
  input  [6:0]   io_w_req_bits_setIdx,
  input  [8:0]   io_w_req_bits_data_0_tag,
  input  [1:0]   io_w_req_bits_data_0_ctr,
  input  [40:0]  io_w_req_bits_data_0_target,
  input          io_w_req_bits_data_0_useful,
  input  [8:0]   io_w_req_bits_data_1_tag,
  input  [1:0]   io_w_req_bits_data_1_ctr,
  input  [40:0]  io_w_req_bits_data_1_target,
  input          io_w_req_bits_data_1_useful,
  input  [8:0]   io_w_req_bits_data_2_tag,
  input  [1:0]   io_w_req_bits_data_2_ctr,
  input  [40:0]  io_w_req_bits_data_2_target,
  input          io_w_req_bits_data_2_useful,
  input  [8:0]   io_w_req_bits_data_3_tag,
  input  [1:0]   io_w_req_bits_data_3_ctr,
  input  [40:0]  io_w_req_bits_data_3_target,
  input          io_w_req_bits_data_3_useful,
  input  [215:0] io_w_req_bits_flattened_bitmask
);

  wire [6:0]   setIdx;
  wire         realRen;
  wire         wen;
  wire [215:0] _array_RW0_rdata;
  reg          _resetState;
  reg  [6:0]   _resetSet;
  assign wen = io_w_req_valid | _resetState;
  assign realRen = io_r_req_valid & ~wen;
  assign setIdx = _resetState ? _resetSet : io_w_req_bits_setIdx;
  reg          rdata_last_REG;
  reg  [53:0]  rdata_hold_data_0;
  reg  [53:0]  rdata_hold_data_1;
  reg  [53:0]  rdata_hold_data_2;
  reg  [53:0]  rdata_hold_data_3;
  wire [53:0]  _rdata_T_0 = rdata_last_REG ? _array_RW0_rdata[53:0] : rdata_hold_data_0;
  wire [53:0]  _rdata_T_1 = rdata_last_REG ? _array_RW0_rdata[107:54] : rdata_hold_data_1;
  wire [53:0]  _rdata_T_2 =
    rdata_last_REG ? _array_RW0_rdata[161:108] : rdata_hold_data_2;
  wire [53:0]  _rdata_T_3 =
    rdata_last_REG ? _array_RW0_rdata[215:162] : rdata_hold_data_3;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _resetState <= 1'h1;
      _resetSet <= 7'h0;
      rdata_last_REG <= 1'h0;
    end
    else begin
      _resetState <= ~(_resetState & (&_resetSet)) & _resetState;
      if (_resetState)
        _resetSet <= 7'(_resetSet + 7'h1);
      rdata_last_REG <= realRen;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (rdata_last_REG) begin
      rdata_hold_data_0 <= _array_RW0_rdata[53:0];
      rdata_hold_data_1 <= _array_RW0_rdata[107:54];
      rdata_hold_data_2 <= _array_RW0_rdata[161:108];
      rdata_hold_data_3 <= _array_RW0_rdata[215:162];
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:15];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h10; i += 5'h1) begin
          _RANDOM[i[3:0]] = `RANDOM;
        end
        _resetState = _RANDOM[4'h0][0];
        _resetSet = _RANDOM[4'h0][7:1];
        rdata_last_REG = _RANDOM[4'h8][27];
        rdata_hold_data_0 = {_RANDOM[4'h8][31:28], _RANDOM[4'h9], _RANDOM[4'hA][17:0]};
        rdata_hold_data_1 = {_RANDOM[4'hA][31:18], _RANDOM[4'hB], _RANDOM[4'hC][7:0]};
        rdata_hold_data_2 = {_RANDOM[4'hC][31:8], _RANDOM[4'hD][29:0]};
        rdata_hold_data_3 = {_RANDOM[4'hD][31:30], _RANDOM[4'hE], _RANDOM[4'hF][19:0]};
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        _resetState = 1'h1;
        _resetSet = 7'h0;
        rdata_last_REG = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  array_7 array (
    .RW0_addr  (wen ? setIdx : io_r_req_bits_setIdx),
    .RW0_en    (realRen | wen),
    .RW0_clk   (clock),
    .RW0_wmode (wen),
    .RW0_wdata
      ({~_resetState,
        _resetState ? 9'h0 : io_w_req_bits_data_3_tag,
        _resetState ? 2'h0 : io_w_req_bits_data_3_ctr,
        _resetState ? 41'h0 : io_w_req_bits_data_3_target,
        ~_resetState & io_w_req_bits_data_3_useful,
        ~_resetState,
        _resetState ? 9'h0 : io_w_req_bits_data_2_tag,
        _resetState ? 2'h0 : io_w_req_bits_data_2_ctr,
        _resetState ? 41'h0 : io_w_req_bits_data_2_target,
        ~_resetState & io_w_req_bits_data_2_useful,
        ~_resetState,
        _resetState ? 9'h0 : io_w_req_bits_data_1_tag,
        _resetState ? 2'h0 : io_w_req_bits_data_1_ctr,
        _resetState ? 41'h0 : io_w_req_bits_data_1_target,
        ~_resetState & io_w_req_bits_data_1_useful,
        ~_resetState,
        _resetState ? 9'h0 : io_w_req_bits_data_0_tag,
        _resetState ? 2'h0 : io_w_req_bits_data_0_ctr,
        _resetState ? 41'h0 : io_w_req_bits_data_0_target,
        ~_resetState & io_w_req_bits_data_0_useful}),
    .RW0_rdata (_array_RW0_rdata),
    .RW0_wmask
      (_resetState
         ? 216'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
         : io_w_req_bits_flattened_bitmask)
  );
  assign io_r_resp_data_0_valid = _rdata_T_0[53];
  assign io_r_resp_data_0_tag = _rdata_T_0[52:44];
  assign io_r_resp_data_0_ctr = _rdata_T_0[43:42];
  assign io_r_resp_data_0_target = _rdata_T_0[41:1];
  assign io_r_resp_data_0_useful = _rdata_T_0[0];
  assign io_r_resp_data_1_valid = _rdata_T_1[53];
  assign io_r_resp_data_1_tag = _rdata_T_1[52:44];
  assign io_r_resp_data_1_ctr = _rdata_T_1[43:42];
  assign io_r_resp_data_1_target = _rdata_T_1[41:1];
  assign io_r_resp_data_1_useful = _rdata_T_1[0];
  assign io_r_resp_data_2_valid = _rdata_T_2[53];
  assign io_r_resp_data_2_tag = _rdata_T_2[52:44];
  assign io_r_resp_data_2_ctr = _rdata_T_2[43:42];
  assign io_r_resp_data_2_target = _rdata_T_2[41:1];
  assign io_r_resp_data_2_useful = _rdata_T_2[0];
  assign io_r_resp_data_3_valid = _rdata_T_3[53];
  assign io_r_resp_data_3_tag = _rdata_T_3[52:44];
  assign io_r_resp_data_3_ctr = _rdata_T_3[43:42];
  assign io_r_resp_data_3_target = _rdata_T_3[41:1];
  assign io_r_resp_data_3_useful = _rdata_T_3[0];
endmodule

