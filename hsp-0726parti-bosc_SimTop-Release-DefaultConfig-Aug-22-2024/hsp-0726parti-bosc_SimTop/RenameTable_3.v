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
module RenameTable_3(
  input        clock,
  input        reset,
  input        io_redirect,
  output [7:0] io_readPorts_0_data,
  output [7:0] io_readPorts_1_data,
  output [7:0] io_readPorts_2_data,
  output [7:0] io_readPorts_3_data,
  output [7:0] io_readPorts_4_data,
  output [7:0] io_readPorts_5_data,
  input        io_specWritePorts_0_wen,
  input  [7:0] io_specWritePorts_0_data,
  input        io_specWritePorts_1_wen,
  input  [7:0] io_specWritePorts_1_data,
  input        io_specWritePorts_2_wen,
  input  [7:0] io_specWritePorts_2_data,
  input        io_specWritePorts_3_wen,
  input  [7:0] io_specWritePorts_3_data,
  input        io_specWritePorts_4_wen,
  input  [7:0] io_specWritePorts_4_data,
  input        io_specWritePorts_5_wen,
  input  [7:0] io_specWritePorts_5_data,
  input        io_archWritePorts_0_wen,
  input  [7:0] io_archWritePorts_0_data,
  input        io_archWritePorts_1_wen,
  input  [7:0] io_archWritePorts_1_data,
  input        io_archWritePorts_2_wen,
  input  [7:0] io_archWritePorts_2_data,
  input        io_archWritePorts_3_wen,
  input  [7:0] io_archWritePorts_3_data,
  input        io_archWritePorts_4_wen,
  input  [7:0] io_archWritePorts_4_data,
  input        io_archWritePorts_5_wen,
  input  [7:0] io_archWritePorts_5_data,
  output [7:0] io_old_pdest_0,
  output [7:0] io_old_pdest_1,
  output [7:0] io_old_pdest_2,
  output [7:0] io_old_pdest_3,
  output [7:0] io_old_pdest_4,
  output [7:0] io_old_pdest_5,
  input        io_snpt_snptEnq,
  input        io_snpt_snptDeq,
  input        io_snpt_useSnpt,
  input  [1:0] io_snpt_snptSelect,
  input        io_snpt_flushVec_0,
  input        io_snpt_flushVec_1,
  input        io_snpt_flushVec_2,
  input        io_snpt_flushVec_3
);

  wire [7:0]      _snapshots_snapshotGen_io_snapshots_0_0;
  wire [7:0]      _snapshots_snapshotGen_io_snapshots_1_0;
  wire [7:0]      _snapshots_snapshotGen_io_snapshots_2_0;
  wire [7:0]      _snapshots_snapshotGen_io_snapshots_3_0;
  reg  [7:0]      spec_table_0;
  reg  [7:0]      arch_table_0;
  reg  [7:0]      old_pdest_0;
  reg  [7:0]      old_pdest_1;
  reg  [7:0]      old_pdest_2;
  reg  [7:0]      old_pdest_3;
  reg  [7:0]      old_pdest_4;
  reg  [7:0]      old_pdest_5;
  reg             t1_redirect_last_REG;
  reg             matchVec_0;
  reg  [7:0]      t1_wSpec_0_data;
  reg             matchVec_1;
  reg  [7:0]      t1_wSpec_1_data;
  reg             matchVec_2;
  reg  [7:0]      t1_wSpec_2_data;
  reg             matchVec_3;
  reg  [7:0]      t1_wSpec_3_data;
  reg             matchVec_4;
  reg  [7:0]      t1_wSpec_4_data;
  reg             matchVec_5;
  reg  [7:0]      t1_wSpec_5_data;
  reg             t1_snpt_snptEnq;
  reg             t1_snpt_snptDeq;
  reg             t1_snpt_useSnpt;
  reg  [1:0]      t1_snpt_snptSelect;
  reg             t1_snpt_flushVec_0;
  reg             t1_snpt_flushVec_1;
  reg             t1_snpt_flushVec_2;
  reg             t1_snpt_flushVec_3;
  reg             t1_bypass_0;
  reg             t1_bypass_1;
  reg             t1_bypass_2;
  reg             t1_bypass_3;
  reg             t1_bypass_4;
  reg             t1_bypass_5;
  reg             t1_bypass_1_0;
  reg             t1_bypass_1_1;
  reg             t1_bypass_1_2;
  reg             t1_bypass_1_3;
  reg             t1_bypass_1_4;
  reg             t1_bypass_1_5;
  reg             t1_bypass_2_0;
  reg             t1_bypass_2_1;
  reg             t1_bypass_2_2;
  reg             t1_bypass_2_3;
  reg             t1_bypass_2_4;
  reg             t1_bypass_2_5;
  reg             t1_bypass_3_0;
  reg             t1_bypass_3_1;
  reg             t1_bypass_3_2;
  reg             t1_bypass_3_3;
  reg             t1_bypass_3_4;
  reg             t1_bypass_3_5;
  reg             t1_bypass_4_0;
  reg             t1_bypass_4_1;
  reg             t1_bypass_4_2;
  reg             t1_bypass_4_3;
  reg             t1_bypass_4_4;
  reg             t1_bypass_4_5;
  reg             t1_bypass_5_0;
  reg             t1_bypass_5_1;
  reg             t1_bypass_5_2;
  reg             t1_bypass_5_3;
  reg             t1_bypass_5_4;
  reg             t1_bypass_5_5;
  wire [3:0][7:0] _GEN =
    {{_snapshots_snapshotGen_io_snapshots_3_0},
     {_snapshots_snapshotGen_io_snapshots_2_0},
     {_snapshots_snapshotGen_io_snapshots_1_0},
     {_snapshots_snapshotGen_io_snapshots_0_0}};
  wire [7:0]      arch_mask_1 = {8{io_archWritePorts_1_wen}};
  wire [7:0]      arch_mask_2 = {8{io_archWritePorts_2_wen}};
  wire [7:0]      arch_mask_3 = {8{io_archWritePorts_3_wen}};
  wire [7:0]      arch_mask_4 = {8{io_archWritePorts_4_wen}};
  wire [7:0]      arch_mask_5 = {8{io_archWritePorts_5_wen}};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      spec_table_0 <= 8'h0;
      arch_table_0 <= 8'h0;
      old_pdest_0 <= 8'h0;
      old_pdest_1 <= 8'h0;
      old_pdest_2 <= 8'h0;
      old_pdest_3 <= 8'h0;
      old_pdest_4 <= 8'h0;
      old_pdest_5 <= 8'h0;
      t1_redirect_last_REG <= 1'h0;
      t1_snpt_snptEnq <= 1'h0;
      t1_snpt_snptDeq <= 1'h0;
      t1_snpt_useSnpt <= 1'h0;
      t1_snpt_snptSelect <= 2'h0;
      t1_snpt_flushVec_0 <= 1'h0;
      t1_snpt_flushVec_1 <= 1'h0;
      t1_snpt_flushVec_2 <= 1'h0;
      t1_snpt_flushVec_3 <= 1'h0;
    end
    else begin
      if (t1_redirect_last_REG)
        spec_table_0 <= t1_snpt_useSnpt ? _GEN[t1_snpt_snptSelect] : arch_table_0;
      else if (|{matchVec_5, matchVec_4, matchVec_3, matchVec_2, matchVec_1, matchVec_0})
        spec_table_0 <=
          matchVec_5 | matchVec_4 | matchVec_3
            ? (matchVec_5
                 ? t1_wSpec_5_data
                 : matchVec_4 ? t1_wSpec_4_data : t1_wSpec_3_data)
            : matchVec_2
                ? t1_wSpec_2_data
                : matchVec_1 ? t1_wSpec_1_data : t1_wSpec_0_data;
      if (io_archWritePorts_5_wen)
        arch_table_0 <= io_archWritePorts_5_data;
      else if (io_archWritePorts_4_wen)
        arch_table_0 <= io_archWritePorts_4_data;
      else if (io_archWritePorts_3_wen)
        arch_table_0 <= io_archWritePorts_3_data;
      else if (io_archWritePorts_2_wen)
        arch_table_0 <= io_archWritePorts_2_data;
      else if (io_archWritePorts_1_wen)
        arch_table_0 <= io_archWritePorts_1_data;
      else if (io_archWritePorts_0_wen)
        arch_table_0 <= io_archWritePorts_0_data;
      old_pdest_0 <= arch_table_0 & {8{io_archWritePorts_0_wen}};
      old_pdest_1 <=
        io_archWritePorts_0_wen
          ? io_archWritePorts_0_data & arch_mask_1
          : arch_table_0 & arch_mask_1;
      old_pdest_2 <=
        io_archWritePorts_1_wen
          ? io_archWritePorts_1_data & arch_mask_2
          : io_archWritePorts_0_wen
              ? io_archWritePorts_0_data & arch_mask_2
              : arch_table_0 & arch_mask_2;
      old_pdest_3 <=
        io_archWritePorts_2_wen
          ? io_archWritePorts_2_data & arch_mask_3
          : io_archWritePorts_1_wen
              ? io_archWritePorts_1_data & arch_mask_3
              : io_archWritePorts_0_wen
                  ? io_archWritePorts_0_data & arch_mask_3
                  : arch_table_0 & arch_mask_3;
      old_pdest_4 <=
        io_archWritePorts_3_wen
          ? io_archWritePorts_3_data & arch_mask_4
          : io_archWritePorts_2_wen
              ? io_archWritePorts_2_data & arch_mask_4
              : io_archWritePorts_1_wen
                  ? io_archWritePorts_1_data & arch_mask_4
                  : io_archWritePorts_0_wen
                      ? io_archWritePorts_0_data & arch_mask_4
                      : arch_table_0 & arch_mask_4;
      old_pdest_5 <=
        io_archWritePorts_4_wen
          ? io_archWritePorts_4_data & arch_mask_5
          : io_archWritePorts_3_wen
              ? io_archWritePorts_3_data & arch_mask_5
              : io_archWritePorts_2_wen
                  ? io_archWritePorts_2_data & arch_mask_5
                  : io_archWritePorts_1_wen
                      ? io_archWritePorts_1_data & arch_mask_5
                      : io_archWritePorts_0_wen
                          ? io_archWritePorts_0_data & arch_mask_5
                          : arch_table_0 & arch_mask_5;
      t1_redirect_last_REG <= io_redirect;
      t1_snpt_snptEnq <= io_snpt_snptEnq;
      t1_snpt_snptDeq <= io_snpt_snptDeq;
      t1_snpt_useSnpt <= io_snpt_useSnpt;
      t1_snpt_snptSelect <= io_snpt_snptSelect;
      t1_snpt_flushVec_0 <= io_snpt_flushVec_0;
      t1_snpt_flushVec_1 <= io_snpt_flushVec_1;
      t1_snpt_flushVec_2 <= io_snpt_flushVec_2;
      t1_snpt_flushVec_3 <= io_snpt_flushVec_3;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_redirect) begin
      matchVec_0 <= 1'h0;
      t1_wSpec_0_data <= 8'h0;
      matchVec_1 <= 1'h0;
      t1_wSpec_1_data <= 8'h0;
      matchVec_2 <= 1'h0;
      t1_wSpec_2_data <= 8'h0;
      matchVec_3 <= 1'h0;
      t1_wSpec_3_data <= 8'h0;
      matchVec_4 <= 1'h0;
      t1_wSpec_4_data <= 8'h0;
      matchVec_5 <= 1'h0;
      t1_wSpec_5_data <= 8'h0;
      t1_bypass_0 <= 1'h0;
      t1_bypass_1 <= 1'h0;
      t1_bypass_2 <= 1'h0;
      t1_bypass_3 <= 1'h0;
      t1_bypass_4 <= 1'h0;
      t1_bypass_5 <= 1'h0;
      t1_bypass_1_0 <= 1'h0;
      t1_bypass_1_1 <= 1'h0;
      t1_bypass_1_2 <= 1'h0;
      t1_bypass_1_3 <= 1'h0;
      t1_bypass_1_4 <= 1'h0;
      t1_bypass_1_5 <= 1'h0;
      t1_bypass_2_0 <= 1'h0;
      t1_bypass_2_1 <= 1'h0;
      t1_bypass_2_2 <= 1'h0;
      t1_bypass_2_3 <= 1'h0;
      t1_bypass_2_4 <= 1'h0;
      t1_bypass_2_5 <= 1'h0;
      t1_bypass_3_0 <= 1'h0;
      t1_bypass_3_1 <= 1'h0;
      t1_bypass_3_2 <= 1'h0;
      t1_bypass_3_3 <= 1'h0;
      t1_bypass_3_4 <= 1'h0;
      t1_bypass_3_5 <= 1'h0;
      t1_bypass_4_0 <= 1'h0;
      t1_bypass_4_1 <= 1'h0;
      t1_bypass_4_2 <= 1'h0;
      t1_bypass_4_3 <= 1'h0;
      t1_bypass_4_4 <= 1'h0;
      t1_bypass_4_5 <= 1'h0;
      t1_bypass_5_0 <= 1'h0;
      t1_bypass_5_1 <= 1'h0;
      t1_bypass_5_2 <= 1'h0;
      t1_bypass_5_3 <= 1'h0;
      t1_bypass_5_4 <= 1'h0;
      t1_bypass_5_5 <= 1'h0;
    end
    else begin
      matchVec_0 <= io_specWritePorts_0_wen;
      t1_wSpec_0_data <= io_specWritePorts_0_data;
      matchVec_1 <= io_specWritePorts_1_wen;
      t1_wSpec_1_data <= io_specWritePorts_1_data;
      matchVec_2 <= io_specWritePorts_2_wen;
      t1_wSpec_2_data <= io_specWritePorts_2_data;
      matchVec_3 <= io_specWritePorts_3_wen;
      t1_wSpec_3_data <= io_specWritePorts_3_data;
      matchVec_4 <= io_specWritePorts_4_wen;
      t1_wSpec_4_data <= io_specWritePorts_4_data;
      matchVec_5 <= io_specWritePorts_5_wen;
      t1_wSpec_5_data <= io_specWritePorts_5_data;
      t1_bypass_0 <= io_specWritePorts_0_wen;
      t1_bypass_1 <= io_specWritePorts_1_wen;
      t1_bypass_2 <= io_specWritePorts_2_wen;
      t1_bypass_3 <= io_specWritePorts_3_wen;
      t1_bypass_4 <= io_specWritePorts_4_wen;
      t1_bypass_5 <= io_specWritePorts_5_wen;
      t1_bypass_1_0 <= io_specWritePorts_0_wen;
      t1_bypass_1_1 <= io_specWritePorts_1_wen;
      t1_bypass_1_2 <= io_specWritePorts_2_wen;
      t1_bypass_1_3 <= io_specWritePorts_3_wen;
      t1_bypass_1_4 <= io_specWritePorts_4_wen;
      t1_bypass_1_5 <= io_specWritePorts_5_wen;
      t1_bypass_2_0 <= io_specWritePorts_0_wen;
      t1_bypass_2_1 <= io_specWritePorts_1_wen;
      t1_bypass_2_2 <= io_specWritePorts_2_wen;
      t1_bypass_2_3 <= io_specWritePorts_3_wen;
      t1_bypass_2_4 <= io_specWritePorts_4_wen;
      t1_bypass_2_5 <= io_specWritePorts_5_wen;
      t1_bypass_3_0 <= io_specWritePorts_0_wen;
      t1_bypass_3_1 <= io_specWritePorts_1_wen;
      t1_bypass_3_2 <= io_specWritePorts_2_wen;
      t1_bypass_3_3 <= io_specWritePorts_3_wen;
      t1_bypass_3_4 <= io_specWritePorts_4_wen;
      t1_bypass_3_5 <= io_specWritePorts_5_wen;
      t1_bypass_4_0 <= io_specWritePorts_0_wen;
      t1_bypass_4_1 <= io_specWritePorts_1_wen;
      t1_bypass_4_2 <= io_specWritePorts_2_wen;
      t1_bypass_4_3 <= io_specWritePorts_3_wen;
      t1_bypass_4_4 <= io_specWritePorts_4_wen;
      t1_bypass_4_5 <= io_specWritePorts_5_wen;
      t1_bypass_5_0 <= io_specWritePorts_0_wen;
      t1_bypass_5_1 <= io_specWritePorts_1_wen;
      t1_bypass_5_2 <= io_specWritePorts_2_wen;
      t1_bypass_5_3 <= io_specWritePorts_3_wen;
      t1_bypass_5_4 <= io_specWritePorts_4_wen;
      t1_bypass_5_5 <= io_specWritePorts_5_wen;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:5];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h6; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        spec_table_0 = _RANDOM[3'h0][7:0];
        arch_table_0 = _RANDOM[3'h0][15:8];
        old_pdest_0 = _RANDOM[3'h0][23:16];
        old_pdest_1 = _RANDOM[3'h0][31:24];
        old_pdest_2 = _RANDOM[3'h1][7:0];
        old_pdest_3 = _RANDOM[3'h1][15:8];
        old_pdest_4 = _RANDOM[3'h1][23:16];
        old_pdest_5 = _RANDOM[3'h1][31:24];
        t1_redirect_last_REG = _RANDOM[3'h2][6];
        matchVec_0 = _RANDOM[3'h2][7];
        t1_wSpec_0_data = _RANDOM[3'h2][15:8];
        matchVec_1 = _RANDOM[3'h2][16];
        t1_wSpec_1_data = _RANDOM[3'h2][24:17];
        matchVec_2 = _RANDOM[3'h2][25];
        t1_wSpec_2_data = {_RANDOM[3'h2][31:26], _RANDOM[3'h3][1:0]};
        matchVec_3 = _RANDOM[3'h3][2];
        t1_wSpec_3_data = _RANDOM[3'h3][10:3];
        matchVec_4 = _RANDOM[3'h3][11];
        t1_wSpec_4_data = _RANDOM[3'h3][19:12];
        matchVec_5 = _RANDOM[3'h3][20];
        t1_wSpec_5_data = _RANDOM[3'h3][28:21];
        t1_snpt_snptEnq = _RANDOM[3'h3][29];
        t1_snpt_snptDeq = _RANDOM[3'h3][30];
        t1_snpt_useSnpt = _RANDOM[3'h3][31];
        t1_snpt_snptSelect = _RANDOM[3'h4][1:0];
        t1_snpt_flushVec_0 = _RANDOM[3'h4][2];
        t1_snpt_flushVec_1 = _RANDOM[3'h4][3];
        t1_snpt_flushVec_2 = _RANDOM[3'h4][4];
        t1_snpt_flushVec_3 = _RANDOM[3'h4][5];
        t1_bypass_0 = _RANDOM[3'h4][6];
        t1_bypass_1 = _RANDOM[3'h4][7];
        t1_bypass_2 = _RANDOM[3'h4][8];
        t1_bypass_3 = _RANDOM[3'h4][9];
        t1_bypass_4 = _RANDOM[3'h4][10];
        t1_bypass_5 = _RANDOM[3'h4][11];
        t1_bypass_1_0 = _RANDOM[3'h4][12];
        t1_bypass_1_1 = _RANDOM[3'h4][13];
        t1_bypass_1_2 = _RANDOM[3'h4][14];
        t1_bypass_1_3 = _RANDOM[3'h4][15];
        t1_bypass_1_4 = _RANDOM[3'h4][16];
        t1_bypass_1_5 = _RANDOM[3'h4][17];
        t1_bypass_2_0 = _RANDOM[3'h4][18];
        t1_bypass_2_1 = _RANDOM[3'h4][19];
        t1_bypass_2_2 = _RANDOM[3'h4][20];
        t1_bypass_2_3 = _RANDOM[3'h4][21];
        t1_bypass_2_4 = _RANDOM[3'h4][22];
        t1_bypass_2_5 = _RANDOM[3'h4][23];
        t1_bypass_3_0 = _RANDOM[3'h4][24];
        t1_bypass_3_1 = _RANDOM[3'h4][25];
        t1_bypass_3_2 = _RANDOM[3'h4][26];
        t1_bypass_3_3 = _RANDOM[3'h4][27];
        t1_bypass_3_4 = _RANDOM[3'h4][28];
        t1_bypass_3_5 = _RANDOM[3'h4][29];
        t1_bypass_4_0 = _RANDOM[3'h4][30];
        t1_bypass_4_1 = _RANDOM[3'h4][31];
        t1_bypass_4_2 = _RANDOM[3'h5][0];
        t1_bypass_4_3 = _RANDOM[3'h5][1];
        t1_bypass_4_4 = _RANDOM[3'h5][2];
        t1_bypass_4_5 = _RANDOM[3'h5][3];
        t1_bypass_5_0 = _RANDOM[3'h5][4];
        t1_bypass_5_1 = _RANDOM[3'h5][5];
        t1_bypass_5_2 = _RANDOM[3'h5][6];
        t1_bypass_5_3 = _RANDOM[3'h5][7];
        t1_bypass_5_4 = _RANDOM[3'h5][8];
        t1_bypass_5_5 = _RANDOM[3'h5][9];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        spec_table_0 = 8'h0;
        arch_table_0 = 8'h0;
        old_pdest_0 = 8'h0;
        old_pdest_1 = 8'h0;
        old_pdest_2 = 8'h0;
        old_pdest_3 = 8'h0;
        old_pdest_4 = 8'h0;
        old_pdest_5 = 8'h0;
        t1_redirect_last_REG = 1'h0;
        t1_snpt_snptEnq = 1'h0;
        t1_snpt_snptDeq = 1'h0;
        t1_snpt_useSnpt = 1'h0;
        t1_snpt_snptSelect = 2'h0;
        t1_snpt_flushVec_0 = 1'h0;
        t1_snpt_flushVec_1 = 1'h0;
        t1_snpt_flushVec_2 = 1'h0;
        t1_snpt_flushVec_3 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SnapshotGenerator_7 snapshots_snapshotGen (
    .clock            (clock),
    .reset            (reset),
    .io_enq           (t1_snpt_snptEnq),
    .io_enqData_0     (spec_table_0),
    .io_deq           (t1_snpt_snptDeq),
    .io_redirect      (t1_redirect_last_REG),
    .io_flushVec_0    (t1_snpt_flushVec_0),
    .io_flushVec_1    (t1_snpt_flushVec_1),
    .io_flushVec_2    (t1_snpt_flushVec_2),
    .io_flushVec_3    (t1_snpt_flushVec_3),
    .io_snapshots_0_0 (_snapshots_snapshotGen_io_snapshots_0_0),
    .io_snapshots_1_0 (_snapshots_snapshotGen_io_snapshots_1_0),
    .io_snapshots_2_0 (_snapshots_snapshotGen_io_snapshots_2_0),
    .io_snapshots_3_0 (_snapshots_snapshotGen_io_snapshots_3_0)
  );
  assign io_readPorts_0_data =
    (|{t1_bypass_5, t1_bypass_4, t1_bypass_3, t1_bypass_2, t1_bypass_1, t1_bypass_0})
      ? (t1_bypass_5 | t1_bypass_4 | t1_bypass_3
           ? (t1_bypass_5
                ? t1_wSpec_5_data
                : t1_bypass_4 ? t1_wSpec_4_data : t1_wSpec_3_data)
           : t1_bypass_2
               ? t1_wSpec_2_data
               : t1_bypass_1 ? t1_wSpec_1_data : t1_wSpec_0_data)
      : spec_table_0;
  assign io_readPorts_1_data =
    (|{t1_bypass_1_5,
       t1_bypass_1_4,
       t1_bypass_1_3,
       t1_bypass_1_2,
       t1_bypass_1_1,
       t1_bypass_1_0})
      ? (t1_bypass_1_5 | t1_bypass_1_4 | t1_bypass_1_3
           ? (t1_bypass_1_5
                ? t1_wSpec_5_data
                : t1_bypass_1_4 ? t1_wSpec_4_data : t1_wSpec_3_data)
           : t1_bypass_1_2
               ? t1_wSpec_2_data
               : t1_bypass_1_1 ? t1_wSpec_1_data : t1_wSpec_0_data)
      : spec_table_0;
  assign io_readPorts_2_data =
    (|{t1_bypass_2_5,
       t1_bypass_2_4,
       t1_bypass_2_3,
       t1_bypass_2_2,
       t1_bypass_2_1,
       t1_bypass_2_0})
      ? (t1_bypass_2_5 | t1_bypass_2_4 | t1_bypass_2_3
           ? (t1_bypass_2_5
                ? t1_wSpec_5_data
                : t1_bypass_2_4 ? t1_wSpec_4_data : t1_wSpec_3_data)
           : t1_bypass_2_2
               ? t1_wSpec_2_data
               : t1_bypass_2_1 ? t1_wSpec_1_data : t1_wSpec_0_data)
      : spec_table_0;
  assign io_readPorts_3_data =
    (|{t1_bypass_3_5,
       t1_bypass_3_4,
       t1_bypass_3_3,
       t1_bypass_3_2,
       t1_bypass_3_1,
       t1_bypass_3_0})
      ? (t1_bypass_3_5 | t1_bypass_3_4 | t1_bypass_3_3
           ? (t1_bypass_3_5
                ? t1_wSpec_5_data
                : t1_bypass_3_4 ? t1_wSpec_4_data : t1_wSpec_3_data)
           : t1_bypass_3_2
               ? t1_wSpec_2_data
               : t1_bypass_3_1 ? t1_wSpec_1_data : t1_wSpec_0_data)
      : spec_table_0;
  assign io_readPorts_4_data =
    (|{t1_bypass_4_5,
       t1_bypass_4_4,
       t1_bypass_4_3,
       t1_bypass_4_2,
       t1_bypass_4_1,
       t1_bypass_4_0})
      ? (t1_bypass_4_5 | t1_bypass_4_4 | t1_bypass_4_3
           ? (t1_bypass_4_5
                ? t1_wSpec_5_data
                : t1_bypass_4_4 ? t1_wSpec_4_data : t1_wSpec_3_data)
           : t1_bypass_4_2
               ? t1_wSpec_2_data
               : t1_bypass_4_1 ? t1_wSpec_1_data : t1_wSpec_0_data)
      : spec_table_0;
  assign io_readPorts_5_data =
    (|{t1_bypass_5_5,
       t1_bypass_5_4,
       t1_bypass_5_3,
       t1_bypass_5_2,
       t1_bypass_5_1,
       t1_bypass_5_0})
      ? (t1_bypass_5_5 | t1_bypass_5_4 | t1_bypass_5_3
           ? (t1_bypass_5_5
                ? t1_wSpec_5_data
                : t1_bypass_5_4 ? t1_wSpec_4_data : t1_wSpec_3_data)
           : t1_bypass_5_2
               ? t1_wSpec_2_data
               : t1_bypass_5_1 ? t1_wSpec_1_data : t1_wSpec_0_data)
      : spec_table_0;
  assign io_old_pdest_0 = old_pdest_0;
  assign io_old_pdest_1 = old_pdest_1;
  assign io_old_pdest_2 = old_pdest_2;
  assign io_old_pdest_3 = old_pdest_3;
  assign io_old_pdest_4 = old_pdest_4;
  assign io_old_pdest_5 = old_pdest_5;
endmodule

