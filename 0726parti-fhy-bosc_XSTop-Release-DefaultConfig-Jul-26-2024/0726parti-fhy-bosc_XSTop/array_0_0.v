// Generated by CIRCT firtool-1.74.0
module array_0_0(
  input  [5:0]   R0_addr,
  input          R0_en,
  input          R0_clk,
  output [319:0] R0_data,
  input  [5:0]   W0_addr,
  input          W0_en,
  input          W0_clk,
  input  [319:0] W0_data
);

  array_0_0_ext array_0_0_ext (
    .R0_addr (R0_addr),
    .R0_en   (R0_en),
    .R0_clk  (R0_clk),
    .R0_data (R0_data),
    .W0_addr (W0_addr),
    .W0_en   (W0_en),
    .W0_clk  (W0_clk),
    .W0_data (W0_data)
  );
endmodule

