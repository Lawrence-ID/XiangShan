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
module MemCtrl(
  input        clock,
  input        reset,
  input        io_redirect_valid,
  input        io_redirect_bits_robIdx_flag,
  input  [7:0] io_redirect_bits_robIdx_value,
  input        io_redirect_bits_level,
  input        io_csrCtrl_lvpred_disable,
  input        io_csrCtrl_no_spec_load,
  input        io_csrCtrl_storeset_wait_store,
  input  [4:0] io_csrCtrl_lvpred_timeout,
  input        io_stIn_0_valid,
  input  [7:0] io_stIn_0_bits_robIdx_value,
  input        io_stIn_1_valid,
  input  [7:0] io_stIn_1_bits_robIdx_value,
  input        io_mdpFoldPcVecVld_0,
  input        io_mdpFoldPcVecVld_1,
  input        io_mdpFoldPcVecVld_2,
  input        io_mdpFoldPcVecVld_3,
  input        io_mdpFoldPcVecVld_4,
  input        io_mdpFoldPcVecVld_5,
  input  [9:0] io_mdpFlodPcVec_0,
  input  [9:0] io_mdpFlodPcVec_1,
  input  [9:0] io_mdpFlodPcVec_2,
  input  [9:0] io_mdpFlodPcVec_3,
  input  [9:0] io_mdpFlodPcVec_4,
  input  [9:0] io_mdpFlodPcVec_5,
  input        io_dispatchLFSTio_req_0_valid,
  input        io_dispatchLFSTio_req_0_bits_isstore,
  input  [4:0] io_dispatchLFSTio_req_0_bits_ssid,
  input        io_dispatchLFSTio_req_0_bits_robIdx_flag,
  input  [7:0] io_dispatchLFSTio_req_0_bits_robIdx_value,
  input        io_dispatchLFSTio_req_1_valid,
  input        io_dispatchLFSTio_req_1_bits_isstore,
  input  [4:0] io_dispatchLFSTio_req_1_bits_ssid,
  input        io_dispatchLFSTio_req_1_bits_robIdx_flag,
  input  [7:0] io_dispatchLFSTio_req_1_bits_robIdx_value,
  input        io_dispatchLFSTio_req_2_valid,
  input        io_dispatchLFSTio_req_2_bits_isstore,
  input  [4:0] io_dispatchLFSTio_req_2_bits_ssid,
  input        io_dispatchLFSTio_req_2_bits_robIdx_flag,
  input  [7:0] io_dispatchLFSTio_req_2_bits_robIdx_value,
  input        io_dispatchLFSTio_req_3_valid,
  input        io_dispatchLFSTio_req_3_bits_isstore,
  input  [4:0] io_dispatchLFSTio_req_3_bits_ssid,
  input        io_dispatchLFSTio_req_3_bits_robIdx_flag,
  input  [7:0] io_dispatchLFSTio_req_3_bits_robIdx_value,
  input        io_dispatchLFSTio_req_4_valid,
  input        io_dispatchLFSTio_req_4_bits_isstore,
  input  [4:0] io_dispatchLFSTio_req_4_bits_ssid,
  input        io_dispatchLFSTio_req_4_bits_robIdx_flag,
  input  [7:0] io_dispatchLFSTio_req_4_bits_robIdx_value,
  input        io_dispatchLFSTio_req_5_valid,
  input        io_dispatchLFSTio_req_5_bits_isstore,
  input  [4:0] io_dispatchLFSTio_req_5_bits_ssid,
  input        io_dispatchLFSTio_req_5_bits_robIdx_flag,
  input  [7:0] io_dispatchLFSTio_req_5_bits_robIdx_value,
  output       io_dispatchLFSTio_resp_0_bits_shouldWait,
  output       io_dispatchLFSTio_resp_0_bits_robIdx_flag,
  output [7:0] io_dispatchLFSTio_resp_0_bits_robIdx_value,
  output       io_dispatchLFSTio_resp_1_bits_shouldWait,
  output       io_dispatchLFSTio_resp_1_bits_robIdx_flag,
  output [7:0] io_dispatchLFSTio_resp_1_bits_robIdx_value,
  output       io_dispatchLFSTio_resp_2_bits_shouldWait,
  output       io_dispatchLFSTio_resp_2_bits_robIdx_flag,
  output [7:0] io_dispatchLFSTio_resp_2_bits_robIdx_value,
  output       io_dispatchLFSTio_resp_3_bits_shouldWait,
  output       io_dispatchLFSTio_resp_3_bits_robIdx_flag,
  output [7:0] io_dispatchLFSTio_resp_3_bits_robIdx_value,
  output       io_dispatchLFSTio_resp_4_bits_shouldWait,
  output       io_dispatchLFSTio_resp_4_bits_robIdx_flag,
  output [7:0] io_dispatchLFSTio_resp_4_bits_robIdx_value,
  output       io_dispatchLFSTio_resp_5_bits_shouldWait,
  output       io_dispatchLFSTio_resp_5_bits_robIdx_flag,
  output [7:0] io_dispatchLFSTio_resp_5_bits_robIdx_value,
  output       io_ssit2Rename_0_valid,
  output [4:0] io_ssit2Rename_0_ssid,
  output       io_ssit2Rename_0_strict,
  output       io_ssit2Rename_1_valid,
  output [4:0] io_ssit2Rename_1_ssid,
  output       io_ssit2Rename_1_strict,
  output       io_ssit2Rename_2_valid,
  output [4:0] io_ssit2Rename_2_ssid,
  output       io_ssit2Rename_2_strict,
  output       io_ssit2Rename_3_valid,
  output [4:0] io_ssit2Rename_3_ssid,
  output       io_ssit2Rename_3_strict,
  output       io_ssit2Rename_4_valid,
  output [4:0] io_ssit2Rename_4_ssid,
  output       io_ssit2Rename_4_strict,
  output       io_ssit2Rename_5_valid,
  output [4:0] io_ssit2Rename_5_ssid,
  output       io_ssit2Rename_5_strict
);

  reg [4:0] ssit_io_csrCtrl_REG_lvpred_timeout;
  reg       lfst_io_redirect_REG_valid;
  reg       lfst_io_redirect_REG_bits_robIdx_flag;
  reg [7:0] lfst_io_redirect_REG_bits_robIdx_value;
  reg       lfst_io_redirect_REG_bits_level;
  reg       REG_0_valid;
  reg [7:0] REG_0_bits_robIdx_value;
  reg       REG_0_bits_storeSetHit;
  reg [4:0] REG_0_bits_ssid;
  reg       REG_1_valid;
  reg [7:0] REG_1_bits_robIdx_value;
  reg       REG_1_bits_storeSetHit;
  reg [4:0] REG_1_bits_ssid;
  reg       lfst_io_csrCtrl_REG_lvpred_disable;
  reg       lfst_io_csrCtrl_REG_no_spec_load;
  reg       lfst_io_csrCtrl_REG_storeset_wait_store;
  always @(posedge clock) begin
    ssit_io_csrCtrl_REG_lvpred_timeout <= io_csrCtrl_lvpred_timeout;
    lfst_io_redirect_REG_valid <= io_redirect_valid;
    lfst_io_redirect_REG_bits_robIdx_flag <= io_redirect_bits_robIdx_flag;
    lfst_io_redirect_REG_bits_robIdx_value <= io_redirect_bits_robIdx_value;
    lfst_io_redirect_REG_bits_level <= io_redirect_bits_level;
    REG_0_valid <= io_stIn_0_valid;
    REG_0_bits_robIdx_value <= io_stIn_0_bits_robIdx_value;
    REG_0_bits_storeSetHit <= 1'h0;
    REG_0_bits_ssid <= 5'h0;
    REG_1_valid <= io_stIn_1_valid;
    REG_1_bits_robIdx_value <= io_stIn_1_bits_robIdx_value;
    REG_1_bits_storeSetHit <= 1'h0;
    REG_1_bits_ssid <= 5'h0;
    lfst_io_csrCtrl_REG_lvpred_disable <= io_csrCtrl_lvpred_disable;
    lfst_io_csrCtrl_REG_no_spec_load <= io_csrCtrl_no_spec_load;
    lfst_io_csrCtrl_REG_storeset_wait_store <= io_csrCtrl_storeset_wait_store;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:111];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [6:0] i = 7'h0; i < 7'h70; i += 7'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        ssit_io_csrCtrl_REG_lvpred_timeout = _RANDOM[7'h2][27:23];
        lfst_io_redirect_REG_valid = _RANDOM[7'h13][26];
        lfst_io_redirect_REG_bits_robIdx_flag = _RANDOM[7'h13][28];
        lfst_io_redirect_REG_bits_robIdx_value =
          {_RANDOM[7'h13][31:29], _RANDOM[7'h14][4:0]};
        lfst_io_redirect_REG_bits_level = _RANDOM[7'h14][16];
        REG_0_valid = _RANDOM[7'h22][18];
        REG_0_bits_robIdx_value = {_RANDOM[7'h34][31:29], _RANDOM[7'h35][4:0]};
        REG_0_bits_storeSetHit = _RANDOM[7'h47][13];
        REG_0_bits_ssid = _RANDOM[7'h47][29:25];
        REG_1_valid = _RANDOM[7'h48][20];
        REG_1_bits_robIdx_value = {_RANDOM[7'h5A][31], _RANDOM[7'h5B][6:0]};
        REG_1_bits_storeSetHit = _RANDOM[7'h6D][15];
        REG_1_bits_ssid = _RANDOM[7'h6D][31:27];
        lfst_io_csrCtrl_REG_lvpred_disable = _RANDOM[7'h6F][9];
        lfst_io_csrCtrl_REG_no_spec_load = _RANDOM[7'h6F][10];
        lfst_io_csrCtrl_REG_storeset_wait_store = _RANDOM[7'h6F][11];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SSIT ssit (
    .clock                     (clock),
    .reset                     (reset),
    .io_ren_0                  (io_mdpFoldPcVecVld_0),
    .io_ren_1                  (io_mdpFoldPcVecVld_1),
    .io_ren_2                  (io_mdpFoldPcVecVld_2),
    .io_ren_3                  (io_mdpFoldPcVecVld_3),
    .io_ren_4                  (io_mdpFoldPcVecVld_4),
    .io_ren_5                  (io_mdpFoldPcVecVld_5),
    .io_raddr_0                (io_mdpFlodPcVec_0),
    .io_raddr_1                (io_mdpFlodPcVec_1),
    .io_raddr_2                (io_mdpFlodPcVec_2),
    .io_raddr_3                (io_mdpFlodPcVec_3),
    .io_raddr_4                (io_mdpFlodPcVec_4),
    .io_raddr_5                (io_mdpFlodPcVec_5),
    .io_rdata_0_valid          (io_ssit2Rename_0_valid),
    .io_rdata_0_ssid           (io_ssit2Rename_0_ssid),
    .io_rdata_0_strict         (io_ssit2Rename_0_strict),
    .io_rdata_1_valid          (io_ssit2Rename_1_valid),
    .io_rdata_1_ssid           (io_ssit2Rename_1_ssid),
    .io_rdata_1_strict         (io_ssit2Rename_1_strict),
    .io_rdata_2_valid          (io_ssit2Rename_2_valid),
    .io_rdata_2_ssid           (io_ssit2Rename_2_ssid),
    .io_rdata_2_strict         (io_ssit2Rename_2_strict),
    .io_rdata_3_valid          (io_ssit2Rename_3_valid),
    .io_rdata_3_ssid           (io_ssit2Rename_3_ssid),
    .io_rdata_3_strict         (io_ssit2Rename_3_strict),
    .io_rdata_4_valid          (io_ssit2Rename_4_valid),
    .io_rdata_4_ssid           (io_ssit2Rename_4_ssid),
    .io_rdata_4_strict         (io_ssit2Rename_4_strict),
    .io_rdata_5_valid          (io_ssit2Rename_5_valid),
    .io_rdata_5_ssid           (io_ssit2Rename_5_ssid),
    .io_rdata_5_strict         (io_ssit2Rename_5_strict),
    .io_csrCtrl_lvpred_timeout (ssit_io_csrCtrl_REG_lvpred_timeout)
  );
  LFST lfst (
    .clock                                (clock),
    .reset                                (reset),
    .io_redirect_valid                    (lfst_io_redirect_REG_valid),
    .io_redirect_bits_robIdx_flag         (lfst_io_redirect_REG_bits_robIdx_flag),
    .io_redirect_bits_robIdx_value        (lfst_io_redirect_REG_bits_robIdx_value),
    .io_redirect_bits_level               (lfst_io_redirect_REG_bits_level),
    .io_dispatch_req_0_valid              (io_dispatchLFSTio_req_0_valid),
    .io_dispatch_req_0_bits_isstore       (io_dispatchLFSTio_req_0_bits_isstore),
    .io_dispatch_req_0_bits_ssid          (io_dispatchLFSTio_req_0_bits_ssid),
    .io_dispatch_req_0_bits_robIdx_flag   (io_dispatchLFSTio_req_0_bits_robIdx_flag),
    .io_dispatch_req_0_bits_robIdx_value  (io_dispatchLFSTio_req_0_bits_robIdx_value),
    .io_dispatch_req_1_valid              (io_dispatchLFSTio_req_1_valid),
    .io_dispatch_req_1_bits_isstore       (io_dispatchLFSTio_req_1_bits_isstore),
    .io_dispatch_req_1_bits_ssid          (io_dispatchLFSTio_req_1_bits_ssid),
    .io_dispatch_req_1_bits_robIdx_flag   (io_dispatchLFSTio_req_1_bits_robIdx_flag),
    .io_dispatch_req_1_bits_robIdx_value  (io_dispatchLFSTio_req_1_bits_robIdx_value),
    .io_dispatch_req_2_valid              (io_dispatchLFSTio_req_2_valid),
    .io_dispatch_req_2_bits_isstore       (io_dispatchLFSTio_req_2_bits_isstore),
    .io_dispatch_req_2_bits_ssid          (io_dispatchLFSTio_req_2_bits_ssid),
    .io_dispatch_req_2_bits_robIdx_flag   (io_dispatchLFSTio_req_2_bits_robIdx_flag),
    .io_dispatch_req_2_bits_robIdx_value  (io_dispatchLFSTio_req_2_bits_robIdx_value),
    .io_dispatch_req_3_valid              (io_dispatchLFSTio_req_3_valid),
    .io_dispatch_req_3_bits_isstore       (io_dispatchLFSTio_req_3_bits_isstore),
    .io_dispatch_req_3_bits_ssid          (io_dispatchLFSTio_req_3_bits_ssid),
    .io_dispatch_req_3_bits_robIdx_flag   (io_dispatchLFSTio_req_3_bits_robIdx_flag),
    .io_dispatch_req_3_bits_robIdx_value  (io_dispatchLFSTio_req_3_bits_robIdx_value),
    .io_dispatch_req_4_valid              (io_dispatchLFSTio_req_4_valid),
    .io_dispatch_req_4_bits_isstore       (io_dispatchLFSTio_req_4_bits_isstore),
    .io_dispatch_req_4_bits_ssid          (io_dispatchLFSTio_req_4_bits_ssid),
    .io_dispatch_req_4_bits_robIdx_flag   (io_dispatchLFSTio_req_4_bits_robIdx_flag),
    .io_dispatch_req_4_bits_robIdx_value  (io_dispatchLFSTio_req_4_bits_robIdx_value),
    .io_dispatch_req_5_valid              (io_dispatchLFSTio_req_5_valid),
    .io_dispatch_req_5_bits_isstore       (io_dispatchLFSTio_req_5_bits_isstore),
    .io_dispatch_req_5_bits_ssid          (io_dispatchLFSTio_req_5_bits_ssid),
    .io_dispatch_req_5_bits_robIdx_flag   (io_dispatchLFSTio_req_5_bits_robIdx_flag),
    .io_dispatch_req_5_bits_robIdx_value  (io_dispatchLFSTio_req_5_bits_robIdx_value),
    .io_dispatch_resp_0_bits_shouldWait   (io_dispatchLFSTio_resp_0_bits_shouldWait),
    .io_dispatch_resp_0_bits_robIdx_flag  (io_dispatchLFSTio_resp_0_bits_robIdx_flag),
    .io_dispatch_resp_0_bits_robIdx_value (io_dispatchLFSTio_resp_0_bits_robIdx_value),
    .io_dispatch_resp_1_bits_shouldWait   (io_dispatchLFSTio_resp_1_bits_shouldWait),
    .io_dispatch_resp_1_bits_robIdx_flag  (io_dispatchLFSTio_resp_1_bits_robIdx_flag),
    .io_dispatch_resp_1_bits_robIdx_value (io_dispatchLFSTio_resp_1_bits_robIdx_value),
    .io_dispatch_resp_2_bits_shouldWait   (io_dispatchLFSTio_resp_2_bits_shouldWait),
    .io_dispatch_resp_2_bits_robIdx_flag  (io_dispatchLFSTio_resp_2_bits_robIdx_flag),
    .io_dispatch_resp_2_bits_robIdx_value (io_dispatchLFSTio_resp_2_bits_robIdx_value),
    .io_dispatch_resp_3_bits_shouldWait   (io_dispatchLFSTio_resp_3_bits_shouldWait),
    .io_dispatch_resp_3_bits_robIdx_flag  (io_dispatchLFSTio_resp_3_bits_robIdx_flag),
    .io_dispatch_resp_3_bits_robIdx_value (io_dispatchLFSTio_resp_3_bits_robIdx_value),
    .io_dispatch_resp_4_bits_shouldWait   (io_dispatchLFSTio_resp_4_bits_shouldWait),
    .io_dispatch_resp_4_bits_robIdx_flag  (io_dispatchLFSTio_resp_4_bits_robIdx_flag),
    .io_dispatch_resp_4_bits_robIdx_value (io_dispatchLFSTio_resp_4_bits_robIdx_value),
    .io_dispatch_resp_5_bits_shouldWait   (io_dispatchLFSTio_resp_5_bits_shouldWait),
    .io_dispatch_resp_5_bits_robIdx_flag  (io_dispatchLFSTio_resp_5_bits_robIdx_flag),
    .io_dispatch_resp_5_bits_robIdx_value (io_dispatchLFSTio_resp_5_bits_robIdx_value),
    .io_storeIssue_0_valid                (REG_0_valid),
    .io_storeIssue_0_bits_robIdx_value    (REG_0_bits_robIdx_value),
    .io_storeIssue_0_bits_storeSetHit     (REG_0_bits_storeSetHit),
    .io_storeIssue_0_bits_ssid            (REG_0_bits_ssid),
    .io_storeIssue_1_valid                (REG_1_valid),
    .io_storeIssue_1_bits_robIdx_value    (REG_1_bits_robIdx_value),
    .io_storeIssue_1_bits_storeSetHit     (REG_1_bits_storeSetHit),
    .io_storeIssue_1_bits_ssid            (REG_1_bits_ssid),
    .io_csrCtrl_lvpred_disable            (lfst_io_csrCtrl_REG_lvpred_disable),
    .io_csrCtrl_no_spec_load              (lfst_io_csrCtrl_REG_no_spec_load),
    .io_csrCtrl_storeset_wait_store       (lfst_io_csrCtrl_REG_storeset_wait_store)
  );
endmodule

