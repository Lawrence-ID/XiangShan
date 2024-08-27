// Generated by CIRCT firtool-1.74.0
// VCS coverage exclude_file
module ram_2x294(
  input          R0_addr,
  input          R0_en,
  input          R0_clk,
  output [293:0] R0_data,
  input          W0_addr,
  input          W0_en,
  input          W0_clk,
  input  [293:0] W0_data
);

  reg [293:0] Memory[0:1];
  always @(posedge W0_clk) begin
    if (W0_en & 1'h1)
      Memory[W0_addr] <= W0_data;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_MEM_
    reg [319:0] _RANDOM_MEM;
    initial begin
      `INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_MEM_INIT
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          for (logic [8:0] j = 9'h0; j < 9'h140; j += 9'h20) begin
            _RANDOM_MEM[j +: 32] = `RANDOM;
          end
          Memory[i[0]] = _RANDOM_MEM[293:0];
        end
      `endif // RANDOMIZE_MEM_INIT
    end // initial
  `endif // ENABLE_INITIAL_MEM_
  assign R0_data = R0_en ? Memory[R0_addr] : 294'bx;
endmodule

