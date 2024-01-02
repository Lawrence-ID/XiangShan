package xiangshan

import org.chipsalliance.cde.config.Parameters
import chisel3._
import chisel3.util.log2Ceil
import xiangshan.backend.rob.{DebugLsInfo, DebugMdpInfo}
import xiangshan.cache.{DCacheBundle, HasDCacheParameters}
import utility.MemReqSource
import xiangshan.mem.prefetch.HasL1PrefetchHelper

/** Mem */
class LoadMissEntry(implicit p: Parameters) extends DCacheBundle {
  val timeCnt = UInt(XLEN.W)
  val robIdx = UInt(log2Ceil(RobSize).W)
  val paddr = UInt(PAddrBits.W)
  val vaddr = UInt(VAddrBits.W)
  // 1:first hit, 2:first miss, 3:second miss
  val missState = UInt(3.W)
}

class LoadAccessEntry(implicit p: Parameters) extends LoadMissEntry{
  val pred_way_num = UInt(XLEN.W)
  val dm_way_num = UInt(XLEN.W)
  val real_way_num = UInt(XLEN.W)
}

class InstInfoEntry(implicit p: Parameters) extends XSBundle{
  val globalID = UInt(XLEN.W)
  val robIdx = UInt(log2Ceil(RobSize).W)
  val instType = FuType()
  val exceptType = UInt(ExceptionVec.ExceptionVecSize.W)
  val ivaddr = UInt(VAddrBits.W)
  val dvaddr = UInt(VAddrBits.W) // the l/s access address
  val dpaddr = UInt(VAddrBits.W) // need the physical address when the TLB is valid
  val tlbLatency = UInt(XLEN.W)  // original requirements is L1toL2TlbLatency
  val accessLatency = UInt(XLEN.W)  // RS out time --> write back time
  val executeLatency = UInt(XLEN.W)
  val issueLatency = UInt(XLEN.W)
  val lsInfo = new DebugLsInfo
  val mdpInfo = new DebugMdpInfo
  val issueTime = UInt(XLEN.W)
  val writebackTime = UInt(XLEN.W)
}

class LoadInfoEntry(implicit p: Parameters) extends XSBundle{
  val isLoad = Bool()
  val pc = UInt(VAddrBits.W)
  val vaddr = UInt(VAddrBits.W)
  val paddr = UInt(PAddrBits.W)
  val issued = UInt(64.W) // time of issue
  val translated = UInt(64.W) // tlb resp time
  val commited = UInt(64.W) // commit by rob time
  val writeback = UInt(64.W) // writeback to rob time
  val cacheMiss = Bool()
  val tlbQueryLatency = UInt(64.W)
  val exeLatency = UInt(64.W)
}

class SMSPFTraceEntry(implicit p: Parameters) extends XSBundle with HasDCacheParameters{
  val TriggerPC = UInt(VAddrBits.W)
  val TriggerVaddr = UInt(VAddrBits.W)
  val PFVaddr = UInt(VAddrBits.W)
  val PFSrc = UInt(sourceTypeWidth.W)
}

class SMSTrainTraceEntry(implicit p: Parameters) extends XSBundle with HasDCacheParameters{
  val Type = UInt(MemReqSource.reqSourceBits.W)
  val OldAddr = UInt(VAddrBits.W)
  val CurAddr = UInt(VAddrBits.W)
  val Offset = UInt(32.W)
  val Score = UInt(32.W)
  val Miss = Bool()
}

class StreamPFTraceEntry(implicit p: Parameters) extends XSBundle with HasL1PrefetchHelper{
  val TriggerPC = UInt(VAddrBits.W)
  val TriggerVaddr = UInt(VAddrBits.W)
  val PFVaddr = UInt(VAddrBits.W)
  val PFSink = UInt(SINK_BITS.W)
}

class StreamTrainTraceEntry(implicit p: Parameters) extends XSBundle with HasDCacheParameters{
  val Type = UInt(MemReqSource.reqSourceBits.W)
  val OldAddr = UInt(VAddrBits.W)
  val CurAddr = UInt(VAddrBits.W)
  val Offset = UInt(32.W)
  val Score = UInt(32.W)
  val Miss = Bool()
}