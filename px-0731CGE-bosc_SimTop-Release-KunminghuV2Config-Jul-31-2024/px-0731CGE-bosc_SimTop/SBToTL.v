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
module SBToTL(
  input          clock,
  input          reset,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
  output [36:0]  auto_out_a_bits_address,
  output [7:0]   auto_out_a_bits_mask,
  output [63:0]  auto_out_a_bits_data,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [2:0]   auto_out_d_bits_size,
  input          auto_out_d_bits_sink,
  input          auto_out_d_bits_denied,
  input  [63:0]  auto_out_d_bits_data,
  input          auto_out_d_bits_corrupt,
  input          io_rdEn,
  input          io_wrEn,
  input  [127:0] io_addrIn,
  input  [127:0] io_dataIn,
  input  [2:0]   io_sizeIn,
  output         io_rdLegal,
  output         io_wrLegal,
  output         io_rdDone,
  output         io_wrDone,
  output         io_respError,
  output [7:0]   io_dataOut,
  output         io_rdLoad_0,
  output         io_rdLoad_1,
  output         io_rdLoad_2,
  output         io_rdLoad_3,
  output         io_rdLoad_4,
  output         io_rdLoad_5,
  output         io_rdLoad_6,
  output         io_rdLoad_7,
  output [2:0]   io_sbStateOut
);

  wire            _d_q_io_deq_valid;
  wire            _d_q_io_deq_bits_denied;
  wire [63:0]     _d_q_io_deq_bits_data;
  wire            _d_q_io_deq_bits_corrupt;
  reg  [2:0]      sbState;
  wire            _rdTxValid_T = sbState == 3'h3;
  wire            _wrTxValid_T = sbState == 3'h4;
  wire            _q_io_deq_ready_T_2 = _rdTxValid_T | _wrTxValid_T;
  reg  [3:0]      counter;
  wire [7:0][7:0] _GEN =
    {{io_dataIn[63:56]},
     {io_dataIn[55:48]},
     {io_dataIn[47:40]},
     {io_dataIn[39:32]},
     {io_dataIn[31:24]},
     {io_dataIn[23:16]},
     {io_dataIn[15:8]},
     {io_dataIn[7:0]}};
  wire [99:0]     _GEN_0 = {io_addrIn[127:30], io_addrIn[29:28] ^ 2'h2};
  wire [100:0]    _GEN_1 = {io_addrIn[127:30], io_addrIn[29:27] ^ 3'h6};
  wire [111:0]    _GEN_2 = {io_addrIn[127:30], io_addrIn[29:16] ^ 14'h3800};
  wire [114:0]    _GEN_3 = {io_addrIn[127:30], io_addrIn[29:13] ^ 17'h1C010};
  wire [115:0]    _GEN_4 = {io_addrIn[127:30], io_addrIn[29:12] ^ 18'h3A000};
  wire [101:0]    _GEN_5 = {io_addrIn[127:30], ~(io_addrIn[29:26])};
  wire [97:0]     _GEN_6 = {io_addrIn[127:31], ~(io_addrIn[30])};
  wire [91:0]     _GEN_7 = {io_addrIn[127:37], ~(io_addrIn[36])};
  wire            io_rdLegal_0 =
    ~(|(io_addrIn[127:29])) | ~(|_GEN_0) | ~(|_GEN_1) | ~(|_GEN_2) | ~(|_GEN_3)
    | ~(|_GEN_4) | ~(|_GEN_5) | ~(|_GEN_6) | ~(|_GEN_7);
  wire            io_wrLegal_0 =
    ~(|(io_addrIn[127:29])) | ~(|_GEN_0) | ~(|_GEN_1) | ~(|_GEN_2) | ~(|_GEN_3)
    | ~(|_GEN_4) | ~(|_GEN_5) | ~(|_GEN_6) | ~(|_GEN_7);
  wire [36:0]     _requestAddr_T = 37'(io_addrIn[36:0] + {33'h0, counter});
  wire [46:0]     _mask_T_3 = 47'h10000 << _requestAddr_T[3:0];
  wire [15:0]     _mask_T_5 = 16'h1 << _requestAddr_T[3:0];
  wire            _nodeOut_a_valid_T = sbState == 3'h1;
  wire            wrTxValid = _wrTxValid_T & _d_q_io_deq_valid & _q_io_deq_ready_T_2;
  wire            rdTxValid = _rdTxValid_T & _d_q_io_deq_valid & _q_io_deq_ready_T_2;
  wire            txLast = {4'h0, counter} == 8'((8'h1 << io_sizeIn) - 8'h1);
  wire [63:0]     _io_dataOut_T_2 =
    _d_q_io_deq_bits_data >> {56'h0, _requestAddr_T[4:0], 3'h0};
  wire            nodeOut_a_valid = _nodeOut_a_valid_T | sbState == 3'h2;
  wire            _counter_T_2 = wrTxValid | rdTxValid;
  wire [7:0][2:0] _GEN_8 =
    {{sbState},
     {sbState},
     {sbState},
     {wrTxValid & txLast ? 3'h0 : wrTxValid ? 3'h2 : sbState},
     {rdTxValid & txLast ? 3'h0 : rdTxValid ? 3'h1 : sbState},
     {nodeOut_a_valid & auto_out_a_ready ? 3'h4 : sbState},
     {nodeOut_a_valid & auto_out_a_ready ? 3'h3 : sbState},
     {io_rdEn & io_rdLegal_0 ? 3'h1 : io_wrEn & io_wrLegal_0 ? 3'h2 : sbState}};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      sbState <= 3'h0;
      counter <= 4'h0;
    end
    else begin
      sbState <= _GEN_8[sbState];
      if (_counter_T_2 & txLast)
        counter <= 4'h0;
      else if (_counter_T_2)
        counter <= 4'(counter + 4'h1);
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
        sbState = _RANDOM[/*Zero width*/ 1'b0][2:0];
        counter = _RANDOM[/*Zero width*/ 1'b0][6:3];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        sbState = 3'h0;
        counter = 4'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  Queue2_TLBundleD_2 d_q (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (auto_out_d_ready),
    .io_enq_valid        (auto_out_d_valid),
    .io_enq_bits_opcode  (auto_out_d_bits_opcode),
    .io_enq_bits_param   (auto_out_d_bits_param),
    .io_enq_bits_size    (auto_out_d_bits_size),
    .io_enq_bits_sink    (auto_out_d_bits_sink),
    .io_enq_bits_denied  (auto_out_d_bits_denied),
    .io_enq_bits_data    (auto_out_d_bits_data),
    .io_enq_bits_corrupt (auto_out_d_bits_corrupt),
    .io_deq_ready        (_q_io_deq_ready_T_2),
    .io_deq_valid        (_d_q_io_deq_valid),
    .io_deq_bits_denied  (_d_q_io_deq_bits_denied),
    .io_deq_bits_data    (_d_q_io_deq_bits_data),
    .io_deq_bits_corrupt (_d_q_io_deq_bits_corrupt)
  );
  assign auto_out_a_valid = nodeOut_a_valid;
  assign auto_out_a_bits_opcode = _nodeOut_a_valid_T ? 3'h4 : 3'h1;
  assign auto_out_a_bits_address =
    ({37{_nodeOut_a_valid_T}} | 37'h1FFFFFFFE0) & _requestAddr_T;
  assign auto_out_a_bits_mask =
    _nodeOut_a_valid_T ? 8'hFF : _requestAddr_T[4] ? _mask_T_3[7:0] : _mask_T_5[7:0];
  assign auto_out_a_bits_data =
    _nodeOut_a_valid_T ? 64'h0 : {2{{2{{2{_GEN[counter[2:0]]}}}}}};
  assign io_rdLegal = io_rdLegal_0;
  assign io_wrLegal = io_wrLegal_0;
  assign io_rdDone = rdTxValid & txLast;
  assign io_wrDone = wrTxValid & txLast;
  assign io_respError = _d_q_io_deq_bits_denied | _d_q_io_deq_bits_corrupt;
  assign io_dataOut = _io_dataOut_T_2[7:0];
  assign io_rdLoad_0 = rdTxValid & counter == 4'h0;
  assign io_rdLoad_1 = rdTxValid & counter == 4'h1;
  assign io_rdLoad_2 = rdTxValid & counter == 4'h2;
  assign io_rdLoad_3 = rdTxValid & counter == 4'h3;
  assign io_rdLoad_4 = rdTxValid & counter == 4'h4;
  assign io_rdLoad_5 = rdTxValid & counter == 4'h5;
  assign io_rdLoad_6 = rdTxValid & counter == 4'h6;
  assign io_rdLoad_7 = rdTxValid & counter == 4'h7;
  assign io_sbStateOut = sbState;
endmodule

