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
module RRArbiterInit(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [40:0] io_in_0_bits_vaddr,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [40:0] io_in_1_bits_vaddr,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [40:0] io_in_2_bits_vaddr,
  output        io_in_3_ready,
  input         io_in_3_valid,
  input  [40:0] io_in_3_bits_vaddr,
  output        io_in_4_ready,
  input         io_in_4_valid,
  input  [40:0] io_in_4_bits_vaddr,
  output        io_in_5_ready,
  input         io_in_5_valid,
  input  [40:0] io_in_5_bits_vaddr,
  output        io_in_6_ready,
  input         io_in_6_valid,
  input  [40:0] io_in_6_bits_vaddr,
  output        io_in_7_ready,
  input         io_in_7_valid,
  input  [40:0] io_in_7_bits_vaddr,
  output        io_in_8_ready,
  input         io_in_8_valid,
  input  [40:0] io_in_8_bits_vaddr,
  output        io_in_9_ready,
  input         io_in_9_valid,
  input  [40:0] io_in_9_bits_vaddr,
  output        io_in_10_ready,
  input         io_in_10_valid,
  input  [40:0] io_in_10_bits_vaddr,
  output        io_in_11_ready,
  input         io_in_11_valid,
  input  [40:0] io_in_11_bits_vaddr,
  output        io_in_12_ready,
  input         io_in_12_valid,
  input  [40:0] io_in_12_bits_vaddr,
  output        io_in_13_ready,
  input         io_in_13_valid,
  input  [40:0] io_in_13_bits_vaddr,
  output        io_in_14_ready,
  input         io_in_14_valid,
  input  [40:0] io_in_14_bits_vaddr,
  output        io_in_15_ready,
  input         io_in_15_valid,
  input  [40:0] io_in_15_bits_vaddr,
  output        io_out_valid,
  output [40:0] io_out_bits_vaddr
);

  wire [3:0]        io_chosen_choice;
  wire [15:0]       _GEN =
    {{io_in_15_valid},
     {io_in_14_valid},
     {io_in_13_valid},
     {io_in_12_valid},
     {io_in_11_valid},
     {io_in_10_valid},
     {io_in_9_valid},
     {io_in_8_valid},
     {io_in_7_valid},
     {io_in_6_valid},
     {io_in_5_valid},
     {io_in_4_valid},
     {io_in_3_valid},
     {io_in_2_valid},
     {io_in_1_valid},
     {io_in_0_valid}};
  wire              io_out_valid_0 = _GEN[io_chosen_choice];
  wire [15:0][40:0] _GEN_0 =
    {{io_in_15_bits_vaddr},
     {io_in_14_bits_vaddr},
     {io_in_13_bits_vaddr},
     {io_in_12_bits_vaddr},
     {io_in_11_bits_vaddr},
     {io_in_10_bits_vaddr},
     {io_in_9_bits_vaddr},
     {io_in_8_bits_vaddr},
     {io_in_7_bits_vaddr},
     {io_in_6_bits_vaddr},
     {io_in_5_bits_vaddr},
     {io_in_4_bits_vaddr},
     {io_in_3_bits_vaddr},
     {io_in_2_bits_vaddr},
     {io_in_1_bits_vaddr},
     {io_in_0_bits_vaddr}};
  reg  [3:0]        ctrl_validMask_grantMask_lastGrant;
  wire              ctrl_validMask_grantMask_1 =
    ctrl_validMask_grantMask_lastGrant == 4'h0;
  wire              ctrl_validMask_grantMask_2 =
    ctrl_validMask_grantMask_lastGrant < 4'h2;
  wire              ctrl_validMask_grantMask_3 =
    ctrl_validMask_grantMask_lastGrant < 4'h3;
  wire              ctrl_validMask_grantMask_4 =
    ctrl_validMask_grantMask_lastGrant < 4'h4;
  wire              ctrl_validMask_grantMask_5 =
    ctrl_validMask_grantMask_lastGrant < 4'h5;
  wire              ctrl_validMask_grantMask_6 =
    ctrl_validMask_grantMask_lastGrant < 4'h6;
  wire              ctrl_validMask_grantMask_7 =
    ctrl_validMask_grantMask_lastGrant < 4'h7;
  wire              ctrl_validMask_grantMask_9 =
    ctrl_validMask_grantMask_lastGrant < 4'h9;
  wire              ctrl_validMask_grantMask_10 =
    ctrl_validMask_grantMask_lastGrant < 4'hA;
  wire              ctrl_validMask_grantMask_11 =
    ctrl_validMask_grantMask_lastGrant < 4'hB;
  wire              ctrl_validMask_grantMask_12 =
    ctrl_validMask_grantMask_lastGrant[3:2] != 2'h3;
  wire              ctrl_validMask_grantMask_13 =
    ctrl_validMask_grantMask_lastGrant < 4'hD;
  wire              ctrl_validMask_grantMask_14 =
    ctrl_validMask_grantMask_lastGrant[3:1] != 3'h7;
  wire              ctrl_validMask_grantMask_15 =
    ctrl_validMask_grantMask_lastGrant != 4'hF;
  wire              ctrl_validMask_1 = io_in_1_valid & ctrl_validMask_grantMask_1;
  wire              ctrl_validMask_2 = io_in_2_valid & ctrl_validMask_grantMask_2;
  wire              ctrl_validMask_3 = io_in_3_valid & ctrl_validMask_grantMask_3;
  wire              ctrl_validMask_4 = io_in_4_valid & ctrl_validMask_grantMask_4;
  wire              ctrl_validMask_5 = io_in_5_valid & ctrl_validMask_grantMask_5;
  wire              ctrl_validMask_6 = io_in_6_valid & ctrl_validMask_grantMask_6;
  wire              ctrl_validMask_7 = io_in_7_valid & ctrl_validMask_grantMask_7;
  wire              ctrl_validMask_8 =
    io_in_8_valid & ~(ctrl_validMask_grantMask_lastGrant[3]);
  wire              ctrl_validMask_9 = io_in_9_valid & ctrl_validMask_grantMask_9;
  wire              ctrl_validMask_10 = io_in_10_valid & ctrl_validMask_grantMask_10;
  wire              ctrl_validMask_11 = io_in_11_valid & ctrl_validMask_grantMask_11;
  wire              ctrl_validMask_12 = io_in_12_valid & ctrl_validMask_grantMask_12;
  wire              ctrl_validMask_13 = io_in_13_valid & ctrl_validMask_grantMask_13;
  wire              ctrl_validMask_14 = io_in_14_valid & ctrl_validMask_grantMask_14;
  wire              ctrl_validMask_15 = io_in_15_valid & ctrl_validMask_grantMask_15;
  wire              _ctrl_T_1 = ctrl_validMask_1 | ctrl_validMask_2;
  wire              _ctrl_T_2 = _ctrl_T_1 | ctrl_validMask_3;
  wire              _ctrl_T_3 = _ctrl_T_2 | ctrl_validMask_4;
  wire              _ctrl_T_4 = _ctrl_T_3 | ctrl_validMask_5;
  wire              _ctrl_T_5 = _ctrl_T_4 | ctrl_validMask_6;
  wire              _ctrl_T_6 = _ctrl_T_5 | ctrl_validMask_7;
  wire              _ctrl_T_7 = _ctrl_T_6 | ctrl_validMask_8;
  wire              _ctrl_T_8 = _ctrl_T_7 | ctrl_validMask_9;
  wire              _ctrl_T_9 = _ctrl_T_8 | ctrl_validMask_10;
  wire              _ctrl_T_10 = _ctrl_T_9 | ctrl_validMask_11;
  wire              _ctrl_T_11 = _ctrl_T_10 | ctrl_validMask_12;
  wire              _ctrl_T_12 = _ctrl_T_11 | ctrl_validMask_13;
  wire              _ctrl_T_13 = _ctrl_T_12 | ctrl_validMask_14;
  wire              _ctrl_T_14 = _ctrl_T_13 | ctrl_validMask_15;
  wire              _ctrl_T_15 = _ctrl_T_14 | io_in_0_valid;
  wire              _ctrl_T_16 = _ctrl_T_15 | io_in_1_valid;
  wire              _ctrl_T_17 = _ctrl_T_16 | io_in_2_valid;
  wire              _ctrl_T_18 = _ctrl_T_17 | io_in_3_valid;
  wire              _ctrl_T_19 = _ctrl_T_18 | io_in_4_valid;
  wire              _ctrl_T_20 = _ctrl_T_19 | io_in_5_valid;
  wire              _ctrl_T_21 = _ctrl_T_20 | io_in_6_valid;
  wire              _ctrl_T_22 = _ctrl_T_21 | io_in_7_valid;
  wire              _ctrl_T_23 = _ctrl_T_22 | io_in_8_valid;
  wire              _ctrl_T_24 = _ctrl_T_23 | io_in_9_valid;
  wire              _ctrl_T_25 = _ctrl_T_24 | io_in_10_valid;
  wire              _ctrl_T_26 = _ctrl_T_25 | io_in_11_valid;
  wire              _ctrl_T_27 = _ctrl_T_26 | io_in_12_valid;
  wire              _ctrl_T_28 = _ctrl_T_27 | io_in_13_valid;
  wire [3:0]        _GEN_1 =
    io_in_0_valid
      ? 4'h0
      : io_in_1_valid
          ? 4'h1
          : io_in_2_valid
              ? 4'h2
              : io_in_3_valid
                  ? 4'h3
                  : io_in_4_valid
                      ? 4'h4
                      : io_in_5_valid
                          ? 4'h5
                          : io_in_6_valid
                              ? 4'h6
                              : io_in_7_valid
                                  ? 4'h7
                                  : io_in_8_valid
                                      ? 4'h8
                                      : io_in_9_valid
                                          ? 4'h9
                                          : io_in_10_valid
                                              ? 4'hA
                                              : io_in_11_valid
                                                  ? 4'hB
                                                  : io_in_12_valid
                                                      ? 4'hC
                                                      : io_in_13_valid
                                                          ? 4'hD
                                                          : {3'h7, ~io_in_14_valid};
  assign io_chosen_choice =
    ctrl_validMask_1
      ? 4'h1
      : ctrl_validMask_2
          ? 4'h2
          : ctrl_validMask_3
              ? 4'h3
              : ctrl_validMask_4
                  ? 4'h4
                  : ctrl_validMask_5
                      ? 4'h5
                      : ctrl_validMask_6
                          ? 4'h6
                          : ctrl_validMask_7
                              ? 4'h7
                              : ctrl_validMask_8
                                  ? 4'h8
                                  : ctrl_validMask_9
                                      ? 4'h9
                                      : ctrl_validMask_10
                                          ? 4'hA
                                          : ctrl_validMask_11
                                              ? 4'hB
                                              : ctrl_validMask_12
                                                  ? 4'hC
                                                  : ctrl_validMask_13
                                                      ? 4'hD
                                                      : ctrl_validMask_14
                                                          ? 4'hE
                                                          : ctrl_validMask_15
                                                              ? 4'hF
                                                              : _GEN_1;
  always @(posedge clock or posedge reset) begin
    if (reset)
      ctrl_validMask_grantMask_lastGrant <= 4'h0;
    else if (io_out_valid_0) begin
      if (ctrl_validMask_1)
        ctrl_validMask_grantMask_lastGrant <= 4'h1;
      else if (ctrl_validMask_2)
        ctrl_validMask_grantMask_lastGrant <= 4'h2;
      else if (ctrl_validMask_3)
        ctrl_validMask_grantMask_lastGrant <= 4'h3;
      else if (ctrl_validMask_4)
        ctrl_validMask_grantMask_lastGrant <= 4'h4;
      else if (ctrl_validMask_5)
        ctrl_validMask_grantMask_lastGrant <= 4'h5;
      else if (ctrl_validMask_6)
        ctrl_validMask_grantMask_lastGrant <= 4'h6;
      else if (ctrl_validMask_7)
        ctrl_validMask_grantMask_lastGrant <= 4'h7;
      else if (ctrl_validMask_8)
        ctrl_validMask_grantMask_lastGrant <= 4'h8;
      else if (ctrl_validMask_9)
        ctrl_validMask_grantMask_lastGrant <= 4'h9;
      else if (ctrl_validMask_10)
        ctrl_validMask_grantMask_lastGrant <= 4'hA;
      else if (ctrl_validMask_11)
        ctrl_validMask_grantMask_lastGrant <= 4'hB;
      else if (ctrl_validMask_12)
        ctrl_validMask_grantMask_lastGrant <= 4'hC;
      else if (ctrl_validMask_13)
        ctrl_validMask_grantMask_lastGrant <= 4'hD;
      else if (ctrl_validMask_14)
        ctrl_validMask_grantMask_lastGrant <= 4'hE;
      else if (ctrl_validMask_15)
        ctrl_validMask_grantMask_lastGrant <= 4'hF;
      else
        ctrl_validMask_grantMask_lastGrant <= _GEN_1;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        ctrl_validMask_grantMask_lastGrant = _RANDOM[/*Zero width*/ 1'b0][3:0];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        ctrl_validMask_grantMask_lastGrant = 4'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_0_ready = ~_ctrl_T_14;
  assign io_in_1_ready = ctrl_validMask_grantMask_1 | ~_ctrl_T_15;
  assign io_in_2_ready = ~ctrl_validMask_1 & ctrl_validMask_grantMask_2 | ~_ctrl_T_16;
  assign io_in_3_ready = ~_ctrl_T_1 & ctrl_validMask_grantMask_3 | ~_ctrl_T_17;
  assign io_in_4_ready = ~_ctrl_T_2 & ctrl_validMask_grantMask_4 | ~_ctrl_T_18;
  assign io_in_5_ready = ~_ctrl_T_3 & ctrl_validMask_grantMask_5 | ~_ctrl_T_19;
  assign io_in_6_ready = ~_ctrl_T_4 & ctrl_validMask_grantMask_6 | ~_ctrl_T_20;
  assign io_in_7_ready = ~_ctrl_T_5 & ctrl_validMask_grantMask_7 | ~_ctrl_T_21;
  assign io_in_8_ready =
    ~_ctrl_T_6 & ~(ctrl_validMask_grantMask_lastGrant[3]) | ~_ctrl_T_22;
  assign io_in_9_ready = ~_ctrl_T_7 & ctrl_validMask_grantMask_9 | ~_ctrl_T_23;
  assign io_in_10_ready = ~_ctrl_T_8 & ctrl_validMask_grantMask_10 | ~_ctrl_T_24;
  assign io_in_11_ready = ~_ctrl_T_9 & ctrl_validMask_grantMask_11 | ~_ctrl_T_25;
  assign io_in_12_ready = ~_ctrl_T_10 & ctrl_validMask_grantMask_12 | ~_ctrl_T_26;
  assign io_in_13_ready = ~_ctrl_T_11 & ctrl_validMask_grantMask_13 | ~_ctrl_T_27;
  assign io_in_14_ready = ~_ctrl_T_12 & ctrl_validMask_grantMask_14 | ~_ctrl_T_28;
  assign io_in_15_ready =
    ~_ctrl_T_13 & ctrl_validMask_grantMask_15 | ~(_ctrl_T_28 | io_in_14_valid);
  assign io_out_valid = io_out_valid_0;
  assign io_out_bits_vaddr = _GEN_0[io_chosen_choice];
endmodule

