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
module SCTable_2(
  input          clock,
  input          reset,
  input          io_req_valid,
  input  [40:0]  io_req_bits_pc,
  input  [7:0]   io_req_bits_folded_hist_hist_11_folded_hist,
  output [5:0]   io_resp_ctrs_0_0,
  output [5:0]   io_resp_ctrs_0_1,
  output [5:0]   io_resp_ctrs_1_0,
  output [5:0]   io_resp_ctrs_1_1,
  input  [40:0]  io_update_pc,
  input  [255:0] io_update_ghist,
  input          io_update_mask_0,
  input          io_update_mask_1,
  input  [5:0]   io_update_oldCtrs_0,
  input  [5:0]   io_update_oldCtrs_1,
  input          io_update_tagePreds_0,
  input          io_update_tagePreds_1,
  input          io_update_takens_0,
  input          io_update_takens_1
);

  wire        _wrbypasses_1_io_hit;
  wire        _wrbypasses_1_io_hit_data_0_valid;
  wire [5:0]  _wrbypasses_1_io_hit_data_0_bits;
  wire        _wrbypasses_1_io_hit_data_1_valid;
  wire [5:0]  _wrbypasses_1_io_hit_data_1_bits;
  wire        _wrbypasses_0_io_hit;
  wire        _wrbypasses_0_io_hit_data_0_valid;
  wire [5:0]  _wrbypasses_0_io_hit_data_0_bits;
  wire        _wrbypasses_0_io_hit_data_1_valid;
  wire [5:0]  _wrbypasses_0_io_hit_data_1_bits;
  wire [5:0]  _table_io_r_resp_data_0;
  wire [5:0]  _table_io_r_resp_data_1;
  wire [5:0]  _table_io_r_resp_data_2;
  wire [5:0]  _table_io_r_resp_data_3;
  reg  [40:0] s1_pc;
  wire        updateWayMask_0 =
    io_update_mask_0 & ~(io_update_pc[1]) & ~io_update_tagePreds_0 | io_update_mask_1
    & io_update_pc[1] & ~io_update_tagePreds_1;
  wire        updateWayMask_1 =
    io_update_mask_0 & ~(io_update_pc[1]) & io_update_tagePreds_0 | io_update_mask_1
    & io_update_pc[1] & io_update_tagePreds_1;
  wire        updateWayMask_2 =
    io_update_mask_0 & io_update_pc[1] & ~io_update_tagePreds_0 | io_update_mask_1
    & ~(io_update_pc[1]) & ~io_update_tagePreds_1;
  wire        updateWayMask_3 =
    io_update_mask_0 & io_update_pc[1] & io_update_tagePreds_0 | io_update_mask_1
    & ~(io_update_pc[1]) & io_update_tagePreds_1;
  wire [7:0]  update_idx =
    io_update_pc[8:1]
    ^ {io_update_ghist[7:2], io_update_ghist[1:0] ^ io_update_ghist[9:8]};
  wire        ctrPos =
    ~(io_update_pc[1]) & io_update_tagePreds_0 | io_update_pc[1] & io_update_tagePreds_1;
  wire [5:0]  oldCtr =
    (~(io_update_pc[1]) & _wrbypasses_0_io_hit | io_update_pc[1] & _wrbypasses_1_io_hit)
    & (ctrPos
         ? ~(io_update_pc[1]) & _wrbypasses_0_io_hit_data_1_valid | io_update_pc[1]
           & _wrbypasses_1_io_hit_data_1_valid
         : ~(io_update_pc[1]) & _wrbypasses_0_io_hit_data_0_valid | io_update_pc[1]
           & _wrbypasses_1_io_hit_data_0_valid)
      ? (ctrPos
           ? (io_update_pc[1] ? 6'h0 : _wrbypasses_0_io_hit_data_1_bits)
             | (io_update_pc[1] ? _wrbypasses_1_io_hit_data_1_bits : 6'h0)
           : (io_update_pc[1] ? 6'h0 : _wrbypasses_0_io_hit_data_0_bits)
             | (io_update_pc[1] ? _wrbypasses_1_io_hit_data_0_bits : 6'h0))
      : (io_update_pc[1] ? 6'h0 : io_update_oldCtrs_0)
        | (io_update_pc[1] ? io_update_oldCtrs_1 : 6'h0);
  wire        taken =
    ~(io_update_pc[1]) & io_update_takens_0 | io_update_pc[1] & io_update_takens_1;
  wire [5:0]  update_wdata_0 =
    oldCtr == 6'h1F & taken
      ? 6'h1F
      : oldCtr == 6'h20 & ~taken ? 6'h20 : taken ? 6'(oldCtr + 6'h1) : 6'(oldCtr - 6'h1);
  wire        ctrPos_1 =
    io_update_pc[1] & io_update_tagePreds_0 | ~(io_update_pc[1]) & io_update_tagePreds_1;
  wire [5:0]  oldCtr_1 =
    (io_update_pc[1] & _wrbypasses_0_io_hit | ~(io_update_pc[1]) & _wrbypasses_1_io_hit)
    & (ctrPos_1
         ? io_update_pc[1] & _wrbypasses_0_io_hit_data_1_valid | ~(io_update_pc[1])
           & _wrbypasses_1_io_hit_data_1_valid
         : io_update_pc[1] & _wrbypasses_0_io_hit_data_0_valid | ~(io_update_pc[1])
           & _wrbypasses_1_io_hit_data_0_valid)
      ? (ctrPos_1
           ? (io_update_pc[1] ? _wrbypasses_0_io_hit_data_1_bits : 6'h0)
             | (io_update_pc[1] ? 6'h0 : _wrbypasses_1_io_hit_data_1_bits)
           : (io_update_pc[1] ? _wrbypasses_0_io_hit_data_0_bits : 6'h0)
             | (io_update_pc[1] ? 6'h0 : _wrbypasses_1_io_hit_data_0_bits))
      : (io_update_pc[1] ? io_update_oldCtrs_0 : 6'h0)
        | (io_update_pc[1] ? 6'h0 : io_update_oldCtrs_1);
  wire        taken_1 =
    io_update_pc[1] & io_update_takens_0 | ~(io_update_pc[1]) & io_update_takens_1;
  wire [5:0]  update_wdata_1 =
    oldCtr_1 == 6'h1F & taken_1
      ? 6'h1F
      : oldCtr_1 == 6'h20 & ~taken_1
          ? 6'h20
          : taken_1 ? 6'(oldCtr_1 + 6'h1) : 6'(oldCtr_1 - 6'h1);
  wire [5:0]  _GEN = io_update_pc[1] ? 6'h0 : update_wdata_0;
  wire [5:0]  _GEN_0 = io_update_pc[1] ? update_wdata_1 : 6'h0;
  wire [5:0]  _GEN_1 = io_update_pc[1] ? update_wdata_0 : 6'h0;
  wire [5:0]  _GEN_2 = io_update_pc[1] ? 6'h0 : update_wdata_1;
  always @(posedge clock) begin
    if (io_req_valid)
      s1_pc <= io_req_bits_pc;
  end // always @(posedge)
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
        s1_pc = {_RANDOM[1'h0][31:8], _RANDOM[1'h1][16:0]};
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SRAMTemplate_56 table_0 (
    .clock                 (clock),
    .reset                 (reset),
    .io_r_req_valid        (io_req_valid),
    .io_r_req_bits_setIdx
      (io_req_bits_pc[8:1] ^ io_req_bits_folded_hist_hist_11_folded_hist),
    .io_r_resp_data_0      (_table_io_r_resp_data_0),
    .io_r_resp_data_1      (_table_io_r_resp_data_1),
    .io_r_resp_data_2      (_table_io_r_resp_data_2),
    .io_r_resp_data_3      (_table_io_r_resp_data_3),
    .io_w_req_valid        (io_update_mask_0 | io_update_mask_1),
    .io_w_req_bits_setIdx  (update_idx),
    .io_w_req_bits_data_0  (update_wdata_0),
    .io_w_req_bits_data_1  (update_wdata_0),
    .io_w_req_bits_data_2  (update_wdata_1),
    .io_w_req_bits_data_3  (update_wdata_1),
    .io_w_req_bits_waymask
      ({updateWayMask_3, updateWayMask_2, updateWayMask_1, updateWayMask_0})
  );
  WrBypass_33 wrbypasses_0 (
    .clock               (clock),
    .reset               (reset),
    .io_wen              (io_update_mask_0),
    .io_write_idx        (update_idx),
    .io_write_data_0     (_GEN | _GEN_0),
    .io_write_data_1     (_GEN | _GEN_0),
    .io_write_way_mask_0
      (~(io_update_pc[1]) & updateWayMask_0 | io_update_pc[1] & updateWayMask_2),
    .io_write_way_mask_1
      (~(io_update_pc[1]) & updateWayMask_1 | io_update_pc[1] & updateWayMask_3),
    .io_hit              (_wrbypasses_0_io_hit),
    .io_hit_data_0_valid (_wrbypasses_0_io_hit_data_0_valid),
    .io_hit_data_0_bits  (_wrbypasses_0_io_hit_data_0_bits),
    .io_hit_data_1_valid (_wrbypasses_0_io_hit_data_1_valid),
    .io_hit_data_1_bits  (_wrbypasses_0_io_hit_data_1_bits)
  );
  WrBypass_33 wrbypasses_1 (
    .clock               (clock),
    .reset               (reset),
    .io_wen              (io_update_mask_1),
    .io_write_idx        (update_idx),
    .io_write_data_0     (_GEN_1 | _GEN_2),
    .io_write_data_1     (_GEN_1 | _GEN_2),
    .io_write_way_mask_0
      (io_update_pc[1] & updateWayMask_0 | ~(io_update_pc[1]) & updateWayMask_2),
    .io_write_way_mask_1
      (io_update_pc[1] & updateWayMask_1 | ~(io_update_pc[1]) & updateWayMask_3),
    .io_hit              (_wrbypasses_1_io_hit),
    .io_hit_data_0_valid (_wrbypasses_1_io_hit_data_0_valid),
    .io_hit_data_0_bits  (_wrbypasses_1_io_hit_data_0_bits),
    .io_hit_data_1_valid (_wrbypasses_1_io_hit_data_1_valid),
    .io_hit_data_1_bits  (_wrbypasses_1_io_hit_data_1_bits)
  );
  assign io_resp_ctrs_0_0 =
    (s1_pc[1] ? 6'h0 : _table_io_r_resp_data_0)
    | (s1_pc[1] ? _table_io_r_resp_data_2 : 6'h0);
  assign io_resp_ctrs_0_1 =
    (s1_pc[1] ? 6'h0 : _table_io_r_resp_data_1)
    | (s1_pc[1] ? _table_io_r_resp_data_3 : 6'h0);
  assign io_resp_ctrs_1_0 =
    (s1_pc[1] ? _table_io_r_resp_data_0 : 6'h0)
    | (s1_pc[1] ? 6'h0 : _table_io_r_resp_data_2);
  assign io_resp_ctrs_1_1 =
    (s1_pc[1] ? _table_io_r_resp_data_1 : 6'h0)
    | (s1_pc[1] ? 6'h0 : _table_io_r_resp_data_3);
endmodule

