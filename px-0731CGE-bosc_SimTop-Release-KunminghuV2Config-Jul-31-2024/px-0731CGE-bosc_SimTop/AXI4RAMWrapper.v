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
module AXI4RAMWrapper(
  input          clock,
  input          reset,
  output         io_axi4_0_aw_ready,
  input          io_axi4_0_aw_valid,
  input  [13:0]  io_axi4_0_aw_bits_id,
  input  [35:0]  io_axi4_0_aw_bits_addr,
  input  [7:0]   io_axi4_0_aw_bits_len,
  input  [2:0]   io_axi4_0_aw_bits_size,
  input  [1:0]   io_axi4_0_aw_bits_burst,
  input          io_axi4_0_aw_bits_lock,
  input  [3:0]   io_axi4_0_aw_bits_cache,
  input  [2:0]   io_axi4_0_aw_bits_prot,
  input  [3:0]   io_axi4_0_aw_bits_qos,
  output         io_axi4_0_w_ready,
  input          io_axi4_0_w_valid,
  input  [255:0] io_axi4_0_w_bits_data,
  input  [31:0]  io_axi4_0_w_bits_strb,
  input          io_axi4_0_w_bits_last,
  input          io_axi4_0_b_ready,
  output         io_axi4_0_b_valid,
  output [13:0]  io_axi4_0_b_bits_id,
  output [1:0]   io_axi4_0_b_bits_resp,
  output         io_axi4_0_ar_ready,
  input          io_axi4_0_ar_valid,
  input  [13:0]  io_axi4_0_ar_bits_id,
  input  [35:0]  io_axi4_0_ar_bits_addr,
  input  [7:0]   io_axi4_0_ar_bits_len,
  input  [2:0]   io_axi4_0_ar_bits_size,
  input  [1:0]   io_axi4_0_ar_bits_burst,
  input          io_axi4_0_ar_bits_lock,
  input  [3:0]   io_axi4_0_ar_bits_cache,
  input  [2:0]   io_axi4_0_ar_bits_prot,
  input  [3:0]   io_axi4_0_ar_bits_qos,
  input          io_axi4_0_r_ready,
  output         io_axi4_0_r_valid,
  output [13:0]  io_axi4_0_r_bits_id,
  output [255:0] io_axi4_0_r_bits_data,
  output [1:0]   io_axi4_0_r_bits_resp,
  output         io_axi4_0_r_bits_last
);

  AXI4RAM ram (
    .clock                 (clock),
    .reset                 (reset),
    .auto_in_aw_ready      (io_axi4_0_aw_ready),
    .auto_in_aw_valid      (io_axi4_0_aw_valid),
    .auto_in_aw_bits_id    (io_axi4_0_aw_bits_id),
    .auto_in_aw_bits_addr  (io_axi4_0_aw_bits_addr),
    .auto_in_aw_bits_len   (io_axi4_0_aw_bits_len),
    .auto_in_aw_bits_size  (io_axi4_0_aw_bits_size),
    .auto_in_aw_bits_burst (io_axi4_0_aw_bits_burst),
    .auto_in_aw_bits_lock  (io_axi4_0_aw_bits_lock),
    .auto_in_aw_bits_cache (io_axi4_0_aw_bits_cache),
    .auto_in_aw_bits_prot  (io_axi4_0_aw_bits_prot),
    .auto_in_aw_bits_qos   (io_axi4_0_aw_bits_qos),
    .auto_in_w_ready       (io_axi4_0_w_ready),
    .auto_in_w_valid       (io_axi4_0_w_valid),
    .auto_in_w_bits_data   (io_axi4_0_w_bits_data),
    .auto_in_w_bits_strb   (io_axi4_0_w_bits_strb),
    .auto_in_w_bits_last   (io_axi4_0_w_bits_last),
    .auto_in_b_ready       (io_axi4_0_b_ready),
    .auto_in_b_valid       (io_axi4_0_b_valid),
    .auto_in_b_bits_id     (io_axi4_0_b_bits_id),
    .auto_in_b_bits_resp   (io_axi4_0_b_bits_resp),
    .auto_in_ar_ready      (io_axi4_0_ar_ready),
    .auto_in_ar_valid      (io_axi4_0_ar_valid),
    .auto_in_ar_bits_id    (io_axi4_0_ar_bits_id),
    .auto_in_ar_bits_addr  (io_axi4_0_ar_bits_addr),
    .auto_in_ar_bits_len   (io_axi4_0_ar_bits_len),
    .auto_in_ar_bits_size  (io_axi4_0_ar_bits_size),
    .auto_in_ar_bits_burst (io_axi4_0_ar_bits_burst),
    .auto_in_ar_bits_lock  (io_axi4_0_ar_bits_lock),
    .auto_in_ar_bits_cache (io_axi4_0_ar_bits_cache),
    .auto_in_ar_bits_prot  (io_axi4_0_ar_bits_prot),
    .auto_in_ar_bits_qos   (io_axi4_0_ar_bits_qos),
    .auto_in_r_ready       (io_axi4_0_r_ready),
    .auto_in_r_valid       (io_axi4_0_r_valid),
    .auto_in_r_bits_id     (io_axi4_0_r_bits_id),
    .auto_in_r_bits_data   (io_axi4_0_r_bits_data),
    .auto_in_r_bits_resp   (io_axi4_0_r_bits_resp),
    .auto_in_r_bits_last   (io_axi4_0_r_bits_last)
  );
endmodule

