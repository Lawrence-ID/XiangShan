// Generated by CIRCT firtool-1.74.0
module Mhpmevent12Module(
  output [63:0] rdata,
  output        regOut_OF,
  output        regOut_MINH,
  output        regOut_SINH,
  output        regOut_UINH,
  output        regOut_VSINH,
  output        regOut_VUINH,
  input  [63:0] perfEvents_9
);

  assign rdata = {perfEvents_9[63:58], 58'h0};
  assign regOut_OF = perfEvents_9[63];
  assign regOut_MINH = perfEvents_9[62];
  assign regOut_SINH = perfEvents_9[61];
  assign regOut_UINH = perfEvents_9[60];
  assign regOut_VSINH = perfEvents_9[59];
  assign regOut_VUINH = perfEvents_9[58];
endmodule

