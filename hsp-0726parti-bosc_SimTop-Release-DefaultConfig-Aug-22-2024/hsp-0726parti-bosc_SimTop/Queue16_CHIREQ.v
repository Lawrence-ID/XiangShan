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
module Queue16_CHIREQ(
  input         clock,
  input         reset,
  input         io_enq_valid,
  input  [6:0]  io_enq_bits_tgtID,
  input  [6:0]  io_enq_bits_srcID,
  input  [7:0]  io_enq_bits_txnID,
  input  [5:0]  io_enq_bits_opcode,
  input  [2:0]  io_enq_bits_size,
  input  [47:0] io_enq_bits_addr,
  input         io_enq_bits_allowRetry,
  input  [3:0]  io_enq_bits_pCrdType,
  input         io_enq_bits_memAttr_allocate,
  input         io_enq_bits_memAttr_cacheable,
  input         io_enq_bits_memAttr_device,
  input         io_enq_bits_memAttr_ewa,
  input         io_enq_bits_snpAttr,
  input         io_enq_bits_expCompAck,
  input         io_deq_ready,
  output        io_deq_valid,
  output [3:0]  io_deq_bits_qos,
  output [7:0]  io_deq_bits_txnID,
  output [6:0]  io_deq_bits_returnNID,
  output        io_deq_bits_stashNIDValid,
  output [7:0]  io_deq_bits_returnTxnID,
  output [5:0]  io_deq_bits_opcode,
  output [47:0] io_deq_bits_addr,
  output        io_deq_bits_ns,
  output        io_deq_bits_likelyshared,
  output        io_deq_bits_allowRetry,
  output [1:0]  io_deq_bits_order,
  output [3:0]  io_deq_bits_pCrdType,
  output        io_deq_bits_memAttr_allocate,
  output        io_deq_bits_memAttr_cacheable,
  output        io_deq_bits_memAttr_device,
  output        io_deq_bits_memAttr_ewa,
  output        io_deq_bits_snpAttr,
  output [4:0]  io_deq_bits_lpID,
  output        io_deq_bits_snoopMe,
  output        io_deq_bits_expCompAck,
  output        io_deq_bits_traceTag,
  output [3:0]  io_deq_bits_rsvdc,
  output [4:0]  io_count
);

  wire         io_enq_ready;
  wire [107:0] _ram_ext_R0_data;
  reg  [3:0]   enq_ptr_value;
  reg  [3:0]   deq_ptr_value;
  reg          maybe_full;
  wire         ptr_match = enq_ptr_value == deq_ptr_value;
  wire         empty = ptr_match & ~maybe_full;
  wire         do_enq = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~(ptr_match & maybe_full);
  wire         do_deq = io_deq_ready & ~empty;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      enq_ptr_value <= 4'h0;
      deq_ptr_value <= 4'h0;
      maybe_full <= 1'h0;
    end
    else begin
      if (do_enq)
        enq_ptr_value <= 4'(enq_ptr_value + 4'h1);
      if (do_deq)
        deq_ptr_value <= 4'(deq_ptr_value + 4'h1);
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
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
        enq_ptr_value = _RANDOM[/*Zero width*/ 1'b0][3:0];
        deq_ptr_value = _RANDOM[/*Zero width*/ 1'b0][7:4];
        maybe_full = _RANDOM[/*Zero width*/ 1'b0][8];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        enq_ptr_value = 4'h0;
        deq_ptr_value = 4'h0;
        maybe_full = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ram_16x108 ram_ext (
    .R0_addr (deq_ptr_value),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (enq_ptr_value),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data
      ({5'h0,
        io_enq_bits_expCompAck,
        6'h0,
        io_enq_bits_snpAttr,
        io_enq_bits_memAttr_ewa,
        io_enq_bits_memAttr_device,
        io_enq_bits_memAttr_cacheable,
        io_enq_bits_memAttr_allocate,
        io_enq_bits_pCrdType,
        2'h0,
        io_enq_bits_allowRetry,
        2'h0,
        io_enq_bits_addr,
        io_enq_bits_opcode,
        16'h0,
        io_enq_bits_txnID,
        4'h0})
  );
  assign io_deq_valid = ~empty;
  assign io_deq_bits_qos = _ram_ext_R0_data[3:0];
  assign io_deq_bits_txnID = _ram_ext_R0_data[11:4];
  assign io_deq_bits_returnNID = _ram_ext_R0_data[18:12];
  assign io_deq_bits_stashNIDValid = _ram_ext_R0_data[19];
  assign io_deq_bits_returnTxnID = _ram_ext_R0_data[27:20];
  assign io_deq_bits_opcode = _ram_ext_R0_data[33:28];
  assign io_deq_bits_addr = _ram_ext_R0_data[81:34];
  assign io_deq_bits_ns = _ram_ext_R0_data[82];
  assign io_deq_bits_likelyshared = _ram_ext_R0_data[83];
  assign io_deq_bits_allowRetry = _ram_ext_R0_data[84];
  assign io_deq_bits_order = _ram_ext_R0_data[86:85];
  assign io_deq_bits_pCrdType = _ram_ext_R0_data[90:87];
  assign io_deq_bits_memAttr_allocate = _ram_ext_R0_data[91];
  assign io_deq_bits_memAttr_cacheable = _ram_ext_R0_data[92];
  assign io_deq_bits_memAttr_device = _ram_ext_R0_data[93];
  assign io_deq_bits_memAttr_ewa = _ram_ext_R0_data[94];
  assign io_deq_bits_snpAttr = _ram_ext_R0_data[95];
  assign io_deq_bits_lpID = _ram_ext_R0_data[100:96];
  assign io_deq_bits_snoopMe = _ram_ext_R0_data[101];
  assign io_deq_bits_expCompAck = _ram_ext_R0_data[102];
  assign io_deq_bits_traceTag = _ram_ext_R0_data[103];
  assign io_deq_bits_rsvdc = _ram_ext_R0_data[107:104];
  assign io_count = {maybe_full & ptr_match, 4'(enq_ptr_value - deq_ptr_value)};
endmodule

