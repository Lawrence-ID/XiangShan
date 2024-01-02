package xiangshan.backend.issue

import org.chipsalliance.cde.config.Parameters
import chisel3._
import utility.HasCircularQueuePtrHelper
import utils.{OptionWrapper}
import xiangshan._
import xiangshan.backend.issue.EntryBundles._


class OthersEntryIO(implicit p: Parameters, params: IssueBlockParams) extends XSBundle {
  //input
  val commonIn        = new CommonInBundle
  //output
  val commonOut       = new CommonOutBundle

  def wakeup          = commonIn.wakeUpFromWB ++ commonIn.wakeUpFromIQ
}

class OthersEntry(isComp: Boolean)(implicit p: Parameters, params: IssueBlockParams) extends XSModule {
  val io = IO(new OthersEntryIO)

  val validReg        = RegInit(false.B)
  val entryReg        = Reg(new EntryBundle)

  val common          = Wire(new CommonWireBundle)
  val entryUpdate     = Wire(new EntryBundle)
  val entryRegNext    = Wire(new EntryBundle)
  val hasWakeupIQ     = OptionWrapper(params.hasIQWakeUp, Wire(new CommonIQWakeupBundle))

  //Reg
  validReg := common.validRegNext
  entryReg := entryRegNext

  //Wire
  CommonWireConnect(common, hasWakeupIQ, validReg, entryReg.status, io.commonIn, false)

  if (params.hasIQWakeUp) {
    ShiftLoadDependency(hasWakeupIQ.get)
    CommonIQWakeupConnect(common, hasWakeupIQ.get, validReg, entryReg.status, io.commonIn, false)
  }

  when(io.commonIn.enq.valid) {
    assert(common.enqReady, "Entry is not ready when enq is valid\n")
  }

  when(io.commonIn.enq.valid) {
    entryRegNext := io.commonIn.enq.bits
  }.otherwise {
    entryRegNext := entryUpdate
  }

  EntryRegCommonConnect(common, hasWakeupIQ, validReg, entryUpdate, entryReg, entryReg.status, io.commonIn, false)

  //output
  CommonOutConnect(io.commonOut, common, hasWakeupIQ, validReg, entryUpdate, entryReg, entryReg.status, io.commonIn, false, isComp)
}

class OthersEntryMem(isComp: Boolean)(implicit p: Parameters, params: IssueBlockParams) extends OthersEntry(isComp)
  with HasCircularQueuePtrHelper {
  EntryMemConnect(io.commonIn, common, validReg, entryReg, entryRegNext, entryUpdate, false)
}

object OthersEntry {
  def apply(isComp: Boolean)(implicit p: Parameters, iqParams: IssueBlockParams): OthersEntry = {
    iqParams.schdType match {
      case IntScheduler() => new OthersEntry(isComp)
      case MemScheduler() =>
        if (iqParams.StdCnt == 0) new OthersEntryMem(isComp)
        else new OthersEntry(isComp)
      case VfScheduler() => new OthersEntry(isComp)
      case _ => null
    }
  }
}