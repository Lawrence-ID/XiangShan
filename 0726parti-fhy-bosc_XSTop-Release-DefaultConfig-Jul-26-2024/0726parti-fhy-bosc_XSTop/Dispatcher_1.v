// Generated by CIRCT firtool-1.74.0
module Dispatcher_1(
  input         io_in_valid,
  input  [34:0] io_in_bits_fuType,
  input  [8:0]  io_in_bits_fuOpType,
  input  [63:0] io_in_bits_src_0,
  input  [63:0] io_in_bits_src_1,
  input  [31:0] io_in_bits_imm,
  input         io_in_bits_robIdx_flag,
  input  [7:0]  io_in_bits_robIdx_value,
  input  [7:0]  io_in_bits_pdest,
  input         io_in_bits_rfWen,
  input  [38:0] io_in_bits_pc,
  input         io_in_bits_preDecode_valid,
  input         io_in_bits_preDecode_isRVC,
  input  [1:0]  io_in_bits_preDecode_brType,
  input         io_in_bits_preDecode_isCall,
  input         io_in_bits_preDecode_isRet,
  input         io_in_bits_ftqIdx_flag,
  input  [5:0]  io_in_bits_ftqIdx_value,
  input  [3:0]  io_in_bits_ftqOffset,
  input  [38:0] io_in_bits_predictInfo_target,
  input         io_in_bits_predictInfo_taken,
  output        io_out_0_valid,
  output [8:0]  io_out_0_bits_fuOpType,
  output [63:0] io_out_0_bits_src_0,
  output [63:0] io_out_0_bits_src_1,
  output [31:0] io_out_0_bits_imm,
  output        io_out_0_bits_robIdx_flag,
  output [7:0]  io_out_0_bits_robIdx_value,
  output [7:0]  io_out_0_bits_pdest,
  output [38:0] io_out_0_bits_pc,
  output        io_out_0_bits_preDecode_valid,
  output        io_out_0_bits_preDecode_isRVC,
  output [1:0]  io_out_0_bits_preDecode_brType,
  output        io_out_0_bits_preDecode_isCall,
  output        io_out_0_bits_preDecode_isRet,
  output        io_out_0_bits_ftqIdx_flag,
  output [5:0]  io_out_0_bits_ftqIdx_value,
  output [3:0]  io_out_0_bits_ftqOffset,
  output        io_out_0_bits_predictInfo_taken,
  output        io_out_1_valid,
  output [8:0]  io_out_1_bits_fuOpType,
  output [63:0] io_out_1_bits_src_0,
  output [31:0] io_out_1_bits_imm,
  output        io_out_1_bits_robIdx_flag,
  output [7:0]  io_out_1_bits_robIdx_value,
  output [7:0]  io_out_1_bits_pdest,
  output        io_out_1_bits_rfWen,
  output [38:0] io_out_1_bits_pc,
  output        io_out_1_bits_preDecode_valid,
  output        io_out_1_bits_preDecode_isRVC,
  output [1:0]  io_out_1_bits_preDecode_brType,
  output        io_out_1_bits_preDecode_isCall,
  output        io_out_1_bits_preDecode_isRet,
  output        io_out_1_bits_ftqIdx_flag,
  output [5:0]  io_out_1_bits_ftqIdx_value,
  output [3:0]  io_out_1_bits_ftqOffset,
  output [38:0] io_out_1_bits_predictInfo_target,
  output        io_out_1_bits_predictInfo_taken
);

  assign io_out_0_valid = io_in_bits_fuType == 35'h2 & io_in_valid;
  assign io_out_0_bits_fuOpType = io_in_bits_fuOpType;
  assign io_out_0_bits_src_0 = io_in_bits_src_0;
  assign io_out_0_bits_src_1 = io_in_bits_src_1;
  assign io_out_0_bits_imm = io_in_bits_imm;
  assign io_out_0_bits_robIdx_flag = io_in_bits_robIdx_flag;
  assign io_out_0_bits_robIdx_value = io_in_bits_robIdx_value;
  assign io_out_0_bits_pdest = io_in_bits_pdest;
  assign io_out_0_bits_pc = io_in_bits_pc;
  assign io_out_0_bits_preDecode_valid = io_in_bits_preDecode_valid;
  assign io_out_0_bits_preDecode_isRVC = io_in_bits_preDecode_isRVC;
  assign io_out_0_bits_preDecode_brType = io_in_bits_preDecode_brType;
  assign io_out_0_bits_preDecode_isCall = io_in_bits_preDecode_isCall;
  assign io_out_0_bits_preDecode_isRet = io_in_bits_preDecode_isRet;
  assign io_out_0_bits_ftqIdx_flag = io_in_bits_ftqIdx_flag;
  assign io_out_0_bits_ftqIdx_value = io_in_bits_ftqIdx_value;
  assign io_out_0_bits_ftqOffset = io_in_bits_ftqOffset;
  assign io_out_0_bits_predictInfo_taken = io_in_bits_predictInfo_taken;
  assign io_out_1_valid = io_in_bits_fuType == 35'h1 & io_in_valid;
  assign io_out_1_bits_fuOpType = io_in_bits_fuOpType;
  assign io_out_1_bits_src_0 = io_in_bits_src_0;
  assign io_out_1_bits_imm = io_in_bits_imm;
  assign io_out_1_bits_robIdx_flag = io_in_bits_robIdx_flag;
  assign io_out_1_bits_robIdx_value = io_in_bits_robIdx_value;
  assign io_out_1_bits_pdest = io_in_bits_pdest;
  assign io_out_1_bits_rfWen = io_in_bits_rfWen;
  assign io_out_1_bits_pc = io_in_bits_pc;
  assign io_out_1_bits_preDecode_valid = io_in_bits_preDecode_valid;
  assign io_out_1_bits_preDecode_isRVC = io_in_bits_preDecode_isRVC;
  assign io_out_1_bits_preDecode_brType = io_in_bits_preDecode_brType;
  assign io_out_1_bits_preDecode_isCall = io_in_bits_preDecode_isCall;
  assign io_out_1_bits_preDecode_isRet = io_in_bits_preDecode_isRet;
  assign io_out_1_bits_ftqIdx_flag = io_in_bits_ftqIdx_flag;
  assign io_out_1_bits_ftqIdx_value = io_in_bits_ftqIdx_value;
  assign io_out_1_bits_ftqOffset = io_in_bits_ftqOffset;
  assign io_out_1_bits_predictInfo_target = io_in_bits_predictInfo_target;
  assign io_out_1_bits_predictInfo_taken = io_in_bits_predictInfo_taken;
endmodule

