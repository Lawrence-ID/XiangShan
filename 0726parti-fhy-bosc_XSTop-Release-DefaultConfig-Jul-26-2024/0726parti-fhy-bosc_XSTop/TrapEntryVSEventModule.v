// Generated by CIRCT firtool-1.74.0
module TrapEntryVSEventModule(
  input         valid,
  input         in_causeNO_Interrupt,
  input  [62:0] in_causeNO_ExceptionCode,
  input  [40:0] in_trapPc,
  input         in_isCrossPageIPF,
  input  [1:0]  in_iMode_PRVM,
  input         in_iMode_V,
  input  [1:0]  in_dMode_PRVM,
  input         in_dMode_V,
  input  [1:0]  in_privState_PRVM,
  input         in_vsstatus_SIE,
  input  [40:0] in_pcFromXtvec,
  input  [3:0]  in_satp_MODE,
  input  [3:0]  in_vsatp_MODE,
  input  [3:0]  in_hgatp_MODE,
  input  [40:0] in_memExceptionVAddr,
  output        out_privState_valid,
  output [1:0]  out_privState_bits_PRVM,
  output        out_privState_bits_V,
  output        out_vsstatus_valid,
  output        out_vsstatus_bits_SIE,
  output        out_vsstatus_bits_SPIE,
  output        out_vsstatus_bits_UBE,
  output        out_vsstatus_bits_SPP,
  output [1:0]  out_vsstatus_bits_VS,
  output [1:0]  out_vsstatus_bits_FS,
  output [1:0]  out_vsstatus_bits_XS,
  output        out_vsstatus_bits_SUM,
  output        out_vsstatus_bits_MXR,
  output [1:0]  out_vsstatus_bits_UXL,
  output        out_vsstatus_bits_SD,
  output        out_vsepc_valid,
  output [62:0] out_vsepc_bits_epc,
  output        out_vscause_valid,
  output        out_vscause_bits_Interrupt,
  output [62:0] out_vscause_bits_ExceptionCode,
  output        out_vstval_valid,
  output [63:0] out_vstval_bits_ALL,
  output        out_targetPc_valid,
  output [40:0] out_targetPc_bits
);

  wire [62:0] highPrioTrapNO =
    (in_causeNO_ExceptionCode == 63'h2 | in_causeNO_ExceptionCode == 63'h6
     | in_causeNO_ExceptionCode == 63'hA) & in_causeNO_Interrupt
      ? 63'(in_causeNO_ExceptionCode - 63'h1)
      : in_causeNO_ExceptionCode;
  wire        trapPC_isBare_v_PrvmIsM = &in_iMode_PRVM;
  wire        trapPC_isBare_isModeM = trapPC_isBare_v_PrvmIsM;
  wire        trapPC_isBare_PrvmIsU = in_iMode_PRVM == 2'h0;
  wire        trapPC_isBare_PrvmIsS = in_iMode_PRVM == 2'h1;
  wire        _trapPC_isSv48_T = trapPC_isBare_PrvmIsU | trapPC_isBare_PrvmIsS;
  wire        _trapMemVA_isBare_T_5 = in_satp_MODE == 4'h0;
  wire        _trapMemVA_isSv48x4_T_2 = in_vsatp_MODE == 4'h0;
  wire        _trapMemVA_isBare_T_12 = in_hgatp_MODE == 4'h0;
  wire        _trapMemVA_isSv39_T_5 = in_satp_MODE == 4'h8;
  wire        _trapMemVA_isSv39_T_9 = in_vsatp_MODE == 4'h8;
  wire        _trapMemVA_isSv39x4_T_4 = in_hgatp_MODE == 4'h8;
  wire [63:0] trapPC =
    (trapPC_isBare_isModeM | _trapPC_isSv48_T & ~in_iMode_V & _trapMemVA_isBare_T_5
     | in_iMode_V & _trapMemVA_isSv48x4_T_2 & _trapMemVA_isBare_T_12
       ? {28'h0, in_trapPc[35:0]}
       : 64'h0)
    | (_trapPC_isSv48_T & ~in_iMode_V & _trapMemVA_isSv39_T_5 | in_iMode_V
       & _trapMemVA_isSv39_T_9
         ? {{25{in_trapPc[38]}}, in_trapPc[38:0]}
         : 64'h0)
    | (in_iMode_V & _trapMemVA_isSv48x4_T_2 & _trapMemVA_isSv39x4_T_4
         ? {{23{in_trapPc[40]}}, in_trapPc}
         : 64'h0);
  wire        trapMemVA_isBare_v_PrvmIsM = &in_dMode_PRVM;
  wire        trapMemVA_isBare_isModeM = trapMemVA_isBare_v_PrvmIsM;
  wire        trapMemVA_isBare_PrvmIsU = in_dMode_PRVM == 2'h0;
  wire        trapMemVA_isBare_PrvmIsS = in_dMode_PRVM == 2'h1;
  wire        _trapMemVA_isSv48_T = trapMemVA_isBare_PrvmIsU | trapMemVA_isBare_PrvmIsS;
  wire [63:0] trapMemVA =
    (trapMemVA_isBare_isModeM | _trapMemVA_isSv48_T & ~in_dMode_V & _trapMemVA_isBare_T_5
     | in_dMode_V & _trapMemVA_isSv48x4_T_2 & _trapMemVA_isBare_T_12
       ? {28'h0, in_memExceptionVAddr[35:0]}
       : 64'h0)
    | (_trapMemVA_isSv48_T & ~in_dMode_V & _trapMemVA_isSv39_T_5 | in_dMode_V
       & _trapMemVA_isSv39_T_9
         ? {{25{in_memExceptionVAddr[38]}}, in_memExceptionVAddr[38:0]}
         : 64'h0)
    | (in_dMode_V & _trapMemVA_isSv48x4_T_2 & _trapMemVA_isSv39x4_T_4
         ? {{23{in_memExceptionVAddr[40]}}, in_memExceptionVAddr}
         : 64'h0);
  wire        isFetchExcp =
    ~in_causeNO_Interrupt & (highPrioTrapNO == 63'h1 | highPrioTrapNO == 63'hC);
  wire        isMemExcp =
    ~in_causeNO_Interrupt
    & (highPrioTrapNO == 63'h4 | highPrioTrapNO == 63'h5 | highPrioTrapNO == 63'h6
       | highPrioTrapNO == 63'h7 | highPrioTrapNO == 63'hD | highPrioTrapNO == 63'hF);
  wire        isBpExcp = ~in_causeNO_Interrupt & highPrioTrapNO == 63'h3;
  wire        _tval_T_4 = isMemExcp & in_dMode_V;
  wire        tvalFillGVA = (isFetchExcp | isBpExcp) & in_iMode_V | _tval_T_4;
  assign out_privState_valid = valid;
  assign out_privState_bits_PRVM = 2'h1;
  assign out_privState_bits_V = 1'h1;
  assign out_vsstatus_valid = valid;
  assign out_vsstatus_bits_SIE = 1'h0;
  assign out_vsstatus_bits_SPIE = in_vsstatus_SIE;
  assign out_vsstatus_bits_UBE = 1'h0;
  assign out_vsstatus_bits_SPP = in_privState_PRVM[0];
  assign out_vsstatus_bits_VS = 2'h0;
  assign out_vsstatus_bits_FS = 2'h0;
  assign out_vsstatus_bits_XS = 2'h0;
  assign out_vsstatus_bits_SUM = 1'h0;
  assign out_vsstatus_bits_MXR = 1'h0;
  assign out_vsstatus_bits_UXL = 2'h0;
  assign out_vsstatus_bits_SD = 1'h0;
  assign out_vsepc_valid = valid;
  assign out_vsepc_bits_epc = trapPC[63:1];
  assign out_vscause_valid = valid;
  assign out_vscause_bits_Interrupt = in_causeNO_Interrupt;
  assign out_vscause_bits_ExceptionCode = highPrioTrapNO;
  assign out_vstval_valid = valid;
  assign out_vstval_bits_ALL =
    (isFetchExcp & ~in_isCrossPageIPF | isBpExcp ? trapPC : 64'h0)
    | (isFetchExcp & in_isCrossPageIPF ? 64'(trapPC + 64'h2) : 64'h0)
    | (isMemExcp & ~in_dMode_V ? trapMemVA : 64'h0) | (_tval_T_4 ? trapMemVA : 64'h0);
  assign out_targetPc_valid = valid;
  assign out_targetPc_bits = in_pcFromXtvec;
endmodule

