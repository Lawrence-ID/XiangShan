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
module HPerfCounter_21(
  input         clock,
  input  [63:0] io_hpm_event,
  input  [5:0]  io_events_sets_1_value,
  input  [5:0]  io_events_sets_2_value,
  input  [5:0]  io_events_sets_3_value,
  input  [5:0]  io_events_sets_4_value,
  input  [5:0]  io_events_sets_5_value,
  input  [5:0]  io_events_sets_6_value,
  input  [5:0]  io_events_sets_7_value,
  input  [5:0]  io_events_sets_8_value,
  input  [5:0]  io_events_sets_9_value,
  input  [5:0]  io_events_sets_10_value,
  input  [5:0]  io_events_sets_11_value,
  input  [5:0]  io_events_sets_12_value,
  input  [5:0]  io_events_sets_13_value,
  input  [5:0]  io_events_sets_14_value,
  input  [5:0]  io_events_sets_15_value,
  input  [5:0]  io_events_sets_16_value,
  input  [5:0]  io_events_sets_17_value,
  input  [5:0]  io_events_sets_18_value,
  input  [5:0]  io_events_sets_19_value,
  input  [5:0]  io_events_sets_20_value,
  input  [5:0]  io_events_sets_21_value,
  input  [5:0]  io_events_sets_22_value,
  input  [5:0]  io_events_sets_23_value,
  input  [5:0]  io_events_sets_24_value,
  input  [5:0]  io_events_sets_25_value,
  input  [5:0]  io_events_sets_26_value,
  input  [5:0]  io_events_sets_27_value,
  input  [5:0]  io_events_sets_28_value,
  input  [5:0]  io_events_sets_29_value,
  input  [5:0]  io_events_sets_30_value,
  input  [5:0]  io_events_sets_31_value,
  input  [5:0]  io_events_sets_32_value,
  input  [5:0]  io_events_sets_33_value,
  input  [5:0]  io_events_sets_34_value,
  input  [5:0]  io_events_sets_35_value,
  input  [5:0]  io_events_sets_36_value,
  input  [5:0]  io_events_sets_37_value,
  input  [5:0]  io_events_sets_38_value,
  input  [5:0]  io_events_sets_39_value,
  input  [5:0]  io_events_sets_40_value,
  input  [5:0]  io_events_sets_41_value,
  input  [5:0]  io_events_sets_42_value,
  input  [5:0]  io_events_sets_43_value,
  input  [5:0]  io_events_sets_44_value,
  input  [5:0]  io_events_sets_45_value,
  input  [5:0]  io_events_sets_46_value,
  input  [5:0]  io_events_sets_47_value,
  input  [5:0]  io_events_sets_48_value,
  input  [5:0]  io_events_sets_49_value,
  input  [5:0]  io_events_sets_50_value,
  input  [5:0]  io_events_sets_51_value,
  input  [5:0]  io_events_sets_52_value,
  input  [5:0]  io_events_sets_53_value,
  input  [5:0]  io_events_sets_54_value,
  input  [5:0]  io_events_sets_55_value,
  input  [5:0]  io_events_sets_56_value,
  input  [5:0]  io_events_sets_57_value,
  input  [5:0]  io_events_sets_58_value,
  input  [5:0]  io_events_sets_59_value,
  input  [5:0]  io_events_sets_60_value,
  input  [5:0]  io_events_sets_61_value,
  input  [5:0]  io_events_sets_62_value,
  input  [5:0]  io_events_sets_63_value,
  input  [5:0]  io_events_sets_64_value,
  input  [5:0]  io_events_sets_65_value,
  input  [5:0]  io_events_sets_66_value,
  input  [5:0]  io_events_sets_67_value,
  input  [5:0]  io_events_sets_68_value,
  input  [5:0]  io_events_sets_69_value,
  input  [5:0]  io_events_sets_70_value,
  input  [5:0]  io_events_sets_71_value,
  input  [5:0]  io_events_sets_72_value,
  input  [5:0]  io_events_sets_73_value,
  input  [5:0]  io_events_sets_74_value,
  input  [5:0]  io_events_sets_75_value,
  input  [5:0]  io_events_sets_76_value,
  input  [5:0]  io_events_sets_77_value,
  input  [5:0]  io_events_sets_78_value,
  input  [5:0]  io_events_sets_79_value,
  input  [5:0]  io_events_sets_80_value,
  input  [5:0]  io_events_sets_81_value,
  input  [5:0]  io_events_sets_82_value,
  input  [5:0]  io_events_sets_83_value,
  input  [5:0]  io_events_sets_84_value,
  input  [5:0]  io_events_sets_85_value,
  input  [5:0]  io_events_sets_86_value,
  input  [5:0]  io_events_sets_87_value,
  input  [5:0]  io_events_sets_88_value,
  input  [5:0]  io_events_sets_89_value,
  input  [5:0]  io_events_sets_90_value,
  input  [5:0]  io_events_sets_91_value,
  input  [5:0]  io_events_sets_92_value,
  input  [5:0]  io_events_sets_93_value,
  input  [5:0]  io_events_sets_94_value,
  input  [5:0]  io_events_sets_95_value,
  input  [5:0]  io_events_sets_96_value,
  input  [5:0]  io_events_sets_97_value,
  input  [5:0]  io_events_sets_98_value,
  input  [5:0]  io_events_sets_99_value,
  input  [5:0]  io_events_sets_100_value,
  input  [5:0]  io_events_sets_101_value,
  input  [5:0]  io_events_sets_102_value,
  input  [5:0]  io_events_sets_103_value,
  input  [5:0]  io_events_sets_104_value,
  input  [5:0]  io_events_sets_105_value,
  input  [5:0]  io_events_sets_106_value,
  input  [5:0]  io_events_sets_107_value,
  input  [5:0]  io_events_sets_108_value,
  input  [5:0]  io_events_sets_109_value,
  input  [5:0]  io_events_sets_110_value,
  input  [5:0]  io_events_sets_111_value,
  input  [5:0]  io_events_sets_112_value,
  input  [5:0]  io_events_sets_113_value,
  input  [5:0]  io_events_sets_114_value,
  input  [5:0]  io_events_sets_115_value,
  input  [5:0]  io_events_sets_116_value,
  input  [5:0]  io_events_sets_117_value,
  input  [5:0]  io_events_sets_118_value,
  input  [5:0]  io_events_sets_119_value,
  input  [5:0]  io_events_sets_120_value,
  input  [5:0]  io_events_sets_121_value,
  input  [5:0]  io_events_sets_122_value,
  input  [5:0]  io_events_sets_123_value,
  input  [5:0]  io_events_sets_124_value,
  input  [5:0]  io_events_sets_125_value,
  output [5:0]  io_perf_0_value
);

  reg  [5:0]        events_incr_0_value;
  reg  [5:0]        events_incr_1_value;
  reg  [5:0]        events_incr_2_value;
  reg  [5:0]        events_incr_3_value;
  reg  [4:0]        event_op_0;
  reg  [4:0]        event_op_1;
  reg  [4:0]        event_op_2;
  reg  [4:0]        event_op_2_reg;
  reg  [5:0]        event_step_0_reg;
  reg  [5:0]        event_step_1_reg;
  reg  [5:0]        io_perf_0_value_REG;
  reg  [5:0]        io_perf_0_value_REG_1;
  wire [1:0][5:0]   _GEN = '{6'h0, 6'h0};
  wire [127:0][5:0] _GEN_0 =
    {_GEN,
     {{io_events_sets_125_value},
      {io_events_sets_124_value},
      {io_events_sets_123_value},
      {io_events_sets_122_value},
      {io_events_sets_121_value},
      {io_events_sets_120_value},
      {io_events_sets_119_value},
      {io_events_sets_118_value},
      {io_events_sets_117_value},
      {io_events_sets_116_value},
      {io_events_sets_115_value},
      {io_events_sets_114_value},
      {io_events_sets_113_value},
      {io_events_sets_112_value},
      {io_events_sets_111_value},
      {io_events_sets_110_value},
      {io_events_sets_109_value},
      {io_events_sets_108_value},
      {io_events_sets_107_value},
      {io_events_sets_106_value},
      {io_events_sets_105_value},
      {io_events_sets_104_value},
      {io_events_sets_103_value},
      {io_events_sets_102_value},
      {io_events_sets_101_value},
      {io_events_sets_100_value},
      {io_events_sets_99_value},
      {io_events_sets_98_value},
      {io_events_sets_97_value},
      {io_events_sets_96_value},
      {io_events_sets_95_value},
      {io_events_sets_94_value},
      {io_events_sets_93_value},
      {io_events_sets_92_value},
      {io_events_sets_91_value},
      {io_events_sets_90_value},
      {io_events_sets_89_value},
      {io_events_sets_88_value},
      {io_events_sets_87_value},
      {io_events_sets_86_value},
      {io_events_sets_85_value},
      {io_events_sets_84_value},
      {io_events_sets_83_value},
      {io_events_sets_82_value},
      {io_events_sets_81_value},
      {io_events_sets_80_value},
      {io_events_sets_79_value},
      {io_events_sets_78_value},
      {io_events_sets_77_value},
      {io_events_sets_76_value},
      {io_events_sets_75_value},
      {io_events_sets_74_value},
      {io_events_sets_73_value},
      {io_events_sets_72_value},
      {io_events_sets_71_value},
      {io_events_sets_70_value},
      {io_events_sets_69_value},
      {io_events_sets_68_value},
      {io_events_sets_67_value},
      {io_events_sets_66_value},
      {io_events_sets_65_value},
      {io_events_sets_64_value},
      {io_events_sets_63_value},
      {io_events_sets_62_value},
      {io_events_sets_61_value},
      {io_events_sets_60_value},
      {io_events_sets_59_value},
      {io_events_sets_58_value},
      {io_events_sets_57_value},
      {io_events_sets_56_value},
      {io_events_sets_55_value},
      {io_events_sets_54_value},
      {io_events_sets_53_value},
      {io_events_sets_52_value},
      {io_events_sets_51_value},
      {io_events_sets_50_value},
      {io_events_sets_49_value},
      {io_events_sets_48_value},
      {io_events_sets_47_value},
      {io_events_sets_46_value},
      {io_events_sets_45_value},
      {io_events_sets_44_value},
      {io_events_sets_43_value},
      {io_events_sets_42_value},
      {io_events_sets_41_value},
      {io_events_sets_40_value},
      {io_events_sets_39_value},
      {io_events_sets_38_value},
      {io_events_sets_37_value},
      {io_events_sets_36_value},
      {io_events_sets_35_value},
      {io_events_sets_34_value},
      {io_events_sets_33_value},
      {io_events_sets_32_value},
      {io_events_sets_31_value},
      {io_events_sets_30_value},
      {io_events_sets_29_value},
      {io_events_sets_28_value},
      {io_events_sets_27_value},
      {io_events_sets_26_value},
      {io_events_sets_25_value},
      {io_events_sets_24_value},
      {io_events_sets_23_value},
      {io_events_sets_22_value},
      {io_events_sets_21_value},
      {io_events_sets_20_value},
      {io_events_sets_19_value},
      {io_events_sets_18_value},
      {io_events_sets_17_value},
      {io_events_sets_16_value},
      {io_events_sets_15_value},
      {io_events_sets_14_value},
      {io_events_sets_13_value},
      {io_events_sets_12_value},
      {io_events_sets_11_value},
      {io_events_sets_10_value},
      {io_events_sets_9_value},
      {io_events_sets_8_value},
      {io_events_sets_7_value},
      {io_events_sets_6_value},
      {io_events_sets_5_value},
      {io_events_sets_4_value},
      {io_events_sets_3_value},
      {io_events_sets_2_value},
      {io_events_sets_1_value},
      {6'h0}}};
  always @(posedge clock) begin
    events_incr_0_value <= _GEN_0[io_hpm_event[6:0]];
    events_incr_1_value <= _GEN_0[io_hpm_event[16:10]];
    events_incr_2_value <= _GEN_0[io_hpm_event[26:20]];
    events_incr_3_value <= _GEN_0[io_hpm_event[36:30]];
    event_op_0 <= io_hpm_event[44:40];
    event_op_1 <= io_hpm_event[49:45];
    event_op_2 <= io_hpm_event[54:50];
    event_op_2_reg <= event_op_2;
    event_step_0_reg <=
      event_op_0[0]
        ? events_incr_0_value & events_incr_1_value
        : event_op_0[1]
            ? events_incr_0_value ^ events_incr_1_value
            : event_op_0[2]
                ? 6'(events_incr_0_value + events_incr_1_value)
                : events_incr_0_value | events_incr_1_value;
    event_step_1_reg <=
      event_op_1[0]
        ? events_incr_2_value & events_incr_3_value
        : event_op_1[1]
            ? events_incr_2_value ^ events_incr_3_value
            : event_op_1[2]
                ? 6'(events_incr_2_value + events_incr_3_value)
                : events_incr_2_value | events_incr_3_value;
    io_perf_0_value_REG <=
      event_op_2_reg[0]
        ? event_step_0_reg & event_step_1_reg
        : event_op_2_reg[1]
            ? event_step_0_reg ^ event_step_1_reg
            : event_op_2_reg[2]
                ? 6'(event_step_0_reg + event_step_1_reg)
                : event_step_0_reg | event_step_1_reg;
    io_perf_0_value_REG_1 <= io_perf_0_value_REG;
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
        events_incr_0_value = _RANDOM[2'h0][5:0];
        events_incr_1_value = _RANDOM[2'h0][11:6];
        events_incr_2_value = _RANDOM[2'h0][17:12];
        events_incr_3_value = _RANDOM[2'h0][23:18];
        event_op_0 = _RANDOM[2'h0][28:24];
        event_op_1 = {_RANDOM[2'h0][31:29], _RANDOM[2'h1][1:0]};
        event_op_2 = _RANDOM[2'h1][6:2];
        event_op_2_reg = _RANDOM[2'h1][11:7];
        event_step_0_reg = _RANDOM[2'h1][17:12];
        event_step_1_reg = _RANDOM[2'h1][23:18];
        io_perf_0_value_REG = _RANDOM[2'h1][29:24];
        io_perf_0_value_REG_1 = {_RANDOM[2'h1][31:30], _RANDOM[2'h2][3:0]};
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_perf_0_value = io_perf_0_value_REG_1;
endmodule

