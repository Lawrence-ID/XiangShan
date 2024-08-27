// Generated by CIRCT firtool-1.74.0
module Arbiter4_MainPipeReq(
  output         io_in_0_ready,
  input          io_in_0_valid,
  input  [1:0]   io_in_0_bits_probe_param,
  input          io_in_0_bits_probe_need_data,
  input  [40:0]  io_in_0_bits_vaddr,
  input  [35:0]  io_in_0_bits_addr,
  input  [5:0]   io_in_0_bits_id,
  output         io_in_1_ready,
  input          io_in_1_valid,
  input          io_in_1_bits_miss,
  input  [3:0]   io_in_1_bits_miss_id,
  input  [3:0]   io_in_1_bits_source,
  input  [4:0]   io_in_1_bits_cmd,
  input  [40:0]  io_in_1_bits_vaddr,
  input  [35:0]  io_in_1_bits_addr,
  input  [2:0]   io_in_1_bits_word_idx,
  input  [63:0]  io_in_1_bits_amo_data,
  input  [7:0]   io_in_1_bits_amo_mask,
  input  [2:0]   io_in_1_bits_pf_source,
  input          io_in_1_bits_access,
  input  [5:0]   io_in_1_bits_id,
  input          io_in_2_valid,
  input  [40:0]  io_in_2_bits_vaddr,
  input  [35:0]  io_in_2_bits_addr,
  input  [511:0] io_in_2_bits_store_data,
  input  [63:0]  io_in_2_bits_store_mask,
  input  [5:0]   io_in_2_bits_id,
  output         io_in_3_ready,
  input          io_in_3_valid,
  input  [4:0]   io_in_3_bits_cmd,
  input  [40:0]  io_in_3_bits_vaddr,
  input  [35:0]  io_in_3_bits_addr,
  input  [2:0]   io_in_3_bits_word_idx,
  input  [63:0]  io_in_3_bits_amo_data,
  input  [7:0]   io_in_3_bits_amo_mask,
  input          io_out_ready,
  output         io_out_valid,
  output         io_out_bits_miss,
  output [3:0]   io_out_bits_miss_id,
  output         io_out_bits_probe,
  output [1:0]   io_out_bits_probe_param,
  output         io_out_bits_probe_need_data,
  output [3:0]   io_out_bits_source,
  output [4:0]   io_out_bits_cmd,
  output [40:0]  io_out_bits_vaddr,
  output [35:0]  io_out_bits_addr,
  output [511:0] io_out_bits_store_data,
  output [63:0]  io_out_bits_store_mask,
  output [2:0]   io_out_bits_word_idx,
  output [63:0]  io_out_bits_amo_data,
  output [7:0]   io_out_bits_amo_mask,
  output [2:0]   io_out_bits_pf_source,
  output         io_out_bits_access,
  output [5:0]   io_out_bits_id
);

  wire _GEN = io_in_0_valid | ~io_in_1_valid;
  wire _GEN_0 = io_in_0_valid | io_in_1_valid | ~io_in_2_valid;
  wire _io_out_valid_T = io_in_0_valid | io_in_1_valid | io_in_2_valid;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_in_3_ready = ~_io_out_valid_T & io_out_ready;
  assign io_out_valid = _io_out_valid_T | io_in_3_valid;
  assign io_out_bits_miss = ~io_in_0_valid & io_in_1_valid & io_in_1_bits_miss;
  assign io_out_bits_miss_id = _GEN ? 4'h0 : io_in_1_bits_miss_id;
  assign io_out_bits_probe = io_in_0_valid;
  assign io_out_bits_probe_param = io_in_0_valid ? io_in_0_bits_probe_param : 2'h0;
  assign io_out_bits_probe_need_data = io_in_0_valid & io_in_0_bits_probe_need_data;
  assign io_out_bits_source =
    io_in_0_valid
      ? 4'h0
      : io_in_1_valid ? io_in_1_bits_source : io_in_2_valid ? 4'h1 : 4'h2;
  assign io_out_bits_cmd =
    io_in_0_valid
      ? 5'h0
      : io_in_1_valid ? io_in_1_bits_cmd : io_in_2_valid ? 5'h1 : io_in_3_bits_cmd;
  assign io_out_bits_vaddr =
    io_in_0_valid
      ? io_in_0_bits_vaddr
      : io_in_1_valid
          ? io_in_1_bits_vaddr
          : io_in_2_valid ? io_in_2_bits_vaddr : io_in_3_bits_vaddr;
  assign io_out_bits_addr =
    io_in_0_valid
      ? io_in_0_bits_addr
      : io_in_1_valid
          ? io_in_1_bits_addr
          : io_in_2_valid ? io_in_2_bits_addr : io_in_3_bits_addr;
  assign io_out_bits_store_data = _GEN_0 ? 512'h0 : io_in_2_bits_store_data;
  assign io_out_bits_store_mask = _GEN_0 ? 64'h0 : io_in_2_bits_store_mask;
  assign io_out_bits_word_idx =
    io_in_0_valid
      ? 3'h0
      : io_in_1_valid
          ? io_in_1_bits_word_idx
          : io_in_2_valid ? 3'h0 : io_in_3_bits_word_idx;
  assign io_out_bits_amo_data =
    io_in_0_valid
      ? 64'h0
      : io_in_1_valid
          ? io_in_1_bits_amo_data
          : io_in_2_valid ? 64'h0 : io_in_3_bits_amo_data;
  assign io_out_bits_amo_mask =
    io_in_0_valid
      ? 8'h0
      : io_in_1_valid
          ? io_in_1_bits_amo_mask
          : io_in_2_valid ? 8'h0 : io_in_3_bits_amo_mask;
  assign io_out_bits_pf_source = _GEN ? 3'h0 : io_in_1_bits_pf_source;
  assign io_out_bits_access = ~io_in_0_valid & io_in_1_valid & io_in_1_bits_access;
  assign io_out_bits_id =
    io_in_0_valid
      ? io_in_0_bits_id
      : io_in_1_valid ? io_in_1_bits_id : io_in_2_valid ? io_in_2_bits_id : 6'h0;
endmodule

