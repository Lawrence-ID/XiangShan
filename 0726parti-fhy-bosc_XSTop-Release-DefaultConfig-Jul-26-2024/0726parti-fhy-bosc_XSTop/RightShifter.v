// Generated by CIRCT firtool-1.74.0
module RightShifter(
  input  [5:0]  io_shiftNum,
  input  [63:0] io_in,
  input         io_msb,
  output [63:0] io_out
);

  wire [63:0] s0 = io_shiftNum[0] ? {io_msb, io_in[63:1]} : io_in;
  wire [63:0] s1 = io_shiftNum[1] ? {{2{io_msb}}, s0[63:2]} : s0;
  wire [63:0] s2 = io_shiftNum[2] ? {{4{io_msb}}, s1[63:4]} : s1;
  wire [63:0] s3 = io_shiftNum[3] ? {{8{io_msb}}, s2[63:8]} : s2;
  wire [63:0] s4 = io_shiftNum[4] ? {{16{io_msb}}, s3[63:16]} : s3;
  assign io_out = io_shiftNum[5] ? {{32{io_msb}}, s4[63:32]} : s4;
endmodule

