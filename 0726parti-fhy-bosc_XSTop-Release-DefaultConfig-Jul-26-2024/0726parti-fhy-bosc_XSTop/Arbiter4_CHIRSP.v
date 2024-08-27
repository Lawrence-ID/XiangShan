// Generated by CIRCT firtool-1.74.0
module Arbiter4_CHIRSP(
  output       io_in_0_ready,
  input        io_in_0_valid,
  input  [3:0] io_in_0_bits_qos,
  input  [6:0] io_in_0_bits_tgtID,
  input  [7:0] io_in_0_bits_txnID,
  input  [3:0] io_in_0_bits_opcode,
  input  [1:0] io_in_0_bits_respErr,
  input  [2:0] io_in_0_bits_resp,
  input  [2:0] io_in_0_bits_fwdState,
  input  [7:0] io_in_0_bits_dbID,
  input  [3:0] io_in_0_bits_pCrdType,
  input        io_in_0_bits_traceTag,
  output       io_in_1_ready,
  input        io_in_1_valid,
  input  [3:0] io_in_1_bits_qos,
  input  [6:0] io_in_1_bits_tgtID,
  input  [7:0] io_in_1_bits_txnID,
  input  [3:0] io_in_1_bits_opcode,
  input  [1:0] io_in_1_bits_respErr,
  input  [2:0] io_in_1_bits_resp,
  input  [2:0] io_in_1_bits_fwdState,
  input  [7:0] io_in_1_bits_dbID,
  input  [3:0] io_in_1_bits_pCrdType,
  input        io_in_1_bits_traceTag,
  output       io_in_2_ready,
  input        io_in_2_valid,
  input  [3:0] io_in_2_bits_qos,
  input  [6:0] io_in_2_bits_tgtID,
  input  [7:0] io_in_2_bits_txnID,
  input  [3:0] io_in_2_bits_opcode,
  input  [1:0] io_in_2_bits_respErr,
  input  [2:0] io_in_2_bits_resp,
  input  [2:0] io_in_2_bits_fwdState,
  input  [7:0] io_in_2_bits_dbID,
  input  [3:0] io_in_2_bits_pCrdType,
  input        io_in_2_bits_traceTag,
  output       io_in_3_ready,
  input        io_in_3_valid,
  input  [3:0] io_in_3_bits_qos,
  input  [6:0] io_in_3_bits_tgtID,
  input  [7:0] io_in_3_bits_txnID,
  input  [3:0] io_in_3_bits_opcode,
  input  [1:0] io_in_3_bits_respErr,
  input  [2:0] io_in_3_bits_resp,
  input  [2:0] io_in_3_bits_fwdState,
  input  [7:0] io_in_3_bits_dbID,
  input  [3:0] io_in_3_bits_pCrdType,
  input        io_in_3_bits_traceTag,
  input        io_out_ready,
  output       io_out_valid,
  output [3:0] io_out_bits_qos,
  output [6:0] io_out_bits_tgtID,
  output [7:0] io_out_bits_txnID,
  output [3:0] io_out_bits_opcode,
  output [1:0] io_out_bits_respErr,
  output [2:0] io_out_bits_resp,
  output [2:0] io_out_bits_fwdState,
  output [7:0] io_out_bits_dbID,
  output [3:0] io_out_bits_pCrdType,
  output       io_out_bits_traceTag
);

  wire _grant_T = io_in_0_valid | io_in_1_valid;
  wire _io_out_valid_T = _grant_T | io_in_2_valid;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_in_2_ready = ~_grant_T & io_out_ready;
  assign io_in_3_ready = ~_io_out_valid_T & io_out_ready;
  assign io_out_valid = _io_out_valid_T | io_in_3_valid;
  assign io_out_bits_qos =
    io_in_0_valid
      ? io_in_0_bits_qos
      : io_in_1_valid
          ? io_in_1_bits_qos
          : io_in_2_valid ? io_in_2_bits_qos : io_in_3_bits_qos;
  assign io_out_bits_tgtID =
    io_in_0_valid
      ? io_in_0_bits_tgtID
      : io_in_1_valid
          ? io_in_1_bits_tgtID
          : io_in_2_valid ? io_in_2_bits_tgtID : io_in_3_bits_tgtID;
  assign io_out_bits_txnID =
    io_in_0_valid
      ? io_in_0_bits_txnID
      : io_in_1_valid
          ? io_in_1_bits_txnID
          : io_in_2_valid ? io_in_2_bits_txnID : io_in_3_bits_txnID;
  assign io_out_bits_opcode =
    io_in_0_valid
      ? io_in_0_bits_opcode
      : io_in_1_valid
          ? io_in_1_bits_opcode
          : io_in_2_valid ? io_in_2_bits_opcode : io_in_3_bits_opcode;
  assign io_out_bits_respErr =
    io_in_0_valid
      ? io_in_0_bits_respErr
      : io_in_1_valid
          ? io_in_1_bits_respErr
          : io_in_2_valid ? io_in_2_bits_respErr : io_in_3_bits_respErr;
  assign io_out_bits_resp =
    io_in_0_valid
      ? io_in_0_bits_resp
      : io_in_1_valid
          ? io_in_1_bits_resp
          : io_in_2_valid ? io_in_2_bits_resp : io_in_3_bits_resp;
  assign io_out_bits_fwdState =
    io_in_0_valid
      ? io_in_0_bits_fwdState
      : io_in_1_valid
          ? io_in_1_bits_fwdState
          : io_in_2_valid ? io_in_2_bits_fwdState : io_in_3_bits_fwdState;
  assign io_out_bits_dbID =
    io_in_0_valid
      ? io_in_0_bits_dbID
      : io_in_1_valid
          ? io_in_1_bits_dbID
          : io_in_2_valid ? io_in_2_bits_dbID : io_in_3_bits_dbID;
  assign io_out_bits_pCrdType =
    io_in_0_valid
      ? io_in_0_bits_pCrdType
      : io_in_1_valid
          ? io_in_1_bits_pCrdType
          : io_in_2_valid ? io_in_2_bits_pCrdType : io_in_3_bits_pCrdType;
  assign io_out_bits_traceTag =
    io_in_0_valid
      ? io_in_0_bits_traceTag
      : io_in_1_valid
          ? io_in_1_bits_traceTag
          : io_in_2_valid ? io_in_2_bits_traceTag : io_in_3_bits_traceTag;
endmodule

