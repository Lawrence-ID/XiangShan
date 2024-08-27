// Generated by CIRCT firtool-1.74.0
module TrapEntryMEventModule(
  input         valid,
  input         in_causeNO_Interrupt,
  input  [62:0] in_causeNO_ExceptionCode,
  input  [40:0] in_trapPc,
  input  [40:0] in_trapPcGPA,
  input         in_isCrossPageIPF,
  input         in_isHls,
  input  [1:0]  in_iMode_PRVM,
  input         in_iMode_V,
  input  [1:0]  in_dMode_PRVM,
  input         in_dMode_V,
  input  [1:0]  in_privState_PRVM,
  input         in_privState_V,
  input         in_mstatus_MIE,
  input         in_tcontrol_MTE,
  input  [40:0] in_pcFromXtvec,
  input  [3:0]  in_satp_MODE,
  input  [3:0]  in_vsatp_MODE,
  input  [3:0]  in_hgatp_MODE,
  input  [40:0] in_memExceptionVAddr,
  input  [40:0] in_memExceptionGPAddr,
  output        out_privState_valid,
  output [1:0]  out_privState_bits_PRVM,
  output        out_privState_bits_V,
  output        out_mstatus_valid,
  output        out_mstatus_bits_SIE,
  output        out_mstatus_bits_MIE,
  output        out_mstatus_bits_SPIE,
  output        out_mstatus_bits_UBE,
  output        out_mstatus_bits_MPIE,
  output        out_mstatus_bits_SPP,
  output [1:0]  out_mstatus_bits_VS,
  output [1:0]  out_mstatus_bits_MPP,
  output [1:0]  out_mstatus_bits_FS,
  output [1:0]  out_mstatus_bits_XS,
  output        out_mstatus_bits_MPRV,
  output        out_mstatus_bits_SUM,
  output        out_mstatus_bits_MXR,
  output        out_mstatus_bits_TVM,
  output        out_mstatus_bits_TW,
  output        out_mstatus_bits_TSR,
  output [1:0]  out_mstatus_bits_UXL,
  output [1:0]  out_mstatus_bits_SXL,
  output        out_mstatus_bits_SBE,
  output        out_mstatus_bits_MBE,
  output        out_mstatus_bits_GVA,
  output        out_mstatus_bits_MPV,
  output        out_mstatus_bits_SD,
  output        out_mepc_valid,
  output [62:0] out_mepc_bits_epc,
  output        out_mcause_valid,
  output        out_mcause_bits_Interrupt,
  output [62:0] out_mcause_bits_ExceptionCode,
  output        out_mtval_valid,
  output [63:0] out_mtval_bits_ALL,
  output        out_mtval2_valid,
  output [63:0] out_mtval2_bits_ALL,
  output        out_mtinst_valid,
  output [63:0] out_mtinst_bits_ALL,
  output        out_tcontrol_valid,
  output        out_tcontrol_bits_MPTE,
  output        out_tcontrol_bits_MTE,
  output        out_targetPc_valid,
  output [40:0] out_targetPc_bits
);

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
    ~in_causeNO_Interrupt
    & (in_causeNO_ExceptionCode == 63'h0 | in_causeNO_ExceptionCode == 63'h1
       | in_causeNO_ExceptionCode == 63'hC);
  wire        isMemExcp =
    ~in_causeNO_Interrupt
    & (in_causeNO_ExceptionCode == 63'h4 | in_causeNO_ExceptionCode == 63'h5
       | in_causeNO_ExceptionCode == 63'hD | in_causeNO_ExceptionCode == 63'h6
       | in_causeNO_ExceptionCode == 63'h7 | in_causeNO_ExceptionCode == 63'hF);
  wire        isBpExcp = ~in_causeNO_Interrupt & in_causeNO_ExceptionCode == 63'h3;
  wire        isLSGuestExcp =
    ~in_causeNO_Interrupt
    & (in_causeNO_ExceptionCode == 63'h15 | in_causeNO_ExceptionCode == 63'h17);
  wire        isFetchGuestExcp =
    ~in_causeNO_Interrupt & in_causeNO_ExceptionCode == 63'h14;
  wire        _tvalFillPcPlus2_T = isFetchExcp | isFetchGuestExcp;
  wire        _tval_T_4 = isMemExcp & in_dMode_V;
  wire        tvalFillGVA =
    in_isHls & isMemExcp | isLSGuestExcp | isFetchGuestExcp | (isFetchExcp | isBpExcp)
    & in_iMode_V | _tval_T_4;
  wire [63:0] _tval2_T_1 = 64'({{23{in_trapPcGPA[40]}}, in_trapPcGPA} + 64'h2);
  assign out_privState_valid = valid;
  assign out_privState_bits_PRVM = 2'h3;
  assign out_privState_bits_V = 1'h0;
  assign out_mstatus_valid = valid;
  assign out_mstatus_bits_SIE = 1'h0;
  assign out_mstatus_bits_MIE = 1'h0;
  assign out_mstatus_bits_SPIE = 1'h0;
  assign out_mstatus_bits_UBE = 1'h0;
  assign out_mstatus_bits_MPIE = in_mstatus_MIE;
  assign out_mstatus_bits_SPP = 1'h0;
  assign out_mstatus_bits_VS = 2'h0;
  assign out_mstatus_bits_MPP = in_privState_PRVM;
  assign out_mstatus_bits_FS = 2'h0;
  assign out_mstatus_bits_XS = 2'h0;
  assign out_mstatus_bits_MPRV = 1'h0;
  assign out_mstatus_bits_SUM = 1'h0;
  assign out_mstatus_bits_MXR = 1'h0;
  assign out_mstatus_bits_TVM = 1'h0;
  assign out_mstatus_bits_TW = 1'h0;
  assign out_mstatus_bits_TSR = 1'h0;
  assign out_mstatus_bits_UXL = 2'h0;
  assign out_mstatus_bits_SXL = 2'h0;
  assign out_mstatus_bits_SBE = 1'h0;
  assign out_mstatus_bits_MBE = 1'h0;
  assign out_mstatus_bits_GVA = tvalFillGVA;
  assign out_mstatus_bits_MPV = in_privState_V;
  assign out_mstatus_bits_SD = 1'h0;
  assign out_mepc_valid = valid;
  assign out_mepc_bits_epc = trapPC[63:1];
  assign out_mcause_valid = valid;
  assign out_mcause_bits_Interrupt = in_causeNO_Interrupt;
  assign out_mcause_bits_ExceptionCode = in_causeNO_ExceptionCode;
  assign out_mtval_valid = valid;
  assign out_mtval_bits_ALL =
    (_tvalFillPcPlus2_T & ~in_isCrossPageIPF | isBpExcp ? trapPC : 64'h0)
    | (_tvalFillPcPlus2_T & in_isCrossPageIPF ? 64'(trapPC + 64'h2) : 64'h0)
    | (isMemExcp & ~in_dMode_V ? trapMemVA : 64'h0) | (_tval_T_4 ? trapMemVA : 64'h0)
    | (isLSGuestExcp ? trapMemVA : 64'h0);
  assign out_mtval2_valid = valid;
  assign out_mtval2_bits_ALL =
    {2'h0,
     (isFetchGuestExcp ? trapPC[63:2] : 62'h0)
       | (isFetchGuestExcp & in_isCrossPageIPF ? _tval2_T_1[63:2] : 62'h0)
       | (isLSGuestExcp
            ? {{23{in_memExceptionGPAddr[40]}}, in_memExceptionGPAddr[40:2]}
            : 62'h0)};
  assign out_mtinst_valid = valid;
  assign out_mtinst_bits_ALL = 64'h0;
  assign out_tcontrol_valid = valid;
  assign out_tcontrol_bits_MPTE = in_tcontrol_MTE;
  assign out_tcontrol_bits_MTE = 1'h0;
  assign out_targetPc_valid = valid;
  assign out_targetPc_bits = in_pcFromXtvec;
endmodule

