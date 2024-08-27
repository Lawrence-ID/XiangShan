// Generated by CIRCT firtool-1.74.0
module Mhpmevent7Module(
  output [63:0] rdata,
  output        regOut_OF,
  output        regOut_MINH,
  output        regOut_SINH,
  output        regOut_UINH,
  output        regOut_VSINH,
  output        regOut_VUINH,
  input  [63:0] perfEvents_4
);

  assign rdata = {perfEvents_4[63:58], 58'h0};
  assign regOut_OF = perfEvents_4[63];
  assign regOut_MINH = perfEvents_4[62];
  assign regOut_SINH = perfEvents_4[61];
  assign regOut_UINH = perfEvents_4[60];
  assign regOut_VSINH = perfEvents_4[59];
  assign regOut_VUINH = perfEvents_4[58];
endmodule

