// Generated by CIRCT firtool-1.74.0
module Arbiter8_CHIREQ(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [7:0]  io_in_0_bits_txnID,
  input  [5:0]  io_in_0_bits_opcode,
  input  [2:0]  io_in_0_bits_size,
  input  [47:0] io_in_0_bits_addr,
  input         io_in_0_bits_allowRetry,
  input  [3:0]  io_in_0_bits_pCrdType,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [7:0]  io_in_1_bits_txnID,
  input  [5:0]  io_in_1_bits_opcode,
  input  [2:0]  io_in_1_bits_size,
  input  [47:0] io_in_1_bits_addr,
  input         io_in_1_bits_allowRetry,
  input  [3:0]  io_in_1_bits_pCrdType,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [7:0]  io_in_2_bits_txnID,
  input  [5:0]  io_in_2_bits_opcode,
  input  [2:0]  io_in_2_bits_size,
  input  [47:0] io_in_2_bits_addr,
  input         io_in_2_bits_allowRetry,
  input  [3:0]  io_in_2_bits_pCrdType,
  output        io_in_3_ready,
  input         io_in_3_valid,
  input  [7:0]  io_in_3_bits_txnID,
  input  [5:0]  io_in_3_bits_opcode,
  input  [2:0]  io_in_3_bits_size,
  input  [47:0] io_in_3_bits_addr,
  input         io_in_3_bits_allowRetry,
  input  [3:0]  io_in_3_bits_pCrdType,
  output        io_in_4_ready,
  input         io_in_4_valid,
  input  [7:0]  io_in_4_bits_txnID,
  input  [5:0]  io_in_4_bits_opcode,
  input  [2:0]  io_in_4_bits_size,
  input  [47:0] io_in_4_bits_addr,
  input         io_in_4_bits_allowRetry,
  input  [3:0]  io_in_4_bits_pCrdType,
  output        io_in_5_ready,
  input         io_in_5_valid,
  input  [7:0]  io_in_5_bits_txnID,
  input  [5:0]  io_in_5_bits_opcode,
  input  [2:0]  io_in_5_bits_size,
  input  [47:0] io_in_5_bits_addr,
  input         io_in_5_bits_allowRetry,
  input  [3:0]  io_in_5_bits_pCrdType,
  output        io_in_6_ready,
  input         io_in_6_valid,
  input  [7:0]  io_in_6_bits_txnID,
  input  [5:0]  io_in_6_bits_opcode,
  input  [2:0]  io_in_6_bits_size,
  input  [47:0] io_in_6_bits_addr,
  input         io_in_6_bits_allowRetry,
  input  [3:0]  io_in_6_bits_pCrdType,
  output        io_in_7_ready,
  input         io_in_7_valid,
  input  [7:0]  io_in_7_bits_txnID,
  input  [5:0]  io_in_7_bits_opcode,
  input  [2:0]  io_in_7_bits_size,
  input  [47:0] io_in_7_bits_addr,
  input         io_in_7_bits_allowRetry,
  input  [3:0]  io_in_7_bits_pCrdType,
  input         io_out_ready,
  output        io_out_valid,
  output [7:0]  io_out_bits_txnID,
  output [5:0]  io_out_bits_opcode,
  output [2:0]  io_out_bits_size,
  output [47:0] io_out_bits_addr,
  output        io_out_bits_allowRetry,
  output [3:0]  io_out_bits_pCrdType
);

  wire _grant_T = io_in_0_valid | io_in_1_valid;
  wire _grant_T_1 = _grant_T | io_in_2_valid;
  wire _grant_T_2 = _grant_T_1 | io_in_3_valid;
  wire _grant_T_3 = _grant_T_2 | io_in_4_valid;
  wire _grant_T_4 = _grant_T_3 | io_in_5_valid;
  wire _io_out_valid_T = _grant_T_4 | io_in_6_valid;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_in_2_ready = ~_grant_T & io_out_ready;
  assign io_in_3_ready = ~_grant_T_1 & io_out_ready;
  assign io_in_4_ready = ~_grant_T_2 & io_out_ready;
  assign io_in_5_ready = ~_grant_T_3 & io_out_ready;
  assign io_in_6_ready = ~_grant_T_4 & io_out_ready;
  assign io_in_7_ready = ~_io_out_valid_T & io_out_ready;
  assign io_out_valid = _io_out_valid_T | io_in_7_valid;
  assign io_out_bits_txnID =
    io_in_0_valid
      ? io_in_0_bits_txnID
      : io_in_1_valid
          ? io_in_1_bits_txnID
          : io_in_2_valid
              ? io_in_2_bits_txnID
              : io_in_3_valid
                  ? io_in_3_bits_txnID
                  : io_in_4_valid
                      ? io_in_4_bits_txnID
                      : io_in_5_valid
                          ? io_in_5_bits_txnID
                          : io_in_6_valid ? io_in_6_bits_txnID : io_in_7_bits_txnID;
  assign io_out_bits_opcode =
    io_in_0_valid
      ? io_in_0_bits_opcode
      : io_in_1_valid
          ? io_in_1_bits_opcode
          : io_in_2_valid
              ? io_in_2_bits_opcode
              : io_in_3_valid
                  ? io_in_3_bits_opcode
                  : io_in_4_valid
                      ? io_in_4_bits_opcode
                      : io_in_5_valid
                          ? io_in_5_bits_opcode
                          : io_in_6_valid ? io_in_6_bits_opcode : io_in_7_bits_opcode;
  assign io_out_bits_size =
    io_in_0_valid
      ? io_in_0_bits_size
      : io_in_1_valid
          ? io_in_1_bits_size
          : io_in_2_valid
              ? io_in_2_bits_size
              : io_in_3_valid
                  ? io_in_3_bits_size
                  : io_in_4_valid
                      ? io_in_4_bits_size
                      : io_in_5_valid
                          ? io_in_5_bits_size
                          : io_in_6_valid ? io_in_6_bits_size : io_in_7_bits_size;
  assign io_out_bits_addr =
    io_in_0_valid
      ? io_in_0_bits_addr
      : io_in_1_valid
          ? io_in_1_bits_addr
          : io_in_2_valid
              ? io_in_2_bits_addr
              : io_in_3_valid
                  ? io_in_3_bits_addr
                  : io_in_4_valid
                      ? io_in_4_bits_addr
                      : io_in_5_valid
                          ? io_in_5_bits_addr
                          : io_in_6_valid ? io_in_6_bits_addr : io_in_7_bits_addr;
  assign io_out_bits_allowRetry =
    io_in_0_valid
      ? io_in_0_bits_allowRetry
      : io_in_1_valid
          ? io_in_1_bits_allowRetry
          : io_in_2_valid
              ? io_in_2_bits_allowRetry
              : io_in_3_valid
                  ? io_in_3_bits_allowRetry
                  : io_in_4_valid
                      ? io_in_4_bits_allowRetry
                      : io_in_5_valid
                          ? io_in_5_bits_allowRetry
                          : io_in_6_valid
                              ? io_in_6_bits_allowRetry
                              : io_in_7_bits_allowRetry;
  assign io_out_bits_pCrdType =
    io_in_0_valid
      ? io_in_0_bits_pCrdType
      : io_in_1_valid
          ? io_in_1_bits_pCrdType
          : io_in_2_valid
              ? io_in_2_bits_pCrdType
              : io_in_3_valid
                  ? io_in_3_bits_pCrdType
                  : io_in_4_valid
                      ? io_in_4_bits_pCrdType
                      : io_in_5_valid
                          ? io_in_5_bits_pCrdType
                          : io_in_6_valid ? io_in_6_bits_pCrdType : io_in_7_bits_pCrdType;
endmodule

