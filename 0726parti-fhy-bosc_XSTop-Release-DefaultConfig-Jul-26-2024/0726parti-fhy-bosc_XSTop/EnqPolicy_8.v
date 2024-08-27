// Generated by CIRCT firtool-1.74.0
module EnqPolicy_8(
  input  [15:0] io_canEnq,
  output        io_enqSelOHVec_0_valid,
  output [15:0] io_enqSelOHVec_0_bits,
  output        io_enqSelOHVec_1_valid,
  output [15:0] io_enqSelOHVec_1_bits
);

  assign io_enqSelOHVec_0_valid = |io_canEnq;
  assign io_enqSelOHVec_0_bits =
    {io_canEnq[15]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13],
          io_canEnq[14]} == 15'h0,
     io_canEnq[14]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12],
          io_canEnq[13]} == 14'h0,
     io_canEnq[13]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11],
          io_canEnq[12]} == 13'h0,
     io_canEnq[12]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10],
          io_canEnq[11]} == 12'h0,
     io_canEnq[11]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9],
          io_canEnq[10]} == 11'h0,
     io_canEnq[10]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8],
          io_canEnq[9]} == 10'h0,
     io_canEnq[9]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7],
          io_canEnq[8]} == 9'h0,
     io_canEnq[8]
       & {io_canEnq[0],
          io_canEnq[1],
          io_canEnq[2],
          io_canEnq[3],
          io_canEnq[4],
          io_canEnq[5],
          io_canEnq[6],
          io_canEnq[7]} == 8'h0,
     io_canEnq[7]
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
    io_canEnq[0] & (|(io_canEnq[15:1])) | io_canEnq[1] & (|(io_canEnq[15:2]))
    | io_canEnq[2] & (|(io_canEnq[15:3])) | io_canEnq[3] & (|(io_canEnq[15:4]))
    | io_canEnq[4] & (|(io_canEnq[15:5])) | io_canEnq[5] & (|(io_canEnq[15:6]))
    | io_canEnq[6] & (|(io_canEnq[15:7])) | io_canEnq[7] & (|(io_canEnq[15:8]))
    | io_canEnq[8] & (|(io_canEnq[15:9])) | io_canEnq[9] & (|(io_canEnq[15:10]))
    | io_canEnq[10] & (|(io_canEnq[15:11])) | io_canEnq[11] & (|(io_canEnq[15:12]))
    | io_canEnq[12] & (|(io_canEnq[15:13])) | io_canEnq[13] & (|(io_canEnq[15:14]))
    | io_canEnq[14] & io_canEnq[15];
  assign io_enqSelOHVec_1_bits =
    {io_canEnq[15],
     io_canEnq[14] & ~(io_canEnq[15]),
     io_canEnq[13] & io_canEnq[15:14] == 2'h0,
     io_canEnq[12] & io_canEnq[15:13] == 3'h0,
     io_canEnq[11] & io_canEnq[15:12] == 4'h0,
     io_canEnq[10] & io_canEnq[15:11] == 5'h0,
     io_canEnq[9] & io_canEnq[15:10] == 6'h0,
     io_canEnq[8] & io_canEnq[15:9] == 7'h0,
     io_canEnq[7] & io_canEnq[15:8] == 8'h0,
     io_canEnq[6] & io_canEnq[15:7] == 9'h0,
     io_canEnq[5] & io_canEnq[15:6] == 10'h0,
     io_canEnq[4] & io_canEnq[15:5] == 11'h0,
     io_canEnq[3] & io_canEnq[15:4] == 12'h0,
     io_canEnq[2] & io_canEnq[15:3] == 13'h0,
     io_canEnq[1] & io_canEnq[15:2] == 14'h0,
     io_canEnq[0] & io_canEnq[15:1] == 15'h0};
endmodule

