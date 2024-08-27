// Generated by CIRCT firtool-1.74.0
module ShiftResultSelect(
  input  [3:0]  io_func,
  input  [63:0] io_sll,
  input  [63:0] io_srl,
  input  [63:0] io_sra,
  input  [63:0] io_rol,
  input  [63:0] io_ror,
  input  [63:0] io_bclr,
  input  [63:0] io_bset,
  input  [63:0] io_binv,
  input  [63:0] io_bext,
  output [63:0] io_shiftRes
);

  wire [7:0][63:0] _GEN =
    {{io_sra}, {io_bext}, {io_srl}, {io_binv}, {io_bset}, {io_bclr}, {io_sll}, {io_sll}};
  assign io_shiftRes = io_func[3] ? (io_func[1] ? io_ror : io_rol) : _GEN[io_func[2:0]];
endmodule

