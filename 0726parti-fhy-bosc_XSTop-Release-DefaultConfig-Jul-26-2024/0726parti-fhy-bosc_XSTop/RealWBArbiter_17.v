// Generated by CIRCT firtool-1.74.0
module RealWBArbiter_17(
  input          io_in_0_valid,
  input          io_in_0_bits_vecWen,
  input  [6:0]   io_in_0_bits_pdest,
  input  [127:0] io_in_0_bits_data,
  output         io_out_valid,
  output         io_out_bits_vecWen,
  output [6:0]   io_out_bits_pdest,
  output [127:0] io_out_bits_data
);

  assign io_out_valid = io_in_0_valid;
  assign io_out_bits_vecWen = io_in_0_bits_vecWen;
  assign io_out_bits_pdest = io_in_0_bits_pdest;
  assign io_out_bits_data = io_in_0_bits_data;
endmodule

