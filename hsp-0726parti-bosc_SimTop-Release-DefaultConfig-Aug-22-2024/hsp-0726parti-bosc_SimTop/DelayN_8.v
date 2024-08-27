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
module DelayN_8(
  input         clock,
  input         io_in_icache_parity_enable,
  input         io_in_bp_ctrl_ubtb_enable,
  input         io_in_bp_ctrl_btb_enable,
  input         io_in_bp_ctrl_tage_enable,
  input         io_in_bp_ctrl_sc_enable,
  input         io_in_bp_ctrl_ras_enable,
  input         io_in_ldld_vio_check_enable,
  input         io_in_cache_error_enable,
  input         io_in_distribute_csr_w_valid,
  input  [11:0] io_in_distribute_csr_w_bits_addr,
  input  [63:0] io_in_distribute_csr_w_bits_data,
  input         io_in_frontend_trigger_tUpdate_valid,
  input  [1:0]  io_in_frontend_trigger_tUpdate_bits_addr,
  input  [1:0]  io_in_frontend_trigger_tUpdate_bits_tdata_matchType,
  input         io_in_frontend_trigger_tUpdate_bits_tdata_select,
  input         io_in_frontend_trigger_tUpdate_bits_tdata_timing,
  input         io_in_frontend_trigger_tUpdate_bits_tdata_chain,
  input  [63:0] io_in_frontend_trigger_tUpdate_bits_tdata_tdata2,
  input         io_in_frontend_trigger_tEnableVec_0,
  input         io_in_frontend_trigger_tEnableVec_1,
  input         io_in_frontend_trigger_tEnableVec_2,
  input         io_in_frontend_trigger_tEnableVec_3,
  input         io_in_mem_trigger_tUpdate_valid,
  input  [1:0]  io_in_mem_trigger_tUpdate_bits_addr,
  input  [1:0]  io_in_mem_trigger_tUpdate_bits_tdata_matchType,
  input         io_in_mem_trigger_tUpdate_bits_tdata_select,
  input         io_in_mem_trigger_tUpdate_bits_tdata_timing,
  input         io_in_mem_trigger_tUpdate_bits_tdata_action,
  input         io_in_mem_trigger_tUpdate_bits_tdata_chain,
  input         io_in_mem_trigger_tUpdate_bits_tdata_store,
  input         io_in_mem_trigger_tUpdate_bits_tdata_load,
  input  [63:0] io_in_mem_trigger_tUpdate_bits_tdata_tdata2,
  input         io_in_mem_trigger_tEnableVec_0,
  input         io_in_mem_trigger_tEnableVec_1,
  input         io_in_mem_trigger_tEnableVec_2,
  input         io_in_mem_trigger_tEnableVec_3,
  input         io_in_mem_trigger_triggerCanRaiseBpExp,
  output        io_out_icache_parity_enable,
  output        io_out_bp_ctrl_ubtb_enable,
  output        io_out_bp_ctrl_btb_enable,
  output        io_out_bp_ctrl_tage_enable,
  output        io_out_bp_ctrl_sc_enable,
  output        io_out_bp_ctrl_ras_enable,
  output        io_out_ldld_vio_check_enable,
  output        io_out_cache_error_enable,
  output        io_out_distribute_csr_w_valid,
  output [11:0] io_out_distribute_csr_w_bits_addr,
  output [63:0] io_out_distribute_csr_w_bits_data,
  output        io_out_frontend_trigger_tUpdate_valid,
  output [1:0]  io_out_frontend_trigger_tUpdate_bits_addr,
  output [1:0]  io_out_frontend_trigger_tUpdate_bits_tdata_matchType,
  output        io_out_frontend_trigger_tUpdate_bits_tdata_select,
  output        io_out_frontend_trigger_tUpdate_bits_tdata_timing,
  output        io_out_frontend_trigger_tUpdate_bits_tdata_chain,
  output [63:0] io_out_frontend_trigger_tUpdate_bits_tdata_tdata2,
  output        io_out_frontend_trigger_tEnableVec_0,
  output        io_out_frontend_trigger_tEnableVec_1,
  output        io_out_frontend_trigger_tEnableVec_2,
  output        io_out_frontend_trigger_tEnableVec_3,
  output        io_out_mem_trigger_tUpdate_valid,
  output [1:0]  io_out_mem_trigger_tUpdate_bits_addr,
  output [1:0]  io_out_mem_trigger_tUpdate_bits_tdata_matchType,
  output        io_out_mem_trigger_tUpdate_bits_tdata_select,
  output        io_out_mem_trigger_tUpdate_bits_tdata_timing,
  output        io_out_mem_trigger_tUpdate_bits_tdata_action,
  output        io_out_mem_trigger_tUpdate_bits_tdata_chain,
  output        io_out_mem_trigger_tUpdate_bits_tdata_store,
  output        io_out_mem_trigger_tUpdate_bits_tdata_load,
  output [63:0] io_out_mem_trigger_tUpdate_bits_tdata_tdata2,
  output        io_out_mem_trigger_tEnableVec_0,
  output        io_out_mem_trigger_tEnableVec_1,
  output        io_out_mem_trigger_tEnableVec_2,
  output        io_out_mem_trigger_tEnableVec_3,
  output        io_out_mem_trigger_triggerCanRaiseBpExp
);

  reg        REG_icache_parity_enable;
  reg        REG_bp_ctrl_ubtb_enable;
  reg        REG_bp_ctrl_btb_enable;
  reg        REG_bp_ctrl_tage_enable;
  reg        REG_bp_ctrl_sc_enable;
  reg        REG_bp_ctrl_ras_enable;
  reg        REG_ldld_vio_check_enable;
  reg        REG_cache_error_enable;
  reg        REG_distribute_csr_w_valid;
  reg [11:0] REG_distribute_csr_w_bits_addr;
  reg [63:0] REG_distribute_csr_w_bits_data;
  reg        REG_frontend_trigger_tUpdate_valid;
  reg [1:0]  REG_frontend_trigger_tUpdate_bits_addr;
  reg [1:0]  REG_frontend_trigger_tUpdate_bits_tdata_matchType;
  reg        REG_frontend_trigger_tUpdate_bits_tdata_select;
  reg        REG_frontend_trigger_tUpdate_bits_tdata_timing;
  reg        REG_frontend_trigger_tUpdate_bits_tdata_chain;
  reg [63:0] REG_frontend_trigger_tUpdate_bits_tdata_tdata2;
  reg        REG_frontend_trigger_tEnableVec_0;
  reg        REG_frontend_trigger_tEnableVec_1;
  reg        REG_frontend_trigger_tEnableVec_2;
  reg        REG_frontend_trigger_tEnableVec_3;
  reg        REG_mem_trigger_tUpdate_valid;
  reg [1:0]  REG_mem_trigger_tUpdate_bits_addr;
  reg [1:0]  REG_mem_trigger_tUpdate_bits_tdata_matchType;
  reg        REG_mem_trigger_tUpdate_bits_tdata_select;
  reg        REG_mem_trigger_tUpdate_bits_tdata_timing;
  reg        REG_mem_trigger_tUpdate_bits_tdata_action;
  reg        REG_mem_trigger_tUpdate_bits_tdata_chain;
  reg        REG_mem_trigger_tUpdate_bits_tdata_store;
  reg        REG_mem_trigger_tUpdate_bits_tdata_load;
  reg [63:0] REG_mem_trigger_tUpdate_bits_tdata_tdata2;
  reg        REG_mem_trigger_tEnableVec_0;
  reg        REG_mem_trigger_tEnableVec_1;
  reg        REG_mem_trigger_tEnableVec_2;
  reg        REG_mem_trigger_tEnableVec_3;
  reg        REG_mem_trigger_triggerCanRaiseBpExp;
  reg        REG_1_icache_parity_enable;
  reg        REG_1_bp_ctrl_ubtb_enable;
  reg        REG_1_bp_ctrl_btb_enable;
  reg        REG_1_bp_ctrl_tage_enable;
  reg        REG_1_bp_ctrl_sc_enable;
  reg        REG_1_bp_ctrl_ras_enable;
  reg        REG_1_ldld_vio_check_enable;
  reg        REG_1_cache_error_enable;
  reg        REG_1_distribute_csr_w_valid;
  reg [11:0] REG_1_distribute_csr_w_bits_addr;
  reg [63:0] REG_1_distribute_csr_w_bits_data;
  reg        REG_1_frontend_trigger_tUpdate_valid;
  reg [1:0]  REG_1_frontend_trigger_tUpdate_bits_addr;
  reg [1:0]  REG_1_frontend_trigger_tUpdate_bits_tdata_matchType;
  reg        REG_1_frontend_trigger_tUpdate_bits_tdata_select;
  reg        REG_1_frontend_trigger_tUpdate_bits_tdata_timing;
  reg        REG_1_frontend_trigger_tUpdate_bits_tdata_chain;
  reg [63:0] REG_1_frontend_trigger_tUpdate_bits_tdata_tdata2;
  reg        REG_1_frontend_trigger_tEnableVec_0;
  reg        REG_1_frontend_trigger_tEnableVec_1;
  reg        REG_1_frontend_trigger_tEnableVec_2;
  reg        REG_1_frontend_trigger_tEnableVec_3;
  reg        REG_1_mem_trigger_tUpdate_valid;
  reg [1:0]  REG_1_mem_trigger_tUpdate_bits_addr;
  reg [1:0]  REG_1_mem_trigger_tUpdate_bits_tdata_matchType;
  reg        REG_1_mem_trigger_tUpdate_bits_tdata_select;
  reg        REG_1_mem_trigger_tUpdate_bits_tdata_timing;
  reg        REG_1_mem_trigger_tUpdate_bits_tdata_action;
  reg        REG_1_mem_trigger_tUpdate_bits_tdata_chain;
  reg        REG_1_mem_trigger_tUpdate_bits_tdata_store;
  reg        REG_1_mem_trigger_tUpdate_bits_tdata_load;
  reg [63:0] REG_1_mem_trigger_tUpdate_bits_tdata_tdata2;
  reg        REG_1_mem_trigger_tEnableVec_0;
  reg        REG_1_mem_trigger_tEnableVec_1;
  reg        REG_1_mem_trigger_tEnableVec_2;
  reg        REG_1_mem_trigger_tEnableVec_3;
  reg        REG_1_mem_trigger_triggerCanRaiseBpExp;
  always @(posedge clock) begin
    REG_icache_parity_enable <= io_in_icache_parity_enable;
    REG_bp_ctrl_ubtb_enable <= io_in_bp_ctrl_ubtb_enable;
    REG_bp_ctrl_btb_enable <= io_in_bp_ctrl_btb_enable;
    REG_bp_ctrl_tage_enable <= io_in_bp_ctrl_tage_enable;
    REG_bp_ctrl_sc_enable <= io_in_bp_ctrl_sc_enable;
    REG_bp_ctrl_ras_enable <= io_in_bp_ctrl_ras_enable;
    REG_ldld_vio_check_enable <= io_in_ldld_vio_check_enable;
    REG_cache_error_enable <= io_in_cache_error_enable;
    REG_distribute_csr_w_valid <= io_in_distribute_csr_w_valid;
    REG_distribute_csr_w_bits_addr <= io_in_distribute_csr_w_bits_addr;
    REG_distribute_csr_w_bits_data <= io_in_distribute_csr_w_bits_data;
    REG_frontend_trigger_tUpdate_valid <= io_in_frontend_trigger_tUpdate_valid;
    REG_frontend_trigger_tUpdate_bits_addr <= io_in_frontend_trigger_tUpdate_bits_addr;
    REG_frontend_trigger_tUpdate_bits_tdata_matchType <=
      io_in_frontend_trigger_tUpdate_bits_tdata_matchType;
    REG_frontend_trigger_tUpdate_bits_tdata_select <=
      io_in_frontend_trigger_tUpdate_bits_tdata_select;
    REG_frontend_trigger_tUpdate_bits_tdata_timing <=
      io_in_frontend_trigger_tUpdate_bits_tdata_timing;
    REG_frontend_trigger_tUpdate_bits_tdata_chain <=
      io_in_frontend_trigger_tUpdate_bits_tdata_chain;
    REG_frontend_trigger_tUpdate_bits_tdata_tdata2 <=
      io_in_frontend_trigger_tUpdate_bits_tdata_tdata2;
    REG_frontend_trigger_tEnableVec_0 <= io_in_frontend_trigger_tEnableVec_0;
    REG_frontend_trigger_tEnableVec_1 <= io_in_frontend_trigger_tEnableVec_1;
    REG_frontend_trigger_tEnableVec_2 <= io_in_frontend_trigger_tEnableVec_2;
    REG_frontend_trigger_tEnableVec_3 <= io_in_frontend_trigger_tEnableVec_3;
    REG_mem_trigger_tUpdate_valid <= io_in_mem_trigger_tUpdate_valid;
    REG_mem_trigger_tUpdate_bits_addr <= io_in_mem_trigger_tUpdate_bits_addr;
    REG_mem_trigger_tUpdate_bits_tdata_matchType <=
      io_in_mem_trigger_tUpdate_bits_tdata_matchType;
    REG_mem_trigger_tUpdate_bits_tdata_select <=
      io_in_mem_trigger_tUpdate_bits_tdata_select;
    REG_mem_trigger_tUpdate_bits_tdata_timing <=
      io_in_mem_trigger_tUpdate_bits_tdata_timing;
    REG_mem_trigger_tUpdate_bits_tdata_action <=
      io_in_mem_trigger_tUpdate_bits_tdata_action;
    REG_mem_trigger_tUpdate_bits_tdata_chain <=
      io_in_mem_trigger_tUpdate_bits_tdata_chain;
    REG_mem_trigger_tUpdate_bits_tdata_store <=
      io_in_mem_trigger_tUpdate_bits_tdata_store;
    REG_mem_trigger_tUpdate_bits_tdata_load <= io_in_mem_trigger_tUpdate_bits_tdata_load;
    REG_mem_trigger_tUpdate_bits_tdata_tdata2 <=
      io_in_mem_trigger_tUpdate_bits_tdata_tdata2;
    REG_mem_trigger_tEnableVec_0 <= io_in_mem_trigger_tEnableVec_0;
    REG_mem_trigger_tEnableVec_1 <= io_in_mem_trigger_tEnableVec_1;
    REG_mem_trigger_tEnableVec_2 <= io_in_mem_trigger_tEnableVec_2;
    REG_mem_trigger_tEnableVec_3 <= io_in_mem_trigger_tEnableVec_3;
    REG_mem_trigger_triggerCanRaiseBpExp <= io_in_mem_trigger_triggerCanRaiseBpExp;
    REG_1_icache_parity_enable <= REG_icache_parity_enable;
    REG_1_bp_ctrl_ubtb_enable <= REG_bp_ctrl_ubtb_enable;
    REG_1_bp_ctrl_btb_enable <= REG_bp_ctrl_btb_enable;
    REG_1_bp_ctrl_tage_enable <= REG_bp_ctrl_tage_enable;
    REG_1_bp_ctrl_sc_enable <= REG_bp_ctrl_sc_enable;
    REG_1_bp_ctrl_ras_enable <= REG_bp_ctrl_ras_enable;
    REG_1_ldld_vio_check_enable <= REG_ldld_vio_check_enable;
    REG_1_cache_error_enable <= REG_cache_error_enable;
    REG_1_distribute_csr_w_valid <= REG_distribute_csr_w_valid;
    REG_1_distribute_csr_w_bits_addr <= REG_distribute_csr_w_bits_addr;
    REG_1_distribute_csr_w_bits_data <= REG_distribute_csr_w_bits_data;
    REG_1_frontend_trigger_tUpdate_valid <= REG_frontend_trigger_tUpdate_valid;
    REG_1_frontend_trigger_tUpdate_bits_addr <= REG_frontend_trigger_tUpdate_bits_addr;
    REG_1_frontend_trigger_tUpdate_bits_tdata_matchType <=
      REG_frontend_trigger_tUpdate_bits_tdata_matchType;
    REG_1_frontend_trigger_tUpdate_bits_tdata_select <=
      REG_frontend_trigger_tUpdate_bits_tdata_select;
    REG_1_frontend_trigger_tUpdate_bits_tdata_timing <=
      REG_frontend_trigger_tUpdate_bits_tdata_timing;
    REG_1_frontend_trigger_tUpdate_bits_tdata_chain <=
      REG_frontend_trigger_tUpdate_bits_tdata_chain;
    REG_1_frontend_trigger_tUpdate_bits_tdata_tdata2 <=
      REG_frontend_trigger_tUpdate_bits_tdata_tdata2;
    REG_1_frontend_trigger_tEnableVec_0 <= REG_frontend_trigger_tEnableVec_0;
    REG_1_frontend_trigger_tEnableVec_1 <= REG_frontend_trigger_tEnableVec_1;
    REG_1_frontend_trigger_tEnableVec_2 <= REG_frontend_trigger_tEnableVec_2;
    REG_1_frontend_trigger_tEnableVec_3 <= REG_frontend_trigger_tEnableVec_3;
    REG_1_mem_trigger_tUpdate_valid <= REG_mem_trigger_tUpdate_valid;
    REG_1_mem_trigger_tUpdate_bits_addr <= REG_mem_trigger_tUpdate_bits_addr;
    REG_1_mem_trigger_tUpdate_bits_tdata_matchType <=
      REG_mem_trigger_tUpdate_bits_tdata_matchType;
    REG_1_mem_trigger_tUpdate_bits_tdata_select <=
      REG_mem_trigger_tUpdate_bits_tdata_select;
    REG_1_mem_trigger_tUpdate_bits_tdata_timing <=
      REG_mem_trigger_tUpdate_bits_tdata_timing;
    REG_1_mem_trigger_tUpdate_bits_tdata_action <=
      REG_mem_trigger_tUpdate_bits_tdata_action;
    REG_1_mem_trigger_tUpdate_bits_tdata_chain <=
      REG_mem_trigger_tUpdate_bits_tdata_chain;
    REG_1_mem_trigger_tUpdate_bits_tdata_store <=
      REG_mem_trigger_tUpdate_bits_tdata_store;
    REG_1_mem_trigger_tUpdate_bits_tdata_load <= REG_mem_trigger_tUpdate_bits_tdata_load;
    REG_1_mem_trigger_tUpdate_bits_tdata_tdata2 <=
      REG_mem_trigger_tUpdate_bits_tdata_tdata2;
    REG_1_mem_trigger_tEnableVec_0 <= REG_mem_trigger_tEnableVec_0;
    REG_1_mem_trigger_tEnableVec_1 <= REG_mem_trigger_tEnableVec_1;
    REG_1_mem_trigger_tEnableVec_2 <= REG_mem_trigger_tEnableVec_2;
    REG_1_mem_trigger_tEnableVec_3 <= REG_mem_trigger_tEnableVec_3;
    REG_1_mem_trigger_triggerCanRaiseBpExp <= REG_mem_trigger_triggerCanRaiseBpExp;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:17];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h12; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        REG_icache_parity_enable = _RANDOM[5'h0][18];
        REG_bp_ctrl_ubtb_enable = _RANDOM[5'h0][28];
        REG_bp_ctrl_btb_enable = _RANDOM[5'h0][29];
        REG_bp_ctrl_tage_enable = _RANDOM[5'h0][31];
        REG_bp_ctrl_sc_enable = _RANDOM[5'h1][0];
        REG_bp_ctrl_ras_enable = _RANDOM[5'h1][1];
        REG_ldld_vio_check_enable = _RANDOM[5'h1][7];
        REG_cache_error_enable = _RANDOM[5'h1][9];
        REG_distribute_csr_w_valid = _RANDOM[5'h1][13];
        REG_distribute_csr_w_bits_addr = _RANDOM[5'h1][25:14];
        REG_distribute_csr_w_bits_data =
          {_RANDOM[5'h1][31:26], _RANDOM[5'h2], _RANDOM[5'h3][25:0]};
        REG_frontend_trigger_tUpdate_valid = _RANDOM[5'h3][27];
        REG_frontend_trigger_tUpdate_bits_addr = _RANDOM[5'h3][29:28];
        REG_frontend_trigger_tUpdate_bits_tdata_matchType = _RANDOM[5'h3][31:30];
        REG_frontend_trigger_tUpdate_bits_tdata_select = _RANDOM[5'h4][0];
        REG_frontend_trigger_tUpdate_bits_tdata_timing = _RANDOM[5'h4][1];
        REG_frontend_trigger_tUpdate_bits_tdata_chain = _RANDOM[5'h4][3];
        REG_frontend_trigger_tUpdate_bits_tdata_tdata2 =
          {_RANDOM[5'h4][31:7], _RANDOM[5'h5], _RANDOM[5'h6][6:0]};
        REG_frontend_trigger_tEnableVec_0 = _RANDOM[5'h6][7];
        REG_frontend_trigger_tEnableVec_1 = _RANDOM[5'h6][8];
        REG_frontend_trigger_tEnableVec_2 = _RANDOM[5'h6][9];
        REG_frontend_trigger_tEnableVec_3 = _RANDOM[5'h6][10];
        REG_mem_trigger_tUpdate_valid = _RANDOM[5'h6][11];
        REG_mem_trigger_tUpdate_bits_addr = _RANDOM[5'h6][13:12];
        REG_mem_trigger_tUpdate_bits_tdata_matchType = _RANDOM[5'h6][15:14];
        REG_mem_trigger_tUpdate_bits_tdata_select = _RANDOM[5'h6][16];
        REG_mem_trigger_tUpdate_bits_tdata_timing = _RANDOM[5'h6][17];
        REG_mem_trigger_tUpdate_bits_tdata_action = _RANDOM[5'h6][18];
        REG_mem_trigger_tUpdate_bits_tdata_chain = _RANDOM[5'h6][19];
        REG_mem_trigger_tUpdate_bits_tdata_store = _RANDOM[5'h6][21];
        REG_mem_trigger_tUpdate_bits_tdata_load = _RANDOM[5'h6][22];
        REG_mem_trigger_tUpdate_bits_tdata_tdata2 =
          {_RANDOM[5'h6][31:23], _RANDOM[5'h7], _RANDOM[5'h8][22:0]};
        REG_mem_trigger_tEnableVec_0 = _RANDOM[5'h8][23];
        REG_mem_trigger_tEnableVec_1 = _RANDOM[5'h8][24];
        REG_mem_trigger_tEnableVec_2 = _RANDOM[5'h8][25];
        REG_mem_trigger_tEnableVec_3 = _RANDOM[5'h8][26];
        REG_mem_trigger_triggerCanRaiseBpExp = _RANDOM[5'h8][27];
        REG_1_icache_parity_enable = _RANDOM[5'h9][15];
        REG_1_bp_ctrl_ubtb_enable = _RANDOM[5'h9][25];
        REG_1_bp_ctrl_btb_enable = _RANDOM[5'h9][26];
        REG_1_bp_ctrl_tage_enable = _RANDOM[5'h9][28];
        REG_1_bp_ctrl_sc_enable = _RANDOM[5'h9][29];
        REG_1_bp_ctrl_ras_enable = _RANDOM[5'h9][30];
        REG_1_ldld_vio_check_enable = _RANDOM[5'hA][4];
        REG_1_cache_error_enable = _RANDOM[5'hA][6];
        REG_1_distribute_csr_w_valid = _RANDOM[5'hA][10];
        REG_1_distribute_csr_w_bits_addr = _RANDOM[5'hA][22:11];
        REG_1_distribute_csr_w_bits_data =
          {_RANDOM[5'hA][31:23], _RANDOM[5'hB], _RANDOM[5'hC][22:0]};
        REG_1_frontend_trigger_tUpdate_valid = _RANDOM[5'hC][24];
        REG_1_frontend_trigger_tUpdate_bits_addr = _RANDOM[5'hC][26:25];
        REG_1_frontend_trigger_tUpdate_bits_tdata_matchType = _RANDOM[5'hC][28:27];
        REG_1_frontend_trigger_tUpdate_bits_tdata_select = _RANDOM[5'hC][29];
        REG_1_frontend_trigger_tUpdate_bits_tdata_timing = _RANDOM[5'hC][30];
        REG_1_frontend_trigger_tUpdate_bits_tdata_chain = _RANDOM[5'hD][0];
        REG_1_frontend_trigger_tUpdate_bits_tdata_tdata2 =
          {_RANDOM[5'hD][31:4], _RANDOM[5'hE], _RANDOM[5'hF][3:0]};
        REG_1_frontend_trigger_tEnableVec_0 = _RANDOM[5'hF][4];
        REG_1_frontend_trigger_tEnableVec_1 = _RANDOM[5'hF][5];
        REG_1_frontend_trigger_tEnableVec_2 = _RANDOM[5'hF][6];
        REG_1_frontend_trigger_tEnableVec_3 = _RANDOM[5'hF][7];
        REG_1_mem_trigger_tUpdate_valid = _RANDOM[5'hF][8];
        REG_1_mem_trigger_tUpdate_bits_addr = _RANDOM[5'hF][10:9];
        REG_1_mem_trigger_tUpdate_bits_tdata_matchType = _RANDOM[5'hF][12:11];
        REG_1_mem_trigger_tUpdate_bits_tdata_select = _RANDOM[5'hF][13];
        REG_1_mem_trigger_tUpdate_bits_tdata_timing = _RANDOM[5'hF][14];
        REG_1_mem_trigger_tUpdate_bits_tdata_action = _RANDOM[5'hF][15];
        REG_1_mem_trigger_tUpdate_bits_tdata_chain = _RANDOM[5'hF][16];
        REG_1_mem_trigger_tUpdate_bits_tdata_store = _RANDOM[5'hF][18];
        REG_1_mem_trigger_tUpdate_bits_tdata_load = _RANDOM[5'hF][19];
        REG_1_mem_trigger_tUpdate_bits_tdata_tdata2 =
          {_RANDOM[5'hF][31:20], _RANDOM[5'h10], _RANDOM[5'h11][19:0]};
        REG_1_mem_trigger_tEnableVec_0 = _RANDOM[5'h11][20];
        REG_1_mem_trigger_tEnableVec_1 = _RANDOM[5'h11][21];
        REG_1_mem_trigger_tEnableVec_2 = _RANDOM[5'h11][22];
        REG_1_mem_trigger_tEnableVec_3 = _RANDOM[5'h11][23];
        REG_1_mem_trigger_triggerCanRaiseBpExp = _RANDOM[5'h11][24];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_out_icache_parity_enable = REG_1_icache_parity_enable;
  assign io_out_bp_ctrl_ubtb_enable = REG_1_bp_ctrl_ubtb_enable;
  assign io_out_bp_ctrl_btb_enable = REG_1_bp_ctrl_btb_enable;
  assign io_out_bp_ctrl_tage_enable = REG_1_bp_ctrl_tage_enable;
  assign io_out_bp_ctrl_sc_enable = REG_1_bp_ctrl_sc_enable;
  assign io_out_bp_ctrl_ras_enable = REG_1_bp_ctrl_ras_enable;
  assign io_out_ldld_vio_check_enable = REG_1_ldld_vio_check_enable;
  assign io_out_cache_error_enable = REG_1_cache_error_enable;
  assign io_out_distribute_csr_w_valid = REG_1_distribute_csr_w_valid;
  assign io_out_distribute_csr_w_bits_addr = REG_1_distribute_csr_w_bits_addr;
  assign io_out_distribute_csr_w_bits_data = REG_1_distribute_csr_w_bits_data;
  assign io_out_frontend_trigger_tUpdate_valid = REG_1_frontend_trigger_tUpdate_valid;
  assign io_out_frontend_trigger_tUpdate_bits_addr =
    REG_1_frontend_trigger_tUpdate_bits_addr;
  assign io_out_frontend_trigger_tUpdate_bits_tdata_matchType =
    REG_1_frontend_trigger_tUpdate_bits_tdata_matchType;
  assign io_out_frontend_trigger_tUpdate_bits_tdata_select =
    REG_1_frontend_trigger_tUpdate_bits_tdata_select;
  assign io_out_frontend_trigger_tUpdate_bits_tdata_timing =
    REG_1_frontend_trigger_tUpdate_bits_tdata_timing;
  assign io_out_frontend_trigger_tUpdate_bits_tdata_chain =
    REG_1_frontend_trigger_tUpdate_bits_tdata_chain;
  assign io_out_frontend_trigger_tUpdate_bits_tdata_tdata2 =
    REG_1_frontend_trigger_tUpdate_bits_tdata_tdata2;
  assign io_out_frontend_trigger_tEnableVec_0 = REG_1_frontend_trigger_tEnableVec_0;
  assign io_out_frontend_trigger_tEnableVec_1 = REG_1_frontend_trigger_tEnableVec_1;
  assign io_out_frontend_trigger_tEnableVec_2 = REG_1_frontend_trigger_tEnableVec_2;
  assign io_out_frontend_trigger_tEnableVec_3 = REG_1_frontend_trigger_tEnableVec_3;
  assign io_out_mem_trigger_tUpdate_valid = REG_1_mem_trigger_tUpdate_valid;
  assign io_out_mem_trigger_tUpdate_bits_addr = REG_1_mem_trigger_tUpdate_bits_addr;
  assign io_out_mem_trigger_tUpdate_bits_tdata_matchType =
    REG_1_mem_trigger_tUpdate_bits_tdata_matchType;
  assign io_out_mem_trigger_tUpdate_bits_tdata_select =
    REG_1_mem_trigger_tUpdate_bits_tdata_select;
  assign io_out_mem_trigger_tUpdate_bits_tdata_timing =
    REG_1_mem_trigger_tUpdate_bits_tdata_timing;
  assign io_out_mem_trigger_tUpdate_bits_tdata_action =
    REG_1_mem_trigger_tUpdate_bits_tdata_action;
  assign io_out_mem_trigger_tUpdate_bits_tdata_chain =
    REG_1_mem_trigger_tUpdate_bits_tdata_chain;
  assign io_out_mem_trigger_tUpdate_bits_tdata_store =
    REG_1_mem_trigger_tUpdate_bits_tdata_store;
  assign io_out_mem_trigger_tUpdate_bits_tdata_load =
    REG_1_mem_trigger_tUpdate_bits_tdata_load;
  assign io_out_mem_trigger_tUpdate_bits_tdata_tdata2 =
    REG_1_mem_trigger_tUpdate_bits_tdata_tdata2;
  assign io_out_mem_trigger_tEnableVec_0 = REG_1_mem_trigger_tEnableVec_0;
  assign io_out_mem_trigger_tEnableVec_1 = REG_1_mem_trigger_tEnableVec_1;
  assign io_out_mem_trigger_tEnableVec_2 = REG_1_mem_trigger_tEnableVec_2;
  assign io_out_mem_trigger_tEnableVec_3 = REG_1_mem_trigger_tEnableVec_3;
  assign io_out_mem_trigger_triggerCanRaiseBpExp = REG_1_mem_trigger_triggerCanRaiseBpExp;
endmodule

