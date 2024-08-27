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
module DivUnit(
  input         clock,
  input         reset,
  input         io_flush_valid,
  input         io_flush_bits_robIdx_flag,
  input  [7:0]  io_flush_bits_robIdx_value,
  input         io_flush_bits_level,
  output        io_in_ready,
  input         io_in_valid,
  input  [8:0]  io_in_bits_ctrl_fuOpType,
  input         io_in_bits_ctrl_robIdx_flag,
  input  [7:0]  io_in_bits_ctrl_robIdx_value,
  input  [7:0]  io_in_bits_ctrl_pdest,
  input         io_in_bits_ctrl_rfWen,
  input  [63:0] io_in_bits_data_src_1,
  input  [63:0] io_in_bits_data_src_0,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_ctrl_robIdx_flag,
  output [7:0]  io_out_bits_ctrl_robIdx_value,
  output [7:0]  io_out_bits_ctrl_pdest,
  output        io_out_bits_ctrl_rfWen,
  output [63:0] io_out_bits_res_data
);

  wire       _divDataModule_io_in_ready;
  reg        robIdxReg_flag;
  reg  [7:0] robIdxReg_value;
  reg        ctrlReg_isW;
  reg        ctrlReg_isHi;
  wire [8:0] _kill_r_flushItself_T_2 =
    {io_flush_bits_robIdx_flag, io_flush_bits_robIdx_value};
  reg        io_out_bits_ctrl_robIdx_r_flag;
  reg  [7:0] io_out_bits_ctrl_robIdx_r_value;
  reg  [7:0] io_out_bits_ctrl_pdest_r;
  reg        io_out_bits_ctrl_rfWen_r;
  always @(posedge clock) begin
    if (_divDataModule_io_in_ready & io_in_valid) begin
      robIdxReg_flag <= io_in_bits_ctrl_robIdx_flag;
      robIdxReg_value <= io_in_bits_ctrl_robIdx_value;
      ctrlReg_isW <= io_in_bits_ctrl_fuOpType[2];
      ctrlReg_isHi <= io_in_bits_ctrl_fuOpType[0];
      io_out_bits_ctrl_robIdx_r_flag <= io_in_bits_ctrl_robIdx_flag;
      io_out_bits_ctrl_robIdx_r_value <= io_in_bits_ctrl_robIdx_value;
      io_out_bits_ctrl_pdest_r <= io_in_bits_ctrl_pdest;
      io_out_bits_ctrl_rfWen_r <= io_in_bits_ctrl_rfWen;
    end
  end // always @(posedge)
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
        robIdxReg_flag = _RANDOM[/*Zero width*/ 1'b0][0];
        robIdxReg_value = _RANDOM[/*Zero width*/ 1'b0][8:1];
        ctrlReg_isW = _RANDOM[/*Zero width*/ 1'b0][10];
        ctrlReg_isHi = _RANDOM[/*Zero width*/ 1'b0][11];
        io_out_bits_ctrl_robIdx_r_flag = _RANDOM[/*Zero width*/ 1'b0][12];
        io_out_bits_ctrl_robIdx_r_value = _RANDOM[/*Zero width*/ 1'b0][20:13];
        io_out_bits_ctrl_pdest_r = _RANDOM[/*Zero width*/ 1'b0][28:21];
        io_out_bits_ctrl_rfWen_r = _RANDOM[/*Zero width*/ 1'b0][29];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SRT16DividerDataModule divDataModule (
    .clock        (clock),
    .reset        (reset),
    .io_src_0
      (io_in_bits_ctrl_fuOpType[2]
         ? {{32{~(io_in_bits_ctrl_fuOpType[1]) & io_in_bits_data_src_0[31]}},
            io_in_bits_data_src_0[31:0]}
         : io_in_bits_data_src_0),
    .io_src_1
      (io_in_bits_ctrl_fuOpType[2]
         ? {{32{~(io_in_bits_ctrl_fuOpType[1]) & io_in_bits_data_src_1[31]}},
            io_in_bits_data_src_1[31:0]}
         : io_in_bits_data_src_1),
    .io_valid     (io_in_valid),
    .io_sign      (~(io_in_bits_ctrl_fuOpType[1])),
    .io_kill_w
      (io_flush_valid
       & (io_flush_bits_level
          & {io_in_bits_ctrl_robIdx_flag,
             io_in_bits_ctrl_robIdx_value} == _kill_r_flushItself_T_2
          | io_in_bits_ctrl_robIdx_flag ^ io_flush_bits_robIdx_flag
          ^ io_in_bits_ctrl_robIdx_value > io_flush_bits_robIdx_value)),
    .io_kill_r
      (~_divDataModule_io_in_ready & io_flush_valid
       & (io_flush_bits_level
          & {robIdxReg_flag, robIdxReg_value} == _kill_r_flushItself_T_2 | robIdxReg_flag
          ^ io_flush_bits_robIdx_flag ^ robIdxReg_value > io_flush_bits_robIdx_value)),
    .io_isHi      (ctrlReg_isHi),
    .io_isW       (ctrlReg_isW),
    .io_in_ready  (_divDataModule_io_in_ready),
    .io_out_valid (io_out_valid),
    .io_out_data  (io_out_bits_res_data),
    .io_out_ready (io_out_ready)
  );
  assign io_in_ready = _divDataModule_io_in_ready;
  assign io_out_bits_ctrl_robIdx_flag = io_out_bits_ctrl_robIdx_r_flag;
  assign io_out_bits_ctrl_robIdx_value = io_out_bits_ctrl_robIdx_r_value;
  assign io_out_bits_ctrl_pdest = io_out_bits_ctrl_pdest_r;
  assign io_out_bits_ctrl_rfWen = io_out_bits_ctrl_rfWen_r;
endmodule

