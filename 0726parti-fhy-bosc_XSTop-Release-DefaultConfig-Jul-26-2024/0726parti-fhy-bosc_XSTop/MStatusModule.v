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
module MStatusModule(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata,
  output        regOut_SIE,
  output        regOut_MIE,
  output        regOut_SPIE,
  output        regOut_MPIE,
  output        regOut_SPP,
  output [1:0]  regOut_VS,
  output [1:0]  regOut_MPP,
  output [1:0]  regOut_FS,
  output        regOut_MPRV,
  output        regOut_SUM,
  output        regOut_MXR,
  output        regOut_TVM,
  output        regOut_TW,
  output        regOut_TSR,
  output        regOut_GVA,
  output        regOut_MPV,
  input         trapToM_mstatus_valid,
  input         trapToM_mstatus_bits_MIE,
  input         trapToM_mstatus_bits_MPIE,
  input  [1:0]  trapToM_mstatus_bits_MPP,
  input         trapToM_mstatus_bits_GVA,
  input         trapToM_mstatus_bits_MPV,
  input         trapToHS_mstatus_valid,
  input         trapToHS_mstatus_bits_SIE,
  input         trapToHS_mstatus_bits_SPIE,
  input         trapToHS_mstatus_bits_SPP,
  input         retFromD_mstatus_valid,
  input         retFromD_mstatus_bits_MPRV,
  input         retFromM_mstatus_valid,
  input         retFromM_mstatus_bits_MIE,
  input         retFromM_mstatus_bits_MPIE,
  input  [1:0]  retFromM_mstatus_bits_MPP,
  input         retFromM_mstatus_bits_MPRV,
  input         retFromM_mstatus_bits_MPV,
  input         retFromS_mstatus_valid,
  input         retFromS_mstatus_bits_SIE,
  input         retFromS_mstatus_bits_SPIE,
  input         retFromS_mstatus_bits_SPP,
  input         retFromS_mstatus_bits_MPRV,
  input         robCommit_fsDirty,
  input         robCommit_vsDirty,
  input         writeFCSR,
  input         writeVCSR,
  output        sstatus_SIE,
  output        sstatus_SPIE,
  output        sstatus_SPP,
  output [1:0]  sstatus_VS,
  output [1:0]  sstatus_FS,
  output        sstatus_SUM,
  output        sstatus_MXR,
  output        sstatus_SD,
  output [63:0] sstatusRdata,
  input         wAliasSstatus_wen,
  input  [63:0] wAliasSstatus_wdata
);

  reg        reg_SIE;
  reg        reg_MIE;
  reg        reg_SPIE;
  reg        reg_MPIE;
  reg        reg_SPP;
  reg  [1:0] reg_VS;
  reg  [1:0] reg_MPP;
  reg  [1:0] reg_FS;
  reg        reg_MPRV;
  reg        reg_SUM;
  reg        reg_MXR;
  reg        reg_TVM;
  reg        reg_TW;
  reg        reg_TSR;
  reg        reg_GVA;
  reg        reg_MPV;
  wire       _mstatus_SD_T_3 = (&reg_FS) | (&reg_VS);
  wire       _GEN = w_wen | wAliasSstatus_wen;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_SIE <= 1'h0;
      reg_MIE <= 1'h0;
      reg_SPIE <= 1'h0;
      reg_MPIE <= 1'h0;
      reg_SPP <= 1'h0;
      reg_VS <= 2'h0;
      reg_MPP <= 2'h0;
      reg_FS <= 2'h0;
      reg_MPRV <= 1'h0;
      reg_SUM <= 1'h0;
      reg_MXR <= 1'h0;
      reg_TVM <= 1'h0;
      reg_TW <= 1'h0;
      reg_TSR <= 1'h0;
      reg_GVA <= 1'h0;
      reg_MPV <= 1'h0;
    end
    else begin
      if (_GEN) begin
        reg_SIE <= wAliasSstatus_wen & wAliasSstatus_wdata[1] | w_wen & w_wdata[1];
        reg_SPIE <= wAliasSstatus_wen & wAliasSstatus_wdata[5] | w_wen & w_wdata[5];
        reg_SPP <= wAliasSstatus_wen & wAliasSstatus_wdata[8] | w_wen & w_wdata[8];
        reg_SUM <= wAliasSstatus_wen & wAliasSstatus_wdata[18] | w_wen & w_wdata[18];
        reg_MXR <= wAliasSstatus_wen & wAliasSstatus_wdata[19] | w_wen & w_wdata[19];
      end
      else begin
        if (retFromS_mstatus_valid) begin
          reg_SIE <= retFromS_mstatus_bits_SIE;
          reg_SPIE <= retFromS_mstatus_bits_SPIE;
          reg_SPP <= retFromS_mstatus_bits_SPP;
        end
        else if (trapToHS_mstatus_valid) begin
          reg_SIE <= trapToHS_mstatus_bits_SIE;
          reg_SPIE <= trapToHS_mstatus_bits_SPIE;
          reg_SPP <= trapToHS_mstatus_bits_SPP;
        end
        else if (w_wen) begin
          reg_SIE <= w_wdata[1];
          reg_SPIE <= w_wdata[5];
          reg_SPP <= w_wdata[8];
        end
        if (w_wen) begin
          reg_SUM <= w_wdata[18];
          reg_MXR <= w_wdata[19];
        end
      end
      if (w_wen) begin
        reg_MIE <= w_wdata[3];
        reg_MPIE <= w_wdata[7];
        reg_MPP <= w_wdata[12:11];
        reg_MPRV <= w_wdata[17];
        reg_TVM <= w_wdata[20];
        reg_TW <= w_wdata[21];
        reg_TSR <= w_wdata[22];
        reg_GVA <= w_wdata[38];
        reg_MPV <= w_wdata[39];
      end
      else begin
        if (retFromM_mstatus_valid) begin
          reg_MIE <= retFromM_mstatus_bits_MIE;
          reg_MPIE <= retFromM_mstatus_bits_MPIE;
          reg_MPP <= retFromM_mstatus_bits_MPP;
          reg_MPV <= retFromM_mstatus_bits_MPV;
        end
        else if (trapToM_mstatus_valid) begin
          reg_MIE <= trapToM_mstatus_bits_MIE;
          reg_MPIE <= trapToM_mstatus_bits_MPIE;
          reg_MPP <= trapToM_mstatus_bits_MPP;
          reg_MPV <= trapToM_mstatus_bits_MPV;
        end
        if (retFromS_mstatus_valid)
          reg_MPRV <= retFromS_mstatus_bits_MPRV;
        else if (retFromM_mstatus_valid)
          reg_MPRV <= retFromM_mstatus_bits_MPRV;
        else if (retFromD_mstatus_valid)
          reg_MPRV <= retFromD_mstatus_bits_MPRV;
        if (trapToM_mstatus_valid)
          reg_GVA <= trapToM_mstatus_bits_GVA;
      end
      if (robCommit_vsDirty | writeVCSR)
        reg_VS <= 2'h3;
      else if (_GEN)
        reg_VS <=
          (wAliasSstatus_wen ? wAliasSstatus_wdata[10:9] : 2'h0)
          | (w_wen ? w_wdata[10:9] : 2'h0);
      else if (w_wen)
        reg_VS <= w_wdata[10:9];
      if (robCommit_fsDirty | writeFCSR)
        reg_FS <= 2'h3;
      else if (_GEN)
        reg_FS <=
          (wAliasSstatus_wen ? wAliasSstatus_wdata[14:13] : 2'h0)
          | (w_wen ? w_wdata[14:13] : 2'h0);
      else if (w_wen)
        reg_FS <= w_wdata[14:13];
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
        reg_SIE = _RANDOM[/*Zero width*/ 1'b0][0];
        reg_MIE = _RANDOM[/*Zero width*/ 1'b0][1];
        reg_SPIE = _RANDOM[/*Zero width*/ 1'b0][2];
        reg_MPIE = _RANDOM[/*Zero width*/ 1'b0][4];
        reg_SPP = _RANDOM[/*Zero width*/ 1'b0][5];
        reg_VS = _RANDOM[/*Zero width*/ 1'b0][7:6];
        reg_MPP = _RANDOM[/*Zero width*/ 1'b0][9:8];
        reg_FS = _RANDOM[/*Zero width*/ 1'b0][11:10];
        reg_MPRV = _RANDOM[/*Zero width*/ 1'b0][14];
        reg_SUM = _RANDOM[/*Zero width*/ 1'b0][15];
        reg_MXR = _RANDOM[/*Zero width*/ 1'b0][16];
        reg_TVM = _RANDOM[/*Zero width*/ 1'b0][17];
        reg_TW = _RANDOM[/*Zero width*/ 1'b0][18];
        reg_TSR = _RANDOM[/*Zero width*/ 1'b0][19];
        reg_GVA = _RANDOM[/*Zero width*/ 1'b0][26];
        reg_MPV = _RANDOM[/*Zero width*/ 1'b0][27];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_SIE = 1'h0;
        reg_MIE = 1'h0;
        reg_SPIE = 1'h0;
        reg_MPIE = 1'h0;
        reg_SPP = 1'h0;
        reg_VS = 2'h0;
        reg_MPP = 2'h0;
        reg_FS = 2'h0;
        reg_MPRV = 1'h0;
        reg_SUM = 1'h0;
        reg_MXR = 1'h0;
        reg_TVM = 1'h0;
        reg_TW = 1'h0;
        reg_TSR = 1'h0;
        reg_GVA = 1'h0;
        reg_MPV = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata =
    {_mstatus_SD_T_3,
     23'h0,
     reg_MPV,
     reg_GVA,
     15'h1400,
     reg_TSR,
     reg_TW,
     reg_TVM,
     reg_MXR,
     reg_SUM,
     reg_MPRV,
     2'h0,
     reg_FS,
     reg_MPP,
     reg_VS,
     reg_SPP,
     reg_MPIE,
     1'h0,
     reg_SPIE,
     1'h0,
     reg_MIE,
     1'h0,
     reg_SIE,
     1'h0};
  assign regOut_SIE = reg_SIE;
  assign regOut_MIE = reg_MIE;
  assign regOut_SPIE = reg_SPIE;
  assign regOut_MPIE = reg_MPIE;
  assign regOut_SPP = reg_SPP;
  assign regOut_VS = reg_VS;
  assign regOut_MPP = reg_MPP;
  assign regOut_FS = reg_FS;
  assign regOut_MPRV = reg_MPRV;
  assign regOut_SUM = reg_SUM;
  assign regOut_MXR = reg_MXR;
  assign regOut_TVM = reg_TVM;
  assign regOut_TW = reg_TW;
  assign regOut_TSR = reg_TSR;
  assign regOut_GVA = reg_GVA;
  assign regOut_MPV = reg_MPV;
  assign sstatus_SIE = reg_SIE;
  assign sstatus_SPIE = reg_SPIE;
  assign sstatus_SPP = reg_SPP;
  assign sstatus_VS = reg_VS;
  assign sstatus_FS = reg_FS;
  assign sstatus_SUM = reg_SUM;
  assign sstatus_MXR = reg_MXR;
  assign sstatus_SD = _mstatus_SD_T_3;
  assign sstatusRdata =
    {_mstatus_SD_T_3,
     43'h2000,
     reg_MXR,
     reg_SUM,
     3'h0,
     reg_FS,
     2'h0,
     reg_VS,
     reg_SPP,
     2'h0,
     reg_SPIE,
     3'h0,
     reg_SIE,
     1'h0};
endmodule

