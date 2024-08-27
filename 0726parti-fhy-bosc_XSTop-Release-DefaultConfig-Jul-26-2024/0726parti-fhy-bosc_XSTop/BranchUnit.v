// Generated by CIRCT firtool-1.74.0
module BranchUnit(
  input         io_in_valid,
  input  [8:0]  io_in_bits_ctrl_fuOpType,
  input         io_in_bits_ctrl_robIdx_flag,
  input  [7:0]  io_in_bits_ctrl_robIdx_value,
  input  [7:0]  io_in_bits_ctrl_pdest,
  input         io_in_bits_ctrl_preDecode_valid,
  input         io_in_bits_ctrl_preDecode_isRVC,
  input  [1:0]  io_in_bits_ctrl_preDecode_brType,
  input         io_in_bits_ctrl_preDecode_isCall,
  input         io_in_bits_ctrl_preDecode_isRet,
  input         io_in_bits_ctrl_ftqIdx_flag,
  input  [5:0]  io_in_bits_ctrl_ftqIdx_value,
  input  [3:0]  io_in_bits_ctrl_ftqOffset,
  input         io_in_bits_ctrl_predictInfo_taken,
  input  [63:0] io_in_bits_data_src_1,
  input  [63:0] io_in_bits_data_src_0,
  input  [63:0] io_in_bits_data_imm,
  input  [38:0] io_in_bits_data_pc,
  output        io_out_valid,
  output        io_out_bits_ctrl_robIdx_flag,
  output [7:0]  io_out_bits_ctrl_robIdx_value,
  output [7:0]  io_out_bits_ctrl_pdest,
  output        io_out_bits_ctrl_preDecode_valid,
  output        io_out_bits_ctrl_preDecode_isRVC,
  output [1:0]  io_out_bits_ctrl_preDecode_brType,
  output        io_out_bits_ctrl_preDecode_isCall,
  output        io_out_bits_ctrl_preDecode_isRet,
  output [63:0] io_out_bits_res_data,
  output        io_out_bits_res_redirect_valid,
  output        io_out_bits_res_redirect_bits_isRVC,
  output        io_out_bits_res_redirect_bits_robIdx_flag,
  output [7:0]  io_out_bits_res_redirect_bits_robIdx_value,
  output        io_out_bits_res_redirect_bits_ftqIdx_flag,
  output [5:0]  io_out_bits_res_redirect_bits_ftqIdx_value,
  output [3:0]  io_out_bits_res_redirect_bits_ftqOffset,
  output        io_out_bits_res_redirect_bits_level,
  output        io_out_bits_res_redirect_bits_interrupt,
  output [40:0] io_out_bits_res_redirect_bits_cfiUpdate_pc,
  output        io_out_bits_res_redirect_bits_cfiUpdate_pd_valid,
  output        io_out_bits_res_redirect_bits_cfiUpdate_pd_isRVC,
  output [1:0]  io_out_bits_res_redirect_bits_cfiUpdate_pd_brType,
  output        io_out_bits_res_redirect_bits_cfiUpdate_pd_isCall,
  output        io_out_bits_res_redirect_bits_cfiUpdate_pd_isRet,
  output [3:0]  io_out_bits_res_redirect_bits_cfiUpdate_ssp,
  output [2:0]  io_out_bits_res_redirect_bits_cfiUpdate_sctr,
  output        io_out_bits_res_redirect_bits_cfiUpdate_TOSW_flag,
  output [4:0]  io_out_bits_res_redirect_bits_cfiUpdate_TOSW_value,
  output        io_out_bits_res_redirect_bits_cfiUpdate_TOSR_flag,
  output [4:0]  io_out_bits_res_redirect_bits_cfiUpdate_TOSR_value,
  output        io_out_bits_res_redirect_bits_cfiUpdate_NOS_flag,
  output [4:0]  io_out_bits_res_redirect_bits_cfiUpdate_NOS_value,
  output [40:0] io_out_bits_res_redirect_bits_cfiUpdate_topAddr,
  output [10:0] io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_17_folded_hist,
  output [10:0] io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_16_folded_hist,
  output [6:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_15_folded_hist,
  output [7:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_14_folded_hist,
  output [8:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_13_folded_hist,
  output [3:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_12_folded_hist,
  output [7:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_11_folded_hist,
  output [8:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_10_folded_hist,
  output [6:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_9_folded_hist,
  output [7:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_8_folded_hist,
  output [6:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_7_folded_hist,
  output [8:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_6_folded_hist,
  output [6:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_5_folded_hist,
  output [7:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_4_folded_hist,
  output [7:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_3_folded_hist,
  output [7:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_2_folded_hist,
  output [10:0] io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_1_folded_hist,
  output [7:0]  io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_0_folded_hist,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_5_bits_0,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_5_bits_1,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_5_bits_2,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_5_bits_3,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_4_bits_0,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_4_bits_1,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_4_bits_2,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_4_bits_3,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_3_bits_0,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_3_bits_1,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_3_bits_2,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_3_bits_3,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_2_bits_0,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_2_bits_1,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_2_bits_2,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_2_bits_3,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_1_bits_0,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_1_bits_1,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_1_bits_2,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_1_bits_3,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_0_bits_0,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_0_bits_1,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_0_bits_2,
  output        io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_0_bits_3,
  output [2:0]  io_out_bits_res_redirect_bits_cfiUpdate_lastBrNumOH,
  output [3:0]  io_out_bits_res_redirect_bits_cfiUpdate_ghr,
  output        io_out_bits_res_redirect_bits_cfiUpdate_histPtr_flag,
  output [7:0]  io_out_bits_res_redirect_bits_cfiUpdate_histPtr_value,
  output [9:0]  io_out_bits_res_redirect_bits_cfiUpdate_specCnt_0,
  output [9:0]  io_out_bits_res_redirect_bits_cfiUpdate_specCnt_1,
  output        io_out_bits_res_redirect_bits_cfiUpdate_br_hit,
  output        io_out_bits_res_redirect_bits_cfiUpdate_jr_hit,
  output        io_out_bits_res_redirect_bits_cfiUpdate_sc_hit,
  output        io_out_bits_res_redirect_bits_cfiUpdate_predTaken,
  output [40:0] io_out_bits_res_redirect_bits_cfiUpdate_target,
  output        io_out_bits_res_redirect_bits_cfiUpdate_taken,
  output        io_out_bits_res_redirect_bits_cfiUpdate_isMisPred,
  output [1:0]  io_out_bits_res_redirect_bits_cfiUpdate_shift,
  output        io_out_bits_res_redirect_bits_cfiUpdate_addIntoHist,
  output        io_out_bits_res_redirect_bits_stFtqIdx_flag,
  output [5:0]  io_out_bits_res_redirect_bits_stFtqIdx_value,
  output [3:0]  io_out_bits_res_redirect_bits_stFtqOffset,
  output [63:0] io_out_bits_res_redirect_bits_debug_runahead_checkpoint_id,
  output        io_out_bits_res_redirect_bits_debugIsCtrl,
  output        io_out_bits_res_redirect_bits_debugIsMemVio
);

  wire [38:0] _addModule_io_target;
  wire        _dataModule_io_taken;
  wire        _dataModule_io_mispredict;
  BranchModule dataModule (
    .io_src_0      (io_in_bits_data_src_0),
    .io_src_1      (io_in_bits_data_src_1),
    .io_func       (io_in_bits_ctrl_fuOpType),
    .io_pred_taken (io_in_bits_ctrl_predictInfo_taken),
    .io_taken      (_dataModule_io_taken),
    .io_mispredict (_dataModule_io_mispredict)
  );
  AddrAddModule addModule (
    .io_pc     (io_in_bits_data_pc),
    .io_taken  (_dataModule_io_taken),
    .io_isRVC  (io_in_bits_ctrl_preDecode_isRVC),
    .io_offset (io_in_bits_data_imm[11:0]),
    .io_target (_addModule_io_target)
  );
  assign io_out_valid = io_in_valid;
  assign io_out_bits_ctrl_robIdx_flag = io_in_bits_ctrl_robIdx_flag;
  assign io_out_bits_ctrl_robIdx_value = io_in_bits_ctrl_robIdx_value;
  assign io_out_bits_ctrl_pdest = io_in_bits_ctrl_pdest;
  assign io_out_bits_ctrl_preDecode_valid = io_in_bits_ctrl_preDecode_valid;
  assign io_out_bits_ctrl_preDecode_isRVC = io_in_bits_ctrl_preDecode_isRVC;
  assign io_out_bits_ctrl_preDecode_brType = io_in_bits_ctrl_preDecode_brType;
  assign io_out_bits_ctrl_preDecode_isCall = io_in_bits_ctrl_preDecode_isCall;
  assign io_out_bits_ctrl_preDecode_isRet = io_in_bits_ctrl_preDecode_isRet;
  assign io_out_bits_res_data = 64'h0;
  assign io_out_bits_res_redirect_valid = io_in_valid & _dataModule_io_mispredict;
  assign io_out_bits_res_redirect_bits_isRVC = 1'h0;
  assign io_out_bits_res_redirect_bits_robIdx_flag = io_in_bits_ctrl_robIdx_flag;
  assign io_out_bits_res_redirect_bits_robIdx_value = io_in_bits_ctrl_robIdx_value;
  assign io_out_bits_res_redirect_bits_ftqIdx_flag = io_in_bits_ctrl_ftqIdx_flag;
  assign io_out_bits_res_redirect_bits_ftqIdx_value = io_in_bits_ctrl_ftqIdx_value;
  assign io_out_bits_res_redirect_bits_ftqOffset = io_in_bits_ctrl_ftqOffset;
  assign io_out_bits_res_redirect_bits_level = 1'h0;
  assign io_out_bits_res_redirect_bits_interrupt = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_pc = {2'h0, io_in_bits_data_pc};
  assign io_out_bits_res_redirect_bits_cfiUpdate_pd_valid = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_pd_isRVC = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_pd_brType = 2'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_pd_isCall = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_pd_isRet = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_ssp = 4'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_sctr = 3'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_TOSW_flag = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_TOSW_value = 5'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_TOSR_flag = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_TOSR_value = 5'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_NOS_flag = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_NOS_value = 5'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_topAddr = 41'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_17_folded_hist = 11'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_16_folded_hist = 11'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_15_folded_hist = 7'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_14_folded_hist = 8'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_13_folded_hist = 9'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_12_folded_hist = 4'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_11_folded_hist = 8'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_10_folded_hist = 9'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_9_folded_hist = 7'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_8_folded_hist = 8'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_7_folded_hist = 7'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_6_folded_hist = 9'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_5_folded_hist = 7'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_4_folded_hist = 8'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_3_folded_hist = 8'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_2_folded_hist = 8'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_1_folded_hist = 11'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_folded_hist_hist_0_folded_hist = 8'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_5_bits_0 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_5_bits_1 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_5_bits_2 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_5_bits_3 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_4_bits_0 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_4_bits_1 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_4_bits_2 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_4_bits_3 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_3_bits_0 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_3_bits_1 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_3_bits_2 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_3_bits_3 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_2_bits_0 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_2_bits_1 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_2_bits_2 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_2_bits_3 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_1_bits_0 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_1_bits_1 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_1_bits_2 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_1_bits_3 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_0_bits_0 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_0_bits_1 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_0_bits_2 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_afhob_afhob_0_bits_3 = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_lastBrNumOH = 3'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_ghr = 4'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_histPtr_flag = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_histPtr_value = 8'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_specCnt_0 = 10'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_specCnt_1 = 10'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_br_hit = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_jr_hit = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_sc_hit = 1'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_predTaken =
    io_in_bits_ctrl_predictInfo_taken;
  assign io_out_bits_res_redirect_bits_cfiUpdate_target = {2'h0, _addModule_io_target};
  assign io_out_bits_res_redirect_bits_cfiUpdate_taken = _dataModule_io_taken;
  assign io_out_bits_res_redirect_bits_cfiUpdate_isMisPred = _dataModule_io_mispredict;
  assign io_out_bits_res_redirect_bits_cfiUpdate_shift = 2'h0;
  assign io_out_bits_res_redirect_bits_cfiUpdate_addIntoHist = 1'h0;
  assign io_out_bits_res_redirect_bits_stFtqIdx_flag = 1'h0;
  assign io_out_bits_res_redirect_bits_stFtqIdx_value = 6'h0;
  assign io_out_bits_res_redirect_bits_stFtqOffset = 4'h0;
  assign io_out_bits_res_redirect_bits_debug_runahead_checkpoint_id = 64'h0;
  assign io_out_bits_res_redirect_bits_debugIsCtrl = 1'h0;
  assign io_out_bits_res_redirect_bits_debugIsMemVio = 1'h0;
endmodule

