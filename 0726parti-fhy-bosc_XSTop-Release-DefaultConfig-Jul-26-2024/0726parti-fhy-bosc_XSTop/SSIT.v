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
module SSIT(
  input        clock,
  input        reset,
  input        io_ren_0,
  input        io_ren_1,
  input        io_ren_2,
  input        io_ren_3,
  input        io_ren_4,
  input        io_ren_5,
  input  [9:0] io_raddr_0,
  input  [9:0] io_raddr_1,
  input  [9:0] io_raddr_2,
  input  [9:0] io_raddr_3,
  input  [9:0] io_raddr_4,
  input  [9:0] io_raddr_5,
  output       io_rdata_0_valid,
  output [4:0] io_rdata_0_ssid,
  output       io_rdata_0_strict,
  output       io_rdata_1_valid,
  output [4:0] io_rdata_1_ssid,
  output       io_rdata_1_strict,
  output       io_rdata_2_valid,
  output [4:0] io_rdata_2_ssid,
  output       io_rdata_2_strict,
  output       io_rdata_3_valid,
  output [4:0] io_rdata_3_ssid,
  output       io_rdata_3_strict,
  output       io_rdata_4_valid,
  output [4:0] io_rdata_4_ssid,
  output       io_rdata_4_strict,
  output       io_rdata_5_valid,
  output [4:0] io_rdata_5_ssid,
  output       io_rdata_5_strict,
  input  [4:0] io_csrCtrl_lvpred_timeout
);

  wire [4:0]      _data_array_io_rdata_0_ssid;
  wire [4:0]      _data_array_io_rdata_1_ssid;
  wire            _valid_array_io_rdata_0;
  wire            _valid_array_io_rdata_1;
  reg  [19:0]     resetCounter;
  reg  [10:0]     resetStepCounter;
  reg             state;
  reg  [4:0]      REG;
  reg             s1_mempred_update_req_valid;
  reg             s2_mempred_update_req_valid;
  reg  [9:0]      s2_ldSsidAllocate_value;
  reg  [9:0]      s2_stSsidAllocate_value;
  reg             s2_loadAssigned;
  reg             s2_storeAssigned;
  reg  [4:0]      s2_loadOldSSID;
  reg  [4:0]      s2_storeOldSSID;
  wire [4:0]      s2_ldSsidAllocate =
    s2_ldSsidAllocate_value[4:0] ^ s2_ldSsidAllocate_value[9:5];
  wire [4:0]      s2_winnerSSID =
    s2_loadOldSSID < s2_storeOldSSID ? s2_loadOldSSID : s2_storeOldSSID;
  wire [1:0]      _GEN = {s2_loadAssigned, s2_storeAssigned};
  wire            _GEN_0 = _GEN == 2'h0;
  wire            _GEN_1 = _GEN == 2'h2;
  wire            _GEN_2 = _GEN == 2'h1;
  wire            _GEN_3 = _GEN_2 | (&_GEN);
  wire            _GEN_4 = s2_mempred_update_req_valid & (_GEN_0 | ~(_GEN_1 | ~_GEN_3));
  wire [9:0]      valid_array_io_waddr_0 =
    _GEN_4 ? s2_ldSsidAllocate_value : state ? resetStepCounter[9:0] : 10'h0;
  wire            data_array_io_wen_0 =
    s2_mempred_update_req_valid & (_GEN_0 | ~_GEN_1 & (_GEN_2 | (&_GEN)));
  wire [9:0]      data_array_io_waddr_0 = _GEN_4 ? s2_ldSsidAllocate_value : 10'h0;
  wire [3:0][4:0] _GEN_5 =
    {{(&_GEN) ? s2_winnerSSID : 5'h0}, {5'h0}, {s2_ldSsidAllocate}, {s2_ldSsidAllocate}};
  wire            _GEN_6 = _GEN_0 | _GEN_1;
  wire            valid_array_io_wdata_1 =
    s2_mempred_update_req_valid & (_GEN_6 | ~_GEN_2 & (&_GEN));
  wire            _GEN_7 = _GEN_2 | ~(&_GEN);
  wire [9:0]      data_array_io_waddr_1 =
    s2_mempred_update_req_valid & (_GEN_6 | ~_GEN_7) ? s2_stSsidAllocate_value : 10'h0;
  wire            _GEN_8 = resetStepCounter == 11'h3FF;
  wire [9:0]      _GEN_9 = resetCounter[19:10] >> REG;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      resetCounter <= 20'h0;
      resetStepCounter <= 11'h0;
      state <= 1'h1;
    end
    else begin
      resetCounter <= ~state & _GEN_9[0] ? 20'h0 : 20'(resetCounter + 20'h1);
      if (state) begin
        resetStepCounter <= _GEN_8 ? 11'h0 : 11'(resetStepCounter + 11'h1);
        state <= ~(state & _GEN_8) & state;
      end
      else
        state <= _GEN_9[0] | state;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    REG <= io_csrCtrl_lvpred_timeout;
    s1_mempred_update_req_valid <= 1'h0;
    s2_mempred_update_req_valid <= s1_mempred_update_req_valid;
    if (s1_mempred_update_req_valid) begin
      s2_ldSsidAllocate_value <= 10'h0;
      s2_stSsidAllocate_value <= 10'h0;
      s2_loadAssigned <= _valid_array_io_rdata_0;
      s2_storeAssigned <= _valid_array_io_rdata_1;
      s2_loadOldSSID <= _data_array_io_rdata_0_ssid;
      s2_storeOldSSID <= _data_array_io_rdata_1_ssid;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:227];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [7:0] i = 8'h0; i < 8'hE4; i += 8'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        resetCounter = _RANDOM[8'hE0][19:0];
        resetStepCounter = _RANDOM[8'hE0][30:20];
        state = _RANDOM[8'hE0][31];
        REG = _RANDOM[8'hE1][4:0];
        s1_mempred_update_req_valid = _RANDOM[8'hE1][5];
        s2_mempred_update_req_valid = _RANDOM[8'hE2][6];
        s2_ldSsidAllocate_value = _RANDOM[8'hE2][28:19];
        s2_stSsidAllocate_value = {_RANDOM[8'hE2][31:29], _RANDOM[8'hE3][6:0]};
        s2_loadAssigned = _RANDOM[8'hE3][7];
        s2_storeAssigned = _RANDOM[8'hE3][8];
        s2_loadOldSSID = _RANDOM[8'hE3][13:9];
        s2_storeOldSSID = _RANDOM[8'hE3][18:14];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        resetCounter = 20'h0;
        resetStepCounter = 11'h0;
        state = 1'h1;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SyncDataModuleTemplate__1024entry valid_array (
    .clock      (clock),
    .reset      (reset),
    .io_ren_0   (io_ren_0),
    .io_ren_1   (io_ren_1),
    .io_ren_2   (io_ren_2),
    .io_ren_3   (io_ren_3),
    .io_ren_4   (io_ren_4),
    .io_ren_5   (io_ren_5),
    .io_raddr_0 (io_raddr_0),
    .io_raddr_1 (io_raddr_1),
    .io_raddr_2 (io_raddr_2),
    .io_raddr_3 (io_raddr_3),
    .io_raddr_4 (io_raddr_4),
    .io_raddr_5 (io_raddr_5),
    .io_rdata_0 (_valid_array_io_rdata_0),
    .io_rdata_1 (_valid_array_io_rdata_1),
    .io_rdata_2 (io_rdata_2_valid),
    .io_rdata_3 (io_rdata_3_valid),
    .io_rdata_4 (io_rdata_4_valid),
    .io_rdata_5 (io_rdata_5_valid),
    .io_wen_0   (s2_mempred_update_req_valid & (_GEN_0 | ~_GEN_1 & _GEN_3) | state),
    .io_wen_1
      (valid_array_io_waddr_0 != data_array_io_waddr_1 & valid_array_io_wdata_1),
    .io_waddr_0 (valid_array_io_waddr_0),
    .io_waddr_1 (data_array_io_waddr_1),
    .io_wdata_0 (data_array_io_wen_0),
    .io_wdata_1 (valid_array_io_wdata_1)
  );
  SyncDataModuleTemplate__1024entry_1 data_array (
    .clock             (clock),
    .reset             (reset),
    .io_ren_0          (io_ren_0),
    .io_ren_1          (io_ren_1),
    .io_ren_2          (io_ren_2),
    .io_ren_3          (io_ren_3),
    .io_ren_4          (io_ren_4),
    .io_ren_5          (io_ren_5),
    .io_raddr_0        (io_raddr_0),
    .io_raddr_1        (io_raddr_1),
    .io_raddr_2        (io_raddr_2),
    .io_raddr_3        (io_raddr_3),
    .io_raddr_4        (io_raddr_4),
    .io_raddr_5        (io_raddr_5),
    .io_rdata_0_ssid   (_data_array_io_rdata_0_ssid),
    .io_rdata_0_strict (io_rdata_0_strict),
    .io_rdata_1_ssid   (_data_array_io_rdata_1_ssid),
    .io_rdata_1_strict (io_rdata_1_strict),
    .io_rdata_2_ssid   (io_rdata_2_ssid),
    .io_rdata_2_strict (io_rdata_2_strict),
    .io_rdata_3_ssid   (io_rdata_3_ssid),
    .io_rdata_3_strict (io_rdata_3_strict),
    .io_rdata_4_ssid   (io_rdata_4_ssid),
    .io_rdata_4_strict (io_rdata_4_strict),
    .io_rdata_5_ssid   (io_rdata_5_ssid),
    .io_rdata_5_strict (io_rdata_5_strict),
    .io_wen_0          (data_array_io_wen_0),
    .io_wen_1
      (data_array_io_waddr_0 != data_array_io_waddr_1 & valid_array_io_wdata_1),
    .io_waddr_0        (data_array_io_waddr_0),
    .io_waddr_1        (data_array_io_waddr_1),
    .io_wdata_0_ssid   (s2_mempred_update_req_valid ? _GEN_5[_GEN] : 5'h0),
    .io_wdata_0_strict
      (s2_mempred_update_req_valid & ~(_GEN_0 | _GEN_1 | _GEN_2) & (&_GEN)
       & s2_loadOldSSID == s2_storeOldSSID),
    .io_wdata_1_ssid
      (s2_mempred_update_req_valid
         ? (_GEN_6
              ? s2_stSsidAllocate_value[4:0] ^ s2_stSsidAllocate_value[9:5]
              : _GEN_7 ? 5'h0 : s2_winnerSSID)
         : 5'h0)
  );
  assign io_rdata_0_valid = _valid_array_io_rdata_0;
  assign io_rdata_0_ssid = _data_array_io_rdata_0_ssid;
  assign io_rdata_1_valid = _valid_array_io_rdata_1;
  assign io_rdata_1_ssid = _data_array_io_rdata_1_ssid;
endmodule

