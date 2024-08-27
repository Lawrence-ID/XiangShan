// Generated by CIRCT firtool-1.74.0
module SRAMTemplate_66(
  input         clock,
  input         io_r_req_valid,
  input  [6:0]  io_r_req_bits_setIdx,
  output [63:0] io_r_resp_data_0,
  input         io_w_req_valid,
  input  [6:0]  io_w_req_bits_setIdx,
  input  [63:0] io_w_req_bits_data_0
);

  wire realRen;
  assign realRen = io_r_req_valid & ~io_w_req_valid;
  array_0_1 array_0 (
    .RW0_addr  (io_w_req_valid ? io_w_req_bits_setIdx : io_r_req_bits_setIdx),
    .RW0_en    (realRen | io_w_req_valid),
    .RW0_clk   (clock),
    .RW0_wmode (io_w_req_valid),
    .RW0_wdata (io_w_req_bits_data_0),
    .RW0_rdata (io_r_resp_data_0)
  );
endmodule

