// Generated by CIRCT firtool-1.74.0
module array_13(
  input  [8:0]  RW0_addr,
  input         RW0_en,
  input         RW0_clk,
  input         RW0_wmode,
  input  [79:0] RW0_wdata,
  output [79:0] RW0_rdata,
  input  [7:0]  RW0_wmask
);

  array_13_ext array_13_ext (
    .RW0_addr  (RW0_addr),
    .RW0_en    (RW0_en),
    .RW0_clk   (RW0_clk),
    .RW0_wmode (RW0_wmode),
    .RW0_wdata (RW0_wdata),
    .RW0_rdata (RW0_rdata),
    .RW0_wmask (RW0_wmask)
  );
endmodule

