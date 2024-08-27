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
module MipModule(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata,
  output        regOut_SSIP,
  output        regOut_VSSIP,
  output        regOut_MSIP,
  output        regOut_STIP,
  output        regOut_VSTIP,
  output        regOut_MTIP,
  output        regOut_SEIP,
  output        regOut_VSEIP,
  output        regOut_MEIP,
  output        regOut_SGEIP,
  output        regOut_LCOFIP,
  input         mvip_SEIP,
  input         mvien_SSIE,
  input         mvien_SEIE,
  input         hvip_VSSIP,
  input         hvip_VSTIP,
  input         hvip_VSEIP,
  input  [62:0] hgeip_ip,
  input  [62:0] hgeie_ie,
  input  [5:0]  hstatusVGEIN,
  input         platformIRP_MEIP,
  input         platformIRP_MTIP,
  input         platformIRP_MSIP,
  input         platformIRP_SEIP,
  input         platformIRP_STIP,
  input         platformIRP_VSTIP,
  input         menvcfg_STCE,
  input         lcofiReq,
  input         aiaToCSR_meip,
  input         aiaToCSR_seip,
  input         fromMvip_SSIP_valid,
  input         fromMvip_SSIP_bits,
  input         fromMvip_STIP_valid,
  input         fromMvip_STIP_bits,
  input         fromSip_SSIP_valid,
  input         fromSip_SSIP_bits,
  input         fromSip_LCOFIP_valid,
  input         fromSip_LCOFIP_bits,
  input         fromVSip_LCOFIP_valid,
  input         fromVSip_LCOFIP_bits,
  output        toMvip_SEIP_valid,
  output        toMvip_SEIP_bits,
  output        toHvip_VSSIP_valid,
  output        toHvip_VSSIP_bits
);

  wire [62:0] _GEN;
  wire        _regOut_MEIP_WIRE;
  wire        _regOut_VSEIP_WIRE;
  wire        _rdataFields_SEIP_WIRE;
  wire        _regOut_VSTIP_WIRE;
  wire        _regOut_STIP_WIRE;
  reg         reg_SSIP;
  reg         reg_STIP;
  reg         reg_LCOFIP;
  assign _regOut_STIP_WIRE = menvcfg_STCE ? platformIRP_STIP : reg_STIP;
  assign _regOut_VSTIP_WIRE = hvip_VSTIP | platformIRP_VSTIP;
  wire        _regOut_SEIP_WIRE = ~mvien_SEIE & mvip_SEIP;
  assign _rdataFields_SEIP_WIRE = _regOut_SEIP_WIRE | platformIRP_SEIP | aiaToCSR_seip;
  wire [63:0] _GEN_0 = {hgeip_ip, 1'h0} >> hstatusVGEIN;
  assign _regOut_VSEIP_WIRE = hvip_VSEIP | _GEN_0[0];
  assign _regOut_MEIP_WIRE = platformIRP_MEIP | aiaToCSR_meip;
  assign _GEN = hgeip_ip & hgeie_ie;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_SSIP <= 1'h0;
      reg_STIP <= 1'h0;
      reg_LCOFIP <= 1'h0;
    end
    else begin
      if (fromMvip_SSIP_valid | fromSip_SSIP_valid)
        reg_SSIP <=
          fromMvip_SSIP_valid & fromMvip_SSIP_bits | fromSip_SSIP_valid
          & fromSip_SSIP_bits;
      else if (w_wen)
        reg_SSIP <= w_wdata[1];
      if ((w_wen | fromMvip_STIP_valid) & ~menvcfg_STCE)
        reg_STIP <= w_wen & w_wdata[5] | fromMvip_STIP_valid & fromMvip_STIP_bits;
      else if (w_wen)
        reg_STIP <= w_wdata[5];
      reg_LCOFIP <=
        fromSip_LCOFIP_valid | fromVSip_LCOFIP_valid
          ? fromSip_LCOFIP_valid & fromSip_LCOFIP_bits | fromVSip_LCOFIP_valid
            & fromVSip_LCOFIP_bits
          : lcofiReq;
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
        reg_SSIP = _RANDOM[/*Zero width*/ 1'b0][0];
        reg_STIP = _RANDOM[/*Zero width*/ 1'b0][3];
        reg_LCOFIP = _RANDOM[/*Zero width*/ 1'b0][10];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_SSIP = 1'h0;
        reg_STIP = 1'h0;
        reg_LCOFIP = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata =
    {50'h0,
     reg_LCOFIP,
     |_GEN,
     _regOut_MEIP_WIRE,
     _regOut_VSEIP_WIRE,
     _rdataFields_SEIP_WIRE,
     1'h0,
     platformIRP_MTIP,
     _regOut_VSTIP_WIRE,
     _regOut_STIP_WIRE,
     1'h0,
     platformIRP_MSIP,
     hvip_VSSIP,
     reg_SSIP,
     1'h0};
  assign regOut_SSIP = reg_SSIP;
  assign regOut_VSSIP = hvip_VSSIP;
  assign regOut_MSIP = platformIRP_MSIP;
  assign regOut_STIP = _regOut_STIP_WIRE;
  assign regOut_VSTIP = _regOut_VSTIP_WIRE;
  assign regOut_MTIP = platformIRP_MTIP;
  assign regOut_SEIP = _regOut_SEIP_WIRE;
  assign regOut_VSEIP = _regOut_VSEIP_WIRE;
  assign regOut_MEIP = _regOut_MEIP_WIRE;
  assign regOut_SGEIP = |_GEN;
  assign regOut_LCOFIP = reg_LCOFIP;
  assign toMvip_SEIP_valid = w_wen & ~mvien_SSIE;
  assign toMvip_SEIP_bits = w_wdata[9];
  assign toHvip_VSSIP_valid = w_wen;
  assign toHvip_VSSIP_bits = w_wdata[2];
endmodule

