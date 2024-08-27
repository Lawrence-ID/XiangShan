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
module SRAMTemplate_56(
  input        clock,
  input        reset,
  input        io_r_req_valid,
  input  [7:0] io_r_req_bits_setIdx,
  output [5:0] io_r_resp_data_0,
  output [5:0] io_r_resp_data_1,
  output [5:0] io_r_resp_data_2,
  output [5:0] io_r_resp_data_3,
  input        io_w_req_valid,
  input  [7:0] io_w_req_bits_setIdx,
  input  [5:0] io_w_req_bits_data_0,
  input  [5:0] io_w_req_bits_data_1,
  input  [5:0] io_w_req_bits_data_2,
  input  [5:0] io_w_req_bits_data_3,
  input  [3:0] io_w_req_bits_waymask
);

  wire [23:0] _array_R0_data;
  reg         _resetState;
  reg  [7:0]  _resetSet;
  reg  [5:0]  bypass_wdata_r_0;
  reg  [5:0]  bypass_wdata_r_1;
  reg  [5:0]  bypass_wdata_r_2;
  reg  [5:0]  bypass_wdata_r_3;
  wire        bypass_mask_need_check = io_r_req_valid & io_w_req_valid;
  reg         bypass_mask_need_check_reg_last_REG;
  reg  [7:0]  bypass_mask_waddr_reg;
  reg  [7:0]  bypass_mask_raddr_reg;
  reg  [3:0]  bypass_mask_wmask_reg;
  wire [3:0]  bypass_mask =
    {4{bypass_mask_need_check_reg_last_REG
         & bypass_mask_waddr_reg == bypass_mask_raddr_reg}} & bypass_mask_wmask_reg;
  wire [5:0]  mem_rdata_0 = bypass_mask[0] ? bypass_wdata_r_0 : _array_R0_data[5:0];
  wire [5:0]  mem_rdata_1 = bypass_mask[1] ? bypass_wdata_r_1 : _array_R0_data[11:6];
  wire [5:0]  mem_rdata_2 = bypass_mask[2] ? bypass_wdata_r_2 : _array_R0_data[17:12];
  wire [5:0]  mem_rdata_3 = bypass_mask[3] ? bypass_wdata_r_3 : _array_R0_data[23:18];
  reg         rdata_last_REG;
  reg  [5:0]  rdata_hold_data_0;
  reg  [5:0]  rdata_hold_data_1;
  reg  [5:0]  rdata_hold_data_2;
  reg  [5:0]  rdata_hold_data_3;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _resetState <= 1'h1;
      _resetSet <= 8'h0;
      bypass_mask_need_check_reg_last_REG <= 1'h0;
      rdata_last_REG <= 1'h0;
    end
    else begin
      _resetState <= ~(_resetState & (&_resetSet)) & _resetState;
      if (_resetState)
        _resetSet <= 8'(_resetSet + 8'h1);
      bypass_mask_need_check_reg_last_REG <= bypass_mask_need_check;
      rdata_last_REG <= io_r_req_valid;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_w_req_valid & io_r_req_valid) begin
      bypass_wdata_r_0 <= io_w_req_bits_data_0;
      bypass_wdata_r_1 <= io_w_req_bits_data_1;
      bypass_wdata_r_2 <= io_w_req_bits_data_2;
      bypass_wdata_r_3 <= io_w_req_bits_data_3;
    end
    if (bypass_mask_need_check) begin
      bypass_mask_waddr_reg <= io_w_req_bits_setIdx;
      bypass_mask_raddr_reg <= io_r_req_bits_setIdx;
      bypass_mask_wmask_reg <= io_w_req_bits_waymask;
    end
    if (rdata_last_REG) begin
      rdata_hold_data_0 <= mem_rdata_0;
      rdata_hold_data_1 <= mem_rdata_1;
      rdata_hold_data_2 <= mem_rdata_2;
      rdata_hold_data_3 <= mem_rdata_3;
    end
  end // always @(posedge)
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
        _resetState = _RANDOM[2'h0][0];
        _resetSet = _RANDOM[2'h0][8:1];
        bypass_wdata_r_0 = _RANDOM[2'h0][14:9];
        bypass_wdata_r_1 = _RANDOM[2'h0][20:15];
        bypass_wdata_r_2 = _RANDOM[2'h0][26:21];
        bypass_wdata_r_3 = {_RANDOM[2'h0][31:27], _RANDOM[2'h1][0]};
        bypass_mask_need_check_reg_last_REG = _RANDOM[2'h1][1];
        bypass_mask_waddr_reg = _RANDOM[2'h1][9:2];
        bypass_mask_raddr_reg = _RANDOM[2'h1][17:10];
        bypass_mask_wmask_reg = _RANDOM[2'h1][21:18];
        rdata_last_REG = _RANDOM[2'h1][22];
        rdata_hold_data_0 = _RANDOM[2'h1][28:23];
        rdata_hold_data_1 = {_RANDOM[2'h1][31:29], _RANDOM[2'h2][2:0]};
        rdata_hold_data_2 = _RANDOM[2'h2][8:3];
        rdata_hold_data_3 = _RANDOM[2'h2][14:9];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        _resetState = 1'h1;
        _resetSet = 8'h0;
        bypass_mask_need_check_reg_last_REG = 1'h0;
        rdata_last_REG = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  array_5 array (
    .R0_addr (io_r_req_bits_setIdx),
    .R0_en   (io_r_req_valid),
    .R0_clk  (clock),
    .R0_data (_array_R0_data),
    .W0_addr (_resetState ? _resetSet : io_w_req_bits_setIdx),
    .W0_en   (io_w_req_valid | _resetState),
    .W0_clk  (clock),
    .W0_data
      ({_resetState ? 6'h0 : io_w_req_bits_data_3,
        _resetState ? 6'h0 : io_w_req_bits_data_2,
        _resetState ? 6'h0 : io_w_req_bits_data_1,
        _resetState ? 6'h0 : io_w_req_bits_data_0}),
    .W0_mask (_resetState ? 4'hF : io_w_req_bits_waymask)
  );
  assign io_r_resp_data_0 = rdata_last_REG ? mem_rdata_0 : rdata_hold_data_0;
  assign io_r_resp_data_1 = rdata_last_REG ? mem_rdata_1 : rdata_hold_data_1;
  assign io_r_resp_data_2 = rdata_last_REG ? mem_rdata_2 : rdata_hold_data_2;
  assign io_r_resp_data_3 = rdata_last_REG ? mem_rdata_3 : rdata_hold_data_3;
endmodule

