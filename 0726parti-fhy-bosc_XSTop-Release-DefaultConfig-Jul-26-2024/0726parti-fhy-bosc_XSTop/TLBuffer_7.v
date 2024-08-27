// Generated by CIRCT firtool-1.74.0
module TLBuffer_7(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_param,
  input  [2:0]   auto_in_a_bits_size,
  input  [5:0]   auto_in_a_bits_source,
  input  [35:0]  auto_in_a_bits_address,
  input          auto_in_a_bits_user_alias,
  input  [34:0]  auto_in_a_bits_user_vaddr,
  input  [3:0]   auto_in_a_bits_user_reqSource,
  input          auto_in_a_bits_user_needHint,
  input          auto_in_a_bits_echo_isKeyword,
  input  [31:0]  auto_in_a_bits_mask,
  input          auto_in_b_ready,
  output         auto_in_b_valid,
  output [1:0]   auto_in_b_bits_param,
  output [35:0]  auto_in_b_bits_address,
  output [255:0] auto_in_b_bits_data,
  output         auto_in_c_ready,
  input          auto_in_c_valid,
  input  [2:0]   auto_in_c_bits_opcode,
  input  [2:0]   auto_in_c_bits_param,
  input  [2:0]   auto_in_c_bits_size,
  input  [5:0]   auto_in_c_bits_source,
  input  [35:0]  auto_in_c_bits_address,
  input  [255:0] auto_in_c_bits_data,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
  output [2:0]   auto_in_d_bits_size,
  output [5:0]   auto_in_d_bits_source,
  output [9:0]   auto_in_d_bits_sink,
  output         auto_in_d_bits_denied,
  output         auto_in_d_bits_echo_isKeyword,
  output [255:0] auto_in_d_bits_data,
  output         auto_in_d_bits_corrupt,
  output         auto_in_e_ready,
  input          auto_in_e_valid,
  input  [9:0]   auto_in_e_bits_sink,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
  output [2:0]   auto_out_a_bits_param,
  output [2:0]   auto_out_a_bits_size,
  output [5:0]   auto_out_a_bits_source,
  output [35:0]  auto_out_a_bits_address,
  output         auto_out_a_bits_user_alias,
  output [34:0]  auto_out_a_bits_user_vaddr,
  output [3:0]   auto_out_a_bits_user_reqSource,
  output         auto_out_a_bits_user_needHint,
  output         auto_out_a_bits_echo_isKeyword,
  output [31:0]  auto_out_a_bits_mask,
  output [255:0] auto_out_a_bits_data,
  output         auto_out_a_bits_corrupt,
  output         auto_out_b_ready,
  input          auto_out_b_valid,
  input  [2:0]   auto_out_b_bits_opcode,
  input  [1:0]   auto_out_b_bits_param,
  input  [2:0]   auto_out_b_bits_size,
  input  [5:0]   auto_out_b_bits_source,
  input  [35:0]  auto_out_b_bits_address,
  input  [31:0]  auto_out_b_bits_mask,
  input  [255:0] auto_out_b_bits_data,
  input          auto_out_b_bits_corrupt,
  input          auto_out_c_ready,
  output         auto_out_c_valid,
  output [2:0]   auto_out_c_bits_opcode,
  output [2:0]   auto_out_c_bits_param,
  output [2:0]   auto_out_c_bits_size,
  output [5:0]   auto_out_c_bits_source,
  output [35:0]  auto_out_c_bits_address,
  output         auto_out_c_bits_user_alias,
  output [34:0]  auto_out_c_bits_user_vaddr,
  output [3:0]   auto_out_c_bits_user_reqSource,
  output         auto_out_c_bits_user_needHint,
  output         auto_out_c_bits_echo_isKeyword,
  output [255:0] auto_out_c_bits_data,
  output         auto_out_c_bits_corrupt,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [2:0]   auto_out_d_bits_size,
  input  [5:0]   auto_out_d_bits_source,
  input  [9:0]   auto_out_d_bits_sink,
  input          auto_out_d_bits_denied,
  input          auto_out_d_bits_echo_isKeyword,
  input  [255:0] auto_out_d_bits_data,
  input          auto_out_d_bits_corrupt,
  input          auto_out_e_ready,
  output         auto_out_e_valid,
  output [9:0]   auto_out_e_bits_sink
);

  Queue2_TLBundleA_7 nodeOut_a_q (
    .clock                      (clock),
    .reset                      (reset),
    .io_enq_ready               (auto_in_a_ready),
    .io_enq_valid               (auto_in_a_valid),
    .io_enq_bits_opcode         (auto_in_a_bits_opcode),
    .io_enq_bits_param          (auto_in_a_bits_param),
    .io_enq_bits_size           (auto_in_a_bits_size),
    .io_enq_bits_source         (auto_in_a_bits_source),
    .io_enq_bits_address        (auto_in_a_bits_address),
    .io_enq_bits_user_alias     (auto_in_a_bits_user_alias),
    .io_enq_bits_user_vaddr     (auto_in_a_bits_user_vaddr),
    .io_enq_bits_user_reqSource (auto_in_a_bits_user_reqSource),
    .io_enq_bits_user_needHint  (auto_in_a_bits_user_needHint),
    .io_enq_bits_echo_isKeyword (auto_in_a_bits_echo_isKeyword),
    .io_enq_bits_mask           (auto_in_a_bits_mask),
    .io_deq_ready               (auto_out_a_ready),
    .io_deq_valid               (auto_out_a_valid),
    .io_deq_bits_opcode         (auto_out_a_bits_opcode),
    .io_deq_bits_param          (auto_out_a_bits_param),
    .io_deq_bits_size           (auto_out_a_bits_size),
    .io_deq_bits_source         (auto_out_a_bits_source),
    .io_deq_bits_address        (auto_out_a_bits_address),
    .io_deq_bits_user_alias     (auto_out_a_bits_user_alias),
    .io_deq_bits_user_vaddr     (auto_out_a_bits_user_vaddr),
    .io_deq_bits_user_reqSource (auto_out_a_bits_user_reqSource),
    .io_deq_bits_user_needHint  (auto_out_a_bits_user_needHint),
    .io_deq_bits_echo_isKeyword (auto_out_a_bits_echo_isKeyword),
    .io_deq_bits_mask           (auto_out_a_bits_mask),
    .io_deq_bits_data           (auto_out_a_bits_data),
    .io_deq_bits_corrupt        (auto_out_a_bits_corrupt)
  );
  Queue2_TLBundleD_8 nodeIn_d_q (
    .clock                      (clock),
    .reset                      (reset),
    .io_enq_ready               (auto_out_d_ready),
    .io_enq_valid               (auto_out_d_valid),
    .io_enq_bits_opcode         (auto_out_d_bits_opcode),
    .io_enq_bits_param          (auto_out_d_bits_param),
    .io_enq_bits_size           (auto_out_d_bits_size),
    .io_enq_bits_source         (auto_out_d_bits_source),
    .io_enq_bits_sink           (auto_out_d_bits_sink),
    .io_enq_bits_denied         (auto_out_d_bits_denied),
    .io_enq_bits_echo_isKeyword (auto_out_d_bits_echo_isKeyword),
    .io_enq_bits_data           (auto_out_d_bits_data),
    .io_enq_bits_corrupt        (auto_out_d_bits_corrupt),
    .io_deq_ready               (auto_in_d_ready),
    .io_deq_valid               (auto_in_d_valid),
    .io_deq_bits_opcode         (auto_in_d_bits_opcode),
    .io_deq_bits_param          (auto_in_d_bits_param),
    .io_deq_bits_size           (auto_in_d_bits_size),
    .io_deq_bits_source         (auto_in_d_bits_source),
    .io_deq_bits_sink           (auto_in_d_bits_sink),
    .io_deq_bits_denied         (auto_in_d_bits_denied),
    .io_deq_bits_echo_isKeyword (auto_in_d_bits_echo_isKeyword),
    .io_deq_bits_data           (auto_in_d_bits_data),
    .io_deq_bits_corrupt        (auto_in_d_bits_corrupt)
  );
  Queue2_TLBundleB nodeIn_b_q (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (auto_out_b_ready),
    .io_enq_valid        (auto_out_b_valid),
    .io_enq_bits_opcode  (auto_out_b_bits_opcode),
    .io_enq_bits_param   (auto_out_b_bits_param),
    .io_enq_bits_size    (auto_out_b_bits_size),
    .io_enq_bits_source  (auto_out_b_bits_source),
    .io_enq_bits_address (auto_out_b_bits_address),
    .io_enq_bits_mask    (auto_out_b_bits_mask),
    .io_enq_bits_data    (auto_out_b_bits_data),
    .io_enq_bits_corrupt (auto_out_b_bits_corrupt),
    .io_deq_ready        (auto_in_b_ready),
    .io_deq_valid        (auto_in_b_valid),
    .io_deq_bits_param   (auto_in_b_bits_param),
    .io_deq_bits_address (auto_in_b_bits_address),
    .io_deq_bits_data    (auto_in_b_bits_data)
  );
  Queue2_TLBundleC nodeOut_c_q (
    .clock                      (clock),
    .reset                      (reset),
    .io_enq_ready               (auto_in_c_ready),
    .io_enq_valid               (auto_in_c_valid),
    .io_enq_bits_opcode         (auto_in_c_bits_opcode),
    .io_enq_bits_param          (auto_in_c_bits_param),
    .io_enq_bits_size           (auto_in_c_bits_size),
    .io_enq_bits_source         (auto_in_c_bits_source),
    .io_enq_bits_address        (auto_in_c_bits_address),
    .io_enq_bits_data           (auto_in_c_bits_data),
    .io_deq_ready               (auto_out_c_ready),
    .io_deq_valid               (auto_out_c_valid),
    .io_deq_bits_opcode         (auto_out_c_bits_opcode),
    .io_deq_bits_param          (auto_out_c_bits_param),
    .io_deq_bits_size           (auto_out_c_bits_size),
    .io_deq_bits_source         (auto_out_c_bits_source),
    .io_deq_bits_address        (auto_out_c_bits_address),
    .io_deq_bits_user_alias     (auto_out_c_bits_user_alias),
    .io_deq_bits_user_vaddr     (auto_out_c_bits_user_vaddr),
    .io_deq_bits_user_reqSource (auto_out_c_bits_user_reqSource),
    .io_deq_bits_user_needHint  (auto_out_c_bits_user_needHint),
    .io_deq_bits_echo_isKeyword (auto_out_c_bits_echo_isKeyword),
    .io_deq_bits_data           (auto_out_c_bits_data),
    .io_deq_bits_corrupt        (auto_out_c_bits_corrupt)
  );
  Queue2_TLBundleE nodeOut_e_q (
    .clock            (clock),
    .reset            (reset),
    .io_enq_ready     (auto_in_e_ready),
    .io_enq_valid     (auto_in_e_valid),
    .io_enq_bits_sink (auto_in_e_bits_sink),
    .io_deq_ready     (auto_out_e_ready),
    .io_deq_valid     (auto_out_e_valid),
    .io_deq_bits_sink (auto_out_e_bits_sink)
  );
endmodule

