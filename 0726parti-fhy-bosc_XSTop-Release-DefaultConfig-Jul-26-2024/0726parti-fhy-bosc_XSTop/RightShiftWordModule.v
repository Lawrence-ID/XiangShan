// Generated by CIRCT firtool-1.74.0
module RightShiftWordModule(
  input  [4:0]  io_shamt,
  input  [4:0]  io_revShamt,
  input  [31:0] io_srlSrc,
  input  [31:0] io_sraSrc,
  output [31:0] io_srlw,
  output [31:0] io_sraw,
  output [31:0] io_revSrlw
);

  wire [31:0] _GEN = {27'h0, io_shamt};
  assign io_srlw = io_srlSrc >> _GEN;
  assign io_sraw = $signed($signed(io_sraSrc) >>> _GEN);
  assign io_revSrlw = io_srlSrc >> io_revShamt;
endmodule

