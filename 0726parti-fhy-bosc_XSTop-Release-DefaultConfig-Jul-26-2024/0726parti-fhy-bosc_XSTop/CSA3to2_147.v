// Generated by CIRCT firtool-1.74.0
module CSA3to2_147(
  input  [15:0] io_in_a,
  input  [15:0] io_in_b,
  input  [15:0] io_in_c,
  output [15:0] io_out_sum,
  output [15:0] io_out_car
);

  assign io_out_sum = io_in_a ^ io_in_b ^ io_in_c;
  assign io_out_car =
    {io_in_a[14:0] & io_in_b[14:0] | io_in_a[14:0] & io_in_c[14:0] | io_in_b[14:0]
       & io_in_c[14:0],
     1'h0};
endmodule

