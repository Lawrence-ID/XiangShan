// Generated by CIRCT firtool-1.74.0
// Include register initializers in init blocks unless synthesis is set
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS
// Standard header to adapt well known macros for register randomization.
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
module AgeDetector_15(
  input        clock,
  input        reset,
  input  [7:0] io_enq_0,
  input  [7:0] io_enq_1,
  input  [7:0] io_canIssue_0,
  output [7:0] io_out_0
);

  reg        age_0_1;
  reg        age_0_2;
  reg        age_0_3;
  reg        age_0_4;
  reg        age_0_5;
  reg        age_0_6;
  reg        age_0_7;
  reg        age_1_2;
  reg        age_1_3;
  reg        age_1_4;
  reg        age_1_5;
  reg        age_1_6;
  reg        age_1_7;
  reg        age_2_3;
  reg        age_2_4;
  reg        age_2_5;
  reg        age_2_6;
  reg        age_2_7;
  reg        age_3_4;
  reg        age_3_5;
  reg        age_3_6;
  reg        age_3_7;
  reg        age_4_5;
  reg        age_4_6;
  reg        age_4_7;
  reg        age_5_6;
  reg        age_5_7;
  reg        age_6_7;
  wire [7:0] _io_out_0_T_71 = ~io_canIssue_0;
  wire [7:0] _io_out_0_T_9 =
    {age_1_7, age_1_6, age_1_5, age_1_4, age_1_3, age_1_2, 1'h1, ~age_0_1}
    | _io_out_0_T_71;
  wire [7:0] _io_out_0_T_17 =
    {age_2_7, age_2_6, age_2_5, age_2_4, age_2_3, 1'h1, ~age_1_2, ~age_0_2}
    | _io_out_0_T_71;
  wire [7:0] _io_out_0_T_26 =
    {age_3_7, age_3_6, age_3_5, age_3_4, 1'h1, ~age_2_3, ~age_1_3, ~age_0_3}
    | _io_out_0_T_71;
  wire [7:0] _io_out_0_T_36 =
    {age_4_7, age_4_6, age_4_5, 1'h1, ~age_3_4, ~age_2_4, ~age_1_4, ~age_0_4}
    | _io_out_0_T_71;
  wire [7:0] _io_out_0_T_47 =
    {age_5_7, age_5_6, 1'h1, ~age_4_5, ~age_3_5, ~age_2_5, ~age_1_5, ~age_0_5}
    | _io_out_0_T_71;
  wire [7:0] _io_out_0_T_59 =
    {age_6_7, 1'h1, ~age_5_6, ~age_4_6, ~age_3_6, ~age_2_6, ~age_1_6, ~age_0_6}
    | _io_out_0_T_71;
  wire [1:0] _GEN = {io_enq_1[0], io_enq_0[0]};
  wire [1:0] _GEN_0 = {io_enq_1[1], io_enq_0[1]};
  wire       _GEN_1 = _GEN == 2'h0;
  wire [1:0] _GEN_2 = {io_enq_1[2], io_enq_0[2]};
  wire [1:0] _GEN_3 = {io_enq_1[3], io_enq_0[3]};
  wire [1:0] _GEN_4 = {io_enq_1[4], io_enq_0[4]};
  wire [1:0] _GEN_5 = {io_enq_1[5], io_enq_0[5]};
  wire [1:0] _GEN_6 = {io_enq_1[6], io_enq_0[6]};
  wire [1:0] _GEN_7 = {io_enq_1[7], io_enq_0[7]};
  wire       _GEN_8 = _GEN_0 == 2'h0;
  wire       _GEN_9 = _GEN_2 == 2'h0;
  wire       _GEN_10 = _GEN_3 == 2'h0;
  wire       _GEN_11 = _GEN_4 == 2'h0;
  wire       _GEN_12 = _GEN_5 == 2'h0;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      age_0_1 <= 1'h0;
      age_0_2 <= 1'h0;
      age_0_3 <= 1'h0;
      age_0_4 <= 1'h0;
      age_0_5 <= 1'h0;
      age_0_6 <= 1'h0;
      age_0_7 <= 1'h0;
      age_1_2 <= 1'h0;
      age_1_3 <= 1'h0;
      age_1_4 <= 1'h0;
      age_1_5 <= 1'h0;
      age_1_6 <= 1'h0;
      age_1_7 <= 1'h0;
      age_2_3 <= 1'h0;
      age_2_4 <= 1'h0;
      age_2_5 <= 1'h0;
      age_2_6 <= 1'h0;
      age_2_7 <= 1'h0;
      age_3_4 <= 1'h0;
      age_3_5 <= 1'h0;
      age_3_6 <= 1'h0;
      age_3_7 <= 1'h0;
      age_4_5 <= 1'h0;
      age_4_6 <= 1'h0;
      age_4_7 <= 1'h0;
      age_5_6 <= 1'h0;
      age_5_7 <= 1'h0;
      age_6_7 <= 1'h0;
    end
    else begin
      if ((|{io_enq_1[0], io_enq_0[0]}) | (|{io_enq_1[1], io_enq_0[1]}))
        age_0_1 <=
          (|_GEN) & (|_GEN_0)
            ? ~(io_enq_1[0] & io_enq_0[1])
            : _GEN_1 & ((|_GEN_0) | age_0_1);
      if ((|{io_enq_1[0], io_enq_0[0]}) | (|{io_enq_1[2], io_enq_0[2]}))
        age_0_2 <=
          (|_GEN) & (|_GEN_2)
            ? ~(io_enq_1[0] & io_enq_0[2])
            : _GEN_1 & ((|_GEN_2) | age_0_2);
      if ((|{io_enq_1[0], io_enq_0[0]}) | (|{io_enq_1[3], io_enq_0[3]}))
        age_0_3 <=
          (|_GEN) & (|_GEN_3)
            ? ~(io_enq_1[0] & io_enq_0[3])
            : _GEN_1 & ((|_GEN_3) | age_0_3);
      if ((|{io_enq_1[0], io_enq_0[0]}) | (|{io_enq_1[4], io_enq_0[4]}))
        age_0_4 <=
          (|_GEN) & (|_GEN_4)
            ? ~(io_enq_1[0] & io_enq_0[4])
            : _GEN_1 & ((|_GEN_4) | age_0_4);
      if ((|{io_enq_1[0], io_enq_0[0]}) | (|{io_enq_1[5], io_enq_0[5]}))
        age_0_5 <=
          (|_GEN) & (|_GEN_5)
            ? ~(io_enq_1[0] & io_enq_0[5])
            : _GEN_1 & ((|_GEN_5) | age_0_5);
      if ((|{io_enq_1[0], io_enq_0[0]}) | (|{io_enq_1[6], io_enq_0[6]}))
        age_0_6 <=
          (|_GEN) & (|_GEN_6)
            ? ~(io_enq_1[0] & io_enq_0[6])
            : _GEN_1 & ((|_GEN_6) | age_0_6);
      if ((|{io_enq_1[0], io_enq_0[0]}) | (|{io_enq_1[7], io_enq_0[7]}))
        age_0_7 <=
          (|_GEN) & (|_GEN_7)
            ? ~(io_enq_1[0] & io_enq_0[7])
            : _GEN_1 & ((|_GEN_7) | age_0_7);
      if ((|{io_enq_1[1], io_enq_0[1]}) | (|{io_enq_1[2], io_enq_0[2]}))
        age_1_2 <=
          (|_GEN_0) & (|_GEN_2)
            ? ~(io_enq_1[1] & io_enq_0[2])
            : _GEN_8 & ((|_GEN_2) | age_1_2);
      if ((|{io_enq_1[1], io_enq_0[1]}) | (|{io_enq_1[3], io_enq_0[3]}))
        age_1_3 <=
          (|_GEN_0) & (|_GEN_3)
            ? ~(io_enq_1[1] & io_enq_0[3])
            : _GEN_8 & ((|_GEN_3) | age_1_3);
      if ((|{io_enq_1[1], io_enq_0[1]}) | (|{io_enq_1[4], io_enq_0[4]}))
        age_1_4 <=
          (|_GEN_0) & (|_GEN_4)
            ? ~(io_enq_1[1] & io_enq_0[4])
            : _GEN_8 & ((|_GEN_4) | age_1_4);
      if ((|{io_enq_1[1], io_enq_0[1]}) | (|{io_enq_1[5], io_enq_0[5]}))
        age_1_5 <=
          (|_GEN_0) & (|_GEN_5)
            ? ~(io_enq_1[1] & io_enq_0[5])
            : _GEN_8 & ((|_GEN_5) | age_1_5);
      if ((|{io_enq_1[1], io_enq_0[1]}) | (|{io_enq_1[6], io_enq_0[6]}))
        age_1_6 <=
          (|_GEN_0) & (|_GEN_6)
            ? ~(io_enq_1[1] & io_enq_0[6])
            : _GEN_8 & ((|_GEN_6) | age_1_6);
      if ((|{io_enq_1[1], io_enq_0[1]}) | (|{io_enq_1[7], io_enq_0[7]}))
        age_1_7 <=
          (|_GEN_0) & (|_GEN_7)
            ? ~(io_enq_1[1] & io_enq_0[7])
            : _GEN_8 & ((|_GEN_7) | age_1_7);
      if ((|{io_enq_1[2], io_enq_0[2]}) | (|{io_enq_1[3], io_enq_0[3]}))
        age_2_3 <=
          (|_GEN_2) & (|_GEN_3)
            ? ~(io_enq_1[2] & io_enq_0[3])
            : _GEN_9 & ((|_GEN_3) | age_2_3);
      if ((|{io_enq_1[2], io_enq_0[2]}) | (|{io_enq_1[4], io_enq_0[4]}))
        age_2_4 <=
          (|_GEN_2) & (|_GEN_4)
            ? ~(io_enq_1[2] & io_enq_0[4])
            : _GEN_9 & ((|_GEN_4) | age_2_4);
      if ((|{io_enq_1[2], io_enq_0[2]}) | (|{io_enq_1[5], io_enq_0[5]}))
        age_2_5 <=
          (|_GEN_2) & (|_GEN_5)
            ? ~(io_enq_1[2] & io_enq_0[5])
            : _GEN_9 & ((|_GEN_5) | age_2_5);
      if ((|{io_enq_1[2], io_enq_0[2]}) | (|{io_enq_1[6], io_enq_0[6]}))
        age_2_6 <=
          (|_GEN_2) & (|_GEN_6)
            ? ~(io_enq_1[2] & io_enq_0[6])
            : _GEN_9 & ((|_GEN_6) | age_2_6);
      if ((|{io_enq_1[2], io_enq_0[2]}) | (|{io_enq_1[7], io_enq_0[7]}))
        age_2_7 <=
          (|_GEN_2) & (|_GEN_7)
            ? ~(io_enq_1[2] & io_enq_0[7])
            : _GEN_9 & ((|_GEN_7) | age_2_7);
      if ((|{io_enq_1[3], io_enq_0[3]}) | (|{io_enq_1[4], io_enq_0[4]}))
        age_3_4 <=
          (|_GEN_3) & (|_GEN_4)
            ? ~(io_enq_1[3] & io_enq_0[4])
            : _GEN_10 & ((|_GEN_4) | age_3_4);
      if ((|{io_enq_1[3], io_enq_0[3]}) | (|{io_enq_1[5], io_enq_0[5]}))
        age_3_5 <=
          (|_GEN_3) & (|_GEN_5)
            ? ~(io_enq_1[3] & io_enq_0[5])
            : _GEN_10 & ((|_GEN_5) | age_3_5);
      if ((|{io_enq_1[3], io_enq_0[3]}) | (|{io_enq_1[6], io_enq_0[6]}))
        age_3_6 <=
          (|_GEN_3) & (|_GEN_6)
            ? ~(io_enq_1[3] & io_enq_0[6])
            : _GEN_10 & ((|_GEN_6) | age_3_6);
      if ((|{io_enq_1[3], io_enq_0[3]}) | (|{io_enq_1[7], io_enq_0[7]}))
        age_3_7 <=
          (|_GEN_3) & (|_GEN_7)
            ? ~(io_enq_1[3] & io_enq_0[7])
            : _GEN_10 & ((|_GEN_7) | age_3_7);
      if ((|{io_enq_1[4], io_enq_0[4]}) | (|{io_enq_1[5], io_enq_0[5]}))
        age_4_5 <=
          (|_GEN_4) & (|_GEN_5)
            ? ~(io_enq_1[4] & io_enq_0[5])
            : _GEN_11 & ((|_GEN_5) | age_4_5);
      if ((|{io_enq_1[4], io_enq_0[4]}) | (|{io_enq_1[6], io_enq_0[6]}))
        age_4_6 <=
          (|_GEN_4) & (|_GEN_6)
            ? ~(io_enq_1[4] & io_enq_0[6])
            : _GEN_11 & ((|_GEN_6) | age_4_6);
      if ((|{io_enq_1[4], io_enq_0[4]}) | (|{io_enq_1[7], io_enq_0[7]}))
        age_4_7 <=
          (|_GEN_4) & (|_GEN_7)
            ? ~(io_enq_1[4] & io_enq_0[7])
            : _GEN_11 & ((|_GEN_7) | age_4_7);
      if ((|{io_enq_1[5], io_enq_0[5]}) | (|{io_enq_1[6], io_enq_0[6]}))
        age_5_6 <=
          (|_GEN_5) & (|_GEN_6)
            ? ~(io_enq_1[5] & io_enq_0[6])
            : _GEN_12 & ((|_GEN_6) | age_5_6);
      if ((|{io_enq_1[5], io_enq_0[5]}) | (|{io_enq_1[7], io_enq_0[7]}))
        age_5_7 <=
          (|_GEN_5) & (|_GEN_7)
            ? ~(io_enq_1[5] & io_enq_0[7])
            : _GEN_12 & ((|_GEN_7) | age_5_7);
      if ((|{io_enq_1[6], io_enq_0[6]}) | (|{io_enq_1[7], io_enq_0[7]}))
        age_6_7 <=
          (|_GEN_6) & (|_GEN_7)
            ? ~(io_enq_1[6] & io_enq_0[7])
            : _GEN_6 == 2'h0 & ((|_GEN_7) | age_6_7);
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:1];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        age_0_1 = _RANDOM[1'h0][1];
        age_0_2 = _RANDOM[1'h0][2];
        age_0_3 = _RANDOM[1'h0][3];
        age_0_4 = _RANDOM[1'h0][4];
        age_0_5 = _RANDOM[1'h0][5];
        age_0_6 = _RANDOM[1'h0][6];
        age_0_7 = _RANDOM[1'h0][7];
        age_1_2 = _RANDOM[1'h0][10];
        age_1_3 = _RANDOM[1'h0][11];
        age_1_4 = _RANDOM[1'h0][12];
        age_1_5 = _RANDOM[1'h0][13];
        age_1_6 = _RANDOM[1'h0][14];
        age_1_7 = _RANDOM[1'h0][15];
        age_2_3 = _RANDOM[1'h0][19];
        age_2_4 = _RANDOM[1'h0][20];
        age_2_5 = _RANDOM[1'h0][21];
        age_2_6 = _RANDOM[1'h0][22];
        age_2_7 = _RANDOM[1'h0][23];
        age_3_4 = _RANDOM[1'h0][28];
        age_3_5 = _RANDOM[1'h0][29];
        age_3_6 = _RANDOM[1'h0][30];
        age_3_7 = _RANDOM[1'h0][31];
        age_4_5 = _RANDOM[1'h1][5];
        age_4_6 = _RANDOM[1'h1][6];
        age_4_7 = _RANDOM[1'h1][7];
        age_5_6 = _RANDOM[1'h1][14];
        age_5_7 = _RANDOM[1'h1][15];
        age_6_7 = _RANDOM[1'h1][23];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        age_0_1 = 1'h0;
        age_0_2 = 1'h0;
        age_0_3 = 1'h0;
        age_0_4 = 1'h0;
        age_0_5 = 1'h0;
        age_0_6 = 1'h0;
        age_0_7 = 1'h0;
        age_1_2 = 1'h0;
        age_1_3 = 1'h0;
        age_1_4 = 1'h0;
        age_1_5 = 1'h0;
        age_1_6 = 1'h0;
        age_1_7 = 1'h0;
        age_2_3 = 1'h0;
        age_2_4 = 1'h0;
        age_2_5 = 1'h0;
        age_2_6 = 1'h0;
        age_2_7 = 1'h0;
        age_3_4 = 1'h0;
        age_3_5 = 1'h0;
        age_3_6 = 1'h0;
        age_3_7 = 1'h0;
        age_4_5 = 1'h0;
        age_4_6 = 1'h0;
        age_4_7 = 1'h0;
        age_5_6 = 1'h0;
        age_5_7 = 1'h0;
        age_6_7 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_out_0 =
    {(&({~age_6_7, ~age_5_7, ~age_4_7, ~age_3_7, ~age_2_7, ~age_1_7, ~age_0_7}
        | _io_out_0_T_71[6:0])) & io_canIssue_0[7],
     (&{_io_out_0_T_59[7], _io_out_0_T_59[5:0]}) & io_canIssue_0[6],
     (&{_io_out_0_T_47[7:6], _io_out_0_T_47[4:0]}) & io_canIssue_0[5],
     (&{_io_out_0_T_36[7:5], _io_out_0_T_36[3:0]}) & io_canIssue_0[4],
     (&{_io_out_0_T_26[7:4], _io_out_0_T_26[2:0]}) & io_canIssue_0[3],
     (&{_io_out_0_T_17[7:3], _io_out_0_T_17[1:0]}) & io_canIssue_0[2],
     (&{_io_out_0_T_9[7:2], _io_out_0_T_9[0]}) & io_canIssue_0[1],
     (&({age_0_7, age_0_6, age_0_5, age_0_4, age_0_3, age_0_2, age_0_1}
        | _io_out_0_T_71[7:1])) & io_canIssue_0[0]};
endmodule

