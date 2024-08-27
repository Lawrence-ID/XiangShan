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
module SRAMTemplate_34(
  input         clock,
  input         reset,
  output        io_r_req_ready,
  input         io_r_req_valid,
  input  [8:0]  io_r_req_bits_setIdx,
  output        io_r_resp_data_0_entry_isCall,
  output        io_r_resp_data_0_entry_isRet,
  output        io_r_resp_data_0_entry_isJalr,
  output        io_r_resp_data_0_entry_valid,
  output [3:0]  io_r_resp_data_0_entry_brSlots_0_offset,
  output        io_r_resp_data_0_entry_brSlots_0_sharing,
  output        io_r_resp_data_0_entry_brSlots_0_valid,
  output [11:0] io_r_resp_data_0_entry_brSlots_0_lower,
  output [1:0]  io_r_resp_data_0_entry_brSlots_0_tarStat,
  output [3:0]  io_r_resp_data_0_entry_tailSlot_offset,
  output        io_r_resp_data_0_entry_tailSlot_sharing,
  output        io_r_resp_data_0_entry_tailSlot_valid,
  output [19:0] io_r_resp_data_0_entry_tailSlot_lower,
  output [1:0]  io_r_resp_data_0_entry_tailSlot_tarStat,
  output [3:0]  io_r_resp_data_0_entry_pftAddr,
  output        io_r_resp_data_0_entry_carry,
  output        io_r_resp_data_0_entry_last_may_be_rvi_call,
  output        io_r_resp_data_0_entry_always_taken_0,
  output        io_r_resp_data_0_entry_always_taken_1,
  output [19:0] io_r_resp_data_0_tag,
  output        io_r_resp_data_1_entry_isCall,
  output        io_r_resp_data_1_entry_isRet,
  output        io_r_resp_data_1_entry_isJalr,
  output        io_r_resp_data_1_entry_valid,
  output [3:0]  io_r_resp_data_1_entry_brSlots_0_offset,
  output        io_r_resp_data_1_entry_brSlots_0_sharing,
  output        io_r_resp_data_1_entry_brSlots_0_valid,
  output [11:0] io_r_resp_data_1_entry_brSlots_0_lower,
  output [1:0]  io_r_resp_data_1_entry_brSlots_0_tarStat,
  output [3:0]  io_r_resp_data_1_entry_tailSlot_offset,
  output        io_r_resp_data_1_entry_tailSlot_sharing,
  output        io_r_resp_data_1_entry_tailSlot_valid,
  output [19:0] io_r_resp_data_1_entry_tailSlot_lower,
  output [1:0]  io_r_resp_data_1_entry_tailSlot_tarStat,
  output [3:0]  io_r_resp_data_1_entry_pftAddr,
  output        io_r_resp_data_1_entry_carry,
  output        io_r_resp_data_1_entry_last_may_be_rvi_call,
  output        io_r_resp_data_1_entry_always_taken_0,
  output        io_r_resp_data_1_entry_always_taken_1,
  output [19:0] io_r_resp_data_1_tag,
  output        io_r_resp_data_2_entry_isCall,
  output        io_r_resp_data_2_entry_isRet,
  output        io_r_resp_data_2_entry_isJalr,
  output        io_r_resp_data_2_entry_valid,
  output [3:0]  io_r_resp_data_2_entry_brSlots_0_offset,
  output        io_r_resp_data_2_entry_brSlots_0_sharing,
  output        io_r_resp_data_2_entry_brSlots_0_valid,
  output [11:0] io_r_resp_data_2_entry_brSlots_0_lower,
  output [1:0]  io_r_resp_data_2_entry_brSlots_0_tarStat,
  output [3:0]  io_r_resp_data_2_entry_tailSlot_offset,
  output        io_r_resp_data_2_entry_tailSlot_sharing,
  output        io_r_resp_data_2_entry_tailSlot_valid,
  output [19:0] io_r_resp_data_2_entry_tailSlot_lower,
  output [1:0]  io_r_resp_data_2_entry_tailSlot_tarStat,
  output [3:0]  io_r_resp_data_2_entry_pftAddr,
  output        io_r_resp_data_2_entry_carry,
  output        io_r_resp_data_2_entry_last_may_be_rvi_call,
  output        io_r_resp_data_2_entry_always_taken_0,
  output        io_r_resp_data_2_entry_always_taken_1,
  output [19:0] io_r_resp_data_2_tag,
  output        io_r_resp_data_3_entry_isCall,
  output        io_r_resp_data_3_entry_isRet,
  output        io_r_resp_data_3_entry_isJalr,
  output        io_r_resp_data_3_entry_valid,
  output [3:0]  io_r_resp_data_3_entry_brSlots_0_offset,
  output        io_r_resp_data_3_entry_brSlots_0_sharing,
  output        io_r_resp_data_3_entry_brSlots_0_valid,
  output [11:0] io_r_resp_data_3_entry_brSlots_0_lower,
  output [1:0]  io_r_resp_data_3_entry_brSlots_0_tarStat,
  output [3:0]  io_r_resp_data_3_entry_tailSlot_offset,
  output        io_r_resp_data_3_entry_tailSlot_sharing,
  output        io_r_resp_data_3_entry_tailSlot_valid,
  output [19:0] io_r_resp_data_3_entry_tailSlot_lower,
  output [1:0]  io_r_resp_data_3_entry_tailSlot_tarStat,
  output [3:0]  io_r_resp_data_3_entry_pftAddr,
  output        io_r_resp_data_3_entry_carry,
  output        io_r_resp_data_3_entry_last_may_be_rvi_call,
  output        io_r_resp_data_3_entry_always_taken_0,
  output        io_r_resp_data_3_entry_always_taken_1,
  output [19:0] io_r_resp_data_3_tag,
  input         io_w_req_valid,
  input  [8:0]  io_w_req_bits_setIdx,
  input         io_w_req_bits_data_0_entry_isCall,
  input         io_w_req_bits_data_0_entry_isRet,
  input         io_w_req_bits_data_0_entry_isJalr,
  input         io_w_req_bits_data_0_entry_valid,
  input  [3:0]  io_w_req_bits_data_0_entry_brSlots_0_offset,
  input         io_w_req_bits_data_0_entry_brSlots_0_sharing,
  input         io_w_req_bits_data_0_entry_brSlots_0_valid,
  input  [11:0] io_w_req_bits_data_0_entry_brSlots_0_lower,
  input  [1:0]  io_w_req_bits_data_0_entry_brSlots_0_tarStat,
  input  [3:0]  io_w_req_bits_data_0_entry_tailSlot_offset,
  input         io_w_req_bits_data_0_entry_tailSlot_sharing,
  input         io_w_req_bits_data_0_entry_tailSlot_valid,
  input  [19:0] io_w_req_bits_data_0_entry_tailSlot_lower,
  input  [1:0]  io_w_req_bits_data_0_entry_tailSlot_tarStat,
  input  [3:0]  io_w_req_bits_data_0_entry_pftAddr,
  input         io_w_req_bits_data_0_entry_carry,
  input         io_w_req_bits_data_0_entry_last_may_be_rvi_call,
  input         io_w_req_bits_data_0_entry_always_taken_0,
  input         io_w_req_bits_data_0_entry_always_taken_1,
  input  [19:0] io_w_req_bits_data_0_tag,
  input         io_w_req_bits_data_1_entry_isCall,
  input         io_w_req_bits_data_1_entry_isRet,
  input         io_w_req_bits_data_1_entry_isJalr,
  input         io_w_req_bits_data_1_entry_valid,
  input  [3:0]  io_w_req_bits_data_1_entry_brSlots_0_offset,
  input         io_w_req_bits_data_1_entry_brSlots_0_sharing,
  input         io_w_req_bits_data_1_entry_brSlots_0_valid,
  input  [11:0] io_w_req_bits_data_1_entry_brSlots_0_lower,
  input  [1:0]  io_w_req_bits_data_1_entry_brSlots_0_tarStat,
  input  [3:0]  io_w_req_bits_data_1_entry_tailSlot_offset,
  input         io_w_req_bits_data_1_entry_tailSlot_sharing,
  input         io_w_req_bits_data_1_entry_tailSlot_valid,
  input  [19:0] io_w_req_bits_data_1_entry_tailSlot_lower,
  input  [1:0]  io_w_req_bits_data_1_entry_tailSlot_tarStat,
  input  [3:0]  io_w_req_bits_data_1_entry_pftAddr,
  input         io_w_req_bits_data_1_entry_carry,
  input         io_w_req_bits_data_1_entry_last_may_be_rvi_call,
  input         io_w_req_bits_data_1_entry_always_taken_0,
  input         io_w_req_bits_data_1_entry_always_taken_1,
  input  [19:0] io_w_req_bits_data_1_tag,
  input         io_w_req_bits_data_2_entry_isCall,
  input         io_w_req_bits_data_2_entry_isRet,
  input         io_w_req_bits_data_2_entry_isJalr,
  input         io_w_req_bits_data_2_entry_valid,
  input  [3:0]  io_w_req_bits_data_2_entry_brSlots_0_offset,
  input         io_w_req_bits_data_2_entry_brSlots_0_sharing,
  input         io_w_req_bits_data_2_entry_brSlots_0_valid,
  input  [11:0] io_w_req_bits_data_2_entry_brSlots_0_lower,
  input  [1:0]  io_w_req_bits_data_2_entry_brSlots_0_tarStat,
  input  [3:0]  io_w_req_bits_data_2_entry_tailSlot_offset,
  input         io_w_req_bits_data_2_entry_tailSlot_sharing,
  input         io_w_req_bits_data_2_entry_tailSlot_valid,
  input  [19:0] io_w_req_bits_data_2_entry_tailSlot_lower,
  input  [1:0]  io_w_req_bits_data_2_entry_tailSlot_tarStat,
  input  [3:0]  io_w_req_bits_data_2_entry_pftAddr,
  input         io_w_req_bits_data_2_entry_carry,
  input         io_w_req_bits_data_2_entry_last_may_be_rvi_call,
  input         io_w_req_bits_data_2_entry_always_taken_0,
  input         io_w_req_bits_data_2_entry_always_taken_1,
  input  [19:0] io_w_req_bits_data_2_tag,
  input         io_w_req_bits_data_3_entry_isCall,
  input         io_w_req_bits_data_3_entry_isRet,
  input         io_w_req_bits_data_3_entry_isJalr,
  input         io_w_req_bits_data_3_entry_valid,
  input  [3:0]  io_w_req_bits_data_3_entry_brSlots_0_offset,
  input         io_w_req_bits_data_3_entry_brSlots_0_sharing,
  input         io_w_req_bits_data_3_entry_brSlots_0_valid,
  input  [11:0] io_w_req_bits_data_3_entry_brSlots_0_lower,
  input  [1:0]  io_w_req_bits_data_3_entry_brSlots_0_tarStat,
  input  [3:0]  io_w_req_bits_data_3_entry_tailSlot_offset,
  input         io_w_req_bits_data_3_entry_tailSlot_sharing,
  input         io_w_req_bits_data_3_entry_tailSlot_valid,
  input  [19:0] io_w_req_bits_data_3_entry_tailSlot_lower,
  input  [1:0]  io_w_req_bits_data_3_entry_tailSlot_tarStat,
  input  [3:0]  io_w_req_bits_data_3_entry_pftAddr,
  input         io_w_req_bits_data_3_entry_carry,
  input         io_w_req_bits_data_3_entry_last_may_be_rvi_call,
  input         io_w_req_bits_data_3_entry_always_taken_0,
  input         io_w_req_bits_data_3_entry_always_taken_1,
  input  [19:0] io_w_req_bits_data_3_tag,
  input  [3:0]  io_w_req_bits_waymask
);

  wire [8:0]   setIdx;
  wire         realRen;
  wire         wen;
  wire [319:0] _array_RW0_rdata;
  reg          _resetState;
  reg  [8:0]   _resetSet;
  assign wen = io_w_req_valid | _resetState;
  assign realRen = io_r_req_valid & ~wen;
  assign setIdx = _resetState ? _resetSet : io_w_req_bits_setIdx;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _resetState <= 1'h1;
      _resetSet <= 9'h0;
    end
    else begin
      _resetState <= ~(_resetState & (&_resetSet)) & _resetState;
      if (_resetState)
        _resetSet <= 9'(_resetSet + 9'h1);
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        _resetState = _RANDOM[/*Zero width*/ 1'b0][0];
        _resetSet = _RANDOM[/*Zero width*/ 1'b0][9:1];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        _resetState = 1'h1;
        _resetSet = 9'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  array_1 array (
    .RW0_addr  (wen ? setIdx : io_r_req_bits_setIdx),
    .RW0_en    (realRen | wen),
    .RW0_clk   (clock),
    .RW0_wmode (wen),
    .RW0_wdata
      ({~_resetState & io_w_req_bits_data_3_entry_isCall,
        ~_resetState & io_w_req_bits_data_3_entry_isRet,
        ~_resetState & io_w_req_bits_data_3_entry_isJalr,
        ~_resetState & io_w_req_bits_data_3_entry_valid,
        _resetState ? 4'h0 : io_w_req_bits_data_3_entry_brSlots_0_offset,
        ~_resetState & io_w_req_bits_data_3_entry_brSlots_0_sharing,
        ~_resetState & io_w_req_bits_data_3_entry_brSlots_0_valid,
        _resetState ? 12'h0 : io_w_req_bits_data_3_entry_brSlots_0_lower,
        _resetState ? 2'h0 : io_w_req_bits_data_3_entry_brSlots_0_tarStat,
        _resetState ? 4'h0 : io_w_req_bits_data_3_entry_tailSlot_offset,
        ~_resetState & io_w_req_bits_data_3_entry_tailSlot_sharing,
        ~_resetState & io_w_req_bits_data_3_entry_tailSlot_valid,
        _resetState ? 20'h0 : io_w_req_bits_data_3_entry_tailSlot_lower,
        _resetState ? 2'h0 : io_w_req_bits_data_3_entry_tailSlot_tarStat,
        _resetState ? 4'h0 : io_w_req_bits_data_3_entry_pftAddr,
        ~_resetState & io_w_req_bits_data_3_entry_carry,
        ~_resetState & io_w_req_bits_data_3_entry_last_may_be_rvi_call,
        ~_resetState & io_w_req_bits_data_3_entry_always_taken_1,
        ~_resetState & io_w_req_bits_data_3_entry_always_taken_0,
        _resetState ? 20'h0 : io_w_req_bits_data_3_tag,
        ~_resetState & io_w_req_bits_data_2_entry_isCall,
        ~_resetState & io_w_req_bits_data_2_entry_isRet,
        ~_resetState & io_w_req_bits_data_2_entry_isJalr,
        ~_resetState & io_w_req_bits_data_2_entry_valid,
        _resetState ? 4'h0 : io_w_req_bits_data_2_entry_brSlots_0_offset,
        ~_resetState & io_w_req_bits_data_2_entry_brSlots_0_sharing,
        ~_resetState & io_w_req_bits_data_2_entry_brSlots_0_valid,
        _resetState ? 12'h0 : io_w_req_bits_data_2_entry_brSlots_0_lower,
        _resetState ? 2'h0 : io_w_req_bits_data_2_entry_brSlots_0_tarStat,
        _resetState ? 4'h0 : io_w_req_bits_data_2_entry_tailSlot_offset,
        ~_resetState & io_w_req_bits_data_2_entry_tailSlot_sharing,
        ~_resetState & io_w_req_bits_data_2_entry_tailSlot_valid,
        _resetState ? 20'h0 : io_w_req_bits_data_2_entry_tailSlot_lower,
        _resetState ? 2'h0 : io_w_req_bits_data_2_entry_tailSlot_tarStat,
        _resetState ? 4'h0 : io_w_req_bits_data_2_entry_pftAddr,
        ~_resetState & io_w_req_bits_data_2_entry_carry,
        ~_resetState & io_w_req_bits_data_2_entry_last_may_be_rvi_call,
        ~_resetState & io_w_req_bits_data_2_entry_always_taken_1,
        ~_resetState & io_w_req_bits_data_2_entry_always_taken_0,
        _resetState ? 20'h0 : io_w_req_bits_data_2_tag,
        ~_resetState & io_w_req_bits_data_1_entry_isCall,
        ~_resetState & io_w_req_bits_data_1_entry_isRet,
        ~_resetState & io_w_req_bits_data_1_entry_isJalr,
        ~_resetState & io_w_req_bits_data_1_entry_valid,
        _resetState ? 4'h0 : io_w_req_bits_data_1_entry_brSlots_0_offset,
        ~_resetState & io_w_req_bits_data_1_entry_brSlots_0_sharing,
        ~_resetState & io_w_req_bits_data_1_entry_brSlots_0_valid,
        _resetState ? 12'h0 : io_w_req_bits_data_1_entry_brSlots_0_lower,
        _resetState ? 2'h0 : io_w_req_bits_data_1_entry_brSlots_0_tarStat,
        _resetState ? 4'h0 : io_w_req_bits_data_1_entry_tailSlot_offset,
        ~_resetState & io_w_req_bits_data_1_entry_tailSlot_sharing,
        ~_resetState & io_w_req_bits_data_1_entry_tailSlot_valid,
        _resetState ? 20'h0 : io_w_req_bits_data_1_entry_tailSlot_lower,
        _resetState ? 2'h0 : io_w_req_bits_data_1_entry_tailSlot_tarStat,
        _resetState ? 4'h0 : io_w_req_bits_data_1_entry_pftAddr,
        ~_resetState & io_w_req_bits_data_1_entry_carry,
        ~_resetState & io_w_req_bits_data_1_entry_last_may_be_rvi_call,
        ~_resetState & io_w_req_bits_data_1_entry_always_taken_1,
        ~_resetState & io_w_req_bits_data_1_entry_always_taken_0,
        _resetState ? 20'h0 : io_w_req_bits_data_1_tag,
        ~_resetState & io_w_req_bits_data_0_entry_isCall,
        ~_resetState & io_w_req_bits_data_0_entry_isRet,
        ~_resetState & io_w_req_bits_data_0_entry_isJalr,
        ~_resetState & io_w_req_bits_data_0_entry_valid,
        _resetState ? 4'h0 : io_w_req_bits_data_0_entry_brSlots_0_offset,
        ~_resetState & io_w_req_bits_data_0_entry_brSlots_0_sharing,
        ~_resetState & io_w_req_bits_data_0_entry_brSlots_0_valid,
        _resetState ? 12'h0 : io_w_req_bits_data_0_entry_brSlots_0_lower,
        _resetState ? 2'h0 : io_w_req_bits_data_0_entry_brSlots_0_tarStat,
        _resetState ? 4'h0 : io_w_req_bits_data_0_entry_tailSlot_offset,
        ~_resetState & io_w_req_bits_data_0_entry_tailSlot_sharing,
        ~_resetState & io_w_req_bits_data_0_entry_tailSlot_valid,
        _resetState ? 20'h0 : io_w_req_bits_data_0_entry_tailSlot_lower,
        _resetState ? 2'h0 : io_w_req_bits_data_0_entry_tailSlot_tarStat,
        _resetState ? 4'h0 : io_w_req_bits_data_0_entry_pftAddr,
        ~_resetState & io_w_req_bits_data_0_entry_carry,
        ~_resetState & io_w_req_bits_data_0_entry_last_may_be_rvi_call,
        ~_resetState & io_w_req_bits_data_0_entry_always_taken_1,
        ~_resetState & io_w_req_bits_data_0_entry_always_taken_0,
        _resetState ? 20'h0 : io_w_req_bits_data_0_tag}),
    .RW0_rdata (_array_RW0_rdata),
    .RW0_wmask (_resetState ? 4'hF : io_w_req_bits_waymask)
  );
  assign io_r_req_ready = ~_resetState & ~wen;
  assign io_r_resp_data_0_entry_isCall = _array_RW0_rdata[79];
  assign io_r_resp_data_0_entry_isRet = _array_RW0_rdata[78];
  assign io_r_resp_data_0_entry_isJalr = _array_RW0_rdata[77];
  assign io_r_resp_data_0_entry_valid = _array_RW0_rdata[76];
  assign io_r_resp_data_0_entry_brSlots_0_offset = _array_RW0_rdata[75:72];
  assign io_r_resp_data_0_entry_brSlots_0_sharing = _array_RW0_rdata[71];
  assign io_r_resp_data_0_entry_brSlots_0_valid = _array_RW0_rdata[70];
  assign io_r_resp_data_0_entry_brSlots_0_lower = _array_RW0_rdata[69:58];
  assign io_r_resp_data_0_entry_brSlots_0_tarStat = _array_RW0_rdata[57:56];
  assign io_r_resp_data_0_entry_tailSlot_offset = _array_RW0_rdata[55:52];
  assign io_r_resp_data_0_entry_tailSlot_sharing = _array_RW0_rdata[51];
  assign io_r_resp_data_0_entry_tailSlot_valid = _array_RW0_rdata[50];
  assign io_r_resp_data_0_entry_tailSlot_lower = _array_RW0_rdata[49:30];
  assign io_r_resp_data_0_entry_tailSlot_tarStat = _array_RW0_rdata[29:28];
  assign io_r_resp_data_0_entry_pftAddr = _array_RW0_rdata[27:24];
  assign io_r_resp_data_0_entry_carry = _array_RW0_rdata[23];
  assign io_r_resp_data_0_entry_last_may_be_rvi_call = _array_RW0_rdata[22];
  assign io_r_resp_data_0_entry_always_taken_0 = _array_RW0_rdata[20];
  assign io_r_resp_data_0_entry_always_taken_1 = _array_RW0_rdata[21];
  assign io_r_resp_data_0_tag = _array_RW0_rdata[19:0];
  assign io_r_resp_data_1_entry_isCall = _array_RW0_rdata[159];
  assign io_r_resp_data_1_entry_isRet = _array_RW0_rdata[158];
  assign io_r_resp_data_1_entry_isJalr = _array_RW0_rdata[157];
  assign io_r_resp_data_1_entry_valid = _array_RW0_rdata[156];
  assign io_r_resp_data_1_entry_brSlots_0_offset = _array_RW0_rdata[155:152];
  assign io_r_resp_data_1_entry_brSlots_0_sharing = _array_RW0_rdata[151];
  assign io_r_resp_data_1_entry_brSlots_0_valid = _array_RW0_rdata[150];
  assign io_r_resp_data_1_entry_brSlots_0_lower = _array_RW0_rdata[149:138];
  assign io_r_resp_data_1_entry_brSlots_0_tarStat = _array_RW0_rdata[137:136];
  assign io_r_resp_data_1_entry_tailSlot_offset = _array_RW0_rdata[135:132];
  assign io_r_resp_data_1_entry_tailSlot_sharing = _array_RW0_rdata[131];
  assign io_r_resp_data_1_entry_tailSlot_valid = _array_RW0_rdata[130];
  assign io_r_resp_data_1_entry_tailSlot_lower = _array_RW0_rdata[129:110];
  assign io_r_resp_data_1_entry_tailSlot_tarStat = _array_RW0_rdata[109:108];
  assign io_r_resp_data_1_entry_pftAddr = _array_RW0_rdata[107:104];
  assign io_r_resp_data_1_entry_carry = _array_RW0_rdata[103];
  assign io_r_resp_data_1_entry_last_may_be_rvi_call = _array_RW0_rdata[102];
  assign io_r_resp_data_1_entry_always_taken_0 = _array_RW0_rdata[100];
  assign io_r_resp_data_1_entry_always_taken_1 = _array_RW0_rdata[101];
  assign io_r_resp_data_1_tag = _array_RW0_rdata[99:80];
  assign io_r_resp_data_2_entry_isCall = _array_RW0_rdata[239];
  assign io_r_resp_data_2_entry_isRet = _array_RW0_rdata[238];
  assign io_r_resp_data_2_entry_isJalr = _array_RW0_rdata[237];
  assign io_r_resp_data_2_entry_valid = _array_RW0_rdata[236];
  assign io_r_resp_data_2_entry_brSlots_0_offset = _array_RW0_rdata[235:232];
  assign io_r_resp_data_2_entry_brSlots_0_sharing = _array_RW0_rdata[231];
  assign io_r_resp_data_2_entry_brSlots_0_valid = _array_RW0_rdata[230];
  assign io_r_resp_data_2_entry_brSlots_0_lower = _array_RW0_rdata[229:218];
  assign io_r_resp_data_2_entry_brSlots_0_tarStat = _array_RW0_rdata[217:216];
  assign io_r_resp_data_2_entry_tailSlot_offset = _array_RW0_rdata[215:212];
  assign io_r_resp_data_2_entry_tailSlot_sharing = _array_RW0_rdata[211];
  assign io_r_resp_data_2_entry_tailSlot_valid = _array_RW0_rdata[210];
  assign io_r_resp_data_2_entry_tailSlot_lower = _array_RW0_rdata[209:190];
  assign io_r_resp_data_2_entry_tailSlot_tarStat = _array_RW0_rdata[189:188];
  assign io_r_resp_data_2_entry_pftAddr = _array_RW0_rdata[187:184];
  assign io_r_resp_data_2_entry_carry = _array_RW0_rdata[183];
  assign io_r_resp_data_2_entry_last_may_be_rvi_call = _array_RW0_rdata[182];
  assign io_r_resp_data_2_entry_always_taken_0 = _array_RW0_rdata[180];
  assign io_r_resp_data_2_entry_always_taken_1 = _array_RW0_rdata[181];
  assign io_r_resp_data_2_tag = _array_RW0_rdata[179:160];
  assign io_r_resp_data_3_entry_isCall = _array_RW0_rdata[319];
  assign io_r_resp_data_3_entry_isRet = _array_RW0_rdata[318];
  assign io_r_resp_data_3_entry_isJalr = _array_RW0_rdata[317];
  assign io_r_resp_data_3_entry_valid = _array_RW0_rdata[316];
  assign io_r_resp_data_3_entry_brSlots_0_offset = _array_RW0_rdata[315:312];
  assign io_r_resp_data_3_entry_brSlots_0_sharing = _array_RW0_rdata[311];
  assign io_r_resp_data_3_entry_brSlots_0_valid = _array_RW0_rdata[310];
  assign io_r_resp_data_3_entry_brSlots_0_lower = _array_RW0_rdata[309:298];
  assign io_r_resp_data_3_entry_brSlots_0_tarStat = _array_RW0_rdata[297:296];
  assign io_r_resp_data_3_entry_tailSlot_offset = _array_RW0_rdata[295:292];
  assign io_r_resp_data_3_entry_tailSlot_sharing = _array_RW0_rdata[291];
  assign io_r_resp_data_3_entry_tailSlot_valid = _array_RW0_rdata[290];
  assign io_r_resp_data_3_entry_tailSlot_lower = _array_RW0_rdata[289:270];
  assign io_r_resp_data_3_entry_tailSlot_tarStat = _array_RW0_rdata[269:268];
  assign io_r_resp_data_3_entry_pftAddr = _array_RW0_rdata[267:264];
  assign io_r_resp_data_3_entry_carry = _array_RW0_rdata[263];
  assign io_r_resp_data_3_entry_last_may_be_rvi_call = _array_RW0_rdata[262];
  assign io_r_resp_data_3_entry_always_taken_0 = _array_RW0_rdata[260];
  assign io_r_resp_data_3_entry_always_taken_1 = _array_RW0_rdata[261];
  assign io_r_resp_data_3_tag = _array_RW0_rdata[259:240];
endmodule

