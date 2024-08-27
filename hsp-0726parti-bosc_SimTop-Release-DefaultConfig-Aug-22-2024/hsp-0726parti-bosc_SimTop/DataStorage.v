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
module DataStorage(
  input          clock,
  input          reset,
  input          io_req_valid,
  input  [2:0]   io_req_bits_way,
  input  [8:0]   io_req_bits_set,
  input          io_req_bits_wen,
  output [511:0] io_rdata_data,
  input  [511:0] io_wdata_data
);

  wire         _ClockGate_Q;
  wire         wen = io_req_valid & io_req_bits_wen;
  wire         ren = io_req_valid & ~io_req_bits_wen;
  reg          holdWen_REG;
  reg          holdRen_REG;
  reg  [2:0]   req_r_way;
  reg  [8:0]   req_r_set;
  reg  [511:0] wdata_r_data;
  wire [11:0]  arrayIdx =
    {io_req_valid ? io_req_bits_way : req_r_way,
     io_req_valid ? io_req_bits_set : req_r_set};
  always @(posedge clock) begin
    holdWen_REG <= wen;
    holdRen_REG <= ren;
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      req_r_way <= 3'h0;
      req_r_set <= 9'h0;
      wdata_r_data <= 512'h0;
    end
    else if (io_req_valid) begin
      req_r_way <= io_req_bits_way;
      req_r_set <= io_req_bits_set;
      wdata_r_data <= io_wdata_data;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:16];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h11; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        holdWen_REG = _RANDOM[5'h0][0];
        holdRen_REG = _RANDOM[5'h0][1];
        req_r_way = _RANDOM[5'h0][4:2];
        req_r_set = _RANDOM[5'h0][13:5];
        wdata_r_data =
          {_RANDOM[5'h0][31:15],
           _RANDOM[5'h1],
           _RANDOM[5'h2],
           _RANDOM[5'h3],
           _RANDOM[5'h4],
           _RANDOM[5'h5],
           _RANDOM[5'h6],
           _RANDOM[5'h7],
           _RANDOM[5'h8],
           _RANDOM[5'h9],
           _RANDOM[5'hA],
           _RANDOM[5'hB],
           _RANDOM[5'hC],
           _RANDOM[5'hD],
           _RANDOM[5'hE],
           _RANDOM[5'hF],
           _RANDOM[5'h10][14:0]};
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        req_r_way = 3'h0;
        req_r_set = 9'h0;
        wdata_r_data = 512'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SRAMTemplate_143 array (
    .clock                     (_ClockGate_Q),
    .io_r_req_valid            (ren | holdRen_REG),
    .io_r_req_bits_setIdx      (arrayIdx),
    .io_r_resp_data_0_data     (io_rdata_data),
    .io_w_req_valid            (wen | holdWen_REG),
    .io_w_req_bits_setIdx      (arrayIdx),
    .io_w_req_bits_data_0_data (io_req_valid ? io_wdata_data : wdata_r_data)
  );
  ClockGate ClockGate (
    .TE (1'h0),
    .E  (io_req_valid),
    .CK (clock),
    .Q  (_ClockGate_Q)
  );
endmodule

