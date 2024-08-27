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
module SRAMTemplate_136(
  input         clock,
  input         io_r_req_valid,
  input  [4:0]  io_r_req_bits_setIdx,
  output [1:0]  io_r_resp_data_0_hist_0,
  output [1:0]  io_r_resp_data_0_hist_1,
  output [1:0]  io_r_resp_data_0_hist_2,
  output [1:0]  io_r_resp_data_0_hist_3,
  output [1:0]  io_r_resp_data_0_hist_4,
  output [1:0]  io_r_resp_data_0_hist_5,
  output [1:0]  io_r_resp_data_0_hist_6,
  output [1:0]  io_r_resp_data_0_hist_7,
  output [1:0]  io_r_resp_data_0_hist_8,
  output [1:0]  io_r_resp_data_0_hist_9,
  output [1:0]  io_r_resp_data_0_hist_10,
  output [1:0]  io_r_resp_data_0_hist_11,
  output [1:0]  io_r_resp_data_0_hist_12,
  output [1:0]  io_r_resp_data_0_hist_13,
  output [1:0]  io_r_resp_data_0_hist_14,
  output [1:0]  io_r_resp_data_0_hist_15,
  output [1:0]  io_r_resp_data_0_hist_16,
  output [1:0]  io_r_resp_data_0_hist_17,
  output [1:0]  io_r_resp_data_0_hist_18,
  output [1:0]  io_r_resp_data_0_hist_19,
  output [1:0]  io_r_resp_data_0_hist_20,
  output [1:0]  io_r_resp_data_0_hist_21,
  output [1:0]  io_r_resp_data_0_hist_22,
  output [1:0]  io_r_resp_data_0_hist_23,
  output [1:0]  io_r_resp_data_0_hist_24,
  output [1:0]  io_r_resp_data_0_hist_25,
  output [1:0]  io_r_resp_data_0_hist_26,
  output [1:0]  io_r_resp_data_0_hist_27,
  output [1:0]  io_r_resp_data_0_hist_28,
  output [1:0]  io_r_resp_data_0_hist_29,
  output [12:0] io_r_resp_data_0_tag,
  output [1:0]  io_r_resp_data_1_hist_0,
  output [1:0]  io_r_resp_data_1_hist_1,
  output [1:0]  io_r_resp_data_1_hist_2,
  output [1:0]  io_r_resp_data_1_hist_3,
  output [1:0]  io_r_resp_data_1_hist_4,
  output [1:0]  io_r_resp_data_1_hist_5,
  output [1:0]  io_r_resp_data_1_hist_6,
  output [1:0]  io_r_resp_data_1_hist_7,
  output [1:0]  io_r_resp_data_1_hist_8,
  output [1:0]  io_r_resp_data_1_hist_9,
  output [1:0]  io_r_resp_data_1_hist_10,
  output [1:0]  io_r_resp_data_1_hist_11,
  output [1:0]  io_r_resp_data_1_hist_12,
  output [1:0]  io_r_resp_data_1_hist_13,
  output [1:0]  io_r_resp_data_1_hist_14,
  output [1:0]  io_r_resp_data_1_hist_15,
  output [1:0]  io_r_resp_data_1_hist_16,
  output [1:0]  io_r_resp_data_1_hist_17,
  output [1:0]  io_r_resp_data_1_hist_18,
  output [1:0]  io_r_resp_data_1_hist_19,
  output [1:0]  io_r_resp_data_1_hist_20,
  output [1:0]  io_r_resp_data_1_hist_21,
  output [1:0]  io_r_resp_data_1_hist_22,
  output [1:0]  io_r_resp_data_1_hist_23,
  output [1:0]  io_r_resp_data_1_hist_24,
  output [1:0]  io_r_resp_data_1_hist_25,
  output [1:0]  io_r_resp_data_1_hist_26,
  output [1:0]  io_r_resp_data_1_hist_27,
  output [1:0]  io_r_resp_data_1_hist_28,
  output [1:0]  io_r_resp_data_1_hist_29,
  output [12:0] io_r_resp_data_1_tag,
  input         io_w_req_valid,
  input  [4:0]  io_w_req_bits_setIdx,
  input  [1:0]  io_w_req_bits_data_0_hist_0,
  input  [1:0]  io_w_req_bits_data_0_hist_1,
  input  [1:0]  io_w_req_bits_data_0_hist_2,
  input  [1:0]  io_w_req_bits_data_0_hist_3,
  input  [1:0]  io_w_req_bits_data_0_hist_4,
  input  [1:0]  io_w_req_bits_data_0_hist_5,
  input  [1:0]  io_w_req_bits_data_0_hist_6,
  input  [1:0]  io_w_req_bits_data_0_hist_7,
  input  [1:0]  io_w_req_bits_data_0_hist_8,
  input  [1:0]  io_w_req_bits_data_0_hist_9,
  input  [1:0]  io_w_req_bits_data_0_hist_10,
  input  [1:0]  io_w_req_bits_data_0_hist_11,
  input  [1:0]  io_w_req_bits_data_0_hist_12,
  input  [1:0]  io_w_req_bits_data_0_hist_13,
  input  [1:0]  io_w_req_bits_data_0_hist_14,
  input  [1:0]  io_w_req_bits_data_0_hist_15,
  input  [1:0]  io_w_req_bits_data_0_hist_16,
  input  [1:0]  io_w_req_bits_data_0_hist_17,
  input  [1:0]  io_w_req_bits_data_0_hist_18,
  input  [1:0]  io_w_req_bits_data_0_hist_19,
  input  [1:0]  io_w_req_bits_data_0_hist_20,
  input  [1:0]  io_w_req_bits_data_0_hist_21,
  input  [1:0]  io_w_req_bits_data_0_hist_22,
  input  [1:0]  io_w_req_bits_data_0_hist_23,
  input  [1:0]  io_w_req_bits_data_0_hist_24,
  input  [1:0]  io_w_req_bits_data_0_hist_25,
  input  [1:0]  io_w_req_bits_data_0_hist_26,
  input  [1:0]  io_w_req_bits_data_0_hist_27,
  input  [1:0]  io_w_req_bits_data_0_hist_28,
  input  [1:0]  io_w_req_bits_data_0_hist_29,
  input  [12:0] io_w_req_bits_data_0_tag,
  input         io_w_req_bits_data_0_decr_mode,
  input  [1:0]  io_w_req_bits_data_1_hist_0,
  input  [1:0]  io_w_req_bits_data_1_hist_1,
  input  [1:0]  io_w_req_bits_data_1_hist_2,
  input  [1:0]  io_w_req_bits_data_1_hist_3,
  input  [1:0]  io_w_req_bits_data_1_hist_4,
  input  [1:0]  io_w_req_bits_data_1_hist_5,
  input  [1:0]  io_w_req_bits_data_1_hist_6,
  input  [1:0]  io_w_req_bits_data_1_hist_7,
  input  [1:0]  io_w_req_bits_data_1_hist_8,
  input  [1:0]  io_w_req_bits_data_1_hist_9,
  input  [1:0]  io_w_req_bits_data_1_hist_10,
  input  [1:0]  io_w_req_bits_data_1_hist_11,
  input  [1:0]  io_w_req_bits_data_1_hist_12,
  input  [1:0]  io_w_req_bits_data_1_hist_13,
  input  [1:0]  io_w_req_bits_data_1_hist_14,
  input  [1:0]  io_w_req_bits_data_1_hist_15,
  input  [1:0]  io_w_req_bits_data_1_hist_16,
  input  [1:0]  io_w_req_bits_data_1_hist_17,
  input  [1:0]  io_w_req_bits_data_1_hist_18,
  input  [1:0]  io_w_req_bits_data_1_hist_19,
  input  [1:0]  io_w_req_bits_data_1_hist_20,
  input  [1:0]  io_w_req_bits_data_1_hist_21,
  input  [1:0]  io_w_req_bits_data_1_hist_22,
  input  [1:0]  io_w_req_bits_data_1_hist_23,
  input  [1:0]  io_w_req_bits_data_1_hist_24,
  input  [1:0]  io_w_req_bits_data_1_hist_25,
  input  [1:0]  io_w_req_bits_data_1_hist_26,
  input  [1:0]  io_w_req_bits_data_1_hist_27,
  input  [1:0]  io_w_req_bits_data_1_hist_28,
  input  [1:0]  io_w_req_bits_data_1_hist_29,
  input  [12:0] io_w_req_bits_data_1_tag,
  input         io_w_req_bits_data_1_decr_mode,
  input  [1:0]  io_w_req_bits_waymask
);

  wire         realRen;
  wire [147:0] _array_RW0_rdata;
  assign realRen = io_r_req_valid & ~io_w_req_valid;
  array_11 array (
    .RW0_addr  (io_w_req_valid ? io_w_req_bits_setIdx : io_r_req_bits_setIdx),
    .RW0_en    (realRen | io_w_req_valid),
    .RW0_clk   (clock),
    .RW0_wmode (io_w_req_valid),
    .RW0_wdata
      ({io_w_req_bits_data_1_hist_29,
        io_w_req_bits_data_1_hist_28,
        io_w_req_bits_data_1_hist_27,
        io_w_req_bits_data_1_hist_26,
        io_w_req_bits_data_1_hist_25,
        io_w_req_bits_data_1_hist_24,
        io_w_req_bits_data_1_hist_23,
        io_w_req_bits_data_1_hist_22,
        io_w_req_bits_data_1_hist_21,
        io_w_req_bits_data_1_hist_20,
        io_w_req_bits_data_1_hist_19,
        io_w_req_bits_data_1_hist_18,
        io_w_req_bits_data_1_hist_17,
        io_w_req_bits_data_1_hist_16,
        io_w_req_bits_data_1_hist_15,
        io_w_req_bits_data_1_hist_14,
        io_w_req_bits_data_1_hist_13,
        io_w_req_bits_data_1_hist_12,
        io_w_req_bits_data_1_hist_11,
        io_w_req_bits_data_1_hist_10,
        io_w_req_bits_data_1_hist_9,
        io_w_req_bits_data_1_hist_8,
        io_w_req_bits_data_1_hist_7,
        io_w_req_bits_data_1_hist_6,
        io_w_req_bits_data_1_hist_5,
        io_w_req_bits_data_1_hist_4,
        io_w_req_bits_data_1_hist_3,
        io_w_req_bits_data_1_hist_2,
        io_w_req_bits_data_1_hist_1,
        io_w_req_bits_data_1_hist_0,
        io_w_req_bits_data_1_tag,
        io_w_req_bits_data_1_decr_mode,
        io_w_req_bits_data_0_hist_29,
        io_w_req_bits_data_0_hist_28,
        io_w_req_bits_data_0_hist_27,
        io_w_req_bits_data_0_hist_26,
        io_w_req_bits_data_0_hist_25,
        io_w_req_bits_data_0_hist_24,
        io_w_req_bits_data_0_hist_23,
        io_w_req_bits_data_0_hist_22,
        io_w_req_bits_data_0_hist_21,
        io_w_req_bits_data_0_hist_20,
        io_w_req_bits_data_0_hist_19,
        io_w_req_bits_data_0_hist_18,
        io_w_req_bits_data_0_hist_17,
        io_w_req_bits_data_0_hist_16,
        io_w_req_bits_data_0_hist_15,
        io_w_req_bits_data_0_hist_14,
        io_w_req_bits_data_0_hist_13,
        io_w_req_bits_data_0_hist_12,
        io_w_req_bits_data_0_hist_11,
        io_w_req_bits_data_0_hist_10,
        io_w_req_bits_data_0_hist_9,
        io_w_req_bits_data_0_hist_8,
        io_w_req_bits_data_0_hist_7,
        io_w_req_bits_data_0_hist_6,
        io_w_req_bits_data_0_hist_5,
        io_w_req_bits_data_0_hist_4,
        io_w_req_bits_data_0_hist_3,
        io_w_req_bits_data_0_hist_2,
        io_w_req_bits_data_0_hist_1,
        io_w_req_bits_data_0_hist_0,
        io_w_req_bits_data_0_tag,
        io_w_req_bits_data_0_decr_mode}),
    .RW0_rdata (_array_RW0_rdata),
    .RW0_wmask (io_w_req_bits_waymask)
  );
  assign io_r_resp_data_0_hist_0 = _array_RW0_rdata[15:14];
  assign io_r_resp_data_0_hist_1 = _array_RW0_rdata[17:16];
  assign io_r_resp_data_0_hist_2 = _array_RW0_rdata[19:18];
  assign io_r_resp_data_0_hist_3 = _array_RW0_rdata[21:20];
  assign io_r_resp_data_0_hist_4 = _array_RW0_rdata[23:22];
  assign io_r_resp_data_0_hist_5 = _array_RW0_rdata[25:24];
  assign io_r_resp_data_0_hist_6 = _array_RW0_rdata[27:26];
  assign io_r_resp_data_0_hist_7 = _array_RW0_rdata[29:28];
  assign io_r_resp_data_0_hist_8 = _array_RW0_rdata[31:30];
  assign io_r_resp_data_0_hist_9 = _array_RW0_rdata[33:32];
  assign io_r_resp_data_0_hist_10 = _array_RW0_rdata[35:34];
  assign io_r_resp_data_0_hist_11 = _array_RW0_rdata[37:36];
  assign io_r_resp_data_0_hist_12 = _array_RW0_rdata[39:38];
  assign io_r_resp_data_0_hist_13 = _array_RW0_rdata[41:40];
  assign io_r_resp_data_0_hist_14 = _array_RW0_rdata[43:42];
  assign io_r_resp_data_0_hist_15 = _array_RW0_rdata[45:44];
  assign io_r_resp_data_0_hist_16 = _array_RW0_rdata[47:46];
  assign io_r_resp_data_0_hist_17 = _array_RW0_rdata[49:48];
  assign io_r_resp_data_0_hist_18 = _array_RW0_rdata[51:50];
  assign io_r_resp_data_0_hist_19 = _array_RW0_rdata[53:52];
  assign io_r_resp_data_0_hist_20 = _array_RW0_rdata[55:54];
  assign io_r_resp_data_0_hist_21 = _array_RW0_rdata[57:56];
  assign io_r_resp_data_0_hist_22 = _array_RW0_rdata[59:58];
  assign io_r_resp_data_0_hist_23 = _array_RW0_rdata[61:60];
  assign io_r_resp_data_0_hist_24 = _array_RW0_rdata[63:62];
  assign io_r_resp_data_0_hist_25 = _array_RW0_rdata[65:64];
  assign io_r_resp_data_0_hist_26 = _array_RW0_rdata[67:66];
  assign io_r_resp_data_0_hist_27 = _array_RW0_rdata[69:68];
  assign io_r_resp_data_0_hist_28 = _array_RW0_rdata[71:70];
  assign io_r_resp_data_0_hist_29 = _array_RW0_rdata[73:72];
  assign io_r_resp_data_0_tag = _array_RW0_rdata[13:1];
  assign io_r_resp_data_1_hist_0 = _array_RW0_rdata[89:88];
  assign io_r_resp_data_1_hist_1 = _array_RW0_rdata[91:90];
  assign io_r_resp_data_1_hist_2 = _array_RW0_rdata[93:92];
  assign io_r_resp_data_1_hist_3 = _array_RW0_rdata[95:94];
  assign io_r_resp_data_1_hist_4 = _array_RW0_rdata[97:96];
  assign io_r_resp_data_1_hist_5 = _array_RW0_rdata[99:98];
  assign io_r_resp_data_1_hist_6 = _array_RW0_rdata[101:100];
  assign io_r_resp_data_1_hist_7 = _array_RW0_rdata[103:102];
  assign io_r_resp_data_1_hist_8 = _array_RW0_rdata[105:104];
  assign io_r_resp_data_1_hist_9 = _array_RW0_rdata[107:106];
  assign io_r_resp_data_1_hist_10 = _array_RW0_rdata[109:108];
  assign io_r_resp_data_1_hist_11 = _array_RW0_rdata[111:110];
  assign io_r_resp_data_1_hist_12 = _array_RW0_rdata[113:112];
  assign io_r_resp_data_1_hist_13 = _array_RW0_rdata[115:114];
  assign io_r_resp_data_1_hist_14 = _array_RW0_rdata[117:116];
  assign io_r_resp_data_1_hist_15 = _array_RW0_rdata[119:118];
  assign io_r_resp_data_1_hist_16 = _array_RW0_rdata[121:120];
  assign io_r_resp_data_1_hist_17 = _array_RW0_rdata[123:122];
  assign io_r_resp_data_1_hist_18 = _array_RW0_rdata[125:124];
  assign io_r_resp_data_1_hist_19 = _array_RW0_rdata[127:126];
  assign io_r_resp_data_1_hist_20 = _array_RW0_rdata[129:128];
  assign io_r_resp_data_1_hist_21 = _array_RW0_rdata[131:130];
  assign io_r_resp_data_1_hist_22 = _array_RW0_rdata[133:132];
  assign io_r_resp_data_1_hist_23 = _array_RW0_rdata[135:134];
  assign io_r_resp_data_1_hist_24 = _array_RW0_rdata[137:136];
  assign io_r_resp_data_1_hist_25 = _array_RW0_rdata[139:138];
  assign io_r_resp_data_1_hist_26 = _array_RW0_rdata[141:140];
  assign io_r_resp_data_1_hist_27 = _array_RW0_rdata[143:142];
  assign io_r_resp_data_1_hist_28 = _array_RW0_rdata[145:144];
  assign io_r_resp_data_1_hist_29 = _array_RW0_rdata[147:146];
  assign io_r_resp_data_1_tag = _array_RW0_rdata[87:75];
endmodule

