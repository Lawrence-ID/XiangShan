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
module SMSPrefetcher(
  input         clock,
  input         reset,
  input         io_ld_in_0_valid,
  input  [40:0] io_ld_in_0_bits_uop_pc,
  input         io_ld_in_0_bits_uop_robIdx_flag,
  input  [7:0]  io_ld_in_0_bits_uop_robIdx_value,
  input  [40:0] io_ld_in_0_bits_vaddr,
  input  [35:0] io_ld_in_0_bits_paddr,
  input         io_ld_in_1_valid,
  input  [40:0] io_ld_in_1_bits_uop_pc,
  input         io_ld_in_1_bits_uop_robIdx_flag,
  input  [7:0]  io_ld_in_1_bits_uop_robIdx_value,
  input  [40:0] io_ld_in_1_bits_vaddr,
  input  [35:0] io_ld_in_1_bits_paddr,
  input         io_ld_in_2_valid,
  input  [40:0] io_ld_in_2_bits_uop_pc,
  input         io_ld_in_2_bits_uop_robIdx_flag,
  input  [7:0]  io_ld_in_2_bits_uop_robIdx_value,
  input  [40:0] io_ld_in_2_bits_vaddr,
  input  [35:0] io_ld_in_2_bits_paddr,
  output        io_tlb_req_req_valid,
  output [40:0] io_tlb_req_req_bits_vaddr,
  output [2:0]  io_tlb_req_req_bits_cmd,
  output        io_tlb_req_req_bits_hyperinst,
  output        io_tlb_req_req_bits_hlvx,
  output        io_tlb_req_req_bits_kill,
  output        io_tlb_req_req_bits_no_translate,
  output        io_tlb_req_req_bits_debug_robIdx_flag,
  output [7:0]  io_tlb_req_req_bits_debug_robIdx_value,
  input         io_tlb_req_resp_valid,
  input  [35:0] io_tlb_req_resp_bits_paddr_0,
  input         io_tlb_req_resp_bits_miss,
  output        io_l2_req_valid,
  output [35:0] io_l2_req_bits_addr,
  input         io_enable,
  input         io_agt_en,
  input         io_pht_en,
  input  [3:0]  io_act_threshold,
  input  [5:0]  io_act_stride,
  input         io_dcache_evict_valid,
  input  [40:0] io_dcache_evict_bits_vaddr
);

  wire        _pf_filter_io_l2_pf_addr_valid;
  wire [35:0] _pf_filter_io_l2_pf_addr_bits;
  wire        _pht_io_pf_gen_req_valid;
  wire [10:0] _pht_io_pf_gen_req_bits_region_tag;
  wire [30:0] _pht_io_pf_gen_req_bits_region_addr;
  wire [15:0] _pht_io_pf_gen_req_bits_region_bits;
  wire        _pht_io_pf_gen_req_bits_paddr_valid;
  wire        _pht_io_pf_gen_req_bits_decr_mode;
  wire        _active_gen_table_io_s2_pht_lookup_valid;
  wire [4:0]  _active_gen_table_io_s2_pht_lookup_bits_pht_index;
  wire [12:0] _active_gen_table_io_s2_pht_lookup_bits_pht_tag;
  wire [30:0] _active_gen_table_io_s2_pht_lookup_bits_region_paddr;
  wire [30:0] _active_gen_table_io_s2_pht_lookup_bits_region_vaddr;
  wire [3:0]  _active_gen_table_io_s2_pht_lookup_bits_region_offset;
  wire        _active_gen_table_io_s2_evict_valid;
  wire [4:0]  _active_gen_table_io_s2_evict_bits_pht_index;
  wire [12:0] _active_gen_table_io_s2_evict_bits_pht_tag;
  wire [15:0] _active_gen_table_io_s2_evict_bits_region_bits;
  wire [3:0]  _active_gen_table_io_s2_evict_bits_region_offset;
  wire        _active_gen_table_io_s2_evict_bits_decr_mode;
  wire        _train_filter_io_train_req_valid;
  wire [40:0] _train_filter_io_train_req_bits_vaddr;
  wire [35:0] _train_filter_io_train_req_bits_paddr;
  wire [40:0] _train_filter_io_train_req_bits_pc;
  reg         train_vld_s0_last_REG;
  reg  [10:0] train_region_tag_s0;
  reg  [10:0] train_region_p1_tag_s0;
  reg  [10:0] train_region_m1_tag_s0;
  reg         train_allow_cross_region_p1_s0;
  reg         train_allow_cross_region_m1_s0;
  reg  [12:0] train_pht_tag_s0;
  reg  [4:0]  train_pht_index_s0;
  reg  [3:0]  train_region_offset_s0;
  reg  [25:0] train_region_paddr_s0;
  reg  [30:0] train_region_vaddr_s0;
  always @(posedge clock or posedge reset) begin
    if (reset)
      train_vld_s0_last_REG <= 1'h0;
    else
      train_vld_s0_last_REG <= _train_filter_io_train_req_valid;
  end // always @(posedge, posedge)
  wire [21:0] _GEN = {1'h0, _train_filter_io_train_req_bits_vaddr[30:10]};
  wire [21:0] _train_region_addr_p1_T_1 = 22'(_GEN + 22'h1);
  wire [21:0] _train_region_addr_m1_T_1 = 22'(_GEN - 22'h1);
  always @(posedge clock) begin
    if (_train_filter_io_train_req_valid) begin
      train_region_tag_s0 <=
        {_train_filter_io_train_req_bits_vaddr[20:16]
           ^ _train_filter_io_train_req_bits_vaddr[25:21]
           ^ _train_filter_io_train_req_bits_vaddr[30:26],
         _train_filter_io_train_req_bits_vaddr[15:10]};
      train_region_p1_tag_s0 <=
        {_train_region_addr_p1_T_1[10:6] ^ _train_region_addr_p1_T_1[15:11]
           ^ _train_region_addr_p1_T_1[20:16],
         _train_region_addr_p1_T_1[5:0]};
      train_region_m1_tag_s0 <=
        {_train_region_addr_m1_T_1[10:6] ^ _train_region_addr_m1_T_1[15:11]
           ^ _train_region_addr_m1_T_1[20:16],
         _train_region_addr_m1_T_1[5:0]};
      train_allow_cross_region_p1_s0 <= ~(_train_region_addr_p1_T_1[21]);
      train_allow_cross_region_m1_s0 <= ~(_train_region_addr_m1_T_1[21]);
      train_pht_tag_s0 <= _train_filter_io_train_req_bits_pc[19:7];
      train_pht_index_s0 <=
        {_train_filter_io_train_req_bits_pc[1] ^ _train_filter_io_train_req_bits_pc[6],
         _train_filter_io_train_req_bits_pc[5:2]};
      train_region_offset_s0 <= _train_filter_io_train_req_bits_vaddr[9:6];
      train_region_paddr_s0 <= _train_filter_io_train_req_bits_paddr[35:10];
      train_region_vaddr_s0 <= _train_filter_io_train_req_bits_vaddr[40:10];
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:7];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'h8; i += 4'h1) begin
          _RANDOM[i[2:0]] = `RANDOM;
        end
        train_vld_s0_last_REG = _RANDOM[3'h0][0];
        train_region_tag_s0 = {_RANDOM[3'h3][31:24], _RANDOM[3'h4][2:0]};
        train_region_p1_tag_s0 = _RANDOM[3'h4][13:3];
        train_region_m1_tag_s0 = _RANDOM[3'h4][24:14];
        train_allow_cross_region_p1_s0 = _RANDOM[3'h4][25];
        train_allow_cross_region_m1_s0 = _RANDOM[3'h4][26];
        train_pht_tag_s0 = {_RANDOM[3'h4][31:27], _RANDOM[3'h5][7:0]};
        train_pht_index_s0 = _RANDOM[3'h5][12:8];
        train_region_offset_s0 = _RANDOM[3'h5][16:13];
        train_region_paddr_s0 = {_RANDOM[3'h5][31:19], _RANDOM[3'h6][12:0]};
        train_region_vaddr_s0 = {_RANDOM[3'h6][31:13], _RANDOM[3'h7][11:0]};
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        train_vld_s0_last_REG = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SMSTrainFilter train_filter (
    .clock                            (clock),
    .reset                            (reset),
    .io_ld_in_0_valid                 (io_ld_in_0_valid),
    .io_ld_in_0_bits_uop_pc           (io_ld_in_0_bits_uop_pc),
    .io_ld_in_0_bits_uop_robIdx_flag  (io_ld_in_0_bits_uop_robIdx_flag),
    .io_ld_in_0_bits_uop_robIdx_value (io_ld_in_0_bits_uop_robIdx_value),
    .io_ld_in_0_bits_vaddr            (io_ld_in_0_bits_vaddr),
    .io_ld_in_0_bits_paddr            (io_ld_in_0_bits_paddr),
    .io_ld_in_1_valid                 (io_ld_in_1_valid),
    .io_ld_in_1_bits_uop_pc           (io_ld_in_1_bits_uop_pc),
    .io_ld_in_1_bits_uop_robIdx_flag  (io_ld_in_1_bits_uop_robIdx_flag),
    .io_ld_in_1_bits_uop_robIdx_value (io_ld_in_1_bits_uop_robIdx_value),
    .io_ld_in_1_bits_vaddr            (io_ld_in_1_bits_vaddr),
    .io_ld_in_1_bits_paddr            (io_ld_in_1_bits_paddr),
    .io_ld_in_2_valid                 (io_ld_in_2_valid),
    .io_ld_in_2_bits_uop_pc           (io_ld_in_2_bits_uop_pc),
    .io_ld_in_2_bits_uop_robIdx_flag  (io_ld_in_2_bits_uop_robIdx_flag),
    .io_ld_in_2_bits_uop_robIdx_value (io_ld_in_2_bits_uop_robIdx_value),
    .io_ld_in_2_bits_vaddr            (io_ld_in_2_bits_vaddr),
    .io_ld_in_2_bits_paddr            (io_ld_in_2_bits_paddr),
    .io_train_req_valid               (_train_filter_io_train_req_valid),
    .io_train_req_bits_vaddr          (_train_filter_io_train_req_bits_vaddr),
    .io_train_req_bits_paddr          (_train_filter_io_train_req_bits_paddr),
    .io_train_req_bits_pc             (_train_filter_io_train_req_bits_pc)
  );
  ActiveGenerationTable active_gen_table (
    .clock                                   (clock),
    .reset                                   (reset),
    .io_agt_en                               (io_agt_en),
    .io_s0_lookup_valid                      (train_vld_s0_last_REG),
    .io_s0_lookup_bits_region_tag            (train_region_tag_s0),
    .io_s0_lookup_bits_region_p1_tag         (train_region_p1_tag_s0),
    .io_s0_lookup_bits_region_m1_tag         (train_region_m1_tag_s0),
    .io_s0_lookup_bits_region_offset         (train_region_offset_s0),
    .io_s0_lookup_bits_pht_index             (train_pht_index_s0),
    .io_s0_lookup_bits_pht_tag               (train_pht_tag_s0),
    .io_s0_lookup_bits_allow_cross_region_p1 (train_allow_cross_region_p1_s0),
    .io_s0_lookup_bits_allow_cross_region_m1 (train_allow_cross_region_m1_s0),
    .io_s0_lookup_bits_region_paddr          ({5'h0, train_region_paddr_s0}),
    .io_s0_lookup_bits_region_vaddr          (train_region_vaddr_s0),
    .io_s0_dcache_evict_valid                (io_dcache_evict_valid),
    .io_s0_dcache_evict_bits_vaddr           (io_dcache_evict_bits_vaddr),
    .io_s2_pht_lookup_valid                  (_active_gen_table_io_s2_pht_lookup_valid),
    .io_s2_pht_lookup_bits_pht_index
      (_active_gen_table_io_s2_pht_lookup_bits_pht_index),
    .io_s2_pht_lookup_bits_pht_tag
      (_active_gen_table_io_s2_pht_lookup_bits_pht_tag),
    .io_s2_pht_lookup_bits_region_paddr
      (_active_gen_table_io_s2_pht_lookup_bits_region_paddr),
    .io_s2_pht_lookup_bits_region_vaddr
      (_active_gen_table_io_s2_pht_lookup_bits_region_vaddr),
    .io_s2_pht_lookup_bits_region_offset
      (_active_gen_table_io_s2_pht_lookup_bits_region_offset),
    .io_s2_evict_valid                       (_active_gen_table_io_s2_evict_valid),
    .io_s2_evict_bits_pht_index
      (_active_gen_table_io_s2_evict_bits_pht_index),
    .io_s2_evict_bits_pht_tag                (_active_gen_table_io_s2_evict_bits_pht_tag),
    .io_s2_evict_bits_region_bits
      (_active_gen_table_io_s2_evict_bits_region_bits),
    .io_s2_evict_bits_region_offset
      (_active_gen_table_io_s2_evict_bits_region_offset),
    .io_s2_evict_bits_decr_mode
      (_active_gen_table_io_s2_evict_bits_decr_mode),
    .io_act_threshold                        (io_act_threshold),
    .io_act_stride                           (io_act_stride)
  );
  PatternHistoryTable pht (
    .clock                               (clock),
    .reset                               (reset),
    .io_agt_update_valid                 (_active_gen_table_io_s2_evict_valid),
    .io_agt_update_bits_pht_index        (_active_gen_table_io_s2_evict_bits_pht_index),
    .io_agt_update_bits_pht_tag          (_active_gen_table_io_s2_evict_bits_pht_tag),
    .io_agt_update_bits_region_bits      (_active_gen_table_io_s2_evict_bits_region_bits),
    .io_agt_update_bits_region_offset
      (_active_gen_table_io_s2_evict_bits_region_offset),
    .io_agt_update_bits_decr_mode        (_active_gen_table_io_s2_evict_bits_decr_mode),
    .io_s2_agt_lookup_valid              (_active_gen_table_io_s2_pht_lookup_valid),
    .io_s2_agt_lookup_bits_pht_index
      (_active_gen_table_io_s2_pht_lookup_bits_pht_index),
    .io_s2_agt_lookup_bits_pht_tag
      (_active_gen_table_io_s2_pht_lookup_bits_pht_tag),
    .io_s2_agt_lookup_bits_region_paddr
      (_active_gen_table_io_s2_pht_lookup_bits_region_paddr),
    .io_s2_agt_lookup_bits_region_vaddr
      (_active_gen_table_io_s2_pht_lookup_bits_region_vaddr),
    .io_s2_agt_lookup_bits_region_offset
      (_active_gen_table_io_s2_pht_lookup_bits_region_offset),
    .io_pf_gen_req_valid                 (_pht_io_pf_gen_req_valid),
    .io_pf_gen_req_bits_region_tag       (_pht_io_pf_gen_req_bits_region_tag),
    .io_pf_gen_req_bits_region_addr      (_pht_io_pf_gen_req_bits_region_addr),
    .io_pf_gen_req_bits_region_bits      (_pht_io_pf_gen_req_bits_region_bits),
    .io_pf_gen_req_bits_paddr_valid      (_pht_io_pf_gen_req_bits_paddr_valid),
    .io_pf_gen_req_bits_decr_mode        (_pht_io_pf_gen_req_bits_decr_mode)
  );
  PrefetchFilter pf_filter (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_gen_req_valid                       (_pht_io_pf_gen_req_valid & io_pht_en),
    .io_gen_req_bits_region_tag             (_pht_io_pf_gen_req_bits_region_tag),
    .io_gen_req_bits_region_addr            (_pht_io_pf_gen_req_bits_region_addr),
    .io_gen_req_bits_region_bits            (_pht_io_pf_gen_req_bits_region_bits),
    .io_gen_req_bits_paddr_valid            (_pht_io_pf_gen_req_bits_paddr_valid),
    .io_gen_req_bits_decr_mode              (_pht_io_pf_gen_req_bits_decr_mode),
    .io_tlb_req_req_valid                   (io_tlb_req_req_valid),
    .io_tlb_req_req_bits_vaddr              (io_tlb_req_req_bits_vaddr),
    .io_tlb_req_req_bits_cmd                (io_tlb_req_req_bits_cmd),
    .io_tlb_req_req_bits_hyperinst          (io_tlb_req_req_bits_hyperinst),
    .io_tlb_req_req_bits_hlvx               (io_tlb_req_req_bits_hlvx),
    .io_tlb_req_req_bits_kill               (io_tlb_req_req_bits_kill),
    .io_tlb_req_req_bits_no_translate       (io_tlb_req_req_bits_no_translate),
    .io_tlb_req_req_bits_debug_robIdx_flag  (io_tlb_req_req_bits_debug_robIdx_flag),
    .io_tlb_req_req_bits_debug_robIdx_value (io_tlb_req_req_bits_debug_robIdx_value),
    .io_tlb_req_resp_valid                  (io_tlb_req_resp_valid),
    .io_tlb_req_resp_bits_paddr_0           (io_tlb_req_resp_bits_paddr_0),
    .io_tlb_req_resp_bits_miss              (io_tlb_req_resp_bits_miss),
    .io_l2_pf_addr_valid                    (_pf_filter_io_l2_pf_addr_valid),
    .io_l2_pf_addr_bits                     (_pf_filter_io_l2_pf_addr_bits)
  );
  assign io_l2_req_valid =
    _pf_filter_io_l2_pf_addr_valid & io_enable
    & _pf_filter_io_l2_pf_addr_bits > 36'h80000000;
  assign io_l2_req_bits_addr = _pf_filter_io_l2_pf_addr_bits;
endmodule

