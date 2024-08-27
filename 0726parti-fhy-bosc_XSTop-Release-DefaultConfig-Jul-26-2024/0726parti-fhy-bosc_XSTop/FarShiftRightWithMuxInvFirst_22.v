// Generated by CIRCT firtool-1.74.0
module FarShiftRightWithMuxInvFirst_22(
  input  [25:0] io_src,
  input  [3:0]  io_shiftValue,
  output [25:0] io_result,
  input         io_EOP
);

  wire [25:0] io_result_res_vec_1 = io_shiftValue[0] ? {io_EOP, io_src[25:1]} : io_src;
  wire [25:0] io_result_res_vec_2 =
    io_shiftValue[1] ? {{2{io_EOP}}, io_result_res_vec_1[25:2]} : io_result_res_vec_1;
  wire [25:0] io_result_res_vec_3 =
    io_shiftValue[2] ? {{4{io_EOP}}, io_result_res_vec_2[25:4]} : io_result_res_vec_2;
  assign io_result =
    io_shiftValue[3] ? {{8{io_EOP}}, io_result_res_vec_3[25:8]} : io_result_res_vec_3;
endmodule

