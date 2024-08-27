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
module AtomicsUnit(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [8:0]  io_in_bits_uop_fuOpType,
  input         io_in_bits_uop_rfWen,
  input  [7:0]  io_in_bits_uop_pdest,
  input         io_in_bits_uop_robIdx_flag,
  input  [7:0]  io_in_bits_uop_robIdx_value,
  input         io_in_bits_uop_sqIdx_flag,
  input  [5:0]  io_in_bits_uop_sqIdx_value,
  input  [63:0] io_in_bits_src_0,
  input         io_storeDataIn_valid,
  input  [63:0] io_storeDataIn_bits_data,
  output        io_out_valid,
  output        io_out_bits_uop_exceptionVec_4,
  output        io_out_bits_uop_exceptionVec_5,
  output        io_out_bits_uop_exceptionVec_6,
  output        io_out_bits_uop_exceptionVec_7,
  output        io_out_bits_uop_exceptionVec_13,
  output        io_out_bits_uop_exceptionVec_15,
  output        io_out_bits_uop_exceptionVec_21,
  output        io_out_bits_uop_exceptionVec_23,
  output        io_out_bits_uop_rfWen,
  output [7:0]  io_out_bits_uop_pdest,
  output        io_out_bits_uop_robIdx_flag,
  output [7:0]  io_out_bits_uop_robIdx_value,
  output [63:0] io_out_bits_data,
  input         io_dcache_req_ready,
  output        io_dcache_req_valid,
  output [4:0]  io_dcache_req_bits_cmd,
  output [40:0] io_dcache_req_bits_vaddr,
  output [35:0] io_dcache_req_bits_addr,
  output [2:0]  io_dcache_req_bits_word_idx,
  output [63:0] io_dcache_req_bits_amo_data,
  output [7:0]  io_dcache_req_bits_amo_mask,
  input         io_dcache_resp_valid,
  input  [63:0] io_dcache_resp_bits_data,
  input         io_dcache_resp_bits_miss,
  input         io_dcache_resp_bits_replay,
  input         io_dcache_resp_bits_error,
  input         io_dcache_block_lr,
  output        io_dtlb_req_valid,
  output [40:0] io_dtlb_req_bits_vaddr,
  output [2:0]  io_dtlb_req_bits_cmd,
  output        io_dtlb_req_bits_debug_robIdx_flag,
  output [7:0]  io_dtlb_req_bits_debug_robIdx_value,
  input         io_dtlb_resp_valid,
  input  [35:0] io_dtlb_resp_bits_paddr_0,
  input  [40:0] io_dtlb_resp_bits_gpaddr_0,
  input         io_dtlb_resp_bits_miss,
  input         io_dtlb_resp_bits_excp_0_gpf_ld,
  input         io_dtlb_resp_bits_excp_0_gpf_st,
  input         io_dtlb_resp_bits_excp_0_pf_ld,
  input         io_dtlb_resp_bits_excp_0_pf_st,
  input         io_dtlb_resp_bits_excp_0_af_ld,
  input         io_dtlb_resp_bits_excp_0_af_st,
  input         io_pmpResp_ld,
  input         io_pmpResp_st,
  output        io_flush_sbuffer_valid,
  input         io_flush_sbuffer_empty,
  output        io_feedbackSlow_valid,
  output        io_feedbackSlow_bits_sqIdx_flag,
  output [5:0]  io_feedbackSlow_bits_sqIdx_value,
  input         io_redirect_valid,
  output        io_exceptionAddr_valid,
  output [40:0] io_exceptionAddr_bits_vaddr,
  output [40:0] io_exceptionAddr_bits_gpaddr,
  input         io_csrCtrl_cache_error_enable
);

  reg  [2:0]  state;
  reg         out_valid;
  reg         data_valid;
  reg  [8:0]  in_uop_fuOpType;
  reg         in_uop_rfWen;
  reg  [7:0]  in_uop_pdest;
  reg         in_uop_robIdx_flag;
  reg  [7:0]  in_uop_robIdx_value;
  reg  [63:0] in_src_0;
  reg  [63:0] in_src_1;
  reg         exceptionVec_4;
  reg         exceptionVec_5;
  reg         exceptionVec_6;
  reg         exceptionVec_7;
  reg         exceptionVec_13;
  reg         exceptionVec_15;
  reg         exceptionVec_21;
  reg         exceptionVec_23;
  reg         atom_override_xtval;
  reg         have_sent_first_tlb_req;
  wire        _resp_data_wire_T_50 = in_uop_fuOpType == 9'h2;
  wire        _resp_data_wire_T_61 = in_uop_fuOpType == 9'h3;
  wire        isLr = _resp_data_wire_T_50 | _resp_data_wire_T_61;
  reg  [35:0] paddr;
  reg  [40:0] gpaddr;
  reg  [63:0] resp_data;
  wire        io_in_ready_0 = state == 3'h0;
  wire        _GEN = io_in_ready_0 & io_in_valid;
  reg         io_feedbackSlow_valid_last_REG;
  reg         io_feedbackSlow_valid_last_REG_1;
  reg         io_feedbackSlow_bits_sqIdx_r_flag;
  reg  [5:0]  io_feedbackSlow_bits_sqIdx_r_value;
  wire        io_dtlb_req_valid_0 = state == 3'h1;
  wire        _GEN_0 = io_dtlb_resp_valid & have_sent_first_tlb_req;
  wire        _GEN_1 = io_dtlb_req_valid_0 & _GEN_0;
  wire [3:0]  _io_dcache_req_bits_cmd_T_53 =
    {in_uop_fuOpType == 9'hE,
     (_resp_data_wire_T_50 ? 3'h6 : 3'h0) | {3{in_uop_fuOpType == 9'h6}}
       | {in_uop_fuOpType == 9'hA, 2'h0}} | (in_uop_fuOpType == 9'h12 ? 4'h9 : 4'h0)
    | (in_uop_fuOpType == 9'h16 ? 4'hB : 4'h0) | (in_uop_fuOpType == 9'h1A ? 4'hA : 4'h0)
    | (in_uop_fuOpType == 9'h1E ? 4'hC : 4'h0) | (in_uop_fuOpType == 9'h22 ? 4'hD : 4'h0)
    | (in_uop_fuOpType == 9'h26 ? 4'hE : 4'h0) | {4{in_uop_fuOpType == 9'h2A}};
  wire [3:0]  _io_dcache_req_bits_cmd_T_64 =
    {_io_dcache_req_bits_cmd_T_53[3] | in_uop_fuOpType == 9'hF,
     _io_dcache_req_bits_cmd_T_53[2:0] | (_resp_data_wire_T_61 ? 3'h6 : 3'h0)
       | {3{in_uop_fuOpType == 9'h7}} | {in_uop_fuOpType == 9'hB, 2'h0}}
    | (in_uop_fuOpType == 9'h13 ? 4'h9 : 4'h0) | (in_uop_fuOpType == 9'h17 ? 4'hB : 4'h0)
    | (in_uop_fuOpType == 9'h1B ? 4'hA : 4'h0) | (in_uop_fuOpType == 9'h1F ? 4'hC : 4'h0)
    | (in_uop_fuOpType == 9'h23 ? 4'hD : 4'h0) | (in_uop_fuOpType == 9'h27 ? 4'hE : 4'h0)
    | {4{in_uop_fuOpType == 9'h2B}};
  wire [14:0] _io_dcache_req_bits_amo_mask_T_13 =
    {7'h0,
     {4'h0,
      {2'h0, {1'h0, ~(|(in_uop_fuOpType[1:0]))} | {2{in_uop_fuOpType[1:0] == 2'h1}}}
        | {4{in_uop_fuOpType[1:0] == 2'h2}}} | {8{&(in_uop_fuOpType[1:0])}}}
    << paddr[2:0];
  wire        io_dcache_req_valid_0 =
    state == 3'h4
    & (_io_dcache_req_bits_cmd_T_64 == 4'h6 ? ~io_dcache_block_lr : data_valid);
  reg  [63:0] dcache_resp_data;
  reg         dcache_resp_error;
  wire        _GEN_2 = state == 3'h5 & io_dcache_resp_valid;
  wire        _GEN_3 = state == 3'h6;
  wire        _GEN_4 = io_dtlb_req_valid_0 & _GEN_0 & ~io_dtlb_resp_bits_miss;
  wire        _GEN_5 = state == 3'h3;
  wire        _GEN_6 = io_dcache_req_ready & io_dcache_req_valid_0;
  wire        addrAligned =
    in_uop_fuOpType[1:0] == 2'h0 | in_uop_fuOpType[1:0] == 2'h1 & ~(in_src_0[0])
    | in_uop_fuOpType[1:0] == 2'h2 & in_src_0[1:0] == 2'h0 | (&(in_uop_fuOpType[1:0]))
    & in_src_0[2:0] == 3'h0;
  wire        _GEN_7 =
    io_dtlb_req_valid_0 & _GEN_0 & ~io_dtlb_resp_bits_miss & ~addrAligned;
  wire        _GEN_8 = state == 3'h2;
  wire        _GEN_9 =
    exceptionVec_15 | exceptionVec_13 | exceptionVec_23 | exceptionVec_21 | exceptionVec_7
    | exceptionVec_5 | io_pmpResp_st | io_pmpResp_ld;
  wire        _GEN_10 = _GEN_9 | _GEN_7;
  wire [2:0]  _GEN_11 = addrAligned ? 3'h2 : 3'h7;
  wire [2:0]  _GEN_12 = _GEN_9 ? 3'h7 : io_flush_sbuffer_empty ? 3'h4 : 3'h3;
  wire [2:0]  _GEN_13 = {_GEN_9, 2'h3};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      state <= 3'h0;
      out_valid <= 1'h0;
      data_valid <= 1'h0;
      exceptionVec_4 <= 1'h0;
      exceptionVec_5 <= 1'h0;
      exceptionVec_6 <= 1'h0;
      exceptionVec_7 <= 1'h0;
      exceptionVec_13 <= 1'h0;
      exceptionVec_15 <= 1'h0;
      exceptionVec_21 <= 1'h0;
      exceptionVec_23 <= 1'h0;
      atom_override_xtval <= 1'h0;
      have_sent_first_tlb_req <= 1'h0;
      io_feedbackSlow_valid_last_REG <= 1'h0;
      io_feedbackSlow_valid_last_REG_1 <= 1'h0;
    end
    else begin
      if (out_valid)
        state <= 3'h0;
      else if (_GEN_3)
        state <= 3'h7;
      else if (_GEN_2) begin
        if (io_dcache_resp_bits_miss) begin
          if (io_dcache_resp_bits_replay)
            state <= 3'h4;
          else if (_GEN_6)
            state <= 3'h5;
          else if (_GEN_5) begin
            if (io_flush_sbuffer_empty)
              state <= 3'h4;
            else if (_GEN_8)
              state <= _GEN_13;
            else if (_GEN_4)
              state <= _GEN_11;
            else if (_GEN)
              state <= 3'h1;
          end
          else if (_GEN_8)
            state <= _GEN_12;
          else if (_GEN_4)
            state <= _GEN_11;
          else if (_GEN)
            state <= 3'h1;
        end
        else
          state <= 3'h6;
      end
      else if (_GEN_6)
        state <= 3'h5;
      else if (_GEN_5) begin
        if (io_flush_sbuffer_empty)
          state <= 3'h4;
        else if (_GEN_8)
          state <= _GEN_13;
        else if (_GEN_4)
          state <= _GEN_11;
        else if (_GEN)
          state <= 3'h1;
      end
      else if (_GEN_8)
        state <= _GEN_12;
      else if (_GEN_4)
        state <= _GEN_11;
      else if (_GEN)
        state <= 3'h1;
      out_valid <=
        ~out_valid & (_GEN_3 | (_GEN_8 ? _GEN_10 | out_valid : _GEN_7 | out_valid));
      data_valid <= state != 3'h7 & (io_storeDataIn_valid | data_valid);
      if (_GEN_1) begin
        exceptionVec_4 <= ~addrAligned & isLr;
        exceptionVec_6 <= ~addrAligned & ~isLr;
        exceptionVec_13 <= io_dtlb_resp_bits_excp_0_pf_ld;
        exceptionVec_15 <= io_dtlb_resp_bits_excp_0_pf_st;
        exceptionVec_21 <= io_dtlb_resp_bits_excp_0_gpf_ld;
        exceptionVec_23 <= io_dtlb_resp_bits_excp_0_gpf_st;
      end
      if (_GEN_3 & dcache_resp_error & io_csrCtrl_cache_error_enable) begin
        exceptionVec_5 <= isLr;
        exceptionVec_7 <= ~isLr;
      end
      else if (_GEN_8) begin
        exceptionVec_5 <= exceptionVec_5 | io_pmpResp_ld & isLr;
        exceptionVec_7 <= exceptionVec_7 | io_pmpResp_st | io_pmpResp_ld & ~isLr;
      end
      else if (_GEN_1) begin
        exceptionVec_5 <= io_dtlb_resp_bits_excp_0_af_ld;
        exceptionVec_7 <= io_dtlb_resp_bits_excp_0_af_st;
      end
      atom_override_xtval <=
        ~io_redirect_valid
        & (_GEN_8 ? _GEN_10 | atom_override_xtval : _GEN_7 | atom_override_xtval);
      have_sent_first_tlb_req <= io_dtlb_req_valid_0 | ~_GEN & have_sent_first_tlb_req;
      io_feedbackSlow_valid_last_REG <= io_in_valid;
      io_feedbackSlow_valid_last_REG_1 <= io_feedbackSlow_valid_last_REG;
    end
  end // always @(posedge, posedge)
  wire [63:0] _rdataSel_T_17 = paddr[2:0] == 3'h0 ? dcache_resp_data : 64'h0;
  wire [55:0] _GEN_14 =
    _rdataSel_T_17[55:0] | (paddr[2:0] == 3'h1 ? dcache_resp_data[63:8] : 56'h0);
  wire [47:0] _GEN_15 =
    _GEN_14[47:0] | (paddr[2:0] == 3'h2 ? dcache_resp_data[63:16] : 48'h0);
  wire [39:0] _GEN_16 =
    _GEN_15[39:0] | (paddr[2:0] == 3'h3 ? dcache_resp_data[63:24] : 40'h0);
  wire [31:0] _GEN_17 =
    _GEN_16[31:0] | (paddr[2:0] == 3'h4 ? dcache_resp_data[63:32] : 32'h0);
  wire [23:0] _GEN_18 =
    _GEN_17[23:0] | (paddr[2:0] == 3'h5 ? dcache_resp_data[63:40] : 24'h0);
  wire [15:0] _GEN_19 =
    _GEN_18[15:0] | (paddr[2:0] == 3'h6 ? dcache_resp_data[63:48] : 16'h0);
  wire [7:0]  _GEN_20 = _GEN_19[7:0] | ((&(paddr[2:0])) ? dcache_resp_data[63:56] : 8'h0);
  wire [63:0] rdataSel =
    {_rdataSel_T_17[63:56],
     _GEN_14[55:48],
     _GEN_15[47:40],
     _GEN_16[39:32],
     _GEN_17[31:24],
     _GEN_18[23:16],
     _GEN_19[15:8],
     _GEN_20};
  always @(posedge clock) begin
    if (_GEN) begin
      in_uop_fuOpType <= io_in_bits_uop_fuOpType;
      in_uop_rfWen <= io_in_bits_uop_rfWen;
      in_uop_pdest <= io_in_bits_uop_pdest;
      in_uop_robIdx_flag <= io_in_bits_uop_robIdx_flag;
      in_uop_robIdx_value <= io_in_bits_uop_robIdx_value;
      in_src_0 <= io_in_bits_src_0;
    end
    if (io_storeDataIn_valid)
      in_src_1 <= io_storeDataIn_bits_data;
    if (_GEN_1) begin
      paddr <= io_dtlb_resp_bits_paddr_0;
      gpaddr <= io_dtlb_resp_bits_gpaddr_0;
    end
    if (_GEN_3)
      resp_data <=
        (_resp_data_wire_T_50
           ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
           : 64'h0) | (in_uop_fuOpType == 9'h6 ? dcache_resp_data : 64'h0)
        | (in_uop_fuOpType == 9'hA
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0)
        | (in_uop_fuOpType == 9'hE
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0)
        | (in_uop_fuOpType == 9'h12
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0)
        | (in_uop_fuOpType == 9'h16
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0)
        | (in_uop_fuOpType == 9'h1A
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0)
        | (in_uop_fuOpType == 9'h1E
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0)
        | (in_uop_fuOpType == 9'h22
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0)
        | (in_uop_fuOpType == 9'h26
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0)
        | (in_uop_fuOpType == 9'h2A
             ? {{32{_GEN_17[31]}}, _GEN_17[31:24], _GEN_18[23:16], _GEN_19[15:8], _GEN_20}
             : 64'h0) | (_resp_data_wire_T_61 ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'h7 ? dcache_resp_data : 64'h0)
        | (in_uop_fuOpType == 9'hB ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'hF ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'h13 ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'h17 ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'h1B ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'h1F ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'h23 ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'h27 ? rdataSel : 64'h0)
        | (in_uop_fuOpType == 9'h2B ? rdataSel : 64'h0);
    if (io_in_valid) begin
      io_feedbackSlow_bits_sqIdx_r_flag <= io_in_bits_uop_sqIdx_flag;
      io_feedbackSlow_bits_sqIdx_r_value <= io_in_bits_uop_sqIdx_value;
    end
    if (~_GEN_2 | io_dcache_resp_bits_miss) begin
    end
    else begin
      dcache_resp_data <= io_dcache_resp_bits_data;
      dcache_resp_error <= io_dcache_resp_bits_error;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:61];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [5:0] i = 6'h0; i < 6'h3E; i += 6'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        state = _RANDOM[6'h0][2:0];
        out_valid = _RANDOM[6'h0][3];
        data_valid = _RANDOM[6'h0][4];
        in_uop_fuOpType = _RANDOM[6'h6][25:17];
        in_uop_rfWen = _RANDOM[6'h6][26];
        in_uop_pdest = _RANDOM[6'h12][13:6];
        in_uop_robIdx_flag = _RANDOM[6'h12][14];
        in_uop_robIdx_value = _RANDOM[6'h12][22:15];
        in_src_0 = {_RANDOM[6'h26][31:6], _RANDOM[6'h27], _RANDOM[6'h28][5:0]};
        in_src_1 = {_RANDOM[6'h28][31:6], _RANDOM[6'h29], _RANDOM[6'h2A][5:0]};
        exceptionVec_4 = _RANDOM[6'h2C][15];
        exceptionVec_5 = _RANDOM[6'h2C][16];
        exceptionVec_6 = _RANDOM[6'h2C][17];
        exceptionVec_7 = _RANDOM[6'h2C][18];
        exceptionVec_13 = _RANDOM[6'h2C][24];
        exceptionVec_15 = _RANDOM[6'h2C][26];
        exceptionVec_21 = _RANDOM[6'h2D][0];
        exceptionVec_23 = _RANDOM[6'h2D][2];
        atom_override_xtval = _RANDOM[6'h2D][3];
        have_sent_first_tlb_req = _RANDOM[6'h2D][4];
        paddr = {_RANDOM[6'h2D][31:5], _RANDOM[6'h2E][8:0]};
        gpaddr = {_RANDOM[6'h2E][31:9], _RANDOM[6'h2F][17:0]};
        resp_data = {_RANDOM[6'h2F][31:19], _RANDOM[6'h30], _RANDOM[6'h31][18:0]};
        io_feedbackSlow_valid_last_REG = _RANDOM[6'h36][4];
        io_feedbackSlow_valid_last_REG_1 = _RANDOM[6'h36][5];
        io_feedbackSlow_bits_sqIdx_r_flag = _RANDOM[6'h36][15];
        io_feedbackSlow_bits_sqIdx_r_value = _RANDOM[6'h36][21:16];
        dcache_resp_data = {_RANDOM[6'h3A][31:30], _RANDOM[6'h3B], _RANDOM[6'h3C][29:0]};
        dcache_resp_error = _RANDOM[6'h3D][4];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        state = 3'h0;
        out_valid = 1'h0;
        data_valid = 1'h0;
        exceptionVec_4 = 1'h0;
        exceptionVec_5 = 1'h0;
        exceptionVec_6 = 1'h0;
        exceptionVec_7 = 1'h0;
        exceptionVec_13 = 1'h0;
        exceptionVec_15 = 1'h0;
        exceptionVec_21 = 1'h0;
        exceptionVec_23 = 1'h0;
        atom_override_xtval = 1'h0;
        have_sent_first_tlb_req = 1'h0;
        io_feedbackSlow_valid_last_REG = 1'h0;
        io_feedbackSlow_valid_last_REG_1 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = io_in_ready_0;
  assign io_out_valid = out_valid;
  assign io_out_bits_uop_exceptionVec_4 = exceptionVec_4;
  assign io_out_bits_uop_exceptionVec_5 = exceptionVec_5;
  assign io_out_bits_uop_exceptionVec_6 = exceptionVec_6;
  assign io_out_bits_uop_exceptionVec_7 = exceptionVec_7;
  assign io_out_bits_uop_exceptionVec_13 = exceptionVec_13;
  assign io_out_bits_uop_exceptionVec_15 = exceptionVec_15;
  assign io_out_bits_uop_exceptionVec_21 = exceptionVec_21;
  assign io_out_bits_uop_exceptionVec_23 = exceptionVec_23;
  assign io_out_bits_uop_rfWen = in_uop_rfWen;
  assign io_out_bits_uop_pdest = in_uop_pdest;
  assign io_out_bits_uop_robIdx_flag = in_uop_robIdx_flag;
  assign io_out_bits_uop_robIdx_value = in_uop_robIdx_value;
  assign io_out_bits_data = resp_data;
  assign io_dcache_req_valid = io_dcache_req_valid_0;
  assign io_dcache_req_bits_cmd = {1'h0, _io_dcache_req_bits_cmd_T_64};
  assign io_dcache_req_bits_vaddr = {in_src_0[40:6], 6'h0};
  assign io_dcache_req_bits_addr = {paddr[35:6], 6'h0};
  assign io_dcache_req_bits_word_idx = paddr[5:3];
  assign io_dcache_req_bits_amo_data =
    ((|(in_uop_fuOpType[1:0])) ? 64'h0 : {2{{2{{2{in_src_1[7:0]}}}}}})
    | (in_uop_fuOpType[1:0] == 2'h1 ? {2{{2{in_src_1[15:0]}}}} : 64'h0)
    | (in_uop_fuOpType[1:0] == 2'h2 ? {2{in_src_1[31:0]}} : 64'h0)
    | ((&(in_uop_fuOpType[1:0])) ? in_src_1 : 64'h0);
  assign io_dcache_req_bits_amo_mask = _io_dcache_req_bits_amo_mask_T_13[7:0];
  assign io_dtlb_req_valid = io_dtlb_req_valid_0;
  assign io_dtlb_req_bits_vaddr = in_src_0[40:0];
  assign io_dtlb_req_bits_cmd = {2'h2, ~isLr};
  assign io_dtlb_req_bits_debug_robIdx_flag = in_uop_robIdx_flag;
  assign io_dtlb_req_bits_debug_robIdx_value = in_uop_robIdx_value;
  assign io_flush_sbuffer_valid = io_dtlb_req_valid_0 & ~io_flush_sbuffer_empty;
  assign io_feedbackSlow_valid = io_feedbackSlow_valid_last_REG_1;
  assign io_feedbackSlow_bits_sqIdx_flag = io_feedbackSlow_bits_sqIdx_r_flag;
  assign io_feedbackSlow_bits_sqIdx_value = io_feedbackSlow_bits_sqIdx_r_value;
  assign io_exceptionAddr_valid = atom_override_xtval;
  assign io_exceptionAddr_bits_vaddr = in_src_0[40:0];
  assign io_exceptionAddr_bits_gpaddr = gpaddr;
endmodule

