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
module HvienModule(
  input         clock,
  input         reset,
  input         w_wen,
  input  [63:0] w_wdata,
  output [63:0] rdata,
  output        regOut_LCOFIE,
  output        regOut_LC14IE,
  output        regOut_LC15IE,
  output        regOut_LC16IE,
  output        regOut_LC17IE,
  output        regOut_LC18IE,
  output        regOut_LC19IE,
  output        regOut_LC20IE,
  output        regOut_LC21IE,
  output        regOut_LC22IE,
  output        regOut_LC23IE,
  output        regOut_LC24IE,
  output        regOut_LC25IE,
  output        regOut_LC26IE,
  output        regOut_LC27IE,
  output        regOut_LC28IE,
  output        regOut_LC29IE,
  output        regOut_LC30IE,
  output        regOut_LC31IE,
  output        regOut_LC32IE,
  output        regOut_LC33IE,
  output        regOut_LC34IE,
  output        regOut_LPRASEIE,
  output        regOut_LC36IE,
  output        regOut_LC37IE,
  output        regOut_LC38IE,
  output        regOut_LC39IE,
  output        regOut_LC40IE,
  output        regOut_LC41IE,
  output        regOut_LC42IE,
  output        regOut_HPRASEIE,
  output        regOut_LC44IE,
  output        regOut_LC45IE,
  output        regOut_LC46IE,
  output        regOut_LC47IE,
  output        regOut_LC48IE,
  output        regOut_LC49IE,
  output        regOut_LC50IE,
  output        regOut_LC51IE,
  output        regOut_LC52IE,
  output        regOut_LC53IE,
  output        regOut_LC54IE,
  output        regOut_LC55IE,
  output        regOut_LC56IE,
  output        regOut_LC57IE,
  output        regOut_LC58IE,
  output        regOut_LC59IE,
  output        regOut_LC60IE,
  output        regOut_LC61IE,
  output        regOut_LC62IE,
  output        regOut_LC63IE
);

  reg reg_LCOFIE;
  reg reg_LC14IE;
  reg reg_LC15IE;
  reg reg_LC16IE;
  reg reg_LC17IE;
  reg reg_LC18IE;
  reg reg_LC19IE;
  reg reg_LC20IE;
  reg reg_LC21IE;
  reg reg_LC22IE;
  reg reg_LC23IE;
  reg reg_LC24IE;
  reg reg_LC25IE;
  reg reg_LC26IE;
  reg reg_LC27IE;
  reg reg_LC28IE;
  reg reg_LC29IE;
  reg reg_LC30IE;
  reg reg_LC31IE;
  reg reg_LC32IE;
  reg reg_LC33IE;
  reg reg_LC34IE;
  reg reg_LPRASEIE;
  reg reg_LC36IE;
  reg reg_LC37IE;
  reg reg_LC38IE;
  reg reg_LC39IE;
  reg reg_LC40IE;
  reg reg_LC41IE;
  reg reg_LC42IE;
  reg reg_HPRASEIE;
  reg reg_LC44IE;
  reg reg_LC45IE;
  reg reg_LC46IE;
  reg reg_LC47IE;
  reg reg_LC48IE;
  reg reg_LC49IE;
  reg reg_LC50IE;
  reg reg_LC51IE;
  reg reg_LC52IE;
  reg reg_LC53IE;
  reg reg_LC54IE;
  reg reg_LC55IE;
  reg reg_LC56IE;
  reg reg_LC57IE;
  reg reg_LC58IE;
  reg reg_LC59IE;
  reg reg_LC60IE;
  reg reg_LC61IE;
  reg reg_LC62IE;
  reg reg_LC63IE;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_LCOFIE <= 1'h0;
      reg_LC14IE <= 1'h0;
      reg_LC15IE <= 1'h0;
      reg_LC16IE <= 1'h0;
      reg_LC17IE <= 1'h0;
      reg_LC18IE <= 1'h0;
      reg_LC19IE <= 1'h0;
      reg_LC20IE <= 1'h0;
      reg_LC21IE <= 1'h0;
      reg_LC22IE <= 1'h0;
      reg_LC23IE <= 1'h0;
      reg_LC24IE <= 1'h0;
      reg_LC25IE <= 1'h0;
      reg_LC26IE <= 1'h0;
      reg_LC27IE <= 1'h0;
      reg_LC28IE <= 1'h0;
      reg_LC29IE <= 1'h0;
      reg_LC30IE <= 1'h0;
      reg_LC31IE <= 1'h0;
      reg_LC32IE <= 1'h0;
      reg_LC33IE <= 1'h0;
      reg_LC34IE <= 1'h0;
      reg_LPRASEIE <= 1'h0;
      reg_LC36IE <= 1'h0;
      reg_LC37IE <= 1'h0;
      reg_LC38IE <= 1'h0;
      reg_LC39IE <= 1'h0;
      reg_LC40IE <= 1'h0;
      reg_LC41IE <= 1'h0;
      reg_LC42IE <= 1'h0;
      reg_HPRASEIE <= 1'h0;
      reg_LC44IE <= 1'h0;
      reg_LC45IE <= 1'h0;
      reg_LC46IE <= 1'h0;
      reg_LC47IE <= 1'h0;
      reg_LC48IE <= 1'h0;
      reg_LC49IE <= 1'h0;
      reg_LC50IE <= 1'h0;
      reg_LC51IE <= 1'h0;
      reg_LC52IE <= 1'h0;
      reg_LC53IE <= 1'h0;
      reg_LC54IE <= 1'h0;
      reg_LC55IE <= 1'h0;
      reg_LC56IE <= 1'h0;
      reg_LC57IE <= 1'h0;
      reg_LC58IE <= 1'h0;
      reg_LC59IE <= 1'h0;
      reg_LC60IE <= 1'h0;
      reg_LC61IE <= 1'h0;
      reg_LC62IE <= 1'h0;
      reg_LC63IE <= 1'h0;
    end
    else if (w_wen) begin
      reg_LCOFIE <= w_wdata[13];
      reg_LC14IE <= w_wdata[14];
      reg_LC15IE <= w_wdata[15];
      reg_LC16IE <= w_wdata[16];
      reg_LC17IE <= w_wdata[17];
      reg_LC18IE <= w_wdata[18];
      reg_LC19IE <= w_wdata[19];
      reg_LC20IE <= w_wdata[20];
      reg_LC21IE <= w_wdata[21];
      reg_LC22IE <= w_wdata[22];
      reg_LC23IE <= w_wdata[23];
      reg_LC24IE <= w_wdata[24];
      reg_LC25IE <= w_wdata[25];
      reg_LC26IE <= w_wdata[26];
      reg_LC27IE <= w_wdata[27];
      reg_LC28IE <= w_wdata[28];
      reg_LC29IE <= w_wdata[29];
      reg_LC30IE <= w_wdata[30];
      reg_LC31IE <= w_wdata[31];
      reg_LC32IE <= w_wdata[32];
      reg_LC33IE <= w_wdata[33];
      reg_LC34IE <= w_wdata[34];
      reg_LPRASEIE <= w_wdata[35];
      reg_LC36IE <= w_wdata[36];
      reg_LC37IE <= w_wdata[37];
      reg_LC38IE <= w_wdata[38];
      reg_LC39IE <= w_wdata[39];
      reg_LC40IE <= w_wdata[40];
      reg_LC41IE <= w_wdata[41];
      reg_LC42IE <= w_wdata[42];
      reg_HPRASEIE <= w_wdata[43];
      reg_LC44IE <= w_wdata[44];
      reg_LC45IE <= w_wdata[45];
      reg_LC46IE <= w_wdata[46];
      reg_LC47IE <= w_wdata[47];
      reg_LC48IE <= w_wdata[48];
      reg_LC49IE <= w_wdata[49];
      reg_LC50IE <= w_wdata[50];
      reg_LC51IE <= w_wdata[51];
      reg_LC52IE <= w_wdata[52];
      reg_LC53IE <= w_wdata[53];
      reg_LC54IE <= w_wdata[54];
      reg_LC55IE <= w_wdata[55];
      reg_LC56IE <= w_wdata[56];
      reg_LC57IE <= w_wdata[57];
      reg_LC58IE <= w_wdata[58];
      reg_LC59IE <= w_wdata[59];
      reg_LC60IE <= w_wdata[60];
      reg_LC61IE <= w_wdata[61];
      reg_LC62IE <= w_wdata[62];
      reg_LC63IE <= w_wdata[63];
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:1];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;
        end
        reg_LCOFIE = _RANDOM[1'h0][10];
        reg_LC14IE = _RANDOM[1'h0][11];
        reg_LC15IE = _RANDOM[1'h0][12];
        reg_LC16IE = _RANDOM[1'h0][13];
        reg_LC17IE = _RANDOM[1'h0][14];
        reg_LC18IE = _RANDOM[1'h0][15];
        reg_LC19IE = _RANDOM[1'h0][16];
        reg_LC20IE = _RANDOM[1'h0][17];
        reg_LC21IE = _RANDOM[1'h0][18];
        reg_LC22IE = _RANDOM[1'h0][19];
        reg_LC23IE = _RANDOM[1'h0][20];
        reg_LC24IE = _RANDOM[1'h0][21];
        reg_LC25IE = _RANDOM[1'h0][22];
        reg_LC26IE = _RANDOM[1'h0][23];
        reg_LC27IE = _RANDOM[1'h0][24];
        reg_LC28IE = _RANDOM[1'h0][25];
        reg_LC29IE = _RANDOM[1'h0][26];
        reg_LC30IE = _RANDOM[1'h0][27];
        reg_LC31IE = _RANDOM[1'h0][28];
        reg_LC32IE = _RANDOM[1'h0][29];
        reg_LC33IE = _RANDOM[1'h0][30];
        reg_LC34IE = _RANDOM[1'h0][31];
        reg_LPRASEIE = _RANDOM[1'h1][0];
        reg_LC36IE = _RANDOM[1'h1][1];
        reg_LC37IE = _RANDOM[1'h1][2];
        reg_LC38IE = _RANDOM[1'h1][3];
        reg_LC39IE = _RANDOM[1'h1][4];
        reg_LC40IE = _RANDOM[1'h1][5];
        reg_LC41IE = _RANDOM[1'h1][6];
        reg_LC42IE = _RANDOM[1'h1][7];
        reg_HPRASEIE = _RANDOM[1'h1][8];
        reg_LC44IE = _RANDOM[1'h1][9];
        reg_LC45IE = _RANDOM[1'h1][10];
        reg_LC46IE = _RANDOM[1'h1][11];
        reg_LC47IE = _RANDOM[1'h1][12];
        reg_LC48IE = _RANDOM[1'h1][13];
        reg_LC49IE = _RANDOM[1'h1][14];
        reg_LC50IE = _RANDOM[1'h1][15];
        reg_LC51IE = _RANDOM[1'h1][16];
        reg_LC52IE = _RANDOM[1'h1][17];
        reg_LC53IE = _RANDOM[1'h1][18];
        reg_LC54IE = _RANDOM[1'h1][19];
        reg_LC55IE = _RANDOM[1'h1][20];
        reg_LC56IE = _RANDOM[1'h1][21];
        reg_LC57IE = _RANDOM[1'h1][22];
        reg_LC58IE = _RANDOM[1'h1][23];
        reg_LC59IE = _RANDOM[1'h1][24];
        reg_LC60IE = _RANDOM[1'h1][25];
        reg_LC61IE = _RANDOM[1'h1][26];
        reg_LC62IE = _RANDOM[1'h1][27];
        reg_LC63IE = _RANDOM[1'h1][28];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        reg_LCOFIE = 1'h0;
        reg_LC14IE = 1'h0;
        reg_LC15IE = 1'h0;
        reg_LC16IE = 1'h0;
        reg_LC17IE = 1'h0;
        reg_LC18IE = 1'h0;
        reg_LC19IE = 1'h0;
        reg_LC20IE = 1'h0;
        reg_LC21IE = 1'h0;
        reg_LC22IE = 1'h0;
        reg_LC23IE = 1'h0;
        reg_LC24IE = 1'h0;
        reg_LC25IE = 1'h0;
        reg_LC26IE = 1'h0;
        reg_LC27IE = 1'h0;
        reg_LC28IE = 1'h0;
        reg_LC29IE = 1'h0;
        reg_LC30IE = 1'h0;
        reg_LC31IE = 1'h0;
        reg_LC32IE = 1'h0;
        reg_LC33IE = 1'h0;
        reg_LC34IE = 1'h0;
        reg_LPRASEIE = 1'h0;
        reg_LC36IE = 1'h0;
        reg_LC37IE = 1'h0;
        reg_LC38IE = 1'h0;
        reg_LC39IE = 1'h0;
        reg_LC40IE = 1'h0;
        reg_LC41IE = 1'h0;
        reg_LC42IE = 1'h0;
        reg_HPRASEIE = 1'h0;
        reg_LC44IE = 1'h0;
        reg_LC45IE = 1'h0;
        reg_LC46IE = 1'h0;
        reg_LC47IE = 1'h0;
        reg_LC48IE = 1'h0;
        reg_LC49IE = 1'h0;
        reg_LC50IE = 1'h0;
        reg_LC51IE = 1'h0;
        reg_LC52IE = 1'h0;
        reg_LC53IE = 1'h0;
        reg_LC54IE = 1'h0;
        reg_LC55IE = 1'h0;
        reg_LC56IE = 1'h0;
        reg_LC57IE = 1'h0;
        reg_LC58IE = 1'h0;
        reg_LC59IE = 1'h0;
        reg_LC60IE = 1'h0;
        reg_LC61IE = 1'h0;
        reg_LC62IE = 1'h0;
        reg_LC63IE = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign rdata =
    {reg_LC63IE,
     reg_LC62IE,
     reg_LC61IE,
     reg_LC60IE,
     reg_LC59IE,
     reg_LC58IE,
     reg_LC57IE,
     reg_LC56IE,
     reg_LC55IE,
     reg_LC54IE,
     reg_LC53IE,
     reg_LC52IE,
     reg_LC51IE,
     reg_LC50IE,
     reg_LC49IE,
     reg_LC48IE,
     reg_LC47IE,
     reg_LC46IE,
     reg_LC45IE,
     reg_LC44IE,
     reg_HPRASEIE,
     reg_LC42IE,
     reg_LC41IE,
     reg_LC40IE,
     reg_LC39IE,
     reg_LC38IE,
     reg_LC37IE,
     reg_LC36IE,
     reg_LPRASEIE,
     reg_LC34IE,
     reg_LC33IE,
     reg_LC32IE,
     reg_LC31IE,
     reg_LC30IE,
     reg_LC29IE,
     reg_LC28IE,
     reg_LC27IE,
     reg_LC26IE,
     reg_LC25IE,
     reg_LC24IE,
     reg_LC23IE,
     reg_LC22IE,
     reg_LC21IE,
     reg_LC20IE,
     reg_LC19IE,
     reg_LC18IE,
     reg_LC17IE,
     reg_LC16IE,
     reg_LC15IE,
     reg_LC14IE,
     reg_LCOFIE,
     13'h0};
  assign regOut_LCOFIE = reg_LCOFIE;
  assign regOut_LC14IE = reg_LC14IE;
  assign regOut_LC15IE = reg_LC15IE;
  assign regOut_LC16IE = reg_LC16IE;
  assign regOut_LC17IE = reg_LC17IE;
  assign regOut_LC18IE = reg_LC18IE;
  assign regOut_LC19IE = reg_LC19IE;
  assign regOut_LC20IE = reg_LC20IE;
  assign regOut_LC21IE = reg_LC21IE;
  assign regOut_LC22IE = reg_LC22IE;
  assign regOut_LC23IE = reg_LC23IE;
  assign regOut_LC24IE = reg_LC24IE;
  assign regOut_LC25IE = reg_LC25IE;
  assign regOut_LC26IE = reg_LC26IE;
  assign regOut_LC27IE = reg_LC27IE;
  assign regOut_LC28IE = reg_LC28IE;
  assign regOut_LC29IE = reg_LC29IE;
  assign regOut_LC30IE = reg_LC30IE;
  assign regOut_LC31IE = reg_LC31IE;
  assign regOut_LC32IE = reg_LC32IE;
  assign regOut_LC33IE = reg_LC33IE;
  assign regOut_LC34IE = reg_LC34IE;
  assign regOut_LPRASEIE = reg_LPRASEIE;
  assign regOut_LC36IE = reg_LC36IE;
  assign regOut_LC37IE = reg_LC37IE;
  assign regOut_LC38IE = reg_LC38IE;
  assign regOut_LC39IE = reg_LC39IE;
  assign regOut_LC40IE = reg_LC40IE;
  assign regOut_LC41IE = reg_LC41IE;
  assign regOut_LC42IE = reg_LC42IE;
  assign regOut_HPRASEIE = reg_HPRASEIE;
  assign regOut_LC44IE = reg_LC44IE;
  assign regOut_LC45IE = reg_LC45IE;
  assign regOut_LC46IE = reg_LC46IE;
  assign regOut_LC47IE = reg_LC47IE;
  assign regOut_LC48IE = reg_LC48IE;
  assign regOut_LC49IE = reg_LC49IE;
  assign regOut_LC50IE = reg_LC50IE;
  assign regOut_LC51IE = reg_LC51IE;
  assign regOut_LC52IE = reg_LC52IE;
  assign regOut_LC53IE = reg_LC53IE;
  assign regOut_LC54IE = reg_LC54IE;
  assign regOut_LC55IE = reg_LC55IE;
  assign regOut_LC56IE = reg_LC56IE;
  assign regOut_LC57IE = reg_LC57IE;
  assign regOut_LC58IE = reg_LC58IE;
  assign regOut_LC59IE = reg_LC59IE;
  assign regOut_LC60IE = reg_LC60IE;
  assign regOut_LC61IE = reg_LC61IE;
  assign regOut_LC62IE = reg_LC62IE;
  assign regOut_LC63IE = reg_LC63IE;
endmodule

