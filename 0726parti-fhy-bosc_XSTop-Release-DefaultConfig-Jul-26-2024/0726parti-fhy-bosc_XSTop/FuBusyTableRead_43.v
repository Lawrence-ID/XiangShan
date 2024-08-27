// Generated by CIRCT firtool-1.74.0
module FuBusyTableRead_43(
  input  [2:0]  io_in_fuBusyTable,
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
  output [17:0] io_out_fuBusyTableMask
);

  assign io_out_fuBusyTableMask =
    (io_in_fuBusyTable[1]
       ? {io_in_fuTypeRegVec_17[11],
          io_in_fuTypeRegVec_16[11],
          io_in_fuTypeRegVec_15[11],
          io_in_fuTypeRegVec_14[11],
          io_in_fuTypeRegVec_13[11],
          io_in_fuTypeRegVec_12[11],
          io_in_fuTypeRegVec_11[11],
          io_in_fuTypeRegVec_10[11],
          io_in_fuTypeRegVec_9[11],
          io_in_fuTypeRegVec_8[11],
          io_in_fuTypeRegVec_7[11],
          io_in_fuTypeRegVec_6[11],
          io_in_fuTypeRegVec_5[11],
          io_in_fuTypeRegVec_4[11],
          io_in_fuTypeRegVec_3[11],
          io_in_fuTypeRegVec_2[11],
          io_in_fuTypeRegVec_1[11],
          io_in_fuTypeRegVec_0[11]}
       : 18'h0)
    | (io_in_fuBusyTable[2]
         ? {io_in_fuTypeRegVec_17[13],
            io_in_fuTypeRegVec_16[13],
            io_in_fuTypeRegVec_15[13],
            io_in_fuTypeRegVec_14[13],
            io_in_fuTypeRegVec_13[13],
            io_in_fuTypeRegVec_12[13],
            io_in_fuTypeRegVec_11[13],
            io_in_fuTypeRegVec_10[13],
            io_in_fuTypeRegVec_9[13],
            io_in_fuTypeRegVec_8[13],
            io_in_fuTypeRegVec_7[13],
            io_in_fuTypeRegVec_6[13],
            io_in_fuTypeRegVec_5[13],
            io_in_fuTypeRegVec_4[13],
            io_in_fuTypeRegVec_3[13],
            io_in_fuTypeRegVec_2[13],
            io_in_fuTypeRegVec_1[13],
            io_in_fuTypeRegVec_0[13]}
         : 18'h0);
endmodule

