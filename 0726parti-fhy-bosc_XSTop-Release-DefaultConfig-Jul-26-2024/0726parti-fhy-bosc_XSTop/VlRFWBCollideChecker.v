// Generated by CIRCT firtool-1.74.0
module VlRFWBCollideChecker(
  input  clock,
  input  reset,
  output io_in_20_0_ready,
  input  io_in_20_0_valid,
  output io_in_19_0_ready,
  input  io_in_19_0_valid,
  output io_in_18_0_ready,
  input  io_in_18_0_valid,
  output io_in_17_0_ready,
  input  io_in_17_0_valid,
  output io_in_16_0_ready,
  input  io_in_16_0_valid,
  output io_in_15_0_ready,
  input  io_in_15_0_valid,
  output io_in_14_0_ready,
  input  io_in_14_0_valid,
  output io_in_13_0_ready,
  input  io_in_13_0_valid,
  output io_in_12_0_ready,
  input  io_in_12_0_valid,
  output io_in_11_0_ready,
  input  io_in_11_0_valid,
  output io_in_10_1_ready,
  input  io_in_10_1_valid,
  output io_in_10_0_ready,
  input  io_in_10_0_valid,
  output io_in_9_1_ready,
  input  io_in_9_1_valid,
  output io_in_9_0_ready,
  input  io_in_9_0_valid,
  output io_in_8_1_ready,
  input  io_in_8_1_valid,
  output io_in_8_0_ready,
  input  io_in_8_0_valid,
  output io_in_7_0_ready,
  input  io_in_7_0_valid,
  output io_in_6_0_ready,
  input  io_in_6_0_valid,
  output io_in_5_0_ready,
  input  io_in_5_0_valid,
  output io_in_4_0_ready,
  input  io_in_4_0_valid,
  output io_in_3_1_ready,
  input  io_in_3_1_valid,
  output io_in_3_0_ready,
  input  io_in_3_0_valid,
  output io_in_2_1_ready,
  input  io_in_2_1_valid,
  output io_in_2_0_ready,
  input  io_in_2_0_valid,
  output io_in_1_1_ready,
  input  io_in_1_1_valid,
  output io_in_1_0_ready,
  input  io_in_1_0_valid,
  output io_in_0_1_ready,
  input  io_in_0_1_valid,
  output io_in_0_0_ready,
  input  io_in_0_0_valid,
  output io_out_0_valid,
  output io_out_1_valid
);

  WBArbiter_5 arbiters_0 (
    .clock         (clock),
    .reset         (reset),
    .io_in_0_ready (io_in_2_1_ready),
    .io_in_0_valid (io_in_2_1_valid),
    .io_out_valid  (io_out_0_valid)
  );
  WBArbiter_5 arbiters_1 (
    .clock         (clock),
    .reset         (reset),
    .io_in_0_ready (io_in_9_1_ready),
    .io_in_0_valid (io_in_9_1_valid),
    .io_out_valid  (io_out_1_valid)
  );
  assign io_in_20_0_ready = 1'h1;
  assign io_in_19_0_ready = 1'h1;
  assign io_in_18_0_ready = 1'h1;
  assign io_in_17_0_ready = 1'h1;
  assign io_in_16_0_ready = 1'h1;
  assign io_in_15_0_ready = 1'h1;
  assign io_in_14_0_ready = 1'h1;
  assign io_in_13_0_ready = 1'h1;
  assign io_in_12_0_ready = 1'h1;
  assign io_in_11_0_ready = 1'h1;
  assign io_in_10_1_ready = 1'h1;
  assign io_in_10_0_ready = 1'h1;
  assign io_in_9_0_ready = 1'h1;
  assign io_in_8_1_ready = 1'h1;
  assign io_in_8_0_ready = 1'h1;
  assign io_in_7_0_ready = 1'h1;
  assign io_in_6_0_ready = 1'h1;
  assign io_in_5_0_ready = 1'h1;
  assign io_in_4_0_ready = 1'h1;
  assign io_in_3_1_ready = 1'h1;
  assign io_in_3_0_ready = 1'h1;
  assign io_in_2_0_ready = 1'h1;
  assign io_in_1_1_ready = 1'h1;
  assign io_in_1_0_ready = 1'h1;
  assign io_in_0_1_ready = 1'h1;
  assign io_in_0_0_ready = 1'h1;
endmodule

