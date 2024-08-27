// Generated by CIRCT firtool-1.74.0
module VIAluSrcTypeModule(
  input  [8:0] io_in_fuOpType,
  input  [1:0] io_in_vsew,
  input        io_in_isExt,
  input        io_in_isDstMask,
  output [3:0] io_out_vs1Type,
  output [3:0] io_out_vs2Type,
  output [3:0] io_out_vdType,
  output       io_out_isVextF2,
  output       io_out_isVextF4,
  output       io_out_isVextF8
);

  wire [1:0]  _vsewX2_T = 2'(io_in_vsew + 2'h1);
  wire        isVext = io_in_fuOpType[5:0] == 6'h2;
  wire        _maskTypes_T = io_in_fuOpType[8:7] == 2'h1;
  wire        _maskTypes_T_4 = io_in_fuOpType[8:7] == 2'h2;
  wire        _vextSews_T = io_in_fuOpType[8:7] == 2'h0;
  wire [5:0]  _addSubSews_T_14 =
    (_vextSews_T ? {3{io_in_vsew}} : 6'h0)
    | (_maskTypes_T ? {{2{io_in_vsew}}, _vsewX2_T} : 6'h0)
    | (_maskTypes_T_4 ? {_vsewX2_T, io_in_vsew, _vsewX2_T} : 6'h0)
    | ((&(io_in_fuOpType[8:7])) ? {_vsewX2_T, {2{io_in_vsew}}} : 6'h0);
  wire [5:0]  _vextSews_T_10 =
    (_vextSews_T ? {{2{2'(io_in_vsew - 2'h1)}}, io_in_vsew} : 6'h0)
    | (_maskTypes_T ? {{2{2'(io_in_vsew - 2'h2)}}, io_in_vsew} : 6'h0)
    | (_maskTypes_T_4 ? {{2{2'(io_in_vsew + 2'h1)}}, io_in_vsew} : 6'h0);
  wire [11:0] _maskTypes_T_14 =
    (_maskTypes_T
       ? {1'h0, io_in_fuOpType[6], io_in_vsew, 1'h0, io_in_fuOpType[6], io_in_vsew, 4'hF}
       : 12'h0)
    | (_maskTypes_T_4
         ? {1'h0,
            io_in_fuOpType[6],
            io_in_vsew,
            1'h0,
            io_in_fuOpType[6],
            io_in_vsew,
            4'hF}
         : 12'h0) | {12{&(io_in_fuOpType[8:7])}};
  wire        _GEN = io_in_isExt | io_in_isDstMask;
  assign io_out_vs1Type =
    (io_in_isDstMask ? _maskTypes_T_14[7:4] : 4'h0)
    | (io_in_isExt ? {1'h0, io_in_fuOpType[6], _vextSews_T_10[3:2]} : 4'h0)
    | (_GEN ? 4'h0 : {1'h0, io_in_fuOpType[6], _addSubSews_T_14[3:2]});
  assign io_out_vs2Type =
    (io_in_isDstMask ? _maskTypes_T_14[11:8] : 4'h0)
    | (io_in_isExt ? {1'h0, io_in_fuOpType[6], _vextSews_T_10[5:4]} : 4'h0)
    | (_GEN ? 4'h0 : {1'h0, io_in_fuOpType[6], _addSubSews_T_14[5:4]});
  assign io_out_vdType =
    (io_in_isDstMask ? _maskTypes_T_14[3:0] : 4'h0)
    | (io_in_isExt ? {1'h0, io_in_fuOpType[6], _vextSews_T_10[1:0]} : 4'h0)
    | (_GEN ? 4'h0 : {1'h0, io_in_fuOpType[6], _addSubSews_T_14[1:0]});
  assign io_out_isVextF2 = isVext & _vextSews_T;
  assign io_out_isVextF4 = isVext & _maskTypes_T;
  assign io_out_isVextF8 = isVext & _maskTypes_T_4;
endmodule

