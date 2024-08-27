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
module DelayQueue_1(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [32:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [38:0] io_out_bits
);

  reg  [32:0]       queue_0_addrNoOffset;
  reg  [7:0]        queue_0_cnt;
  reg  [32:0]       queue_1_addrNoOffset;
  reg  [7:0]        queue_1_cnt;
  reg  [32:0]       queue_2_addrNoOffset;
  reg  [7:0]        queue_2_cnt;
  reg  [32:0]       queue_3_addrNoOffset;
  reg  [7:0]        queue_3_cnt;
  reg  [32:0]       queue_4_addrNoOffset;
  reg  [7:0]        queue_4_cnt;
  reg  [32:0]       queue_5_addrNoOffset;
  reg  [7:0]        queue_5_cnt;
  reg  [32:0]       queue_6_addrNoOffset;
  reg  [7:0]        queue_6_cnt;
  reg  [32:0]       queue_7_addrNoOffset;
  reg  [7:0]        queue_7_cnt;
  reg  [32:0]       queue_8_addrNoOffset;
  reg  [7:0]        queue_8_cnt;
  reg  [32:0]       queue_9_addrNoOffset;
  reg  [7:0]        queue_9_cnt;
  reg  [32:0]       queue_10_addrNoOffset;
  reg  [7:0]        queue_10_cnt;
  reg  [32:0]       queue_11_addrNoOffset;
  reg  [7:0]        queue_11_cnt;
  reg  [32:0]       queue_12_addrNoOffset;
  reg  [7:0]        queue_12_cnt;
  reg  [32:0]       queue_13_addrNoOffset;
  reg  [7:0]        queue_13_cnt;
  reg  [32:0]       queue_14_addrNoOffset;
  reg  [7:0]        queue_14_cnt;
  reg  [32:0]       queue_15_addrNoOffset;
  reg  [7:0]        queue_15_cnt;
  reg               valids_0;
  reg               valids_1;
  reg               valids_2;
  reg               valids_3;
  reg               valids_4;
  reg               valids_5;
  reg               valids_6;
  reg               valids_7;
  reg               valids_8;
  reg               valids_9;
  reg               valids_10;
  reg               valids_11;
  reg               valids_12;
  reg               valids_13;
  reg               valids_14;
  reg               valids_15;
  reg  [3:0]        head;
  reg  [3:0]        tail;
  wire              _full_T = head == tail;
  wire [15:0][32:0] _GEN =
    {{queue_15_addrNoOffset},
     {queue_14_addrNoOffset},
     {queue_13_addrNoOffset},
     {queue_12_addrNoOffset},
     {queue_11_addrNoOffset},
     {queue_10_addrNoOffset},
     {queue_9_addrNoOffset},
     {queue_8_addrNoOffset},
     {queue_7_addrNoOffset},
     {queue_6_addrNoOffset},
     {queue_5_addrNoOffset},
     {queue_4_addrNoOffset},
     {queue_3_addrNoOffset},
     {queue_2_addrNoOffset},
     {queue_1_addrNoOffset},
     {queue_0_addrNoOffset}};
  wire [15:0][7:0]  _GEN_0 =
    {{queue_15_cnt},
     {queue_14_cnt},
     {queue_13_cnt},
     {queue_12_cnt},
     {queue_11_cnt},
     {queue_10_cnt},
     {queue_9_cnt},
     {queue_8_cnt},
     {queue_7_cnt},
     {queue_6_cnt},
     {queue_5_cnt},
     {queue_4_cnt},
     {queue_3_cnt},
     {queue_2_cnt},
     {queue_1_cnt},
     {queue_0_cnt}};
  wire [15:0]       _GEN_1 =
    {{valids_15},
     {valids_14},
     {valids_13},
     {valids_12},
     {valids_11},
     {valids_10},
     {valids_9},
     {valids_8},
     {valids_7},
     {valids_6},
     {valids_5},
     {valids_4},
     {valids_3},
     {valids_2},
     {valids_1},
     {valids_0}};
  wire              outValid =
    ~(_full_T & ~valids_15) & _GEN_0[head] == 8'h0 & _GEN_1[head];
  wire              _GEN_2 = io_in_valid & ~(_full_T & valids_15);
  wire              _GEN_3 = _GEN_2 & tail == 4'h0;
  wire              _GEN_4 = _GEN_2 & tail == 4'h1;
  wire              _GEN_5 = _GEN_2 & tail == 4'h2;
  wire              _GEN_6 = _GEN_2 & tail == 4'h3;
  wire              _GEN_7 = _GEN_2 & tail == 4'h4;
  wire              _GEN_8 = _GEN_2 & tail == 4'h5;
  wire              _GEN_9 = _GEN_2 & tail == 4'h6;
  wire              _GEN_10 = _GEN_2 & tail == 4'h7;
  wire              _GEN_11 = _GEN_2 & tail == 4'h8;
  wire              _GEN_12 = _GEN_2 & tail == 4'h9;
  wire              _GEN_13 = _GEN_2 & tail == 4'hA;
  wire              _GEN_14 = _GEN_2 & tail == 4'hB;
  wire              _GEN_15 = _GEN_2 & tail == 4'hC;
  wire              _GEN_16 = _GEN_2 & tail == 4'hD;
  wire              _GEN_17 = _GEN_2 & tail == 4'hE;
  wire              _GEN_18 = _GEN_2 & (&tail);
  wire              _GEN_19 = outValid & io_out_ready;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      queue_0_addrNoOffset <= 33'h0;
      queue_0_cnt <= 8'h0;
      queue_1_addrNoOffset <= 33'h0;
      queue_1_cnt <= 8'h0;
      queue_2_addrNoOffset <= 33'h0;
      queue_2_cnt <= 8'h0;
      queue_3_addrNoOffset <= 33'h0;
      queue_3_cnt <= 8'h0;
      queue_4_addrNoOffset <= 33'h0;
      queue_4_cnt <= 8'h0;
      queue_5_addrNoOffset <= 33'h0;
      queue_5_cnt <= 8'h0;
      queue_6_addrNoOffset <= 33'h0;
      queue_6_cnt <= 8'h0;
      queue_7_addrNoOffset <= 33'h0;
      queue_7_cnt <= 8'h0;
      queue_8_addrNoOffset <= 33'h0;
      queue_8_cnt <= 8'h0;
      queue_9_addrNoOffset <= 33'h0;
      queue_9_cnt <= 8'h0;
      queue_10_addrNoOffset <= 33'h0;
      queue_10_cnt <= 8'h0;
      queue_11_addrNoOffset <= 33'h0;
      queue_11_cnt <= 8'h0;
      queue_12_addrNoOffset <= 33'h0;
      queue_12_cnt <= 8'h0;
      queue_13_addrNoOffset <= 33'h0;
      queue_13_cnt <= 8'h0;
      queue_14_addrNoOffset <= 33'h0;
      queue_14_cnt <= 8'h0;
      queue_15_addrNoOffset <= 33'h0;
      queue_15_cnt <= 8'h0;
      valids_0 <= 1'h0;
      valids_1 <= 1'h0;
      valids_2 <= 1'h0;
      valids_3 <= 1'h0;
      valids_4 <= 1'h0;
      valids_5 <= 1'h0;
      valids_6 <= 1'h0;
      valids_7 <= 1'h0;
      valids_8 <= 1'h0;
      valids_9 <= 1'h0;
      valids_10 <= 1'h0;
      valids_11 <= 1'h0;
      valids_12 <= 1'h0;
      valids_13 <= 1'h0;
      valids_14 <= 1'h0;
      valids_15 <= 1'h0;
      head <= 4'h0;
      tail <= 4'h0;
    end
    else begin
      if (_GEN_3)
        queue_0_addrNoOffset <= io_in_bits;
      if (|queue_0_cnt)
        queue_0_cnt <= 8'(queue_0_cnt - 8'h1);
      else if (_GEN_3)
        queue_0_cnt <= 8'hAF;
      if (_GEN_4)
        queue_1_addrNoOffset <= io_in_bits;
      if (|queue_1_cnt)
        queue_1_cnt <= 8'(queue_1_cnt - 8'h1);
      else if (_GEN_4)
        queue_1_cnt <= 8'hAF;
      if (_GEN_5)
        queue_2_addrNoOffset <= io_in_bits;
      if (|queue_2_cnt)
        queue_2_cnt <= 8'(queue_2_cnt - 8'h1);
      else if (_GEN_5)
        queue_2_cnt <= 8'hAF;
      if (_GEN_6)
        queue_3_addrNoOffset <= io_in_bits;
      if (|queue_3_cnt)
        queue_3_cnt <= 8'(queue_3_cnt - 8'h1);
      else if (_GEN_6)
        queue_3_cnt <= 8'hAF;
      if (_GEN_7)
        queue_4_addrNoOffset <= io_in_bits;
      if (|queue_4_cnt)
        queue_4_cnt <= 8'(queue_4_cnt - 8'h1);
      else if (_GEN_7)
        queue_4_cnt <= 8'hAF;
      if (_GEN_8)
        queue_5_addrNoOffset <= io_in_bits;
      if (|queue_5_cnt)
        queue_5_cnt <= 8'(queue_5_cnt - 8'h1);
      else if (_GEN_8)
        queue_5_cnt <= 8'hAF;
      if (_GEN_9)
        queue_6_addrNoOffset <= io_in_bits;
      if (|queue_6_cnt)
        queue_6_cnt <= 8'(queue_6_cnt - 8'h1);
      else if (_GEN_9)
        queue_6_cnt <= 8'hAF;
      if (_GEN_10)
        queue_7_addrNoOffset <= io_in_bits;
      if (|queue_7_cnt)
        queue_7_cnt <= 8'(queue_7_cnt - 8'h1);
      else if (_GEN_10)
        queue_7_cnt <= 8'hAF;
      if (_GEN_11)
        queue_8_addrNoOffset <= io_in_bits;
      if (|queue_8_cnt)
        queue_8_cnt <= 8'(queue_8_cnt - 8'h1);
      else if (_GEN_11)
        queue_8_cnt <= 8'hAF;
      if (_GEN_12)
        queue_9_addrNoOffset <= io_in_bits;
      if (|queue_9_cnt)
        queue_9_cnt <= 8'(queue_9_cnt - 8'h1);
      else if (_GEN_12)
        queue_9_cnt <= 8'hAF;
      if (_GEN_13)
        queue_10_addrNoOffset <= io_in_bits;
      if (|queue_10_cnt)
        queue_10_cnt <= 8'(queue_10_cnt - 8'h1);
      else if (_GEN_13)
        queue_10_cnt <= 8'hAF;
      if (_GEN_14)
        queue_11_addrNoOffset <= io_in_bits;
      if (|queue_11_cnt)
        queue_11_cnt <= 8'(queue_11_cnt - 8'h1);
      else if (_GEN_14)
        queue_11_cnt <= 8'hAF;
      if (_GEN_15)
        queue_12_addrNoOffset <= io_in_bits;
      if (|queue_12_cnt)
        queue_12_cnt <= 8'(queue_12_cnt - 8'h1);
      else if (_GEN_15)
        queue_12_cnt <= 8'hAF;
      if (_GEN_16)
        queue_13_addrNoOffset <= io_in_bits;
      if (|queue_13_cnt)
        queue_13_cnt <= 8'(queue_13_cnt - 8'h1);
      else if (_GEN_16)
        queue_13_cnt <= 8'hAF;
      if (_GEN_17)
        queue_14_addrNoOffset <= io_in_bits;
      if (|queue_14_cnt)
        queue_14_cnt <= 8'(queue_14_cnt - 8'h1);
      else if (_GEN_17)
        queue_14_cnt <= 8'hAF;
      if (_GEN_18)
        queue_15_addrNoOffset <= io_in_bits;
      if (|queue_15_cnt)
        queue_15_cnt <= 8'(queue_15_cnt - 8'h1);
      else if (_GEN_18)
        queue_15_cnt <= 8'hAF;
      valids_0 <= ~(_GEN_19 & head == 4'h0) & (_GEN_3 | valids_0);
      valids_1 <= ~(_GEN_19 & head == 4'h1) & (_GEN_4 | valids_1);
      valids_2 <= ~(_GEN_19 & head == 4'h2) & (_GEN_5 | valids_2);
      valids_3 <= ~(_GEN_19 & head == 4'h3) & (_GEN_6 | valids_3);
      valids_4 <= ~(_GEN_19 & head == 4'h4) & (_GEN_7 | valids_4);
      valids_5 <= ~(_GEN_19 & head == 4'h5) & (_GEN_8 | valids_5);
      valids_6 <= ~(_GEN_19 & head == 4'h6) & (_GEN_9 | valids_6);
      valids_7 <= ~(_GEN_19 & head == 4'h7) & (_GEN_10 | valids_7);
      valids_8 <= ~(_GEN_19 & head == 4'h8) & (_GEN_11 | valids_8);
      valids_9 <= ~(_GEN_19 & head == 4'h9) & (_GEN_12 | valids_9);
      valids_10 <= ~(_GEN_19 & head == 4'hA) & (_GEN_13 | valids_10);
      valids_11 <= ~(_GEN_19 & head == 4'hB) & (_GEN_14 | valids_11);
      valids_12 <= ~(_GEN_19 & head == 4'hC) & (_GEN_15 | valids_12);
      valids_13 <= ~(_GEN_19 & head == 4'hD) & (_GEN_16 | valids_13);
      valids_14 <= ~(_GEN_19 & head == 4'hE) & (_GEN_17 | valids_14);
      valids_15 <= ~(_GEN_19 & (&head)) & (_GEN_18 | valids_15);
      if (_GEN_19)
        head <= 4'(head + 4'h1);
      if (_GEN_2)
        tail <= 4'(tail + 4'h1);
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:21];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h16; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        queue_0_addrNoOffset = {_RANDOM[5'h0], _RANDOM[5'h1][0]};
        queue_0_cnt = _RANDOM[5'h1][8:1];
        queue_1_addrNoOffset = {_RANDOM[5'h1][31:9], _RANDOM[5'h2][9:0]};
        queue_1_cnt = _RANDOM[5'h2][17:10];
        queue_2_addrNoOffset = {_RANDOM[5'h2][31:18], _RANDOM[5'h3][18:0]};
        queue_2_cnt = _RANDOM[5'h3][26:19];
        queue_3_addrNoOffset = {_RANDOM[5'h3][31:27], _RANDOM[5'h4][27:0]};
        queue_3_cnt = {_RANDOM[5'h4][31:28], _RANDOM[5'h5][3:0]};
        queue_4_addrNoOffset = {_RANDOM[5'h5][31:4], _RANDOM[5'h6][4:0]};
        queue_4_cnt = _RANDOM[5'h6][12:5];
        queue_5_addrNoOffset = {_RANDOM[5'h6][31:13], _RANDOM[5'h7][13:0]};
        queue_5_cnt = _RANDOM[5'h7][21:14];
        queue_6_addrNoOffset = {_RANDOM[5'h7][31:22], _RANDOM[5'h8][22:0]};
        queue_6_cnt = _RANDOM[5'h8][30:23];
        queue_7_addrNoOffset = {_RANDOM[5'h8][31], _RANDOM[5'h9]};
        queue_7_cnt = _RANDOM[5'hA][7:0];
        queue_8_addrNoOffset = {_RANDOM[5'hA][31:8], _RANDOM[5'hB][8:0]};
        queue_8_cnt = _RANDOM[5'hB][16:9];
        queue_9_addrNoOffset = {_RANDOM[5'hB][31:17], _RANDOM[5'hC][17:0]};
        queue_9_cnt = _RANDOM[5'hC][25:18];
        queue_10_addrNoOffset = {_RANDOM[5'hC][31:26], _RANDOM[5'hD][26:0]};
        queue_10_cnt = {_RANDOM[5'hD][31:27], _RANDOM[5'hE][2:0]};
        queue_11_addrNoOffset = {_RANDOM[5'hE][31:3], _RANDOM[5'hF][3:0]};
        queue_11_cnt = _RANDOM[5'hF][11:4];
        queue_12_addrNoOffset = {_RANDOM[5'hF][31:12], _RANDOM[5'h10][12:0]};
        queue_12_cnt = _RANDOM[5'h10][20:13];
        queue_13_addrNoOffset = {_RANDOM[5'h10][31:21], _RANDOM[5'h11][21:0]};
        queue_13_cnt = _RANDOM[5'h11][29:22];
        queue_14_addrNoOffset = {_RANDOM[5'h11][31:30], _RANDOM[5'h12][30:0]};
        queue_14_cnt = {_RANDOM[5'h12][31], _RANDOM[5'h13][6:0]};
        queue_15_addrNoOffset = {_RANDOM[5'h13][31:7], _RANDOM[5'h14][7:0]};
        queue_15_cnt = _RANDOM[5'h14][15:8];
        valids_0 = _RANDOM[5'h14][16];
        valids_1 = _RANDOM[5'h14][17];
        valids_2 = _RANDOM[5'h14][18];
        valids_3 = _RANDOM[5'h14][19];
        valids_4 = _RANDOM[5'h14][20];
        valids_5 = _RANDOM[5'h14][21];
        valids_6 = _RANDOM[5'h14][22];
        valids_7 = _RANDOM[5'h14][23];
        valids_8 = _RANDOM[5'h14][24];
        valids_9 = _RANDOM[5'h14][25];
        valids_10 = _RANDOM[5'h14][26];
        valids_11 = _RANDOM[5'h14][27];
        valids_12 = _RANDOM[5'h14][28];
        valids_13 = _RANDOM[5'h14][29];
        valids_14 = _RANDOM[5'h14][30];
        valids_15 = _RANDOM[5'h14][31];
        head = _RANDOM[5'h15][3:0];
        tail = _RANDOM[5'h15][7:4];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        queue_0_addrNoOffset = 33'h0;
        queue_0_cnt = 8'h0;
        queue_1_addrNoOffset = 33'h0;
        queue_1_cnt = 8'h0;
        queue_2_addrNoOffset = 33'h0;
        queue_2_cnt = 8'h0;
        queue_3_addrNoOffset = 33'h0;
        queue_3_cnt = 8'h0;
        queue_4_addrNoOffset = 33'h0;
        queue_4_cnt = 8'h0;
        queue_5_addrNoOffset = 33'h0;
        queue_5_cnt = 8'h0;
        queue_6_addrNoOffset = 33'h0;
        queue_6_cnt = 8'h0;
        queue_7_addrNoOffset = 33'h0;
        queue_7_cnt = 8'h0;
        queue_8_addrNoOffset = 33'h0;
        queue_8_cnt = 8'h0;
        queue_9_addrNoOffset = 33'h0;
        queue_9_cnt = 8'h0;
        queue_10_addrNoOffset = 33'h0;
        queue_10_cnt = 8'h0;
        queue_11_addrNoOffset = 33'h0;
        queue_11_cnt = 8'h0;
        queue_12_addrNoOffset = 33'h0;
        queue_12_cnt = 8'h0;
        queue_13_addrNoOffset = 33'h0;
        queue_13_cnt = 8'h0;
        queue_14_addrNoOffset = 33'h0;
        queue_14_cnt = 8'h0;
        queue_15_addrNoOffset = 33'h0;
        queue_15_cnt = 8'h0;
        valids_0 = 1'h0;
        valids_1 = 1'h0;
        valids_2 = 1'h0;
        valids_3 = 1'h0;
        valids_4 = 1'h0;
        valids_5 = 1'h0;
        valids_6 = 1'h0;
        valids_7 = 1'h0;
        valids_8 = 1'h0;
        valids_9 = 1'h0;
        valids_10 = 1'h0;
        valids_11 = 1'h0;
        valids_12 = 1'h0;
        valids_13 = 1'h0;
        valids_14 = 1'h0;
        valids_15 = 1'h0;
        head = 4'h0;
        tail = 4'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_out_valid = outValid;
  assign io_out_bits = {_GEN[head], 6'h0};
endmodule

