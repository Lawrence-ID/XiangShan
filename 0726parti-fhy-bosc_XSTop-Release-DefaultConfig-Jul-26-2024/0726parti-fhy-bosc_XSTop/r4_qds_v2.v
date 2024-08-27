// Generated by CIRCT firtool-1.74.0
module r4_qds_v2(
  input  [5:0] io_rem_i,
  output [4:0] io_quo_dig_o
);

  wire [5:0] _qds_sign_T = 6'(io_rem_i - 6'hC);
  wire [5:0] _qds_sign_T_4 = 6'(io_rem_i - 6'h3);
  wire [5:0] _qds_sign_T_8 = 6'(io_rem_i + 6'h4);
  wire [5:0] _qds_sign_T_12 = 6'(io_rem_i + 6'hD);
  wire [1:0] _io_quo_dig_o_T_2 = {_qds_sign_T_8[5], _qds_sign_T_12[5]};
  wire [1:0] _io_quo_dig_o_T_8 = {_qds_sign_T[5], _qds_sign_T_4[5]};
  assign io_quo_dig_o =
    {&_io_quo_dig_o_T_2,
     _io_quo_dig_o_T_2 == 2'h2,
     {_qds_sign_T_4[5], _qds_sign_T_8[5]} == 2'h2,
     _io_quo_dig_o_T_8 == 2'h2,
     _io_quo_dig_o_T_8 == 2'h0};
endmodule

