// Generated by CIRCT firtool-1.74.0
module r4_qds_cg(
  input        a0_i,
  input        a2_i,
  input        a3_i,
  input        a4_i,
  output [6:0] m_neg_1_o,
  output [6:0] m_neg_0_o,
  output [6:0] m_pos_1_o,
  output [6:0] m_pos_2_o
);

  wire [2:0] a2_a3_a4 = {a2_i, a3_i, a4_i};
  wire       _m_pos_2_o_T_1 = a2_a3_a4 == 3'h0;
  wire       _m_pos_2_o_T_4 = a2_a3_a4 == 3'h1;
  wire       _m_pos_2_o_T_7 = a2_a3_a4 == 3'h2;
  wire       _m_pos_2_o_T_10 = a2_a3_a4 == 3'h3;
  wire       _m_pos_2_o_T_13 = a2_a3_a4 == 3'h4;
  wire       _m_pos_2_o_T_16 = a2_a3_a4 == 3'h5;
  wire       _m_pos_2_o_T_19 = a2_a3_a4 == 3'h6;
  assign m_neg_1_o =
    (~a0_i & _m_pos_2_o_T_1 ? 7'hD : 7'h0) | (~a0_i & _m_pos_2_o_T_4 ? 7'hE : 7'h0)
    | {2'h0, ~a0_i & _m_pos_2_o_T_7, 4'h0} | (~a0_i & _m_pos_2_o_T_10 ? 7'h11 : 7'h0)
    | (~a0_i & _m_pos_2_o_T_13 ? 7'h12 : 7'h0) | (~a0_i & _m_pos_2_o_T_16 ? 7'h14 : 7'h0)
    | (~a0_i & _m_pos_2_o_T_19 ? 7'h16 : 7'h0) | (~a0_i & (&a2_a3_a4) ? 7'h17 : 7'h0)
    | (a0_i ? 7'h17 : 7'h0);
  assign m_neg_0_o =
    (~a0_i & _m_pos_2_o_T_4 ? 7'h5 : 7'h0) | (~a0_i & _m_pos_2_o_T_7 ? 7'h6 : 7'h0)
    | (~a0_i & _m_pos_2_o_T_10 ? 7'h6 : 7'h0) | (~a0_i & _m_pos_2_o_T_13 ? 7'h6 : 7'h0)
    | {3'h0,
       ~a0_i & _m_pos_2_o_T_19 | ~a0_i & (&a2_a3_a4) | a0_i | ~a0_i & _m_pos_2_o_T_16,
       ~a0_i & _m_pos_2_o_T_1,
       2'h0};
  assign m_pos_1_o =
    (~a0_i & _m_pos_2_o_T_1 | ~a0_i & _m_pos_2_o_T_4 | ~a0_i & _m_pos_2_o_T_7 | ~a0_i
     & _m_pos_2_o_T_10
       ? 7'h7C
       : 7'h0) | (~a0_i & _m_pos_2_o_T_13 ? 7'h7A : 7'h0)
    | (~a0_i & _m_pos_2_o_T_16 ? 7'h7A : 7'h0) | (~a0_i & _m_pos_2_o_T_19 ? 7'h78 : 7'h0)
    | (~a0_i & (&a2_a3_a4) ? 7'h78 : 7'h0) | (a0_i ? 7'h78 : 7'h0);
  assign m_pos_2_o =
    (~a0_i & _m_pos_2_o_T_1 ? 7'h74 : 7'h0) | (~a0_i & _m_pos_2_o_T_4 ? 7'h72 : 7'h0)
    | (~a0_i & _m_pos_2_o_T_7 ? 7'h70 : 7'h0) | (~a0_i & _m_pos_2_o_T_10 ? 7'h70 : 7'h0)
    | (~a0_i & _m_pos_2_o_T_13 ? 7'h6E : 7'h0) | (~a0_i & _m_pos_2_o_T_16 ? 7'h6C : 7'h0)
    | (~a0_i & _m_pos_2_o_T_19 ? 7'h6C : 7'h0) | (~a0_i & (&a2_a3_a4) ? 7'h6A : 7'h0)
    | (a0_i ? 7'h6A : 7'h0);
endmodule

