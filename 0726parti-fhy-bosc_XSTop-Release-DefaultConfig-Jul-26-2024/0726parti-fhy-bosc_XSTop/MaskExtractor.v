// Generated by CIRCT firtool-1.74.0
module MaskExtractor(
  input  [15:0] io_in_mask,
  input  [1:0]  io_in_vsew,
  output [15:0] io_out_mask
);

  assign io_out_mask =
    (io_in_vsew == 2'h0 ? io_in_mask : 16'h0)
    | (io_in_vsew == 2'h1
         ? {{2{io_in_mask[7]}},
            {2{io_in_mask[6]}},
            {2{io_in_mask[5]}},
            {2{io_in_mask[4]}},
            {2{io_in_mask[3]}},
            {2{io_in_mask[2]}},
            {2{io_in_mask[1]}},
            {2{io_in_mask[0]}}}
         : 16'h0)
    | (io_in_vsew == 2'h2
         ? {{4{io_in_mask[3]}},
            {4{io_in_mask[2]}},
            {4{io_in_mask[1]}},
            {4{io_in_mask[0]}}}
         : 16'h0) | ((&io_in_vsew) ? {{8{io_in_mask[1]}}, {8{io_in_mask[0]}}} : 16'h0);
endmodule

