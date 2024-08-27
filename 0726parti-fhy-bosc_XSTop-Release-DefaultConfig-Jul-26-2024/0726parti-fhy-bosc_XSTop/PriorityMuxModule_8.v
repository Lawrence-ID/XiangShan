// Generated by CIRCT firtool-1.74.0
module PriorityMuxModule_8(
  input        s2_GHPtr_sel,
  input        s2_GHPtr_src_flag,
  input  [7:0] s2_GHPtr_src_value,
  input        s1_GHPtr_sel,
  input        s1_GHPtr_src_flag,
  input  [7:0] s1_GHPtr_src_value,
  input        s3_GHPtr_sel,
  input        s3_GHPtr_src_flag,
  input  [7:0] s3_GHPtr_src_value,
  input        redirect_GHPtr_sel,
  input        redirect_GHPtr_src_flag,
  input  [7:0] redirect_GHPtr_src_value,
  input        stallGHPtr_src_flag,
  input  [7:0] stallGHPtr_src_value,
  output       out_res_flag,
  output [7:0] out_res_value
);

  assign out_res_flag =
    s2_GHPtr_sel
      ? s2_GHPtr_src_flag
      : s1_GHPtr_sel
          ? s1_GHPtr_src_flag
          : s3_GHPtr_sel
              ? s3_GHPtr_src_flag
              : redirect_GHPtr_sel ? redirect_GHPtr_src_flag : stallGHPtr_src_flag;
  assign out_res_value =
    s2_GHPtr_sel
      ? s2_GHPtr_src_value
      : s1_GHPtr_sel
          ? s1_GHPtr_src_value
          : s3_GHPtr_sel
              ? s3_GHPtr_src_value
              : redirect_GHPtr_sel ? redirect_GHPtr_src_value : stallGHPtr_src_value;
endmodule

