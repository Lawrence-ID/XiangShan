// Generated by CIRCT firtool-1.74.0
module indexedLSUopTable_3(
  input  [3:0] src,
  output [2:0] outOffsetVs2,
  output [2:0] outOffsetVd
);

  wire [3:0] out_invInputs = ~src;
  assign outOffsetVs2 =
    {1'h0,
     |{&{out_invInputs[0], src[3]}, &{out_invInputs[1], src[3]}, &{src[2], src[3]}},
     |{&{out_invInputs[0], src[1], src[2]}, src[3]}};
  assign outOffsetVd =
    {1'h0,
     |{&{src[1], out_invInputs[2]}, &{src[1], out_invInputs[3]}, &{src[0], src[1]}},
     |{src[1], &{src[0], out_invInputs[2], src[3]}}};
endmodule

