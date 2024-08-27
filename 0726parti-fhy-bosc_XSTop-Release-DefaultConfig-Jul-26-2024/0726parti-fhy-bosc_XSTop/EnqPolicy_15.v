// Generated by CIRCT firtool-1.74.0
module EnqPolicy_15(
  input  [7:0] io_canEnq,
  output       io_enqSelOHVec_0_valid,
  output [7:0] io_enqSelOHVec_0_bits,
  output       io_enqSelOHVec_1_valid,
  output [7:0] io_enqSelOHVec_1_bits
);

  assign io_enqSelOHVec_0_valid = |io_canEnq;
  assign io_enqSelOHVec_0_bits =
    {io_canEnq[7]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6]} == 7'h0,
     io_canEnq[6]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5]} == 6'h0,
     io_canEnq[5]
       & {io_canEnq[0], io_canEnq[1], io_canEnq[2], io_canEnq[3], io_canEnq[4]} == 5'h0,
     io_canEnq[4] & {io_canEnq[0], io_canEnq[1], io_canEnq[2], io_canEnq[3]} == 4'h0,
     io_canEnq[3] & {io_canEnq[0], io_canEnq[1], io_canEnq[2]} == 3'h0,
     io_canEnq[2] & {io_canEnq[0], io_canEnq[1]} == 2'h0,
     io_canEnq[1] & ~(io_canEnq[0]),
     io_canEnq[0]};
  assign io_enqSelOHVec_1_valid =
    io_canEnq[0] & (|(io_canEnq[7:1])) | io_canEnq[1] & (|(io_canEnq[7:2])) | io_canEnq[2]
    & (|(io_canEnq[7:3])) | io_canEnq[3] & (|(io_canEnq[7:4])) | io_canEnq[4]
    & (|(io_canEnq[7:5])) | io_canEnq[5] & (|(io_canEnq[7:6])) | io_canEnq[6]
    & io_canEnq[7];
  assign io_enqSelOHVec_1_bits =
    {io_canEnq[7],
     io_canEnq[6] & ~(io_canEnq[7]),
     io_canEnq[5] & io_canEnq[7:6] == 2'h0,
     io_canEnq[4] & io_canEnq[7:5] == 3'h0,
     io_canEnq[3] & io_canEnq[7:4] == 4'h0,
     io_canEnq[2] & io_canEnq[7:3] == 5'h0,
     io_canEnq[1] & io_canEnq[7:2] == 6'h0,
     io_canEnq[0] & io_canEnq[7:1] == 7'h0};
endmodule

