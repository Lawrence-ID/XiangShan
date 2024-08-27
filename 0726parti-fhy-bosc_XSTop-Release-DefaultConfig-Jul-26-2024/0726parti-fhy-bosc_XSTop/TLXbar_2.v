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
module TLXbar_2(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [5:0]  auto_in_a_bits_source,
  input  [29:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [1:0]  auto_in_d_bits_size,
  output [5:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_4_a_ready,
  output        auto_out_4_a_valid,
  output [2:0]  auto_out_4_a_bits_opcode,
  output [2:0]  auto_out_4_a_bits_param,
  output [1:0]  auto_out_4_a_bits_size,
  output [5:0]  auto_out_4_a_bits_source,
  output [29:0] auto_out_4_a_bits_address,
  output [7:0]  auto_out_4_a_bits_mask,
  output [63:0] auto_out_4_a_bits_data,
  output        auto_out_4_a_bits_corrupt,
  output        auto_out_4_d_ready,
  input         auto_out_4_d_valid,
  input  [2:0]  auto_out_4_d_bits_opcode,
  input  [1:0]  auto_out_4_d_bits_param,
  input  [1:0]  auto_out_4_d_bits_size,
  input  [5:0]  auto_out_4_d_bits_source,
  input         auto_out_4_d_bits_sink,
  input         auto_out_4_d_bits_denied,
  input  [63:0] auto_out_4_d_bits_data,
  input         auto_out_4_d_bits_corrupt,
  input         auto_out_3_a_ready,
  output        auto_out_3_a_valid,
  output [2:0]  auto_out_3_a_bits_opcode,
  output [1:0]  auto_out_3_a_bits_size,
  output [5:0]  auto_out_3_a_bits_source,
  output [29:0] auto_out_3_a_bits_address,
  output [7:0]  auto_out_3_a_bits_mask,
  output [63:0] auto_out_3_a_bits_data,
  output        auto_out_3_d_ready,
  input         auto_out_3_d_valid,
  input  [2:0]  auto_out_3_d_bits_opcode,
  input  [1:0]  auto_out_3_d_bits_size,
  input  [5:0]  auto_out_3_d_bits_source,
  input  [63:0] auto_out_3_d_bits_data,
  input         auto_out_2_a_ready,
  output        auto_out_2_a_valid,
  output [2:0]  auto_out_2_a_bits_opcode,
  output [1:0]  auto_out_2_a_bits_size,
  output [5:0]  auto_out_2_a_bits_source,
  output [29:0] auto_out_2_a_bits_address,
  output [7:0]  auto_out_2_a_bits_mask,
  output [63:0] auto_out_2_a_bits_data,
  output        auto_out_2_d_ready,
  input         auto_out_2_d_valid,
  input  [2:0]  auto_out_2_d_bits_opcode,
  input  [1:0]  auto_out_2_d_bits_size,
  input  [5:0]  auto_out_2_d_bits_source,
  input  [63:0] auto_out_2_d_bits_data,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [1:0]  auto_out_1_a_bits_size,
  output [5:0]  auto_out_1_a_bits_source,
  output [29:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [1:0]  auto_out_1_d_bits_size,
  input  [5:0]  auto_out_1_d_bits_source,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [1:0]  auto_out_0_a_bits_size,
  output [5:0]  auto_out_0_a_bits_source,
  output [29:0] auto_out_0_a_bits_address,
  output [7:0]  auto_out_0_a_bits_mask,
  output [63:0] auto_out_0_a_bits_data,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_size,
  input  [5:0]  auto_out_0_d_bits_source,
  input  [63:0] auto_out_0_d_bits_data
);

  wire       requestAIO_0_0 =
    {auto_in_a_bits_address[26:25], auto_in_a_bits_address[17]} == 3'h0;
  wire       requestAIO_0_2 =
    {auto_in_a_bits_address[26],
     ~(auto_in_a_bits_address[25]),
     auto_in_a_bits_address[17],
     auto_in_a_bits_address[12]} == 4'h0;
  wire       requestAIO_0_3 =
    {auto_in_a_bits_address[26:25],
     ~(auto_in_a_bits_address[17]),
     auto_in_a_bits_address[12]} == 4'h0;
  wire [5:0] _GEN = auto_in_a_bits_address[17:12] ^ 6'h21;
  wire       requestAIO_0_4 = {auto_in_a_bits_address[26:25], _GEN[5], _GEN[0]} == 4'h0;
  reg        beatsLeft;
  wire [4:0] readys_valid =
    {auto_out_4_d_valid,
     auto_out_3_d_valid,
     auto_out_2_d_valid,
     auto_out_1_d_valid,
     auto_out_0_d_valid};
  reg  [4:0] readys_mask;
  wire [4:0] _readys_filter_T_1 = readys_valid & ~readys_mask;
  wire [7:0] _GEN_0 =
    {_readys_filter_T_1[3:0],
     auto_out_4_d_valid,
     auto_out_3_d_valid,
     auto_out_2_d_valid,
     auto_out_1_d_valid}
    | {_readys_filter_T_1, auto_out_4_d_valid, auto_out_3_d_valid, auto_out_2_d_valid};
  wire [6:0] _GEN_1 = _GEN_0[6:0] | {_readys_filter_T_1[4], _GEN_0[7:2]};
  wire [4:0] readys_readys =
    ~({readys_mask[4],
       _readys_filter_T_1[4] | readys_mask[3],
       _GEN_0[7] | readys_mask[2],
       _GEN_1[6:5] | readys_mask[1:0]}
      & (_GEN_1[4:0] | {_readys_filter_T_1[4], _GEN_0[7], _GEN_1[6:4]}));
  wire       winner_0 = readys_readys[0] & auto_out_0_d_valid;
  wire       winner_1 = readys_readys[1] & auto_out_1_d_valid;
  wire       winner_2 = readys_readys[2] & auto_out_2_d_valid;
  wire       winner_3 = readys_readys[3] & auto_out_3_d_valid;
  wire       winner_4 = readys_readys[4] & auto_out_4_d_valid;
  reg        state_0;
  reg        state_1;
  reg        state_2;
  reg        state_3;
  reg        state_4;
  wire       muxState_0 = beatsLeft ? state_0 : winner_0;
  wire       muxState_1 = beatsLeft ? state_1 : winner_1;
  wire       muxState_2 = beatsLeft ? state_2 : winner_2;
  wire       muxState_3 = beatsLeft ? state_3 : winner_3;
  wire       muxState_4 = beatsLeft ? state_4 : winner_4;
  wire       in_0_d_valid =
    beatsLeft
      ? state_0 & auto_out_0_d_valid | state_1 & auto_out_1_d_valid | state_2
        & auto_out_2_d_valid | state_3 & auto_out_3_d_valid | state_4 & auto_out_4_d_valid
      : auto_out_0_d_valid | auto_out_1_d_valid | auto_out_2_d_valid | auto_out_3_d_valid
        | auto_out_4_d_valid;
  wire [4:0] _readys_mask_T = readys_readys & readys_valid;
  wire [4:0] _readys_mask_T_3 = _readys_mask_T | {_readys_mask_T[3:0], 1'h0};
  wire [4:0] _readys_mask_T_6 = _readys_mask_T_3 | {_readys_mask_T_3[2:0], 2'h0};
  wire       latch = ~beatsLeft & auto_in_d_ready;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      beatsLeft <= 1'h0;
      readys_mask <= 5'h1F;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
      state_2 <= 1'h0;
      state_3 <= 1'h0;
      state_4 <= 1'h0;
    end
    else begin
      beatsLeft <= ~latch & 1'(beatsLeft - (auto_in_d_ready & in_0_d_valid));
      if (latch & (|readys_valid))
        readys_mask <= _readys_mask_T_6 | {_readys_mask_T_6[0], 4'h0};
      if (beatsLeft) begin
      end
      else begin
        state_0 <= winner_0;
        state_1 <= winner_1;
        state_2 <= winner_2;
        state_3 <= winner_3;
        state_4 <= winner_4;
      end
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
        beatsLeft = _RANDOM[/*Zero width*/ 1'b0][0];
        readys_mask = _RANDOM[/*Zero width*/ 1'b0][5:1];
        state_0 = _RANDOM[/*Zero width*/ 1'b0][6];
        state_1 = _RANDOM[/*Zero width*/ 1'b0][7];
        state_2 = _RANDOM[/*Zero width*/ 1'b0][8];
        state_3 = _RANDOM[/*Zero width*/ 1'b0][9];
        state_4 = _RANDOM[/*Zero width*/ 1'b0][10];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        beatsLeft = 1'h0;
        readys_mask = 5'h1F;
        state_0 = 1'h0;
        state_1 = 1'h0;
        state_2 = 1'h0;
        state_3 = 1'h0;
        state_4 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign auto_in_a_ready =
    requestAIO_0_0 & auto_out_0_a_ready | auto_in_a_bits_address[26] & auto_out_1_a_ready
    | requestAIO_0_2 & auto_out_2_a_ready | requestAIO_0_3 & auto_out_3_a_ready
    | requestAIO_0_4 & auto_out_4_a_ready;
  assign auto_in_d_valid = in_0_d_valid;
  assign auto_in_d_bits_opcode =
    (muxState_0 ? auto_out_0_d_bits_opcode : 3'h0)
    | (muxState_1 ? auto_out_1_d_bits_opcode : 3'h0)
    | (muxState_2 ? auto_out_2_d_bits_opcode : 3'h0)
    | (muxState_3 ? auto_out_3_d_bits_opcode : 3'h0)
    | (muxState_4 ? auto_out_4_d_bits_opcode : 3'h0);
  assign auto_in_d_bits_param = muxState_4 ? auto_out_4_d_bits_param : 2'h0;
  assign auto_in_d_bits_size =
    (muxState_0 ? auto_out_0_d_bits_size : 2'h0)
    | (muxState_1 ? auto_out_1_d_bits_size : 2'h0)
    | (muxState_2 ? auto_out_2_d_bits_size : 2'h0)
    | (muxState_3 ? auto_out_3_d_bits_size : 2'h0)
    | (muxState_4 ? auto_out_4_d_bits_size : 2'h0);
  assign auto_in_d_bits_source =
    (muxState_0 ? auto_out_0_d_bits_source : 6'h0)
    | (muxState_1 ? auto_out_1_d_bits_source : 6'h0)
    | (muxState_2 ? auto_out_2_d_bits_source : 6'h0)
    | (muxState_3 ? auto_out_3_d_bits_source : 6'h0)
    | (muxState_4 ? auto_out_4_d_bits_source : 6'h0);
  assign auto_in_d_bits_sink = muxState_4 & auto_out_4_d_bits_sink;
  assign auto_in_d_bits_denied = muxState_4 & auto_out_4_d_bits_denied;
  assign auto_in_d_bits_data =
    (muxState_0 ? auto_out_0_d_bits_data : 64'h0)
    | (muxState_1 ? auto_out_1_d_bits_data : 64'h0)
    | (muxState_2 ? auto_out_2_d_bits_data : 64'h0)
    | (muxState_3 ? auto_out_3_d_bits_data : 64'h0)
    | (muxState_4 ? auto_out_4_d_bits_data : 64'h0);
  assign auto_in_d_bits_corrupt = muxState_4 & auto_out_4_d_bits_corrupt;
  assign auto_out_4_a_valid = auto_in_a_valid & requestAIO_0_4;
  assign auto_out_4_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_4_a_bits_param = auto_in_a_bits_param;
  assign auto_out_4_a_bits_size = auto_in_a_bits_size;
  assign auto_out_4_a_bits_source = auto_in_a_bits_source;
  assign auto_out_4_a_bits_address = auto_in_a_bits_address;
  assign auto_out_4_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_4_a_bits_data = auto_in_a_bits_data;
  assign auto_out_4_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_4_d_ready = auto_in_d_ready & (beatsLeft ? state_4 : readys_readys[4]);
  assign auto_out_3_a_valid = auto_in_a_valid & requestAIO_0_3;
  assign auto_out_3_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_3_a_bits_size = auto_in_a_bits_size;
  assign auto_out_3_a_bits_source = auto_in_a_bits_source;
  assign auto_out_3_a_bits_address = auto_in_a_bits_address;
  assign auto_out_3_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_3_a_bits_data = auto_in_a_bits_data;
  assign auto_out_3_d_ready = auto_in_d_ready & (beatsLeft ? state_3 : readys_readys[3]);
  assign auto_out_2_a_valid = auto_in_a_valid & requestAIO_0_2;
  assign auto_out_2_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_2_a_bits_size = auto_in_a_bits_size;
  assign auto_out_2_a_bits_source = auto_in_a_bits_source;
  assign auto_out_2_a_bits_address = auto_in_a_bits_address;
  assign auto_out_2_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_2_a_bits_data = auto_in_a_bits_data;
  assign auto_out_2_d_ready = auto_in_d_ready & (beatsLeft ? state_2 : readys_readys[2]);
  assign auto_out_1_a_valid = auto_in_a_valid & auto_in_a_bits_address[26];
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_size = auto_in_a_bits_size;
  assign auto_out_1_a_bits_source = auto_in_a_bits_source;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address;
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_d_ready = auto_in_d_ready & (beatsLeft ? state_1 : readys_readys[1]);
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0;
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_size = auto_in_a_bits_size;
  assign auto_out_0_a_bits_source = auto_in_a_bits_source;
  assign auto_out_0_a_bits_address = auto_in_a_bits_address;
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_0_a_bits_data = auto_in_a_bits_data;
  assign auto_out_0_d_ready = auto_in_d_ready & (beatsLeft ? state_0 : readys_readys[0]);
endmodule

