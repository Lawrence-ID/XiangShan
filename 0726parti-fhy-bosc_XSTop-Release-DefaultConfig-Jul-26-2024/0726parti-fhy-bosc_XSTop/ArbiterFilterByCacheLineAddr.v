// Generated by CIRCT firtool-1.74.0
module ArbiterFilterByCacheLineAddr(
  output         io_in_0_ready,
  input          io_in_0_valid,
  input  [3:0]   io_in_0_bits_source,
  input  [4:0]   io_in_0_bits_cmd,
  input  [35:0]  io_in_0_bits_addr,
  input  [40:0]  io_in_0_bits_vaddr,
  input          io_in_0_bits_full_overwrite,
  input  [2:0]   io_in_0_bits_word_idx,
  input  [63:0]  io_in_0_bits_amo_data,
  input  [7:0]   io_in_0_bits_amo_mask,
  input  [1:0]   io_in_0_bits_req_coh_state,
  input  [5:0]   io_in_0_bits_id,
  input  [511:0] io_in_0_bits_store_data,
  input  [63:0]  io_in_0_bits_store_mask,
  output         io_in_1_ready,
  input          io_in_1_valid,
  input  [3:0]   io_in_1_bits_source,
  input  [2:0]   io_in_1_bits_pf_source,
  input  [4:0]   io_in_1_bits_cmd,
  input  [35:0]  io_in_1_bits_addr,
  input  [40:0]  io_in_1_bits_vaddr,
  input          io_in_1_bits_lqIdx_flag,
  input  [6:0]   io_in_1_bits_lqIdx_value,
  input  [1:0]   io_in_1_bits_req_coh_state,
  input          io_in_1_bits_cancel,
  output         io_in_2_ready,
  input          io_in_2_valid,
  input  [3:0]   io_in_2_bits_source,
  input  [2:0]   io_in_2_bits_pf_source,
  input  [4:0]   io_in_2_bits_cmd,
  input  [35:0]  io_in_2_bits_addr,
  input  [40:0]  io_in_2_bits_vaddr,
  input          io_in_2_bits_lqIdx_flag,
  input  [6:0]   io_in_2_bits_lqIdx_value,
  input  [1:0]   io_in_2_bits_req_coh_state,
  input          io_in_2_bits_cancel,
  output         io_in_3_ready,
  input          io_in_3_valid,
  input  [3:0]   io_in_3_bits_source,
  input  [2:0]   io_in_3_bits_pf_source,
  input  [4:0]   io_in_3_bits_cmd,
  input  [35:0]  io_in_3_bits_addr,
  input  [40:0]  io_in_3_bits_vaddr,
  input          io_in_3_bits_lqIdx_flag,
  input  [6:0]   io_in_3_bits_lqIdx_value,
  input  [1:0]   io_in_3_bits_req_coh_state,
  input          io_in_3_bits_cancel,
  input          io_out_ready,
  output         io_out_valid,
  output [3:0]   io_out_bits_source,
  output [2:0]   io_out_bits_pf_source,
  output [4:0]   io_out_bits_cmd,
  output [35:0]  io_out_bits_addr,
  output [40:0]  io_out_bits_vaddr,
  output         io_out_bits_lqIdx_flag,
  output [6:0]   io_out_bits_lqIdx_value,
  output         io_out_bits_full_overwrite,
  output [2:0]   io_out_bits_word_idx,
  output [63:0]  io_out_bits_amo_data,
  output [7:0]   io_out_bits_amo_mask,
  output [1:0]   io_out_bits_req_coh_state,
  output [5:0]   io_out_bits_id,
  output         io_out_bits_cancel,
  output [511:0] io_out_bits_store_data,
  output [63:0]  io_out_bits_store_mask
);

  wire [35:0] io_out_bits_addr_0 =
    io_in_0_valid
      ? io_in_0_bits_addr
      : io_in_1_valid
          ? io_in_1_bits_addr
          : io_in_2_valid ? io_in_2_bits_addr : io_in_3_bits_addr;
  wire        _grant_T = io_in_0_valid | io_in_1_valid;
  wire        _io_out_valid_T = _grant_T | io_in_2_valid;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready =
    (~io_in_0_valid | io_in_1_bits_addr[35:6] == io_out_bits_addr_0[35:6]) & io_out_ready;
  assign io_in_2_ready =
    (~_grant_T | io_in_2_bits_addr[35:6] == io_out_bits_addr_0[35:6]) & io_out_ready;
  assign io_in_3_ready =
    (~_io_out_valid_T | io_in_3_bits_addr[35:6] == io_out_bits_addr_0[35:6])
    & io_out_ready;
  assign io_out_valid = _io_out_valid_T | io_in_3_valid;
  assign io_out_bits_source =
    io_in_0_valid
      ? io_in_0_bits_source
      : io_in_1_valid
          ? io_in_1_bits_source
          : io_in_2_valid ? io_in_2_bits_source : io_in_3_bits_source;
  assign io_out_bits_pf_source =
    io_in_0_valid
      ? 3'h0
      : io_in_1_valid
          ? io_in_1_bits_pf_source
          : io_in_2_valid ? io_in_2_bits_pf_source : io_in_3_bits_pf_source;
  assign io_out_bits_cmd =
    io_in_0_valid
      ? io_in_0_bits_cmd
      : io_in_1_valid
          ? io_in_1_bits_cmd
          : io_in_2_valid ? io_in_2_bits_cmd : io_in_3_bits_cmd;
  assign io_out_bits_addr = io_out_bits_addr_0;
  assign io_out_bits_vaddr =
    io_in_0_valid
      ? io_in_0_bits_vaddr
      : io_in_1_valid
          ? io_in_1_bits_vaddr
          : io_in_2_valid ? io_in_2_bits_vaddr : io_in_3_bits_vaddr;
  assign io_out_bits_lqIdx_flag =
    ~io_in_0_valid
    & (io_in_1_valid
         ? io_in_1_bits_lqIdx_flag
         : io_in_2_valid ? io_in_2_bits_lqIdx_flag : io_in_3_bits_lqIdx_flag);
  assign io_out_bits_lqIdx_value =
    io_in_0_valid
      ? 7'h0
      : io_in_1_valid
          ? io_in_1_bits_lqIdx_value
          : io_in_2_valid ? io_in_2_bits_lqIdx_value : io_in_3_bits_lqIdx_value;
  assign io_out_bits_full_overwrite = io_in_0_valid & io_in_0_bits_full_overwrite;
  assign io_out_bits_word_idx = io_in_0_valid ? io_in_0_bits_word_idx : 3'h0;
  assign io_out_bits_amo_data = io_in_0_valid ? io_in_0_bits_amo_data : 64'h0;
  assign io_out_bits_amo_mask = io_in_0_valid ? io_in_0_bits_amo_mask : 8'h0;
  assign io_out_bits_req_coh_state =
    io_in_0_valid
      ? io_in_0_bits_req_coh_state
      : io_in_1_valid
          ? io_in_1_bits_req_coh_state
          : io_in_2_valid ? io_in_2_bits_req_coh_state : io_in_3_bits_req_coh_state;
  assign io_out_bits_id = io_in_0_valid ? io_in_0_bits_id : 6'h0;
  assign io_out_bits_cancel =
    ~io_in_0_valid
    & (io_in_1_valid
         ? io_in_1_bits_cancel
         : io_in_2_valid ? io_in_2_bits_cancel : io_in_3_bits_cancel);
  assign io_out_bits_store_data = io_in_0_valid ? io_in_0_bits_store_data : 512'h0;
  assign io_out_bits_store_mask = io_in_0_valid ? io_in_0_bits_store_mask : 64'h0;
endmodule

