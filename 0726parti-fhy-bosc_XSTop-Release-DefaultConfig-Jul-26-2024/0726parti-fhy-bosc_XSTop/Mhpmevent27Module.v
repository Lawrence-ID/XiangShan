// Generated by CIRCT firtool-1.74.0
module Mhpmevent27Module(
  output [63:0] rdata,
  output        regOut_OF,
  output        regOut_MINH,
  output        regOut_SINH,
  output        regOut_UINH,
  output        regOut_VSINH,
  output        regOut_VUINH,
  input  [63:0] perfEvents_24
);

  assign rdata = {perfEvents_24[63:58], 58'h0};
  assign regOut_OF = perfEvents_24[63];
  assign regOut_MINH = perfEvents_24[62];
  assign regOut_SINH = perfEvents_24[61];
  assign regOut_UINH = perfEvents_24[60];
  assign regOut_VSINH = perfEvents_24[59];
  assign regOut_VUINH = perfEvents_24[58];
endmodule

