// Generated basic-flow test for the transaction_detail entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped TransactionDetailTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object TransactionDetailEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("transaction_detail.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.transactionDetail(null)
      rep.check("transaction_detail.instance", ent != null, "expected non-null transaction_detail entity")
    }

    rep.scope("transaction_detail.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/transaction_detail/TransactionDetailTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("transaction_detail01", "TRANSACTION_DETAIL01")
      idmap.put("transaction_detail02", "TRANSACTION_DETAIL02")
      idmap.put("transaction_detail03", "TRANSACTION_DETAIL03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("payment01", "PAYMENT01")
      idmap.put("payment02", "PAYMENT02")
      idmap.put("payment03", "PAYMENT03")
      idmap.put("account_id", "ACCOUNT01")
      val now = System.currentTimeMillis()
      val transactionDetailRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.transaction_detail")))
      val transactionDetailRef01Data = Helpers.toMapAny(transactionDetailRef01DataRaw.get(0).get(1))

      // UPDATE
      val transactionDetailRef01Ent = client.transactionDetail(null)
      val transactionDetailRef01DataUp0Up = new LinkedHashMap[String, Object]()
      transactionDetailRef01DataUp0Up.put("id", transactionDetailRef01Data.get("id"))
      transactionDetailRef01DataUp0Up.put("account_id", idmap.get("account_id"))
      val transactionDetailRef01MarkdefUp0Name = "description"
      val transactionDetailRef01MarkdefUp0Value = "Mark01-transaction_detail_ref01_" + now
      transactionDetailRef01DataUp0Up.put(transactionDetailRef01MarkdefUp0Name, transactionDetailRef01MarkdefUp0Value)
      val transactionDetailRef01ResdataUp0Result = transactionDetailRef01Ent.update(transactionDetailRef01DataUp0Up, null)
      val transactionDetailRef01ResdataUp0 = Helpers.toMapAny(transactionDetailRef01ResdataUp0Result)
      rep.check("transaction_detail.update.map", transactionDetailRef01ResdataUp0 != null, "expected update result to be a map")
      rep.eq("transaction_detail.update.id", transactionDetailRef01DataUp0Up.get("id"), transactionDetailRef01ResdataUp0.get("id"))
      rep.eq("transaction_detail.update.mark", transactionDetailRef01MarkdefUp0Value, transactionDetailRef01ResdataUp0.get(transactionDetailRef01MarkdefUp0Name))

      // LOAD
      val transactionDetailRef01MatchDt0 = new LinkedHashMap[String, Object]()
      transactionDetailRef01MatchDt0.put("id", transactionDetailRef01Data.get("id"))
      val transactionDetailRef01DataDt0Loaded = transactionDetailRef01Ent.load(transactionDetailRef01MatchDt0, null)
      val transactionDetailRef01DataDt0LoadResult = Helpers.toMapAny(transactionDetailRef01DataDt0Loaded)
      rep.check("transaction_detail.load.map", transactionDetailRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("transaction_detail.load.id", transactionDetailRef01Data.get("id"), transactionDetailRef01DataDt0LoadResult.get("id"))
    }
  }
}
