// Generated by CIRCT firtool-1.74.0
module IterBlockI8Nr4(
  input  [8:0] io_d_cons_0,
  input  [8:0] io_d_cons_1,
  input  [8:0] io_d_cons_2,
  input  [8:0] io_d_cons_3,
  input  [8:0] io_pre_w,
  input  [7:0] io_pre_w_low,
  output [8:0] io_nxt_w,
  output [7:0] io_nxt_w_low,
  input  [7:0] io_pre_q,
  output [7:0] io_nxt_q
);

  wire [3:0][8:0] _GEN = {{io_d_cons_3}, {io_d_cons_2}, {io_d_cons_1}, {io_d_cons_0}};
  wire [8:0]      _tmp_T =
    9'(_GEN[2'({1'h0, io_pre_w[8]} + 2'h1)] + {io_pre_w[7:0], io_pre_w_low[7]});
  wire [8:0]      _GEN_0 = {io_pre_w[6:0], io_pre_w_low[7:6]};
  wire [1:0]      _GEN_1 = {io_pre_w[8], _tmp_T[8]};
  wire [8:0]      _io_nxt_w_T_10 =
    (_GEN_1 == 2'h0 ? 9'(io_d_cons_0 + _GEN_0) : 9'h0)
    | (_GEN_1 == 2'h1 ? 9'(io_d_cons_1 + _GEN_0) : 9'h0)
    | (_GEN_1 == 2'h2 ? 9'(io_d_cons_2 + _GEN_0) : 9'h0)
    | ((&_GEN_1) ? 9'(io_d_cons_3 + _GEN_0) : 9'h0);
  assign io_nxt_w = _io_nxt_w_T_10;
  assign io_nxt_w_low = {io_pre_w_low[5:0], 2'h0};
  assign io_nxt_q = {io_pre_q[5:0], ~(_tmp_T[8]), ~(_io_nxt_w_T_10[8])};
endmodule

