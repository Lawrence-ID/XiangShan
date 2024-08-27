// Generated by CIRCT firtool-1.74.0
module Mhpmevent13Module(
  output [63:0] rdata,
  output        regOut_OF,
  output        regOut_MINH,
  output        regOut_SINH,
  output        regOut_UINH,
  output        regOut_VSINH,
  output        regOut_VUINH,
  input  [63:0] perfEvents_10
);

  assign rdata = {perfEvents_10[63:58], 58'h0};
  assign regOut_OF = perfEvents_10[63];
  assign regOut_MINH = perfEvents_10[62];
  assign regOut_SINH = perfEvents_10[61];
  assign regOut_UINH = perfEvents_10[60];
  assign regOut_VSINH = perfEvents_10[59];
  assign regOut_VUINH = perfEvents_10[58];
endmodule

