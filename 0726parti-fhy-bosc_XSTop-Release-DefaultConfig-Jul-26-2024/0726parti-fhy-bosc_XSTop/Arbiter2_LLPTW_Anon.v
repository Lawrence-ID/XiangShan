// Generated by CIRCT firtool-1.74.0
module Arbiter2_LLPTW_Anon(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [1:0]  io_in_0_bits_source,
  input  [2:0]  io_in_0_bits_id,
  input  [28:0] io_in_0_bits_ppn,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [1:0]  io_in_1_bits_source,
  input  [2:0]  io_in_1_bits_id,
  input  [28:0] io_in_1_bits_ppn,
  input         io_out_ready,
  output        io_out_valid,
  output [1:0]  io_out_bits_source,
  output [2:0]  io_out_bits_id,
  output [28:0] io_out_bits_ppn
);

  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_out_valid = io_in_0_valid | io_in_1_valid;
  assign io_out_bits_source = io_in_0_valid ? io_in_0_bits_source : io_in_1_bits_source;
  assign io_out_bits_id = io_in_0_valid ? io_in_0_bits_id : io_in_1_bits_id;
  assign io_out_bits_ppn = io_in_0_valid ? io_in_0_bits_ppn : io_in_1_bits_ppn;
endmodule

