// Generated by CIRCT firtool-1.74.0
// VCS coverage exclude_file
module ram_40x38(
  input  [5:0]  R0_addr,
  input         R0_en,
  input         R0_clk,
  output [37:0] R0_data,
  input  [5:0]  W0_addr,
  input         W0_en,
  input         W0_clk,
  input  [37:0] W0_data
);

  reg [37:0] Memory[0:39];
  always @(posedge W0_clk) begin
    if (W0_en & 1'h1)
      Memory[W0_addr] <= W0_data;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_MEM_
    reg [63:0] _RANDOM_MEM;
    initial begin
      `INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_MEM_INIT
        for (logic [5:0] i = 6'h0; i < 6'h28; i += 6'h1) begin
          for (logic [6:0] j = 7'h0; j < 7'h40; j += 7'h20) begin
            _RANDOM_MEM[j +: 32] = `RANDOM;
          end
          Memory[i] = _RANDOM_MEM[37:0];
        end
      `endif // RANDOMIZE_MEM_INIT
    end // initial
  `endif // ENABLE_INITIAL_MEM_
  assign R0_data = R0_en ? Memory[R0_addr] : 38'bx;
endmodule

