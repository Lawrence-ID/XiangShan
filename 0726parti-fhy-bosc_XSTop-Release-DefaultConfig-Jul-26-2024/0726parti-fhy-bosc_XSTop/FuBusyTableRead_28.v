// Generated by CIRCT firtool-1.74.0
module FuBusyTableRead_28(
  input         io_in_fuBusyTable,
  input  [34:0] io_in_fuTypeRegVec_0,
  input  [34:0] io_in_fuTypeRegVec_1,
  input  [34:0] io_in_fuTypeRegVec_2,
  input  [34:0] io_in_fuTypeRegVec_3,
  input  [34:0] io_in_fuTypeRegVec_4,
  input  [34:0] io_in_fuTypeRegVec_5,
  input  [34:0] io_in_fuTypeRegVec_6,
  input  [34:0] io_in_fuTypeRegVec_7,
  input  [34:0] io_in_fuTypeRegVec_8,
  input  [34:0] io_in_fuTypeRegVec_9,
  input  [34:0] io_in_fuTypeRegVec_10,
  input  [34:0] io_in_fuTypeRegVec_11,
  input  [34:0] io_in_fuTypeRegVec_12,
  input  [34:0] io_in_fuTypeRegVec_13,
  input  [34:0] io_in_fuTypeRegVec_14,
  input  [34:0] io_in_fuTypeRegVec_15,
  input  [34:0] io_in_fuTypeRegVec_16,
  input  [34:0] io_in_fuTypeRegVec_17,
  input  [34:0] io_in_fuTypeRegVec_18,
  input  [34:0] io_in_fuTypeRegVec_19,
  input  [34:0] io_in_fuTypeRegVec_20,
  input  [34:0] io_in_fuTypeRegVec_21,
  input  [34:0] io_in_fuTypeRegVec_22,
  input  [34:0] io_in_fuTypeRegVec_23,
  output [23:0] io_out_fuBusyTableMask
);

  assign io_out_fuBusyTableMask =
    io_in_fuBusyTable
      ? {io_in_fuTypeRegVec_23[3],
         io_in_fuTypeRegVec_22[3],
         io_in_fuTypeRegVec_21[3],
         io_in_fuTypeRegVec_20[3],
         io_in_fuTypeRegVec_19[3],
         io_in_fuTypeRegVec_18[3],
         io_in_fuTypeRegVec_17[3],
         io_in_fuTypeRegVec_16[3],
         io_in_fuTypeRegVec_15[3],
         io_in_fuTypeRegVec_14[3],
         io_in_fuTypeRegVec_13[3],
         io_in_fuTypeRegVec_12[3],
         io_in_fuTypeRegVec_11[3],
         io_in_fuTypeRegVec_10[3],
         io_in_fuTypeRegVec_9[3],
         io_in_fuTypeRegVec_8[3],
         io_in_fuTypeRegVec_7[3],
         io_in_fuTypeRegVec_6[3],
         io_in_fuTypeRegVec_5[3],
         io_in_fuTypeRegVec_4[3],
         io_in_fuTypeRegVec_3[3],
         io_in_fuTypeRegVec_2[3],
         io_in_fuTypeRegVec_1[3],
         io_in_fuTypeRegVec_0[3]}
      : 24'h0;
endmodule

