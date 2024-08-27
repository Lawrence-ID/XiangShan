// Generated by CIRCT firtool-1.62.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM
// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM
// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY
// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_
// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS
// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS
module I8DivNr4(
  input        clock,
  input        reset,
  input        io_sign,
  input  [7:0] io_dividend,
  input  [7:0] io_divisor,
  input        io_flush,
  input        io_div_in_valid,
  input        io_div_out_ready,
  output       io_div_out_valid,
  output [7:0] io_div_out_q,
  output [7:0] io_div_out_rem
);

  wire [8:0] _iter_b_io_nxt_w;
  wire [7:0] _iter_b_io_nxt_w_low;
  wire [7:0] _iter_b_io_nxt_q;
  reg  [5:0] stateReg;
  reg  [7:0] iter_q_reg;
  reg  [8:0] iter_w_reg;
  reg  [7:0] iter_w_low_reg;
  wire       x_sign = io_sign & io_dividend[7];
  reg        x_sign_reg;
  wire       d_sign = io_sign & io_divisor[7];
  wire [7:0] neg_x_q = 8'(8'h0 - (stateReg[1] ? io_dividend : iter_q_reg));
  wire [7:0] abs_x = x_sign ? neg_x_q : io_dividend;
  wire [7:0] abs_d = d_sign ? 8'(8'h0 - io_divisor) : io_divisor;
  reg        q_sign_reg;
  wire       x_small = abs_x < abs_d;
  wire       d_zero = abs_d == 8'h0;
  reg        zero_d_reg;
  wire       early_finish = x_small | abs_x == 8'h0 | d_zero;
  reg        early_finish_q;
  reg  [2:0] iter_num_reg;
  wire [2:0] _iter_num_T_2 = 3'(iter_num_reg - 3'h1);
  reg  [9:0] const_d_reg_0;
  reg  [9:0] const_d_reg_1;
  reg  [9:0] const_d_reg_2;
  reg  [9:0] const_d_reg_3;
  reg  [7:0] out_q_final_reg;
  reg  [7:0] out_rem_final_reg;
  always @(posedge clock or posedge reset) begin
    if (reset)
      stateReg <= 6'h1;
    else if (stateReg[0] & io_div_in_valid & stateReg[0])
      stateReg <= 6'h2;
    else if (stateReg[1])
      stateReg <= {1'h0, early_finish ? 5'h8 : 5'h4};
    else if (stateReg[2])
      stateReg <= {1'h0, (|(stateReg[1] ? 3'h4 : _iter_num_T_2)) ? 5'h4 : 5'h8};
    else if (stateReg[3])
      stateReg <= 6'h10;
    else if (stateReg[4] & io_div_out_ready | io_flush)
      stateReg <= 6'h1;
  end // always @(posedge, posedge)
  wire [8:0] neg_d_ext = 9'(9'h0 - {1'h0, abs_d});
  wire [7:0] _out_rem_adjust_T_2 = 8'(8'h0 - iter_w_reg[7:0]);
  always @(posedge clock) begin
    if (stateReg[1] | stateReg[2]) begin
      if (stateReg[1]) begin
        if (~early_finish | x_small)
          iter_q_reg <= 8'h0;
        else
          iter_q_reg <= {8{d_zero}};
      end
      else
        iter_q_reg <= _iter_b_io_nxt_q;
    end
    if (stateReg[1] | stateReg[2])
      iter_w_reg <=
        stateReg[1]
          ? (early_finish ? {1'h0, x_small | d_zero ? abs_x : 8'h0} : 9'h0)
          : _iter_b_io_nxt_w;
    if (stateReg[1] | stateReg[2])
      iter_w_low_reg <= stateReg[1] ? abs_x : _iter_b_io_nxt_w_low;
    if (stateReg[1])
      x_sign_reg <= x_sign;
    if (stateReg[1])
      q_sign_reg <= x_sign ^ d_sign;
    if (stateReg[1])
      zero_d_reg <= d_zero;
    if (stateReg[1])
      early_finish_q <= early_finish;
    if (stateReg[1] | stateReg[2]) begin
      if (stateReg[1])
        iter_num_reg <= 3'h4;
      else
        iter_num_reg <= _iter_num_T_2;
    end
    if (stateReg[1]) begin
      const_d_reg_0 <= 10'({1'h0, neg_d_ext} + {neg_d_ext, 1'h0});
      const_d_reg_1 <= {1'h0, neg_d_ext};
      const_d_reg_2 <= {2'h0, abs_d};
      const_d_reg_3 <= 10'({2'h0, abs_d} + {1'h0, abs_d, 1'h0});
    end
    if (stateReg[3])
      out_q_final_reg <= q_sign_reg & ~zero_d_reg ? neg_x_q : iter_q_reg;
    if (stateReg[3])
      out_rem_final_reg <=
        iter_w_reg[8] & ~early_finish_q
          ? (x_sign_reg
               ? 8'(_out_rem_adjust_T_2 + const_d_reg_1[7:0])
               : 8'(iter_w_reg[7:0] + const_d_reg_2[7:0]))
          : x_sign_reg ? _out_rem_adjust_T_2 : iter_w_reg[7:0];
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:2];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        stateReg = _RANDOM[2'h0][5:0];
        iter_q_reg = _RANDOM[2'h0][13:6];
        iter_w_reg = _RANDOM[2'h0][22:14];
        iter_w_low_reg = _RANDOM[2'h0][30:23];
        x_sign_reg = _RANDOM[2'h0][31];
        q_sign_reg = _RANDOM[2'h1][0];
        zero_d_reg = _RANDOM[2'h1][1];
        early_finish_q = _RANDOM[2'h1][2];
        iter_num_reg = _RANDOM[2'h1][5:3];
        const_d_reg_0 = _RANDOM[2'h1][15:6];
        const_d_reg_1 = _RANDOM[2'h1][25:16];
        const_d_reg_2 = {_RANDOM[2'h1][31:26], _RANDOM[2'h2][3:0]};
        const_d_reg_3 = _RANDOM[2'h2][13:4];
        out_q_final_reg = _RANDOM[2'h2][21:14];
        out_rem_final_reg = _RANDOM[2'h2][29:22];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        stateReg = 6'h1;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  IterBlockI8Nr4 iter_b (
    .io_d_cons_0  (const_d_reg_0[8:0]),
    .io_d_cons_1  (const_d_reg_1[8:0]),
    .io_d_cons_2  (const_d_reg_2[8:0]),
    .io_d_cons_3  (const_d_reg_3[8:0]),
    .io_pre_w     (iter_w_reg),
    .io_pre_w_low (iter_w_low_reg),
    .io_nxt_w     (_iter_b_io_nxt_w),
    .io_nxt_w_low (_iter_b_io_nxt_w_low),
    .io_pre_q     (iter_q_reg),
    .io_nxt_q     (_iter_b_io_nxt_q)
  );
  assign io_div_out_valid = stateReg[4];
  assign io_div_out_q = out_q_final_reg;
  assign io_div_out_rem = out_rem_final_reg;
endmodule

