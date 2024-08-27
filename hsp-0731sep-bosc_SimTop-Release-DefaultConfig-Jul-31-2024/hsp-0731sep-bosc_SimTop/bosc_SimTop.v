//commit 22c6ee0bb71ec72a054daed057e87de930187f10
//Author: weiding liu <1045251744@qq.com>
//Date:   Wed Jul 31 11:40:13 2024 +0800
//
//    VLSU: feedback to RS delay 1 cycle && VsegmentUnit writeback delay 1 cycle
//diff --git a/src/main/resources/aia b/src/main/resources/aia
//--- a/src/main/resources/aia
//+++ b/src/main/resources/aia
//@@ -1 +1 @@
//-Subproject commit e4af98a3e9df3aa80a703322bca340eb5f66426c
//+Subproject commit e4af98a3e9df3aa80a703322bca340eb5f66426c-dirty
//diff --git a/src/main/scala/xiangshan/frontend/BPU.scala b/src/main/scala/xiangshan/frontend/BPU.scala
//index bef4a76f8..89f16a234 100644
//--- a/src/main/scala/xiangshan/frontend/BPU.scala
//+++ b/src/main/scala/xiangshan/frontend/BPU.scala
//@@ -237,6 +237,7 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
// 
//   val ctrl = DelayN(io.ctrl, 1)
//   val predictors = Module(if (useBPD) new Composer else new FakePredictor)
//+  val historyManager = Module(new HistoryManager)
// 
//   def numOfStage = 3
//   require(numOfStage > 1, "BPU numOfStage must be greater than 1")
//@@ -296,59 +297,15 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//   val s2_pc = RegEnable(s1_pc, s1_fire_dup(0))
//   val s3_pc = RegEnable(s2_pc, s2_fire_dup(0))
// 
//-  val s0_folded_gh_dup = dup_wire(new AllFoldedHistories(foldedGHistInfos))
//-  val s0_folded_gh_reg_dup = s0_folded_gh_dup.zip(s0_stall_dup).map{
//-    case (x, s0_stall) => RegEnable(x, 0.U.asTypeOf(s0_folded_gh_dup(0)), !s0_stall)
//-  }
//-  val s1_folded_gh_dup = RegEnable(s0_folded_gh_dup, 0.U.asTypeOf(s0_folded_gh_dup), s0_fire_dup(1))
//-  val s2_folded_gh_dup = RegEnable(s1_folded_gh_dup, 0.U.asTypeOf(s0_folded_gh_dup), s1_fire_dup(1))
//-  val s3_folded_gh_dup = RegEnable(s2_folded_gh_dup, 0.U.asTypeOf(s0_folded_gh_dup), s2_fire_dup(1))
//-
//-  val s0_last_br_num_oh_dup = dup_wire(UInt((numBr+1).W))
//-  val s0_last_br_num_oh_reg_dup = s0_last_br_num_oh_dup.zip(s0_stall_dup).map{
//-    case (x, s0_stall) => RegEnable(x, 0.U, !s0_stall)
//-  }
//-  val s1_last_br_num_oh_dup = RegEnable(s0_last_br_num_oh_dup, 0.U.asTypeOf(s0_last_br_num_oh_dup), s0_fire_dup(1))
//-  val s2_last_br_num_oh_dup = RegEnable(s1_last_br_num_oh_dup, 0.U.asTypeOf(s0_last_br_num_oh_dup), s1_fire_dup(1))
//-  val s3_last_br_num_oh_dup = RegEnable(s2_last_br_num_oh_dup, 0.U.asTypeOf(s0_last_br_num_oh_dup), s2_fire_dup(1))
//-
//-  val s0_ahead_fh_oldest_bits_dup = dup_wire(new AllAheadFoldedHistoryOldestBits(foldedGHistInfos))
//-  val s0_ahead_fh_oldest_bits_reg_dup = s0_ahead_fh_oldest_bits_dup.zip(s0_stall_dup).map{
//-    case (x, s0_stall) => RegEnable(x, 0.U.asTypeOf(s0_ahead_fh_oldest_bits_dup(0)), !s0_stall)
//-  }
//-  val s1_ahead_fh_oldest_bits_dup = RegEnable(s0_ahead_fh_oldest_bits_dup, 0.U.asTypeOf(s0_ahead_fh_oldest_bits_dup), s0_fire_dup(1))
//-  val s2_ahead_fh_oldest_bits_dup = RegEnable(s1_ahead_fh_oldest_bits_dup, 0.U.asTypeOf(s0_ahead_fh_oldest_bits_dup), s1_fire_dup(1))
//-  val s3_ahead_fh_oldest_bits_dup = RegEnable(s2_ahead_fh_oldest_bits_dup, 0.U.asTypeOf(s0_ahead_fh_oldest_bits_dup), s2_fire_dup(1))
//-
//   val npcGen_dup         = Seq.tabulate(numDup)(n => new PhyPriorityMuxGenerator[UInt])
//-  val foldedGhGen_dup    = Seq.tabulate(numDup)(n => new PhyPriorityMuxGenerator[AllFoldedHistories])
//-  val ghistPtrGen_dup    = Seq.tabulate(numDup)(n => new PhyPriorityMuxGenerator[CGHPtr])
//-  val lastBrNumOHGen_dup = Seq.tabulate(numDup)(n => new PhyPriorityMuxGenerator[UInt])
//-  val aheadFhObGen_dup   = Seq.tabulate(numDup)(n => new PhyPriorityMuxGenerator[AllAheadFoldedHistoryOldestBits])
//-
//-  val ghvBitWriteGens = Seq.tabulate(HistoryLength)(n => new PhyPriorityMuxGenerator[Bool])
//-  // val ghistGen = new PhyPriorityMuxGenerator[UInt]
//-
//-  val ghv = RegInit(0.U.asTypeOf(Vec(HistoryLength, Bool())))
//-  val ghv_wire = WireInit(ghv)
//-
//-  val s0_ghist = WireInit(0.U.asTypeOf(UInt(HistoryLength.W)))
//-
// 
//-  println(f"history buffer length ${HistoryLength}")
//-  val ghv_write_datas = Wire(Vec(HistoryLength, Bool()))
//-  val ghv_wens = Wire(Vec(HistoryLength, Bool()))
//-
//-  val s0_ghist_ptr_dup = dup_wire(new CGHPtr)
//-  val s0_ghist_ptr_reg_dup = s0_ghist_ptr_dup.zip(s0_stall_dup).map{
//-    case (x, s0_stall) => RegEnable(x, 0.U.asTypeOf(new CGHPtr), !s0_stall)
//-  }
//-  val s1_ghist_ptr_dup = RegEnable(s0_ghist_ptr_dup, 0.U.asTypeOf(s0_ghist_ptr_dup), s0_fire_dup(1))
//-  val s2_ghist_ptr_dup = RegEnable(s1_ghist_ptr_dup, 0.U.asTypeOf(s0_ghist_ptr_dup), s1_fire_dup(1))
//-  val s3_ghist_ptr_dup = RegEnable(s2_ghist_ptr_dup, 0.U.asTypeOf(s0_ghist_ptr_dup), s2_fire_dup(1))
//+  val s0_ghist = historyManager.io.s0_ghist
//+  val s0_folded_gh_dup = historyManager.io.s0_folded_gh_dup
//+  val s1_folded_gh_dup = historyManager.io.s1_folded_gh_dup
//+  val s3_ghist_ptr_dup = historyManager.io.s3_ghist_ptr_dup
//+  val ghv_wire = historyManager.io.ghv_wire
// 
//   def getHist(ptr: CGHPtr): UInt = (Cat(ghv_wire.asUInt, ghv_wire.asUInt) >> (ptr.value+1.U))(HistoryLength-1, 0)
//-  s0_ghist := getHist(s0_ghist_ptr_dup(0))
// 
//   val resp = predictors.io.out
// 
//@@ -358,6 +315,16 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//   val s1_flush_dup, s2_flush_dup, s3_flush_dup = dup_wire(Bool())
//   val s2_redirect_dup, s3_redirect_dup = dup_wire(Bool())
// 
//+  historyManager.io.resp := resp
//+  historyManager.io.s1_valid_dup := s1_valid_dup
//+  historyManager.io.s0_fire_dup := s0_fire_dup
//+  historyManager.io.s1_fire_dup := s1_fire_dup
//+  historyManager.io.s2_fire_dup := s2_fire_dup
//+  historyManager.io.s0_stall_dup := s0_stall_dup
//+  historyManager.io.s2_redirect_dup := s2_redirect_dup
//+  historyManager.io.s3_redirect_dup := s3_redirect_dup
//+  historyManager.io.ftq_to_bpu := io.ftq_to_bpu
//+
//   // predictors.io := DontCare
//   predictors.io.in.valid := s0_fire_dup(0)
//   predictors.io.in.bits.s0_pc := s0_pc_dup
//@@ -485,14 +452,6 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
// 
//   npcGen_dup.zip(s0_pc_reg_dup).map{ case (gen, reg) =>
//     gen.register(true.B, reg, Some("stallPC"), 0)}
//-  foldedGhGen_dup.zip(s0_folded_gh_reg_dup).map{ case (gen, reg) =>
//-    gen.register(true.B, reg, Some("stallFGH"), 0)}
//-  ghistPtrGen_dup.zip(s0_ghist_ptr_reg_dup).map{ case (gen, reg) =>
//-    gen.register(true.B, reg, Some("stallGHPtr"), 0)}
//-  lastBrNumOHGen_dup.zip(s0_last_br_num_oh_reg_dup).map{ case (gen, reg) =>
//-    gen.register(true.B, reg, Some("stallBrNumOH"), 0)}
//-  aheadFhObGen_dup.zip(s0_ahead_fh_oldest_bits_reg_dup).map{ case (gen, reg) =>
//-    gen.register(true.B, reg, Some("stallAFHOB"), 0)}
// 
//   // assign pred cycle for profiling
//   io.bpu_to_ftq.resp.bits.s1.full_pred.map(_.predCycle.map(_ := GTimer()))
//@@ -500,59 +459,9 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//   io.bpu_to_ftq.resp.bits.s3.full_pred.map(_.predCycle.map(_ := GTimer()))
// 
// 
//-
//-  // History manage
//-  // s1
//-  val s1_possible_predicted_ghist_ptrs_dup = s1_ghist_ptr_dup.map(ptr => (0 to numBr).map(ptr - _.U))
//-  val s1_predicted_ghist_ptr_dup = s1_possible_predicted_ghist_ptrs_dup.zip(resp.s1.lastBrPosOH).map{ case (ptr, oh) => Mux1H(oh, ptr)}
//-  val s1_possible_predicted_fhs_dup =
//-    for (((((fgh, afh), br_num_oh), t), br_pos_oh) <-
//-      s1_folded_gh_dup zip s1_ahead_fh_oldest_bits_dup zip s1_last_br_num_oh_dup zip resp.s1.brTaken zip resp.s1.lastBrPosOH)
//-      yield (0 to numBr).map(i =>
//-        fgh.update(afh, br_num_oh, i, t & br_pos_oh(i))
//-      )
//-  val s1_predicted_fh_dup = resp.s1.lastBrPosOH.zip(s1_possible_predicted_fhs_dup).map{ case (oh, fh) => Mux1H(oh, fh)}
//-
//-  val s1_ahead_fh_ob_src_dup = dup_wire(new AllAheadFoldedHistoryOldestBits(foldedGHistInfos))
//-  s1_ahead_fh_ob_src_dup.zip(s1_ghist_ptr_dup).map{ case (src, ptr) => src.read(ghv, ptr)}
//-
//-  if (EnableGHistDiff) {
//-    val s1_predicted_ghist = WireInit(getHist(s1_predicted_ghist_ptr_dup(0)).asTypeOf(Vec(HistoryLength, Bool())))
//-    for (i <- 0 until numBr) {
//-      when (resp.s1.shouldShiftVec(0)(i)) {
//-        s1_predicted_ghist(i) := resp.s1.brTaken(0) && (i==0).B
//-      }
//-    }
//-    when (s1_valid_dup(0)) {
//-      s0_ghist := s1_predicted_ghist.asUInt
//-    }
//-  }
//-
//-  val s1_ghv_wens = (0 until HistoryLength).map(n =>
//-    (0 until numBr).map(b => (s1_ghist_ptr_dup(0)).value === (CGHPtr(false.B, n.U) + b.U).value && resp.s1.shouldShiftVec(0)(b) && s1_valid_dup(0)))
//-  val s1_ghv_wdatas = (0 until HistoryLength).map(n =>
//-    Mux1H(
//-      (0 until numBr).map(b => (
//-        (s1_ghist_ptr_dup(0)).value === (CGHPtr(false.B, n.U) + b.U).value && resp.s1.shouldShiftVec(0)(b),
//-        resp.s1.brTaken(0) && resp.s1.lastBrPosOH(0)(b+1)
//-      ))
//-    )
//-  )
//-
//-
//   for (((npcGen, s1_valid), s1_target) <- npcGen_dup zip s1_valid_dup zip resp.s1.getTarget)
//     npcGen.register(s1_valid, s1_target, Some("s1_target"), 4)
//-  for (((foldedGhGen, s1_valid), s1_predicted_fh) <- foldedGhGen_dup zip s1_valid_dup zip s1_predicted_fh_dup)
//-    foldedGhGen.register(s1_valid, s1_predicted_fh, Some("s1_FGH"), 4)
//-  for (((ghistPtrGen, s1_valid), s1_predicted_ghist_ptr) <- ghistPtrGen_dup zip s1_valid_dup zip s1_predicted_ghist_ptr_dup)
//-    ghistPtrGen.register(s1_valid, s1_predicted_ghist_ptr, Some("s1_GHPtr"), 4)
//-  for (((lastBrNumOHGen, s1_valid), s1_brPosOH) <- lastBrNumOHGen_dup zip s1_valid_dup zip resp.s1.lastBrPosOH.map(_.asUInt))
//-    lastBrNumOHGen.register(s1_valid, s1_brPosOH, Some("s1_BrNumOH"), 4)
//-  for (((aheadFhObGen, s1_valid), s1_ahead_fh_ob_src) <- aheadFhObGen_dup zip s1_valid_dup zip s1_ahead_fh_ob_src_dup)
//-    aheadFhObGen.register(s1_valid, s1_ahead_fh_ob_src, Some("s1_AFHOB"), 4)
//-  ghvBitWriteGens.zip(s1_ghv_wens).zipWithIndex.map{case ((b, w), i) =>
//-    b.register(w.reduce(_||_), s1_ghv_wdatas(i), Some(s"s1_new_bit_$i"), 4)
//-  }
//+
// 
//   class PreviousPredInfo extends Bundle {
//     val hit = Vec(numDup, Bool())
//@@ -589,43 +498,6 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//     )
//   }
// 
//-  // s2
//-  val s2_possible_predicted_ghist_ptrs_dup = s2_ghist_ptr_dup.map(ptr => (0 to numBr).map(ptr - _.U))
//-  val s2_predicted_ghist_ptr_dup = s2_possible_predicted_ghist_ptrs_dup.zip(resp.s2.lastBrPosOH).map{ case (ptr, oh) => Mux1H(oh, ptr)}
//-
//-  val s2_possible_predicted_fhs_dup =
//-    for ((((fgh, afh), br_num_oh), full_pred) <-
//-      s2_folded_gh_dup zip s2_ahead_fh_oldest_bits_dup zip s2_last_br_num_oh_dup zip resp.s2.full_pred)
//-      yield (0 to numBr).map(i =>
//-        fgh.update(afh, br_num_oh, i, if (i > 0) full_pred.br_taken_mask(i-1) else false.B)
//-      )
//-  val s2_predicted_fh_dup = resp.s2.lastBrPosOH.zip(s2_possible_predicted_fhs_dup).map{ case (oh, fh) => Mux1H(oh, fh)}
//-
//-  val s2_ahead_fh_ob_src_dup = dup_wire(new AllAheadFoldedHistoryOldestBits(foldedGHistInfos))
//-  s2_ahead_fh_ob_src_dup.zip(s2_ghist_ptr_dup).map{ case (src, ptr) => src.read(ghv, ptr)}
//-
//-  if (EnableGHistDiff) {
//-    val s2_predicted_ghist = WireInit(getHist(s2_predicted_ghist_ptr_dup(0)).asTypeOf(Vec(HistoryLength, Bool())))
//-    for (i <- 0 until numBr) {
//-      when (resp.s2.shouldShiftVec(0)(i)) {
//-        s2_predicted_ghist(i) := resp.s2.brTaken(0) && (i==0).B
//-      }
//-    }
//-    when(s2_redirect_dup(0)) {
//-      s0_ghist := s2_predicted_ghist.asUInt
//-    }
//-  }
//-
//-  val s2_ghv_wens = (0 until HistoryLength).map(n =>
//-    (0 until numBr).map(b => (s2_ghist_ptr_dup(0)).value === (CGHPtr(false.B, n.U) + b.U).value && resp.s2.shouldShiftVec(0)(b) && s2_redirect_dup(0)))
//-  val s2_ghv_wdatas = (0 until HistoryLength).map(n =>
//-    Mux1H(
//-      (0 until numBr).map(b => (
//-        (s2_ghist_ptr_dup(0)).value === (CGHPtr(false.B, n.U) + b.U).value && resp.s2.shouldShiftVec(0)(b),
//-        resp.s2.full_pred(0).real_br_taken_mask()(b)
//-      ))
//-    )
//-  )
// 
//   val s1_pred_info = Wire(new PreviousPredInfo)
//   s1_pred_info.hit := resp.s1.full_pred.map(_.hit)
//@@ -645,17 +517,7 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
// 
//   for (((npcGen, s2_redirect), s2_target) <- npcGen_dup zip s2_redirect_dup zip resp.s2.getTarget)
//     npcGen.register(s2_redirect, s2_target, Some("s2_target"), 5)
//-  for (((foldedGhGen, s2_redirect), s2_predicted_fh) <- foldedGhGen_dup zip s2_redirect_dup zip s2_predicted_fh_dup)
//-    foldedGhGen.register(s2_redirect, s2_predicted_fh, Some("s2_FGH"), 5)
//-  for (((ghistPtrGen, s2_redirect), s2_predicted_ghist_ptr) <- ghistPtrGen_dup zip s2_redirect_dup zip s2_predicted_ghist_ptr_dup)
//-    ghistPtrGen.register(s2_redirect, s2_predicted_ghist_ptr, Some("s2_GHPtr"), 5)
//-  for (((lastBrNumOHGen, s2_redirect), s2_brPosOH) <- lastBrNumOHGen_dup zip s2_redirect_dup zip resp.s2.lastBrPosOH.map(_.asUInt))
//-    lastBrNumOHGen.register(s2_redirect, s2_brPosOH, Some("s2_BrNumOH"), 5)
//-  for (((aheadFhObGen, s2_redirect), s2_ahead_fh_ob_src) <- aheadFhObGen_dup zip s2_redirect_dup zip s2_ahead_fh_ob_src_dup)
//-    aheadFhObGen.register(s2_redirect, s2_ahead_fh_ob_src, Some("s2_AFHOB"), 5)
//-  ghvBitWriteGens.zip(s2_ghv_wens).zipWithIndex.map{case ((b, w), i) =>
//-    b.register(w.reduce(_||_), s2_ghv_wdatas(i), Some(s"s2_new_bit_$i"), 5)
//-  }
//+
// 
//   XSPerfAccumulate("s2_redirect_because_target_diff", s2_fire_dup(0) && s2_redirect_s1_last_pred_vec_dup(0)(0))
//   XSPerfAccumulate("s2_redirect_because_branch_num_diff", s2_fire_dup(0) && s2_redirect_s1_last_pred_vec_dup(0)(1))
//@@ -670,44 +532,6 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//   XSPerfAccumulate("s2_redirect_when_not_hit", s2_redirect_dup(0) && !resp.s2.full_pred(0).hit)
// 
// 
//-  // s3
//-  val s3_possible_predicted_ghist_ptrs_dup = s3_ghist_ptr_dup.map(ptr => (0 to numBr).map(ptr - _.U))
//-  val s3_predicted_ghist_ptr_dup = s3_possible_predicted_ghist_ptrs_dup.zip(resp.s3.lastBrPosOH).map{ case (ptr, oh) => Mux1H(oh, ptr)}
//-
//-  val s3_possible_predicted_fhs_dup =
//-    for ((((fgh, afh), br_num_oh), full_pred) <-
//-      s3_folded_gh_dup zip s3_ahead_fh_oldest_bits_dup zip s3_last_br_num_oh_dup zip resp.s3.full_pred)
//-      yield (0 to numBr).map(i =>
//-        fgh.update(afh, br_num_oh, i, if (i > 0) full_pred.br_taken_mask(i-1) else false.B)
//-      )
//-  val s3_predicted_fh_dup = resp.s3.lastBrPosOH.zip(s3_possible_predicted_fhs_dup).map{ case (oh, fh) => Mux1H(oh, fh)}
//-
//-  val s3_ahead_fh_ob_src_dup = dup_wire(new AllAheadFoldedHistoryOldestBits(foldedGHistInfos))
//-  s3_ahead_fh_ob_src_dup.zip(s3_ghist_ptr_dup).map{ case (src, ptr) => src.read(ghv, ptr)}
//-
//-  if (EnableGHistDiff) {
//-    val s3_predicted_ghist = WireInit(getHist(s3_predicted_ghist_ptr_dup(0)).asTypeOf(Vec(HistoryLength, Bool())))
//-    for (i <- 0 until numBr) {
//-      when (resp.s3.shouldShiftVec(0)(i)) {
//-        s3_predicted_ghist(i) := resp.s3.brTaken(0) && (i==0).B
//-      }
//-    }
//-    when(s3_redirect_dup(0)) {
//-      s0_ghist := s3_predicted_ghist.asUInt
//-    }
//-  }
//-
//-  val s3_ghv_wens = (0 until HistoryLength).map(n =>
//-    (0 until numBr).map(b => (s3_ghist_ptr_dup(0)).value === (CGHPtr(false.B, n.U) + b.U).value && resp.s3.shouldShiftVec(0)(b) && s3_redirect_dup(0)))
//-  val s3_ghv_wdatas = (0 until HistoryLength).map(n =>
//-    Mux1H(
//-      (0 until numBr).map(b => (
//-        (s3_ghist_ptr_dup(0)).value === (CGHPtr(false.B, n.U) + b.U).value && resp.s3.shouldShiftVec(0)(b),
//-        resp.s3.full_pred(0).real_br_taken_mask()(b)
//-      ))
//-    )
//-  )
//-
//   val previous_s2_pred = RegEnable(resp.s2, 0.U.asTypeOf(resp.s2), s2_fire_dup(0))
// 
//   val s3_redirect_on_br_taken_dup = resp.s3.full_pred.zip(previous_s2_pred.full_pred).map {case (fp1, fp2) => fp1.real_br_taken_mask().asUInt =/= fp2.real_br_taken_mask().asUInt}
//@@ -731,17 +555,7 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
// 
//   for (((npcGen, s3_redirect), s3_target) <- npcGen_dup zip s3_redirect_dup zip resp.s3.getTarget)
//     npcGen.register(s3_redirect, s3_target, Some("s3_target"), 3)
//-  for (((foldedGhGen, s3_redirect), s3_predicted_fh) <- foldedGhGen_dup zip s3_redirect_dup zip s3_predicted_fh_dup)
//-    foldedGhGen.register(s3_redirect, s3_predicted_fh, Some("s3_FGH"), 3)
//-  for (((ghistPtrGen, s3_redirect), s3_predicted_ghist_ptr) <- ghistPtrGen_dup zip s3_redirect_dup zip s3_predicted_ghist_ptr_dup)
//-    ghistPtrGen.register(s3_redirect, s3_predicted_ghist_ptr, Some("s3_GHPtr"), 3)
//-  for (((lastBrNumOHGen, s3_redirect), s3_brPosOH) <- lastBrNumOHGen_dup zip s3_redirect_dup zip resp.s3.lastBrPosOH.map(_.asUInt))
//-    lastBrNumOHGen.register(s3_redirect, s3_brPosOH, Some("s3_BrNumOH"), 3)
//-  for (((aheadFhObGen, s3_redirect), s3_ahead_fh_ob_src) <- aheadFhObGen_dup zip s3_redirect_dup zip s3_ahead_fh_ob_src_dup)
//-    aheadFhObGen.register(s3_redirect, s3_ahead_fh_ob_src, Some("s3_AFHOB"), 3)
//-  ghvBitWriteGens.zip(s3_ghv_wens).zipWithIndex.map{case ((b, w), i) =>
//-    b.register(w.reduce(_||_), s3_ghv_wdatas(i), Some(s"s3_new_bit_$i"), 3)
//-  }
//+
// 
//   // Send signal tell Ftq override
//   val s2_ftq_idx = RegEnable(io.ftq_to_bpu.enq_ptr, s1_fire_dup(0))
//@@ -768,139 +582,13 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//   predictors.io.update.bits.ghist := RegEnable(
//     getHist(io.ftq_to_bpu.update.bits.spec_info.histPtr), io.ftq_to_bpu.update.valid)
// 
//-  val redirect_dup = do_redirect_dup.map(_.bits)
//   predictors.io.redirect := do_redirect_dup(0)
// 
//-  // Redirect logic
//-  val shift_dup = redirect_dup.map(_.cfiUpdate.shift)
//-  val addIntoHist_dup = redirect_dup.map(_.cfiUpdate.addIntoHist)
//-  // TODO: remove these below
//-  val shouldShiftVec_dup = shift_dup.map(shift => Mux(shift === 0.U, VecInit(0.U((1 << (log2Ceil(numBr) + 1)).W).asBools), VecInit((LowerMask(1.U << (shift-1.U))).asBools)))
//-  // TODO end
//-  val afhob_dup = redirect_dup.map(_.cfiUpdate.afhob)
//-  val lastBrNumOH_dup = redirect_dup.map(_.cfiUpdate.lastBrNumOH)
//-
//-
//-  val isBr_dup = redirect_dup.map(_.cfiUpdate.pd.isBr)
//-  val taken_dup = redirect_dup.map(_.cfiUpdate.taken)
//-  val real_br_taken_mask_dup =
//-    for (((shift, taken), addIntoHist) <- shift_dup zip taken_dup zip addIntoHist_dup)
//-      yield (0 until numBr).map(i => shift === (i+1).U && taken && addIntoHist )
//-
//-  val oldPtr_dup = redirect_dup.map(_.cfiUpdate.histPtr)
//-  val updated_ptr_dup = oldPtr_dup.zip(shift_dup).map {case (oldPtr, shift) => oldPtr - shift}
//-  def computeFoldedHist(hist: UInt, compLen: Int)(histLen: Int): UInt = {
//-    if (histLen > 0) {
//-      val nChunks     = (histLen + compLen - 1) / compLen
//-      val hist_chunks = (0 until nChunks) map { i =>
//-        hist(min((i + 1) * compLen, histLen) - 1, i * compLen)
//-      }
//-      ParallelXOR(hist_chunks)
//-    }
//-    else 0.U
//-  }
//-
//-  val oldFh_dup = dup_seq(WireInit(0.U.asTypeOf(new AllFoldedHistories(foldedGHistInfos))))
//-  oldFh_dup.zip(oldPtr_dup).map { case (oldFh, oldPtr) =>
//-      foldedGHistInfos.foreach { case (histLen, compLen) => 
//-        oldFh.getHistWithInfo((histLen, compLen)).folded_hist := computeFoldedHist(getHist(oldPtr), compLen)(histLen)
//-      }
//-  }
//-
//-  val updated_fh_dup =
//-    for (((((oldFh, oldPtr), taken), addIntoHist), shift) <-
//-      oldFh_dup zip oldPtr_dup zip taken_dup zip addIntoHist_dup zip shift_dup)
//-    yield VecInit((0 to numBr).map(i => oldFh.update(ghv, oldPtr, i, taken && addIntoHist)))(shift)
//-  val thisBrNumOH_dup = shift_dup.map(shift => UIntToOH(shift, numBr+1))
//-  val thisAheadFhOb_dup = dup_wire(new AllAheadFoldedHistoryOldestBits(foldedGHistInfos))
//-  thisAheadFhOb_dup.zip(oldPtr_dup).map {case (afhob, oldPtr) => afhob.read(ghv, oldPtr)}
//-  val redirect_ghv_wens = (0 until HistoryLength).map(n =>
//-    (0 until numBr).map(b => oldPtr_dup(0).value === (CGHPtr(false.B, n.U) + b.U).value && shouldShiftVec_dup(0)(b) && do_redirect_dup(0).valid))
//-  val redirect_ghv_wdatas = (0 until HistoryLength).map(n =>
//-    Mux1H(
//-      (0 until numBr).map(b => oldPtr_dup(0).value === (CGHPtr(false.B, n.U) + b.U).value && shouldShiftVec_dup(0)(b)),
//-      real_br_taken_mask_dup(0)
//-    )
//-  )
//-
//-  if (EnableGHistDiff) {
//-    val updated_ghist = WireInit(getHist(updated_ptr_dup(0)).asTypeOf(Vec(HistoryLength, Bool())))
//-    for (i <- 0 until numBr) {
//-      when (shift_dup(0) >= (i+1).U) {
//-        updated_ghist(i) := taken_dup(0) && addIntoHist_dup(0) && (i==0).B
//-      }
//-    }
//-    when(do_redirect_dup(0).valid) {
//-      s0_ghist := updated_ghist.asUInt
//-    }
//-  }
//-
//-  // Commit time history checker
//-  if (EnableCommitGHistDiff) {
//-    val commitGHist = RegInit(0.U.asTypeOf(Vec(HistoryLength, Bool())))
//-    val commitGHistPtr = RegInit(0.U.asTypeOf(new CGHPtr))
//-    def getCommitHist(ptr: CGHPtr): UInt =
//-      (Cat(commitGHist.asUInt, commitGHist.asUInt) >> (ptr.value+1.U))(HistoryLength-1, 0)
//-
//-    val updateValid        : Bool      = io.ftq_to_bpu.update.valid
//-    val branchValidMask    : UInt      = io.ftq_to_bpu.update.bits.ftb_entry.brValids.asUInt
//-    val branchCommittedMask: Vec[Bool] = io.ftq_to_bpu.update.bits.br_committed
//-    val misPredictMask     : UInt      = io.ftq_to_bpu.update.bits.mispred_mask.asUInt
//-    val takenMask          : UInt      =
//-      io.ftq_to_bpu.update.bits.br_taken_mask.asUInt |
//-        io.ftq_to_bpu.update.bits.ftb_entry.always_taken.asUInt // Always taken branch is recorded in history
//-    val takenIdx       : UInt = (PriorityEncoder(takenMask) + 1.U((log2Ceil(numBr)+1).W)).asUInt
//-    val misPredictIdx  : UInt = (PriorityEncoder(misPredictMask) + 1.U((log2Ceil(numBr)+1).W)).asUInt
//-    val shouldShiftMask: UInt = Mux(takenMask.orR,
//-        LowerMask(takenIdx).asUInt,
//-        ((1 << numBr) - 1).asUInt) &
//-      Mux(misPredictMask.orR,
//-        LowerMask(misPredictIdx).asUInt,
//-        ((1 << numBr) - 1).asUInt) &
//-      branchCommittedMask.asUInt
//-    val updateShift    : UInt   =
//-      Mux(updateValid && branchValidMask.orR, PopCount(branchValidMask & shouldShiftMask), 0.U)
//-
//-    // Maintain the commitGHist
//-    for (i <- 0 until numBr) {
//-      when(updateShift >= (i + 1).U) {
//-        val ptr: CGHPtr = commitGHistPtr - i.asUInt
//-        commitGHist(ptr.value) := takenMask(i)
//-      }
//-    }
//-    when(updateValid) {
//-      commitGHistPtr := commitGHistPtr - updateShift
//-    }
//-
//-    // Calculate true history using Parallel XOR
//-    // Do differential
//-    TageTableInfos.map {
//-      case (nRows, histLen, _) => {
//-        val nRowsPerBr = nRows / numBr
//-        val predictGHistPtr = io.ftq_to_bpu.update.bits.spec_info.histPtr
//-        val commitTrueHist: UInt = computeFoldedHist(getCommitHist(commitGHistPtr), log2Ceil(nRowsPerBr))(histLen)
//-        val predictFHist  : UInt = computeFoldedHist(getHist(predictGHistPtr), log2Ceil(nRowsPerBr))(histLen)
//-        XSWarn(updateValid && predictFHist =/= commitTrueHist,
//-          p"predict time ghist: ${predictFHist} is different from commit time: ${commitTrueHist}\n")
//-      }
//-    }
//-  }
//-
// 
//   // val updatedGh = oldGh.update(shift, taken && addIntoHist)
//   for ((npcGen, do_redirect) <- npcGen_dup zip do_redirect_dup)
//     npcGen.register(do_redirect.valid, do_redirect.bits.cfiUpdate.target, Some("redirect_target"), 2)
//-  for (((foldedGhGen, do_redirect), updated_fh) <- foldedGhGen_dup zip do_redirect_dup zip updated_fh_dup)
//-    foldedGhGen.register(do_redirect.valid, updated_fh, Some("redirect_FGHT"), 2)
//-  for (((ghistPtrGen, do_redirect), updated_ptr) <- ghistPtrGen_dup zip do_redirect_dup zip updated_ptr_dup)
//-    ghistPtrGen.register(do_redirect.valid, updated_ptr, Some("redirect_GHPtr"), 2)
//-  for (((lastBrNumOHGen, do_redirect), thisBrNumOH) <- lastBrNumOHGen_dup zip do_redirect_dup zip thisBrNumOH_dup)
//-    lastBrNumOHGen.register(do_redirect.valid, thisBrNumOH, Some("redirect_BrNumOH"), 2)
//-  for (((aheadFhObGen, do_redirect), thisAheadFhOb) <- aheadFhObGen_dup zip do_redirect_dup zip thisAheadFhOb_dup)
//-    aheadFhObGen.register(do_redirect.valid, thisAheadFhOb, Some("redirect_AFHOB"), 2)
//-  ghvBitWriteGens.zip(redirect_ghv_wens).zipWithIndex.map{case ((b, w), i) =>
//-    b.register(w.reduce(_||_), redirect_ghv_wdatas(i), Some(s"redirect_new_bit_$i"), 2)
//-  }
//+
//   // no need to assign s0_last_pred
// 
//   // val need_reset = RegNext(reset.asBool) && !reset.asBool
//@@ -911,19 +599,7 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//   // ghistPtrGen.register(need_reset, 0.U.asTypeOf(new CGHPtr), Some("reset_GHPtr"), 1)
// 
//   s0_pc_dup.zip(npcGen_dup).map {case (s0_pc, npcGen) => s0_pc := npcGen()}
//-  s0_folded_gh_dup.zip(foldedGhGen_dup).map {case (s0_folded_gh, foldedGhGen) => s0_folded_gh := foldedGhGen()}
//-  s0_ghist_ptr_dup.zip(ghistPtrGen_dup).map {case (s0_ghist_ptr, ghistPtrGen) => s0_ghist_ptr := ghistPtrGen()}
//-  s0_ahead_fh_oldest_bits_dup.zip(aheadFhObGen_dup).map {case (s0_ahead_fh_oldest_bits, aheadFhObGen) =>
//-    s0_ahead_fh_oldest_bits := aheadFhObGen()}
//-  s0_last_br_num_oh_dup.zip(lastBrNumOHGen_dup).map {case (s0_last_br_num_oh, lastBrNumOHGen) =>
//-    s0_last_br_num_oh := lastBrNumOHGen()}
//-  (ghv_write_datas zip ghvBitWriteGens).map{case (wd, d) => wd := d()}
//-  for (i <- 0 until HistoryLength) {
//-    ghv_wens(i) := Seq(s1_ghv_wens, s2_ghv_wens, s3_ghv_wens, redirect_ghv_wens).map(_(i).reduce(_||_)).reduce(_||_)
//-    when (ghv_wens(i)) {
//-      ghv(i) := ghv_write_datas(i)
//-    }
//-  }
//+
// 
//   // TODO: signals for memVio and other Redirects
//   controlRedirectBubble := do_redirect_dup(0).valid && do_redirect_dup(0).bits.ControlRedirectBubble
//@@ -1006,12 +682,6 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//     topdown_stages(0).reasons(TopDownCounters.FtqFullStall.id) := true.B
//   }
// 
//-  XSError(isBefore(redirect_dup(0).cfiUpdate.histPtr, s3_ghist_ptr_dup(0)) && do_redirect_dup(0).valid,
//-    p"s3_ghist_ptr ${s3_ghist_ptr_dup(0)} exceeds redirect histPtr ${redirect_dup(0).cfiUpdate.histPtr}\n")
//-  XSError(isBefore(redirect_dup(0).cfiUpdate.histPtr, s2_ghist_ptr_dup(0)) && do_redirect_dup(0).valid,
//-    p"s2_ghist_ptr ${s2_ghist_ptr_dup(0)} exceeds redirect histPtr ${redirect_dup(0).cfiUpdate.histPtr}\n")
//-  XSError(isBefore(redirect_dup(0).cfiUpdate.histPtr, s1_ghist_ptr_dup(0)) && do_redirect_dup(0).valid,
//-    p"s1_ghist_ptr ${s1_ghist_ptr_dup(0)} exceeds redirect histPtr ${redirect_dup(0).cfiUpdate.histPtr}\n")
// 
//   XSDebug(RegNext(reset.asBool) && !reset.asBool, "Reseting...\n")
//   XSDebug(io.ftq_to_bpu.update.valid, p"Update from ftq\n")
//@@ -1031,10 +701,6 @@ class Predictor(implicit p: Parameters) extends XSModule with HasBPUConst with H
//   // XSDebug("s1_ghist: %b\n", s1_ghist.predHist)
//   // XSDebug("s2_ghist: %b\n", s2_ghist.predHist)
//   // XSDebug("s2_predicted_ghist: %b\n", s2_predicted_ghist.predHist)
//-  XSDebug(p"s0_ghist_ptr: ${s0_ghist_ptr_dup(0)}\n")
//-  XSDebug(p"s1_ghist_ptr: ${s1_ghist_ptr_dup(0)}\n")
//-  XSDebug(p"s2_ghist_ptr: ${s2_ghist_ptr_dup(0)}\n")
//-  XSDebug(p"s3_ghist_ptr: ${s3_ghist_ptr_dup(0)}\n")
// 
//   io.ftq_to_bpu.update.bits.display(io.ftq_to_bpu.update.valid)
//   io.ftq_to_bpu.redirect.bits.display(io.ftq_to_bpu.redirect.valid)
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
module bosc_SimTop(
  input         clock,
  input         reset,
  output [63:0] difftest_exit,
  output [63:0] difftest_step,
  input         difftest_perfCtrl_clean,
  input         difftest_perfCtrl_dump,
  input  [63:0] difftest_logCtrl_begin,
  input  [63:0] difftest_logCtrl_end,
  input  [63:0] difftest_logCtrl_level,
  output        difftest_uart_out_valid,
  output [7:0]  difftest_uart_out_ch,
  output        difftest_uart_in_valid,
  input  [7:0]  difftest_uart_in_ch
);

  wire         _jtag_jtag_TCK;
  wire         _jtag_jtag_TMS;
  wire         _jtag_jtag_TDI;
  wire         _memory_io_axi4_0_aw_ready;
  wire         _memory_io_axi4_0_w_ready;
  wire         _memory_io_axi4_0_b_valid;
  wire [13:0]  _memory_io_axi4_0_b_bits_id;
  wire [1:0]   _memory_io_axi4_0_b_bits_resp;
  wire         _memory_io_axi4_0_ar_ready;
  wire         _memory_io_axi4_0_r_valid;
  wire [13:0]  _memory_io_axi4_0_r_bits_id;
  wire [255:0] _memory_io_axi4_0_r_bits_data;
  wire [1:0]   _memory_io_axi4_0_r_bits_resp;
  wire         _memory_io_axi4_0_r_bits_last;
  wire         _l_simMMIO_io_axi4_0_aw_ready;
  wire         _l_simMMIO_io_axi4_0_w_ready;
  wire         _l_simMMIO_io_axi4_0_b_valid;
  wire [1:0]   _l_simMMIO_io_axi4_0_b_bits_id;
  wire [1:0]   _l_simMMIO_io_axi4_0_b_bits_resp;
  wire         _l_simMMIO_io_axi4_0_ar_ready;
  wire         _l_simMMIO_io_axi4_0_r_valid;
  wire [1:0]   _l_simMMIO_io_axi4_0_r_bits_id;
  wire [63:0]  _l_simMMIO_io_axi4_0_r_bits_data;
  wire [1:0]   _l_simMMIO_io_axi4_0_r_bits_resp;
  wire         _l_simMMIO_io_axi4_0_r_bits_last;
  wire [63:0]  _l_simMMIO_io_interrupt_intrVec;
  wire         _l_soc_peripheral_awvalid;
  wire [1:0]   _l_soc_peripheral_awid;
  wire [30:0]  _l_soc_peripheral_awaddr;
  wire [7:0]   _l_soc_peripheral_awlen;
  wire [2:0]   _l_soc_peripheral_awsize;
  wire [1:0]   _l_soc_peripheral_awburst;
  wire         _l_soc_peripheral_awlock;
  wire [3:0]   _l_soc_peripheral_awcache;
  wire [2:0]   _l_soc_peripheral_awprot;
  wire [3:0]   _l_soc_peripheral_awqos;
  wire         _l_soc_peripheral_wvalid;
  wire [63:0]  _l_soc_peripheral_wdata;
  wire [7:0]   _l_soc_peripheral_wstrb;
  wire         _l_soc_peripheral_wlast;
  wire         _l_soc_peripheral_bready;
  wire         _l_soc_peripheral_arvalid;
  wire [1:0]   _l_soc_peripheral_arid;
  wire [30:0]  _l_soc_peripheral_araddr;
  wire [7:0]   _l_soc_peripheral_arlen;
  wire [2:0]   _l_soc_peripheral_arsize;
  wire [1:0]   _l_soc_peripheral_arburst;
  wire         _l_soc_peripheral_arlock;
  wire [3:0]   _l_soc_peripheral_arcache;
  wire [2:0]   _l_soc_peripheral_arprot;
  wire [3:0]   _l_soc_peripheral_arqos;
  wire         _l_soc_peripheral_rready;
  wire         _l_soc_memory_awvalid;
  wire [13:0]  _l_soc_memory_awid;
  wire [35:0]  _l_soc_memory_awaddr;
  wire [7:0]   _l_soc_memory_awlen;
  wire [2:0]   _l_soc_memory_awsize;
  wire [1:0]   _l_soc_memory_awburst;
  wire         _l_soc_memory_awlock;
  wire [3:0]   _l_soc_memory_awcache;
  wire [2:0]   _l_soc_memory_awprot;
  wire [3:0]   _l_soc_memory_awqos;
  wire         _l_soc_memory_wvalid;
  wire [255:0] _l_soc_memory_wdata;
  wire [31:0]  _l_soc_memory_wstrb;
  wire         _l_soc_memory_wlast;
  wire         _l_soc_memory_bready;
  wire         _l_soc_memory_arvalid;
  wire [13:0]  _l_soc_memory_arid;
  wire [35:0]  _l_soc_memory_araddr;
  wire [7:0]   _l_soc_memory_arlen;
  wire [2:0]   _l_soc_memory_arsize;
  wire [1:0]   _l_soc_memory_arburst;
  wire         _l_soc_memory_arlock;
  wire [3:0]   _l_soc_memory_arcache;
  wire [2:0]   _l_soc_memory_arprot;
  wire [3:0]   _l_soc_memory_arqos;
  wire         _l_soc_memory_rready;
  wire         _l_soc_io_systemjtag_jtag_TDO_data;
  wire         _l_soc_io_systemjtag_jtag_TDO_driven;
  wire         _l_soc_io_debug_reset;
  wire         logEnable = 1'h0;
  wire         clean = 1'h0;
  wire         dump = 1'h0;
  wire [63:0]  timer = 64'h0;
  reg  [5:0]   rtcCounter;
  reg          rtcClock;
  reg  [63:0]  difftest_timer;
  wire         difftest_log_enable =
    difftest_timer >= difftest_logCtrl_begin & difftest_timer < difftest_logCtrl_end;
  always @(posedge clock) begin
    if (reset) begin
      rtcCounter <= 6'h0;
      rtcClock <= 1'h0;
      difftest_timer <= 64'h0;
    end
    else begin
      if (rtcCounter == 6'h31)
        rtcCounter <= 6'h0;
      else
        rtcCounter <= 6'(rtcCounter + 6'h1);
      rtcClock <= rtcCounter == 6'h0 ^ rtcClock;
      difftest_timer <= 64'(difftest_timer + 64'h1);
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:2];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        rtcCounter = _RANDOM[2'h0][5:0];
        rtcClock = _RANDOM[2'h0][6];
        difftest_timer = {_RANDOM[2'h0][31:7], _RANDOM[2'h1], _RANDOM[2'h2][6:0]};
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  XSTop l_soc (
    .peripheral_awready                 (_l_simMMIO_io_axi4_0_aw_ready),
    .peripheral_awvalid                 (_l_soc_peripheral_awvalid),
    .peripheral_awid                    (_l_soc_peripheral_awid),
    .peripheral_awaddr                  (_l_soc_peripheral_awaddr),
    .peripheral_awlen                   (_l_soc_peripheral_awlen),
    .peripheral_awsize                  (_l_soc_peripheral_awsize),
    .peripheral_awburst                 (_l_soc_peripheral_awburst),
    .peripheral_awlock                  (_l_soc_peripheral_awlock),
    .peripheral_awcache                 (_l_soc_peripheral_awcache),
    .peripheral_awprot                  (_l_soc_peripheral_awprot),
    .peripheral_awqos                   (_l_soc_peripheral_awqos),
    .peripheral_wready                  (_l_simMMIO_io_axi4_0_w_ready),
    .peripheral_wvalid                  (_l_soc_peripheral_wvalid),
    .peripheral_wdata                   (_l_soc_peripheral_wdata),
    .peripheral_wstrb                   (_l_soc_peripheral_wstrb),
    .peripheral_wlast                   (_l_soc_peripheral_wlast),
    .peripheral_bready                  (_l_soc_peripheral_bready),
    .peripheral_bvalid                  (_l_simMMIO_io_axi4_0_b_valid),
    .peripheral_bid                     (_l_simMMIO_io_axi4_0_b_bits_id),
    .peripheral_bresp                   (_l_simMMIO_io_axi4_0_b_bits_resp),
    .peripheral_arready                 (_l_simMMIO_io_axi4_0_ar_ready),
    .peripheral_arvalid                 (_l_soc_peripheral_arvalid),
    .peripheral_arid                    (_l_soc_peripheral_arid),
    .peripheral_araddr                  (_l_soc_peripheral_araddr),
    .peripheral_arlen                   (_l_soc_peripheral_arlen),
    .peripheral_arsize                  (_l_soc_peripheral_arsize),
    .peripheral_arburst                 (_l_soc_peripheral_arburst),
    .peripheral_arlock                  (_l_soc_peripheral_arlock),
    .peripheral_arcache                 (_l_soc_peripheral_arcache),
    .peripheral_arprot                  (_l_soc_peripheral_arprot),
    .peripheral_arqos                   (_l_soc_peripheral_arqos),
    .peripheral_rready                  (_l_soc_peripheral_rready),
    .peripheral_rvalid                  (_l_simMMIO_io_axi4_0_r_valid),
    .peripheral_rid                     (_l_simMMIO_io_axi4_0_r_bits_id),
    .peripheral_rdata                   (_l_simMMIO_io_axi4_0_r_bits_data),
    .peripheral_rresp                   (_l_simMMIO_io_axi4_0_r_bits_resp),
    .peripheral_rlast                   (_l_simMMIO_io_axi4_0_r_bits_last),
    .memory_awready                     (_memory_io_axi4_0_aw_ready),
    .memory_awvalid                     (_l_soc_memory_awvalid),
    .memory_awid                        (_l_soc_memory_awid),
    .memory_awaddr                      (_l_soc_memory_awaddr),
    .memory_awlen                       (_l_soc_memory_awlen),
    .memory_awsize                      (_l_soc_memory_awsize),
    .memory_awburst                     (_l_soc_memory_awburst),
    .memory_awlock                      (_l_soc_memory_awlock),
    .memory_awcache                     (_l_soc_memory_awcache),
    .memory_awprot                      (_l_soc_memory_awprot),
    .memory_awqos                       (_l_soc_memory_awqos),
    .memory_wready                      (_memory_io_axi4_0_w_ready),
    .memory_wvalid                      (_l_soc_memory_wvalid),
    .memory_wdata                       (_l_soc_memory_wdata),
    .memory_wstrb                       (_l_soc_memory_wstrb),
    .memory_wlast                       (_l_soc_memory_wlast),
    .memory_bready                      (_l_soc_memory_bready),
    .memory_bvalid                      (_memory_io_axi4_0_b_valid),
    .memory_bid                         (_memory_io_axi4_0_b_bits_id),
    .memory_bresp                       (_memory_io_axi4_0_b_bits_resp),
    .memory_arready                     (_memory_io_axi4_0_ar_ready),
    .memory_arvalid                     (_l_soc_memory_arvalid),
    .memory_arid                        (_l_soc_memory_arid),
    .memory_araddr                      (_l_soc_memory_araddr),
    .memory_arlen                       (_l_soc_memory_arlen),
    .memory_arsize                      (_l_soc_memory_arsize),
    .memory_arburst                     (_l_soc_memory_arburst),
    .memory_arlock                      (_l_soc_memory_arlock),
    .memory_arcache                     (_l_soc_memory_arcache),
    .memory_arprot                      (_l_soc_memory_arprot),
    .memory_arqos                       (_l_soc_memory_arqos),
    .memory_rready                      (_l_soc_memory_rready),
    .memory_rvalid                      (_memory_io_axi4_0_r_valid),
    .memory_rid                         (_memory_io_axi4_0_r_bits_id),
    .memory_rdata                       (_memory_io_axi4_0_r_bits_data),
    .memory_rresp                       (_memory_io_axi4_0_r_bits_resp),
    .memory_rlast                       (_memory_io_axi4_0_r_bits_last),
    .io_clock                           (clock),
    .io_reset                           (reset | _l_soc_io_debug_reset),
    .io_sram_config                     (16'h0),
    .io_extIntrs                        (_l_simMMIO_io_interrupt_intrVec),
    .io_pll0_lock                       (1'h1),
    .io_pll0_ctrl_0                     (/* unused */),
    .io_pll0_ctrl_1                     (/* unused */),
    .io_pll0_ctrl_2                     (/* unused */),
    .io_pll0_ctrl_3                     (/* unused */),
    .io_pll0_ctrl_4                     (/* unused */),
    .io_pll0_ctrl_5                     (/* unused */),
    .io_systemjtag_jtag_TCK             (_jtag_jtag_TCK),
    .io_systemjtag_jtag_TMS             (_jtag_jtag_TMS),
    .io_systemjtag_jtag_TDI             (_jtag_jtag_TDI),
    .io_systemjtag_jtag_TDO_data        (_l_soc_io_systemjtag_jtag_TDO_data),
    .io_systemjtag_jtag_TDO_driven      (_l_soc_io_systemjtag_jtag_TDO_driven),
    .io_systemjtag_reset                (reset),
    .io_systemjtag_mfr_id               (11'h0),
    .io_systemjtag_part_number          (16'h0),
    .io_systemjtag_version              (4'h0),
    .io_debug_reset                     (_l_soc_io_debug_reset),
    .io_rtc_clock                       (rtcClock),
    .io_cacheable_check_req_0_valid     (1'h0),
    .io_cacheable_check_req_0_bits_addr (36'h0),
    .io_cacheable_check_req_0_bits_size (2'h0),
    .io_cacheable_check_req_0_bits_cmd  (3'h0),
    .io_cacheable_check_req_1_valid     (1'h0),
    .io_cacheable_check_req_1_bits_addr (36'h0),
    .io_cacheable_check_req_1_bits_size (2'h0),
    .io_cacheable_check_req_1_bits_cmd  (3'h0),
    .io_cacheable_check_resp_0_ld       (/* unused */),
    .io_cacheable_check_resp_0_st       (/* unused */),
    .io_cacheable_check_resp_0_instr    (/* unused */),
    .io_cacheable_check_resp_0_mmio     (/* unused */),
    .io_cacheable_check_resp_0_atomic   (/* unused */),
    .io_cacheable_check_resp_1_ld       (/* unused */),
    .io_cacheable_check_resp_1_st       (/* unused */),
    .io_cacheable_check_resp_1_instr    (/* unused */),
    .io_cacheable_check_resp_1_mmio     (/* unused */),
    .io_cacheable_check_resp_1_atomic   (/* unused */),
    .io_riscv_halt_0                    (/* unused */),
    .io_riscv_rst_vec_0                 (38'h10000000)
  );
  SimMMIO l_simMMIO (
    .clock                   (clock),
    .reset                   (reset),
    .io_axi4_0_aw_ready      (_l_simMMIO_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid      (_l_soc_peripheral_awvalid),
    .io_axi4_0_aw_bits_id    (_l_soc_peripheral_awid),
    .io_axi4_0_aw_bits_addr  (_l_soc_peripheral_awaddr),
    .io_axi4_0_aw_bits_len   (_l_soc_peripheral_awlen),
    .io_axi4_0_aw_bits_size  (_l_soc_peripheral_awsize),
    .io_axi4_0_aw_bits_burst (_l_soc_peripheral_awburst),
    .io_axi4_0_aw_bits_lock  (_l_soc_peripheral_awlock),
    .io_axi4_0_aw_bits_cache (_l_soc_peripheral_awcache),
    .io_axi4_0_aw_bits_prot  (_l_soc_peripheral_awprot),
    .io_axi4_0_aw_bits_qos   (_l_soc_peripheral_awqos),
    .io_axi4_0_w_ready       (_l_simMMIO_io_axi4_0_w_ready),
    .io_axi4_0_w_valid       (_l_soc_peripheral_wvalid),
    .io_axi4_0_w_bits_data   (_l_soc_peripheral_wdata),
    .io_axi4_0_w_bits_strb   (_l_soc_peripheral_wstrb),
    .io_axi4_0_w_bits_last   (_l_soc_peripheral_wlast),
    .io_axi4_0_b_ready       (_l_soc_peripheral_bready),
    .io_axi4_0_b_valid       (_l_simMMIO_io_axi4_0_b_valid),
    .io_axi4_0_b_bits_id     (_l_simMMIO_io_axi4_0_b_bits_id),
    .io_axi4_0_b_bits_resp   (_l_simMMIO_io_axi4_0_b_bits_resp),
    .io_axi4_0_ar_ready      (_l_simMMIO_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid      (_l_soc_peripheral_arvalid),
    .io_axi4_0_ar_bits_id    (_l_soc_peripheral_arid),
    .io_axi4_0_ar_bits_addr  (_l_soc_peripheral_araddr),
    .io_axi4_0_ar_bits_len   (_l_soc_peripheral_arlen),
    .io_axi4_0_ar_bits_size  (_l_soc_peripheral_arsize),
    .io_axi4_0_ar_bits_burst (_l_soc_peripheral_arburst),
    .io_axi4_0_ar_bits_lock  (_l_soc_peripheral_arlock),
    .io_axi4_0_ar_bits_cache (_l_soc_peripheral_arcache),
    .io_axi4_0_ar_bits_prot  (_l_soc_peripheral_arprot),
    .io_axi4_0_ar_bits_qos   (_l_soc_peripheral_arqos),
    .io_axi4_0_r_ready       (_l_soc_peripheral_rready),
    .io_axi4_0_r_valid       (_l_simMMIO_io_axi4_0_r_valid),
    .io_axi4_0_r_bits_id     (_l_simMMIO_io_axi4_0_r_bits_id),
    .io_axi4_0_r_bits_data   (_l_simMMIO_io_axi4_0_r_bits_data),
    .io_axi4_0_r_bits_resp   (_l_simMMIO_io_axi4_0_r_bits_resp),
    .io_axi4_0_r_bits_last   (_l_simMMIO_io_axi4_0_r_bits_last),
    .io_uart_out_valid       (difftest_uart_out_valid),
    .io_uart_out_ch          (difftest_uart_out_ch),
    .io_uart_in_valid        (difftest_uart_in_valid),
    .io_uart_in_ch           (difftest_uart_in_ch),
    .io_interrupt_intrVec    (_l_simMMIO_io_interrupt_intrVec)
  );
  AXI4RAMWrapper memory (
    .clock                   (clock),
    .reset                   (reset),
    .io_axi4_0_aw_ready      (_memory_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid      (_l_soc_memory_awvalid),
    .io_axi4_0_aw_bits_id    (_l_soc_memory_awid),
    .io_axi4_0_aw_bits_addr  (_l_soc_memory_awaddr),
    .io_axi4_0_aw_bits_len   (_l_soc_memory_awlen),
    .io_axi4_0_aw_bits_size  (_l_soc_memory_awsize),
    .io_axi4_0_aw_bits_burst (_l_soc_memory_awburst),
    .io_axi4_0_aw_bits_lock  (_l_soc_memory_awlock),
    .io_axi4_0_aw_bits_cache (_l_soc_memory_awcache),
    .io_axi4_0_aw_bits_prot  (_l_soc_memory_awprot),
    .io_axi4_0_aw_bits_qos   (_l_soc_memory_awqos),
    .io_axi4_0_w_ready       (_memory_io_axi4_0_w_ready),
    .io_axi4_0_w_valid       (_l_soc_memory_wvalid),
    .io_axi4_0_w_bits_data   (_l_soc_memory_wdata),
    .io_axi4_0_w_bits_strb   (_l_soc_memory_wstrb),
    .io_axi4_0_w_bits_last   (_l_soc_memory_wlast),
    .io_axi4_0_b_ready       (_l_soc_memory_bready),
    .io_axi4_0_b_valid       (_memory_io_axi4_0_b_valid),
    .io_axi4_0_b_bits_id     (_memory_io_axi4_0_b_bits_id),
    .io_axi4_0_b_bits_resp   (_memory_io_axi4_0_b_bits_resp),
    .io_axi4_0_ar_ready      (_memory_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid      (_l_soc_memory_arvalid),
    .io_axi4_0_ar_bits_id    (_l_soc_memory_arid),
    .io_axi4_0_ar_bits_addr  (_l_soc_memory_araddr),
    .io_axi4_0_ar_bits_len   (_l_soc_memory_arlen),
    .io_axi4_0_ar_bits_size  (_l_soc_memory_arsize),
    .io_axi4_0_ar_bits_burst (_l_soc_memory_arburst),
    .io_axi4_0_ar_bits_lock  (_l_soc_memory_arlock),
    .io_axi4_0_ar_bits_cache (_l_soc_memory_arcache),
    .io_axi4_0_ar_bits_prot  (_l_soc_memory_arprot),
    .io_axi4_0_ar_bits_qos   (_l_soc_memory_arqos),
    .io_axi4_0_r_ready       (_l_soc_memory_rready),
    .io_axi4_0_r_valid       (_memory_io_axi4_0_r_valid),
    .io_axi4_0_r_bits_id     (_memory_io_axi4_0_r_bits_id),
    .io_axi4_0_r_bits_data   (_memory_io_axi4_0_r_bits_data),
    .io_axi4_0_r_bits_resp   (_memory_io_axi4_0_r_bits_resp),
    .io_axi4_0_r_bits_last   (_memory_io_axi4_0_r_bits_last)
  );
  SimJTAG #(
    .TICK_DELAY(3)
  ) jtag (
    .clock           (clock),
    .reset           (reset),
    .jtag_TRSTn      (/* unused */),
    .jtag_TCK        (_jtag_jtag_TCK),
    .jtag_TMS        (_jtag_jtag_TMS),
    .jtag_TDI        (_jtag_jtag_TDI),
    .jtag_TDO_data   (_l_soc_io_systemjtag_jtag_TDO_data),
    .jtag_TDO_driven (_l_soc_io_systemjtag_jtag_TDO_driven),
    .enable          (1'h1),
    .init_done       (~reset),
    .exit            (/* unused */)
  );
  assign difftest_exit = 64'h0;
  assign difftest_step = 64'h0;
endmodule

